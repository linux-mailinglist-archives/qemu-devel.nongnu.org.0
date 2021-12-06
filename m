Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C54696A8
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:17:34 +0100 (CET)
Received: from localhost ([::1]:56344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muDs5-0004Ya-Jj
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:17:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muDVI-0001j6-9D
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 07:54:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1muDVF-0001na-NX
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 07:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638795231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=VP3cmEsPSDqVJ5SNGLDjBRajPV6CTpvH7yzgchAxkmk=;
 b=i/GZ27zqe6V7LJWW6mgoWzh1t8+dwpry4DWMADClRIH9AdPNGGoYBjN9bl4FlMz8wZmOZ4
 5nbxAowvo9wdxNWqNyOh4xX2abY9YnJEW98loxorpos4l1EntP2hDeJ1HYy/Vp1WsASJCy
 iJ1k6QyFfgfFLfABvn07x9k0V22Z3/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-DEngy-u9NgiMKK5I2aPjgQ-1; Mon, 06 Dec 2021 07:53:48 -0500
X-MC-Unique: DEngy-u9NgiMKK5I2aPjgQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 571DA86A062;
 Mon,  6 Dec 2021 12:53:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC4560C13;
 Mon,  6 Dec 2021 12:53:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9AA38113865F; Mon,  6 Dec 2021 13:53:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Bad error handling in machine sifive-u
Date: Mon, 06 Dec 2021 13:53:45 +0100
Message-ID: <87mtldlwrq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Watch this:

    $ ../qemu/bld/qemu-system-riscv64 -M sifive_u -S -monitor stdio -display none -drive if=pflash
    QEMU 6.1.93 monitor - type 'help' for more information
    (qemu) Unexpected error in sifive_u_otp_realize() at ../hw/misc/sifive_u_otp.c:229:
    qemu-system-riscv64: OTP drive size < 16K
    Aborted (core dumped)

sifive_u_machine_init() calls

    qdev_realize(DEVICE(&s->soc), NULL, &error_abort);

My reproducer demonstrates that passing &error_abort is wrong: this
realize can fail.

&error_fatal should do here.

Please check the other uses of &error_abort in this machine for similar
misuse.


