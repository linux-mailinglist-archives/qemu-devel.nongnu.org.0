Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3553DB950
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:28:31 +0200 (CEST)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9SYw-0007Ez-0G
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SWe-000589-0J
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:26:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9SWb-00007k-2J
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627651564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Em7L8HoW6ray9DM0pblJoBfD83p/5VfH5UcsY77kZaA=;
 b=DNxDDUEX9w6lyri5xZn+qUKDG1d1eXDeU7nYOAeHDZFzz5f30YALSQ20VRmcOTKEPxp4si
 m6hZRDxoqM4qJdcMwE0LWTG5613TH53afdbd+P1XvxSg3XHZlQhxzU12DI5Pe0kynGnQBL
 TZcnSZNRTvij1xAObtp2rYcXFhsoPao=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-705bIOSJNmmZ2p1LEJff4w-1; Fri, 30 Jul 2021 09:26:03 -0400
X-MC-Unique: 705bIOSJNmmZ2p1LEJff4w-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a7bc5d10000b0290228d7e174f1so1606633wmk.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Em7L8HoW6ray9DM0pblJoBfD83p/5VfH5UcsY77kZaA=;
 b=k28/lQOCBJUH2247yB0qbvCgQd3zrNouzQeKJnT2MlEk4C9pk+BSxMbn+ThkOH8FD/
 okiBGLpJQQr4qm05zAfnKJ9o3pWDUULxbpW6RQ7xw2qMmcG81NMo/ktGOG+5qeG6FfGm
 CnWTh7xkt+J1nIaB5q2EaazEf/KvBWY89C/K7IaA8SPJLEDGj0x8Ph40v3MhH/1eyJnP
 TSSqcaSlWOVu9dsDXXlTUMKYtz+MzQvjxJWTaWQ7t9hLE2SpV9yykfkaCylnI8Uuf4Jf
 jbngDAQw2W8xnOsQKVSbMrW8HuqnS8uPRxp68keyx4GXtNP1F9ygGVZAwiCNVVQq3FzG
 jeLA==
X-Gm-Message-State: AOAM533OVs+ohrV0Cp5eTgVDnotl7/b1vQHvWCJYvGjC0OkHQBJvc+AZ
 tWFu3h7qeNg2rhYcFqnDD4usT/i6NDEX56XKpfOBUhQ+7ftW2xxT+NQV+WNall5yfaz+1Ssomxv
 pVa2MuzLAF8lnXcMyDutFREXPIZnHeNXcmb4UnO9shOWOvVczAtbuSt/udyyHNnHj
X-Received: by 2002:a1c:a94f:: with SMTP id s76mr2948947wme.17.1627651561587; 
 Fri, 30 Jul 2021 06:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFEERr+iV715C/EFQxxSfkuucyczCpfGqrAJy99oaMG0HD5HmIL6lPRLUqIx5KEQyejwGMIg==
X-Received: by 2002:a1c:a94f:: with SMTP id s76mr2948925wme.17.1627651561261; 
 Fri, 30 Jul 2021 06:26:01 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id x18sm1732195wrw.19.2021.07.30.06.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:26:00 -0700 (PDT)
Subject: Re: need help with my config
To: Lindsay Ryan <Ryan.Lindsay@petermac.org>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>
References: <MEYP282MB168775224F9A7690C9F5AEF9F9EC9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <82ae0532-50c2-7a67-af16-04226cb2986b@redhat.com>
Date: Fri, 30 Jul 2021 15:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB168775224F9A7690C9F5AEF9F9EC9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-ppc@

On 7/30/21 6:25 AM, Lindsay Ryan wrote:
> Hi
> I'm trying to emulate some physical IBM Power 9's that we have. There
> seems to be plenty of examples of using x86_64 qemu, but slightly less
> for Power. Unless it's specifically for installing AIX
> Anyway, I'm trying to boot the VM as I guess a bare metal Power 9 box,
> then install redhat from Iso on a disk and have it on the network.
> 
> ./qemu-system-ppc64 -cpu POWER9 -smp cpus=4 -machine pseries -m 4096 -M
> accel=tcg  -serial stdio -nodefaults -nographic -device
> megasas,id=scsi0,bus=pci.0,addr=0x5 -drive
> file=/home/hdisk1.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none
> -device
> scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=2
> -cdrom /mnt/images/rhel-8.4-ppc64le-boot.iso -monitor
> telnet:0.0.0.0:3344,server,nowait -netdev
> bridge,id=net0,helper=qemu-bridge-helper,br=bridge0,id=hostnet0
> 
> So the megasas gets detected as a raid controller. Yay. 
> But my qcow2 disk image doesn't seem to be plugged into it correctly as
> it's not detected. 
> It sees the cdrom image and I can boot from it.
> The other thing I can't get working is the network card. 
> 
> On this host system I have some other x86 kvm's running. So Ideally if I
> could plug the nic on this vm into 
> 7: virbr0
> 
> 6: bridge0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
> state UP group default qlen 1000
>     link/ether 00:25:b5:04:2a:1e brd ff:ff:ff:ff:ff:ff
>     inet 10.126.24.82/24 brd 10.126.24.255 scope global noprefixroute
> bridge0
>        valid_lft forever preferred_lft forever
>     inet6 fe80::76a8:89ec:fc62:9c94/64 scope link noprefixroute
>        valid_lft forever preferred_lft forever
> 7: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
> state UP group default qlen 1000
>     link/ether 52:54:00:51:db:be brd ff:ff:ff:ff:ff:ff
>     inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
>        valid_lft forever preferred_lft forever
> 
> If I can't do that, then I really only need the ppc64 guest to have
> access out to the internet and I can nat anything incoming
> 
> Any help, particularly about how to plug virtual disk drives into
> virtual disk controllers would be helpful
> regards
> 
> 
> Ryan Lindsay BEng, MSc.
> Linux Storage Administrator
> Research Computing Facility
> 
> 
> *Disclaimer: *This email (including any attachments or links) may
> contain confidential and/or legally privileged information and is
> intended only to be read or used by the addressee. If you are not the
> intended addressee, any use, distribution, disclosure or copying of this
> email is strictly prohibited. Confidentiality and legal privilege
> attached to this email (including any attachments) are not waived or
> lost by reason of its mistaken delivery to you. If you have received
> this email in error, please delete it and notify us immediately by
> telephone or email. Peter MacCallum Cancer Centre provides no guarantee
> that this transmission is free of virus or that it has not been
> intercepted or altered and will not be liable for any delay in its receipt.
> 


