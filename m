Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9FD35978C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 10:19:59 +0200 (CEST)
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUmMw-0004bo-C8
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 04:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUmMB-0004Ac-UA
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lUmM9-0004yY-O9
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 04:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617956348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=feBhMh/5qHLwHqdayYu4rFL7yvQOqTUv3nIKfXg9g+o=;
 b=KPw+bqG4NR81PZSgDxf6OKMonVxWBBsnOCiep6LWSqK+T3HIxX4Wxi91lJ6IeBn3eE1mVj
 CgXs7ghMU7MEs6p5ghCD4gPU9Zg557oqPIhd+HEYFd5O20Hb3J2yBsXskkXENLEqbNprhb
 I0VnVzYmJfzYRive8JliOK05O9k/Dc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-xOjfAMnvOF2lXVZZhr77zQ-1; Fri, 09 Apr 2021 04:19:04 -0400
X-MC-Unique: xOjfAMnvOF2lXVZZhr77zQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB0AB801814;
 Fri,  9 Apr 2021 08:19:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A67065D9C0;
 Fri,  9 Apr 2021 08:19:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F381D113525D; Fri,  9 Apr 2021 10:19:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>
Subject: Re: [QUESTION] qemu: how to control the switch of floppy drive
References: <910b1361-3b9f-ec80-794e-fb335b0ef631@windriver.com>
Date: Fri, 09 Apr 2021 10:19:00 +0200
In-Reply-To: <910b1361-3b9f-ec80-794e-fb335b0ef631@windriver.com> (Yanfei Xu's
 message of "Fri, 9 Apr 2021 14:48:59 +0800")
Message-ID: <87h7kf50qz.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Xu, Yanfei" <yanfei.xu@windriver.com> writes:

> Hi experts,
>
> How can I disable the floppy controller drive when I boot a VM by qemu-
> system-x86_64? I did not specify any arguments about floppy, but after
> the qemu boots up, linux always can detect floppy drive and then
> modprobe the matched floppy.ko.
>
> qemu version: v5.2
>
> command line:
>
> qemu-system-x86_64 -device virtio-net-
> pci,netdev=net0,mac=52:54:00:12:34:02 -netdev
> tap,id=net0,ifname=tap0,script=no,downscript=no -object rng-
> random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0
> -drive file=/path/to/images/qemux86-64
> /qemux86-64.ext4,if=virtio,format=raw -usb -device usb-tablet   -cpu
> core2duo -enable-kvm -m 512  -pidfile /path/to/pidfile_4167420 -m 512
> -snapshot -serial mon:vc -serial null  -kernel /path/to/qemux86-64
> /bzImage.bin -append 'root=/dev/vda rw  mem=512M
> ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1
> printk.time=1'
>
> As I konw BIOS can control the switch of floppy controller on a real
> hardware, But how can I do it on qemu? And does the qemu enable that by
> default?

Machine types pc-i440fx-* provide a floppy controller.  An empty floppy
drive is connected by default.  Use -nodefaults to suppress it.

Machine types pc-q35-* provide a floppy controller only when you ask for
it, e.g. with -drive if=floppy.

Use -M to select the machine type.


