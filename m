Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1235632397C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:32:14 +0100 (CET)
Received: from localhost ([::1]:54898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEqWi-0004uE-Ot
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEqU0-0003ag-Pr
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:29:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEqTy-0005wr-Ha
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614158960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9aAb/32Jv0CB5PZIeEus2uvPKHunxqrAKuVx+fiUo6o=;
 b=RSKxxv3o9ZiKh5MrwSK3UOt9fSRhbWq+KPdtcpYTZDFLvkhL7487fDrro/P/kLjQsZbGdF
 XkUxLBr2QvgveafE9L4/4PzsyZvm9yREMLFKAVBzUfoVCKNnvON2IOj2cTO08ehXZ1MxSl
 0UZIOGBbPZTIsTwcxhG55Ml3PiVkrSE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-1ACLeUV4P2mUscEukdfUIg-1; Wed, 24 Feb 2021 04:29:18 -0500
X-MC-Unique: 1ACLeUV4P2mUscEukdfUIg-1
Received: by mail-wr1-f70.google.com with SMTP id e11so756942wro.19
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 01:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=9aAb/32Jv0CB5PZIeEus2uvPKHunxqrAKuVx+fiUo6o=;
 b=AdTzdy22+rqt2Pv4NGlJRZDWtmzdIZl394rEPVb6ZowtR2J+6wqDbNf1tWBCpGCRcF
 cRtbzFdE9wAxVmrQmnt8FSCnNQnyvGelMBTz+UFzpK+fkGB2xFPE6B3oDT7nAdz+jyj8
 8o0X6S1wntqPXq89kOIivhd/3RMDu9E/ZxZrFPKYBh8G5ib1WYACt67VoY/2j+T2SgSI
 HIIBMO94NvoZir11wrDBNKMkcUcaELquZneIDRtfqgfG6c4LTvQY9zEvhxGnqKZM4ux7
 DGUmUj7BKQjqHfeIC3PMI+5iK0cfAYz8NLPKank5qorS14g8Gi/wyn6jFzvymMfTlM9F
 ha3Q==
X-Gm-Message-State: AOAM533wYGs9239+AhFPjHF2B2D941QhIccnA/gqcAL5MtRQhyG4AUvj
 I5ofc6ND4kGCB9gIAuiTpvYUXuJCZ6dYFb/rLQe/Qi60aHpl2X47dsJG3Nzmitwtci/89pQUXv5
 8JJVtf5EE1SoUk9I=
X-Received: by 2002:a7b:c4d7:: with SMTP id g23mr2850151wmk.106.1614158956907; 
 Wed, 24 Feb 2021 01:29:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMkvjG3T6flqAPt7cBUf+8fThppEKL0QTlnojwULvP4U0pH/NrUTDPI5HBiGTc1kVMYkXK5w==
X-Received: by 2002:a7b:c4d7:: with SMTP id g23mr2850131wmk.106.1614158956694; 
 Wed, 24 Feb 2021 01:29:16 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v6sm2305283wrx.32.2021.02.24.01.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 01:29:16 -0800 (PST)
To: qemu-devel <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: Problem running functional tests from China
Message-ID: <60118671-cd47-1900-59c6-96782dd7e26c@redhat.com>
Date: Wed, 24 Feb 2021 10:29:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, avocado-devel <avocado-devel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just to inform the files hosted on github don't work when
testing from China:

 (02/23)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_emcraft_sf2:
CANCEL: Missing asset
https://raw.githubusercontent.com/Subbaraya-Sundeep/qemu-test-binaries/fe371d32e50ca682391e1e70ab98c2942aeffb01/u-boot
(0.02 s)
 (03/23)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_uart0:
INTERRUPTED: Missing asset
http://archive.raspberrypi.org/debian/pool/main/r/raspberrypi-firmware/raspberrypi-kernel_1.20190215-1_armhf.deb\nRunner
error occurred: Timeout reached\nOriginal status: CANCEL\n{'name':
'03-tests/acceptance/boot_linux_console.py:BootLinuxCons... (90.61 s)
 (04/23)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_exynos4210_initrd:
CANCEL: Missing asset
https://github.com/groeck/linux-build-test/raw/2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/arm/rootfs-armv5.cpio.gz
(35.63 s)
 (05/23)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_initrd:
CANCEL: Missing asset
https://github.com/groeck/linux-build-test/raw/2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/arm/rootfs-armv5.cpio.gz
(8.75 s)
 (06/23)
tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_cubieboard_sata:
CANCEL: Missing asset
https://github.com/groeck/linux-build-test/raw/2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/arm/rootfs-armv5.ext2.gz
(8.63 s)
 (17/23)
tests/acceptance/machine_arm_integratorcp.py:IntegratorMachine.test_integratorcp_console:
CANCEL: Missing asset
https://github.com/zayac/qemu-arm/raw/master/arm-test/kernel/zImage.integrator
(0.76 s)
 (22/23)
tests/acceptance/replay_kernel.py:ReplayKernelNormal.test_arm_cubieboard_initrd:
CANCEL: Missing asset
https://github.com/groeck/linux-build-test/raw/2eb0a73b5d5a28df3170c546ddaaa9757e1e0848/rootfs/arm/rootfs-armv5.cpio.gz
(8.11 s)

raw.githubusercontent.com resolves to 127.0.0.1

Regards,

Phil.


