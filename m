Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B245341529
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 06:55:04 +0100 (CET)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN86A-0005zw-VE
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 01:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lN85E-0005Vm-Gf
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 01:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lN85D-0007Dx-4Y
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 01:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616133242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PB5JcJDqFY9cIkeGMDr5ZJJIK2ByoxQdeytt2yQ/wO4=;
 b=DFELV0pp7Av8BOdESQpusnCMwFYQM5r8x98NUx0ZrXEfamQFLLs2Pry8mx7gDm9b5s+dOx
 J6UMeVVN9OwJTzwzeRhRneiBFVB987QLk96zKyBuHTUmOm6CbPdKQ6hFhgFi6C3eqHUuPx
 DzsIGuto3X+tBwtJW31Cj4vg8odk1io=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-aaD0ogPwNvq5-9HW8Fw1gQ-1; Fri, 19 Mar 2021 01:53:58 -0400
X-MC-Unique: aaD0ogPwNvq5-9HW8Fw1gQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58E9680006E;
 Fri, 19 Mar 2021 05:53:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1281E5D9C6;
 Fri, 19 Mar 2021 05:53:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 75A2111386A7; Fri, 19 Mar 2021 06:53:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH 1/2] floppy: add a regression test for CVE-2020-25741
References: <20200827113806.1850687-1-ppandit@redhat.com>
 <20210319050906.14875-1-alxndr@bu.edu>
Date: Fri, 19 Mar 2021 06:53:55 +0100
In-Reply-To: <20210319050906.14875-1-alxndr@bu.edu> (Alexander Bulekov's
 message of "Fri, 19 Mar 2021 01:09:05 -0400")
Message-ID: <87lfajsn7w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Li Qiang <liq3ea@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexander Bulekov <alxndr@bu.edu> writes:

> dd if=/dev/zero of=/tmp/fda.img bs=1024 count=1440
> cat << EOF | ./qemu-system-i386 -nographic -m 512M -nodefaults \
> -accel qtest -fda /tmp/fda.img -qtest stdio
> outw 0x3f4 0x0500
> outb 0x3f5 0x00
> outb 0x3f5 0x00
> outw 0x3f4 0x00
> outb 0x3f5 0x00
> outw 0x3f1 0x0400
> outw 0x3f4 0x0
> outw 0x3f4 0x00
> outb 0x3f5 0x0
> outb 0x3f5 0x01
> outw 0x3f1 0x0500
> outb 0x3f5 0x00
> EOF
>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

I guess this is a reproducer.  Please also describe actual and expected
result.  Same for PATCH 2.


