Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C236F5F0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:51:35 +0200 (CEST)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcMzu-0002a9-D4
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcMwb-0000pp-5p
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:48:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcMwV-000301-49
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619765281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2gLoCwHNURlP8Fo5OI4EpYz1jtFQFNXs6YWnfKl8k30=;
 b=Pq2qbjsRA1iREZMxHW4q1Q4unZnt+ca8K1E+rVmsQmok+F3KIFxMP8U/CDNEXFb7RDEVw6
 EwzMF4zBHLZ4/gAvaFsKqQiMAc40Oj3XeNKhe3qI1qOVUAyx0Bu6WRowPjudXMIrifbkce
 xoO9AuBC4hcgqqh+bSuR0dLTFmTu+bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-GCAY7FYOPrKHrm3q6z2iEQ-1; Fri, 30 Apr 2021 02:47:59 -0400
X-MC-Unique: GCAY7FYOPrKHrm3q6z2iEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A5D7189829E;
 Fri, 30 Apr 2021 06:47:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63EB2679E7;
 Fri, 30 Apr 2021 06:47:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DAB05113525D; Fri, 30 Apr 2021 08:47:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: Let's remove some deprecated stuff
References: <87y2d1csxe.fsf@dusky.pond.sub.org> <YIqLPNScbDYCS89t@redhat.com>
Date: Fri, 30 Apr 2021 08:47:52 +0200
In-Reply-To: <YIqLPNScbDYCS89t@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Thu, 29 Apr 2021 11:32:28 +0100")
Message-ID: <87v984nu93.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathi?= =?utf-8?Q?eu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Thu, Apr 29, 2021 at 11:59:41AM +0200, Markus Armbruster wrote:
>> Myself, but I only documented it; it's actually Kevin Wolf:
>>=20
>>     ``blockdev-open-tray``, ``blockdev-close-tray`` argument ``device`` =
(since 2.8.0)
>>     ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''=
'''''''''''''
>>=20
>>     Use argument ``id`` instead.
>>=20
>>     ``eject`` argument ``device`` (since 2.8.0)
>>     '''''''''''''''''''''''''''''''''''''''''''
>>=20
>>     Use argument ``id`` instead.
>>=20
>>     ``blockdev-change-medium`` argument ``device`` (since 2.8.0)
>>     ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>=20
>>     Use argument ``id`` instead.
>>=20
>>     ``block_set_io_throttle`` argument ``device`` (since 2.8.0)
>>     '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>>=20
>>     Use argument ``id`` instead.
>
> FYI, I did prepare patches for these already, but they broke the iotests.
>
> I found it difficult to figure out the right fix for the iotests, becuase
> IIUC "device" and "id" values are different, and I didn't see what "id"
> to use when args are still using -drive, not -blockdev.

Rebase and post as RFC to solicit clues or even fixes?

[...]


