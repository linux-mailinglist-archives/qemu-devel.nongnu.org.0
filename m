Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71406714B0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:15:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI2de-00065R-Ir; Wed, 18 Jan 2023 02:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pI2dO-0005za-35
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:13:23 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pI2dK-0004LY-3S
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 02:13:20 -0500
Received: from [10.0.41.144] (unknown [80.250.189.91])
 by mail.ispras.ru (Postfix) with ESMTPSA id E357644C1007;
 Wed, 18 Jan 2023 07:12:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru E357644C1007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674025969;
 bh=f3KEDNF7/YYgCbAXPpVwBReOCwOheF17f/zgaUVaqZ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oWOtwIi2zE4OfAEVnk8h4+9vw1Jd3QLnwLoeUsJ9eWna+cFeZgKPvcxC9qg+qShQS
 HaC7HL/wpJ63pTSORMbUPpQf2yU2177sxfXX8Xs2DSybdaf4OBeMDNcb9tX92x+1Dk
 LFsaBhYfgXuBUY6MkwkB2T4t9zUX923lIymj32/E=
Message-ID: <cf7bf2cb-b142-6658-5778-081d5b3b4c2b@ispras.ru>
Date: Wed, 18 Jan 2023 10:12:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: reverse-{debugging,continue} not working on v7.2.0, i386 guest
Content-Language: en-US
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>, qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <Y8eOSedPWlOjriho@localhost>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <Y8eOSedPWlOjriho@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As replay works well, the reverse debugging should be ok too.
But for "going back" it needs a VM snapshot that can be used for reload.

Snapshots are saved on qcow2 images connected to QEMU.
Therefore you need to add an empty qcow2 to your command line with the 
following option: -drive file=empty.qcow2,if=none,id=rr

And you also need to add rrsnapshot to icount for creating the snapshot 
at the start of VM execution:
-icount shift=auto,rr=record,rrfile=$REPLAY_FILE,rrsnapshot=start


On 18.01.2023 09:14, Hyeonggon Yoo wrote:
> Hello QEMU folks.
> I was struggling to fix a recent heisenbug in the Linux kernel,
> and fortunately the bug was reproducible with TCG and -smp 1.
> 
> I'm using qemu version 7.2.0, and guest architecture is i386.
> I tried to inspect the bug using record/replay and reverse-debugging
> feature in the QEMU.
> 
> 
> recorded with:
> 
> qemu-system-i386 \
>          -icount shift=auto,rr=record,rrfile=$REPLAY_FILE \
>          -kernel arch/x86/boot/bzImage \
>          -cpu SandyBridge \
>          -initrd debian-i386.cgz \
>          -smp 1 \
>          -m 1024 \
>          -nographic \
>          -net none \
>          -append "page_owner=on console=ttyS0"
> 
> and replayed with:
> 
> qemu-system-i386 \
>          -icount shift=auto,rr=replay,rrfile=$REPLAY_FILE \
>          -kernel arch/x86/boot/bzImage \
>          -cpu SandyBridge \
>          -initrd debian-i386.cgz \
>          -smp 1 \
>          -m 1024 \
>          -nographic \
>          -net none \
>          -s \
>          -append "page_owner=on console=ttyS0"
> 
> (I'm using a initrd image instead of a disk file.)
> 
> The record and replay works well. The bug is reliably reproduced
> when relaying. but when I try to reverse-continue or reverse-stepi after
> kernel panic, the gdb only says:
> 
> 	"remote failure reply 'E14'"
> 
> Is there something I'm missing, or record/replay do not work with
> QEMU v7.2.0 or i386?
> 
> --
> Best regards,
> Hyeonggon


