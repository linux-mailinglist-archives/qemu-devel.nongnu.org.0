Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3116C29234A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:00:50 +0200 (CEST)
Received: from localhost ([::1]:42512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQ65-0005E1-7x
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUQ0t-0000HR-V9
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:55:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kUQ0s-0000dv-0e
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:55:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603094125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9nkt/Ojpp8+FXMDervNsVDCE8IqKlxbRoOzcaqnkKeo=;
 b=Y5/DEvjC5Q98+9LNGjkxUBaB7YqdP2Ni+Obk9c+GwevgyDpHLwmCRbUDnj4kNea18Hpdiq
 x6VmvRpsPV82+1WYtYCVTZygjwHd58s6bPfPNjqJdgOJdCNw9t/Nc9dQSqMbj9zs6q3PkR
 K/gdhEcI00QU49yBNvln2IYOzR4116E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-vigFfHzgNtOZF01_4Zggkw-1; Mon, 19 Oct 2020 03:55:23 -0400
X-MC-Unique: vigFfHzgNtOZF01_4Zggkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52302185A0F0
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 07:55:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20C621A4D6;
 Mon, 19 Oct 2020 07:55:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9AD341132A08; Mon, 19 Oct 2020 09:55:20 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 0/5] qapi: Restrict machine (and migration) specific
 commands
References: <20201012121536.3381997-1-philmd@redhat.com>
 <20201015182824.GG5733@habkost.net>
Date: Mon, 19 Oct 2020 09:55:20 +0200
In-Reply-To: <20201015182824.GG5733@habkost.net> (Eduardo Habkost's message of
 "Thu, 15 Oct 2020 14:28:24 -0400")
Message-ID: <87ft6a1wgn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Mon, Oct 12, 2020 at 02:15:31PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Reduce the machine code pulled into qemu-storage-daemon.
>>=20
>> The series is fully Acked, but Markus wants it reviewed
>> by the Machine core maintainers.
>
> I've confirmed that all patches move QAPI schema code without
> introducing any additional changes.
>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

I take this as "I agree the things moved to machine.json belong there".
Holler if I'm mistaken.


