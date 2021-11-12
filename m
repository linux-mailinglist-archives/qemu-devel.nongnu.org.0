Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C744EC20
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 18:43:57 +0100 (CET)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlaai-0007nl-BT
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 12:43:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brak@vultr.com>) id 1mlaZL-0006Nj-Np
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 12:42:31 -0500
Received: from [2607:f8b0:4864:20::102a] (port=46607
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brak@vultr.com>) id 1mlaZK-0002Et-1k
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 12:42:31 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so6966045pjb.5
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 09:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vultr.com; s=google;
 h=from:message-id:date:mime-version:user-agent:subject:reply-to:to
 :content-language:content-transfer-encoding;
 bh=Mq3tDg0k6CX8E6nbDfGC1ENHbcQ1qSwdqVpvns+s3GI=;
 b=ob4iRJGrZO4WOrxRysbiwoJ/og4A/LfSMaMrhsnchv7RU3iTeYsnZ4uv80Zo6E9/8f
 HpLwdsE0FrHxcKgQyVdRX1NQLexP59focnkWcbFqUGCcbdR48+GUHt4zmlNrLZG0hlaw
 3P3QJSEEM+DE3aqh7H4qtbPiqB2obgQWMElgxHlvw9b/eP1FghcfJ6PpWjUD11lXn2wW
 Q3Vu1gbkU1EF3ljv9GuRg19HqiDHDAtCQlF+GyPe4eAWl/Jz3oxq33wBrNANT/wfyr2e
 Mc7L3EW1lkvTWG81zGfGOz/BKrqgzVyNgi3VMcjsKPXUgVFqE9wyBGjcmIZHSuojbCLG
 QJZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:reply-to:to:content-language:content-transfer-encoding;
 bh=Mq3tDg0k6CX8E6nbDfGC1ENHbcQ1qSwdqVpvns+s3GI=;
 b=ky5ru8uxDhlZhbeo9LiaeneEcHOpdXhgEsNlFr9N0nQC7VaKbxZ6sT6vAaq0amWYz6
 TBIWAX26HiR4z5Pez7na9HCK0H9WaoBlrPO3gnINfcRKTOC0qAl7vkWrDH8T617NIUL5
 aJaGyTD702DCIYPsjHyckmGeAPiQ0tgDv+D3azEZCTiVcA9QvlInkzYa/gzHH3PZwX1X
 suAras5F4MrNuLA4pLm6n141tB1a37lIxwPQqWGhCtYXpC0dP0WT/+8UxD/rX6X7t6+r
 W0gvn/RAMlr5gjT7XFd6IZGEQ/2xGhCIpnl5p2XnIrDLn3BgrdAX4wRqSY/EXHfneL6u
 Q9zw==
X-Gm-Message-State: AOAM533RXY7TRGMLOSdgtrzFMiGCdKYONyVs8HZasilDxQO0+/miNNwX
 mdN90b5A5kthSYYQ7LusdELxV9hn9dE00r+Vt0Q07g3CIMYP5ZwQH5+CSSsmluOApfOIMjsgvRN
 S7zx2Is3IMBfqy+obiFxOV+SoyMRfx3J0L1qz2u7oeP1r/nCLiDYGWALwlMV/ZxQ=
X-Google-Smtp-Source: ABdhPJz9DpH4ZFhevewXjnTdEDpUrlq/yxH4L05L7o5V8E5nRQxsBpJYXRvG5srxc5FNCiwm85kmXA==
X-Received: by 2002:a05:6214:e8b:: with SMTP id
 hf11mr16662770qvb.40.1636738508440; 
 Fri, 12 Nov 2021 09:35:08 -0800 (PST)
Received: from [192.168.5.229] (ool-44c536c3.dyn.optonline.net.
 [68.197.54.195])
 by smtp.gmail.com with ESMTPSA id 1sm3453755qtx.65.2021.11.12.09.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 09:35:08 -0800 (PST)
