Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468022A69F3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 17:38:07 +0100 (CET)
Received: from localhost ([::1]:49728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaLnS-0007Hu-Bp
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 11:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kaLlT-0005zq-G6
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:36:03 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:39118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kaLlR-0001JR-Oj
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 11:36:03 -0500
Received: by mail-qk1-x731.google.com with SMTP id k9so19848324qki.6
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 08:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=P4Fw55UmuNzALpQluqOSNlVrqJ0798a3jC4C+Dv3PCU=;
 b=jiaFKfYAksWNMJMW3F6fB3MG7tDQ2IVKWT2/IWM0XwhJT2aNcNN2Ta4xH03c1bhGaj
 O40vw1Ac881BFQ/1tBlqL6/UoOdeObqHjQ//I10Des42DLpmH4QvEAR/gyvDYX+d/xIe
 g2R7p7g4wNqkSqOCTTPVkc3ZZwUdqyZ43AEsj1hodi1Hutu3ct5tg6YWFzmeJvbKqGEU
 EgKDrWFVBJc75Jt8xX+tzW0uDXxm7yCHKic1aehNJQUp4cCMCIFMwIWu98+N4zzHqo6H
 m2MrlBAMhLoRQZRFxBICKl/eRghteGN+LRNWoemri6JqVBybANHGxSscY89cPHQvbP5H
 4KLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=P4Fw55UmuNzALpQluqOSNlVrqJ0798a3jC4C+Dv3PCU=;
 b=WFHYW0HRqGsx5C41yD22pzCEt3g31nyOab9b6rOyrb7C9tmFB+vKQIJekQQgdNA4Wb
 xqOygFKHQDzR5qb5H1Qyzv580FJHL4g+86BULGVJTdxF9kFCQxtKxBCGmCPNiHKK5UNE
 SfqtkLmRlZmhoWxGiLzBr2a1rm7MKIyRDMmnxU38C65+LRir0sIxOaanA4Q7/RGaBi2k
 aKxX2UiJNCY2tkFdVpSHAPvpXJS0hf3Zn23jc7w4O7gzNKySAZGs5ZQ2GZbAgsKG4vAl
 Ngr3SvAdxfMzkDru58oJvh5fH/nfIEPEMoEkAK22sNcNK1R/IAH1oFPRbroBzXFJ+DH1
 2kKg==
X-Gm-Message-State: AOAM531J3Hzy1JSQhMNxsrINTMU0zljaJm26x5UGhdY4Xm9SHn6jisqJ
 1Dzn7G92S2MNVU5P3ZhvOoYfp7cUYg==
X-Google-Smtp-Source: ABdhPJxk+pTDiEkg7mqULZ2Q7QyX4BptCUz57wRLDrMMMA1zKdU8e63tublJa2WoaVQZgaL1k8afhQ==
X-Received: by 2002:a37:3d1:: with SMTP id 200mr2655320qkd.43.1604507759670;
 Wed, 04 Nov 2020 08:35:59 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id b16sm2715223qkh.42.2020.11.04.08.35.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Nov 2020 08:35:58 -0800 (PST)
Date: Wed, 4 Nov 2020 11:35:56 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: qemu-devel@nongnu.org
Subject: locking option doesn't work as expected
Message-ID: <20201104163556.ifevmhkj4bw6iuc2@gabell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=msys.mizuma@gmail.com; helo=mail-qk1-x731.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Hello,

It seems that locking option doesn't work as expected.
When I run qemu as following options, then I got an error and failed to
boot the guest:

  qemu-system-x86_64 \
    -machine pc \
    -enable-kvm \
    -cpu host \
    -smp 1 -m 4G \
    -nographic \
    -serial telnet::1235,server,nowait \
    -blockdev driver=qcow2,node-name=disk,file.driver=file,file.filename=/mnt/guest.qcow2,file.locking=auto \
    -device virtio-blk-pci,scsi=off,drive=disk,id=virtio-disk0,bootindex=1

  qemu-system-x86_64: -blockdev driver=qcow2,node-name=disk,file.driver=file,file.filename=/mnt/guest.qcow2,file.locking=auto: Failed to lock byte 100

The error happens when the filesystem doesn't support OFD lock.
qemu_probe_lock_ops() judges whether qemu can use OFD lock or not with doing
fcntl(F_OFD_GETLK) to /dev/null, so the error happens if /dev/null supports OFD lock,
but the filesystem doesn't support the lock.

I'm thinking how to fix the error. My idea is to add locking=posix option to use posix
lock to the file, but I'm not sure the idea is good way to fix the error...

I would appreciate it if you could give me some advises to fix the error.

BTW, locking=off may be useful for the workaround so far, however, locking=off
doesn't work on the splitting blockdev configs as followings...
I split the blockdev option as libvirt doing.

   -blockdev driver=file,filename=/mnt/guest.qcow2,node-name=storage,auto-read-only=on,locking=off \
   -blockdev node-name=format,read-only=off,driver=qcow2,file=storage \

Thanks,
Masa

