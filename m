Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6257F2AD3C9
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:29:16 +0100 (CET)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQtn-0008Lg-Fn
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcQs9-0007oK-25
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:27:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kcQs7-0005cK-H2
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605004050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9qEmTn68PtRyNwoU4LRKxSK4ZqVRXBgOFnwzxU9Scc=;
 b=SoKCFCXg8qti1izHi5vkmZsuZONinzJHmLoKetD2sWo2WT3W9FX+tTzjMq7Pp9ptt/80uP
 22hhfsMw3iHksZ/PtWM1xtUgqs69U6Js7joc9NhXoG70cCkAatedHnrPoc1uDyPfKsvRNl
 qtf3adufNIWEXUtw+1DLapUqPrmhdDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-ZERk7GnUOUGT6Ts9UBqAvg-1; Tue, 10 Nov 2020 05:27:29 -0500
X-MC-Unique: ZERk7GnUOUGT6Ts9UBqAvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B7291006C9B
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 10:27:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E067E5C5FD;
 Tue, 10 Nov 2020 10:27:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 64D431132BD6; Tue, 10 Nov 2020 11:27:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: QMP and the 'id' parameter
References: <62700620-5228-f1cc-f0df-751c0d9f1f82@redhat.com>
 <87361h20kd.fsf@dusky.pond.sub.org>
 <20201110091512.GA866671@redhat.com>
Date: Tue, 10 Nov 2020 11:27:26 +0100
In-Reply-To: <20201110091512.GA866671@redhat.com> ("Daniel P. =?utf-8?Q?Be?=
 =?utf-8?Q?rrang=C3=A9=22's?=
 message of "Tue, 10 Nov 2020 09:15:12 +0000")
Message-ID: <87k0utwlpt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Nov 10, 2020 at 07:22:26AM +0100, Markus Armbruster wrote:
[...]
>> Command responses get sent strictly in order (even parse errors), except
>> for commands executed out-of-band.
>
> With out of band commands, how much runs in the background ? Is the
> JSON parsing still in the foreground, such that we can expect that
> even for OOB commands, a error response without a "id" is still
> received strictly in order.

Yes, you can.  We made sure both errors and results flow through the
same pipeline[*].  The only fork is for OOB commands, and to take it,
the parser must have yielded a JSON object.

Use of exec-oob without "id" is foolish.

Pipelining commands without "id" is merely unadvisable.


[*] We queue parse errors along with successfully parsed values.
The QMP dispatcher dequeues, executes if it's a request, sends the
response, loop.