From: Brian Rak <brak@vultr.com>
X-Google-Original-From: Brian Rak <brak@gameservers.com>
Message-ID: <abff2095-9ac8-c115-bc7f-6a19b9defe51@gameservers.com>
Date: Fri, 12 Nov 2021 12:35:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Guests wont start with 15 pcie-root-port devices
To: qemu-devel <qemu-devel@nongnu.org>, marcel.apfelbaum@gmail.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=brak@vultr.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: brak@gameservers.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In 6.1, a guest with 15 empty pcie-root-port devices will not boot 
properly - it just hangs on "Guest has not initialized the display 
(yet).".  As soon as I remove the last pcie-root-port, the guest begins 
starting up normally.  My qemu command line:

/usr/libexec/qemu-kvm -name guest=xxx,debug-threads=on -S -object 
{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-29-xxx/master-key.aes"} 
-machine 
pc-q35-6.1,accel=kvm,usb=off,dump-guest-core=off,memory-backend=pc.ram 
-cpu Haswell-noTSX-IBRS -m 4096 -object 
{"qom-type":"memory-backend-ram","id":"pc.ram","size":4294967296} 
-overcommit mem-lock=off -smp 2,sockets=2,cores=1,threads=1 -uuid 
daf2c139-4991-4079-9b8a-b4c98fc675e0 -no-user-config -nodefaults 
-chardev socket,id=charmonitor,fd=31,server=on,wait=off -mon 
chardev=charmonitor,id=monitor,mode=control -rtc base=utc -no-shutdown 
-boot strict=on -device 
pcie-root-port,port=0x10,chassis=1,id=pci.1,bus=pcie.0,multifunction=on,addr=0x2 
-device 
pcie-root-port,port=0x11,chassis=2,id=pci.2,bus=pcie.0,addr=0x2.0x1 
-device 
pcie-root-port,port=0x12,chassis=3,id=pci.3,bus=pcie.0,addr=0x2.0x2 
-device 
pcie-root-port,port=0x13,chassis=4,id=pci.4,bus=pcie.0,addr=0x2.0x3 
-device 
pcie-root-port,port=0x14,chassis=5,id=pci.5,bus=pcie.0,addr=0x2.0x4 
-device 
pcie-root-port,port=0x15,chassis=6,id=pci.6,bus=pcie.0,addr=0x2.0x5 
-device 
pcie-root-port,port=0x16,chassis=7,id=pci.7,bus=pcie.0,addr=0x2.0x6 
-device 
pcie-root-port,port=0x17,chassis=8,id=pci.8,bus=pcie.0,addr=0x2.0x7 
-device 
pcie-root-port,port=0x18,chassis=9,id=pci.9,bus=pcie.0,multifunction=on,addr=0x3 
-device 
pcie-root-port,port=0x19,chassis=10,id=pci.10,bus=pcie.0,addr=0x3.0x1 
-device 
pcie-root-port,port=0x1a,chassis=11,id=pci.11,bus=pcie.0,addr=0x3.0x2 
-device 
pcie-root-port,port=0x1b,chassis=12,id=pci.12,bus=pcie.0,addr=0x3.0x3 
-device 
pcie-root-port,port=0x1c,chassis=13,id=pci.13,bus=pcie.0,addr=0x3.0x4 
-device 
pcie-root-port,port=0x1d,chassis=14,id=pci.14,bus=pcie.0,addr=0x3.0x5 
-device 
pcie-root-port,port=0x1e,chassis=15,id=pci.15,bus=pcie.0,addr=0x3.0x6 
-device qemu-xhci,id=usb,bus=pci.1,addr=0x0 -audiodev 
id=audio1,driver=none -vnc 
127.0.0.1:5410,websocket=41310,password=on,audiodev=audio1 -device 
cirrus-vga,id=video0,bus=pcie.0,addr=0x1 -device 
virtio-balloon-pci,id=balloon0,bus=pci.2,addr=0x0 -sandbox 
on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny 
-msg timestamp=on

The same guest XML that produced this worked fine in 5.2  I was able to 
bisect this down to this commit:


commit e2a6290aab578b2170c1f5909fa556385dc0d820
Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date:   Mon Aug 2 12:00:57 2021 +0300

     hw/pcie-root-port: Fix hotplug for PCI devices requiring IO

Although I can't say I really understand why that commit triggered it.


