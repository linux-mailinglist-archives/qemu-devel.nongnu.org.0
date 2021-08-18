Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FC83F018D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 12:23:33 +0200 (CEST)
Received: from localhost ([::1]:38022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGIjM-00032n-VR
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 06:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mGIiC-0002Mr-7k
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 06:22:20 -0400
Received: from relay.yourmailgateway.de ([194.59.204.23]:57745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mGIi8-0007y4-2N
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 06:22:19 -0400
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4GqP8g3nwpz46t2
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1629282131; bh=hjbNesPmUTMHtO7dI70zF9k8XRx2WqreXI0dz6n79pc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=OtnqD9Qsos54L7N242JgPd/lRro4clw3ClsMKA5D1eXihJwm7K1Yy/Uy1VooNNcum
 w3IUIuPvDqMrHTqCdRk53IpkWTyyqnCWebsIqUr7ofKnMUBffo3c2N1eu0lZoSl8uk
 EBsABEX1lcph4TwKQs85ckBchcjkeDs2rBZ2CgyWsebe7Z3WPYGx8MzQvuMdQzn5P+
 jR5JGOXOBC/GkfxlBZwTHjkSOxKtNsHotesqcSZZ99fczkW1+aOuegryenVm1vaLbO
 cbA7+v6UD9ZPAaME5x8Xi34pT70IE8/tTHUp2zoIJsIxDIhYoqkKngOf5L/3fiDD/N
 kXIEe/j5uxIYw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4GqP8g3GKFz7tth
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:22:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4GqP8V50fsz8sk8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:22:02 +0200 (CEST)
Received: from [192.168.54.9] (ip-95-223-68-231.hsi16.unitymediagroup.de
 [95.223.68.231])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 2E51665985
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:22:01 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.68.231) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Subject: Re: [PATCH v3] block/file-win32: add reopen handlers
To: qemu-devel@nongnu.org
References: <20210817202115.16771-1-viktor.prutyanov@phystech.edu>
From: Helge Konetzka <hk@zapateado.de>
Message-ID: <9c3c72c0-5952-aac5-d2a3-4d145f57ea78@zapateado.de>
Date: Wed, 18 Aug 2021 12:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817202115.16771-1-viktor.prutyanov@phystech.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-PPP-Message-ID: <162928212175.2966.4116807909292195701@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: 1naznAIROOGEPd0P7bLE8vAub1lkEAFrMQAtl00Zpw1z
Received-SPF: pass client-ip=194.59.204.23; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.08.21 um 22:21 schrieb Viktor Prutyanov:
> Make 'qemu-img commit' work on Windows.
>
> Command 'commit' requires reopening backing file in RW mode. So,
> add reopen prepare/commit/abort handlers and change dwShareMode
> for CreateFile call in order to allow further read/write reopening.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418
> Suggested-by: Hanna Reitz <hreitz@redhat.com>
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>   v2:
>      - fix indentation in raw_reopen_prepare
>      - free rs if raw_reopen_prepare fails
>   v3:
>      - restore suggested-by field missed in v2
>
>   block/file-win32.c | 90 +++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 89 insertions(+), 1 deletion(-)

Test was successful on Windows 10 Pro, 21H1, 19043.1165, build & test 
environment MSYS2, MINGW64

Tested-by: Helge Konetzka <hk@zapateado.de>

See my test protocol:

$ git clone https://github.com/patchew-project/qemu.git patchew-qemu
$ cd patchew-qemu
$ git checkout 
tags/patchew/20210817202115.16771-1-viktor.prutyanov@phystech.edu
$ mkdir build-msys2 && cd build-msys2
$ export AR=gcc-ar NM=nm OBJCOPY=objcopy RANLIB=gcc-ranlib STRIP=strip 
WINDRES=windres
$ ../configure \
   --cross-prefix=x86_64-w64-mingw32- \
   --prefix=/mingw64/opt/patchew-qemu --target-list=x86_64-softmmu \
   --bindir=bin --datadir=share/qemu --localedir=share/locale 
--mandir=share/man --docdir=share/doc/qemu
$ make -j2 && make install

$ export PATH="/mingw64/opt/patchew-qemu/bin:$PATH"
$ which qemu-img
/mingw64/opt/patchew-qemu/bin/qemu-img
$ qemu-img create -f qcow2 testbacking.qcow2 20G
Formatting 'testbacking.qcow2', fmt=qcow2 cluster_size=65536 
extended_l2=off compression_type=zlib size=21474836480 
lazy_refcounts=off refcount_bits=16
$ qemu-img create -F qcow2 -b testbacking.qcow2 -f qcow2 test.qcow2
Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off 
compression_type=zlib size=21474836480 backing_file=testbacking.qcow2 
backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
$ ls -l test*.qcow2
-rw-r--r-- 1 User Kein 197120 Aug 18 09:38 test.qcow2
-rw-r--r-- 1 User Kein 197120 Aug 18 09:34 testbacking.qcow2
$ qemu-img commit test.qcow2
Image committed.
$ ls -l test*.qcow2
-rw-r--r-- 1 User Kein 262144 Aug 18 09:39 test.qcow2
-rw-r--r-- 1 User Kein 197120 Aug 18 09:34 testbacking.qcow2
# Install Linux to image ...
$ qemu-system-x86_64 -accel whpx,kernel-irqchip=off -m 1G -hda test.qcow2 \
   -cdrom debian-10.8.0-amd64-netinst.iso
Windows Hypervisor Platform accelerator is operational
# Test Linux image before commit  ...
$ qemu-system-x86_64 -accel whpx,kernel-irqchip=off -m 1G -hda test.qcow2
Windows Hypervisor Platform accelerator is operational
$ ls -l test*.qcow2
-rw-r--r-- 1 User Kein 6641090560 Aug 18 10:57 test.qcow2
-rw-r--r-- 1 User Kein     197120 Aug 18 09:34 testbacking.qcow2
$ qemu-img commit test.qcow2
Image committed.
$ ls -l test*.qcow2
-rw-r--r-- 1 User Kein     262144 Aug 18 11:09 test.qcow2
-rw-r--r-- 1 User Kein 6641090560 Aug 18 11:09 testbacking.qcow2
$ rm test.qcow2
# Test Linux image after commit ...
$ qemu-system-x86_64 -accel whpx,kernel-irqchip=off -m 1G -hda 
testbacking.qcow2


