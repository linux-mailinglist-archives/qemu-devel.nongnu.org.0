Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2F22DDB8D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 23:41:31 +0100 (CET)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq1xi-0004Bc-JA
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 17:41:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kq1vt-0003cv-RL
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:39:37 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1kq1vr-0005LE-Mc
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:39:37 -0500
Received: by mail-pl1-x62f.google.com with SMTP id v3so307818plz.13
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 14:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iMeMlLGKP8FZSmK4YfRNroq3Yxy5IC+NFRd33KyDgN8=;
 b=CwbhoJU12T2mi9nJp8N+2eKERdsxjUWMZ7bMSoqrKXyWFfYhR04AkO5llT6bSs/u7W
 5kQTS9lYtfolSJCz492yg3KJXGpWYN+27couToO6RgV+hXhVZflcFjETuWEwR2WubKj4
 Q07TOdqiAifytSQ3/QIL5QfEB36BCtHUvAmJdJjbGf0qKFMKs1Y/8lknFXzM+aYg9/Ya
 TaDR+8A+D7pBumjj+lDMgc4DoLR5EB/ACLXEeQen8/VkCWZ+DdEYYLsvZefRR18K8LW+
 yRCe4UOZy5J78l9wHCUrS/5/sfxLeeYKH8GLdSIIAscGOeslUZ4mMfd+XdPX7cLXZWmo
 f0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iMeMlLGKP8FZSmK4YfRNroq3Yxy5IC+NFRd33KyDgN8=;
 b=ULYqPMkv5She5/2bap7s/q4LSFChMs70OShM0J7EieyaQiwtAfuD6kk8wmaTkSV79P
 esED41OlscTfom6S20v+sd8ZCCjl58mBHwV8HSt8yPv9YwWeD64fXpYhodtKaBis7a9V
 rSLXoUg1Zges5Az3vbUyDpTbrCi26JsaYWTQECGOLYznPPefAEBpg3vrmusW2QVTE2t0
 4004nByDDki/VNQb9gUgNAa3hLtUzBll+f6bXC9TrjRjF95vP9TkqPXYjNa9VPFuKJj6
 RWTVrXwPSV6+gyfdBuQJhvueIQMWmSqHI7iGAibJTNVQ+z7OusAJnYmxJdoy82uEpek5
 vb1A==
X-Gm-Message-State: AOAM533RxKqdDJG1jR+qe20j4mknpBNEegizOYgeD/Dwp/jQ65oIn5aV
 9NirD7iTcJdtvDQsdn6S3CURFA==
X-Google-Smtp-Source: ABdhPJxuS2u1+0xapJMGi039QhxxUK4HYKdhkxhtdtysNpHS48pegURr9QvtaBoKOuXiVA4o76s7ww==
X-Received: by 2002:a17:90a:bf88:: with SMTP id
 d8mr1368956pjs.102.1608244773776; 
 Thu, 17 Dec 2020 14:39:33 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o129sm6274967pfg.66.2020.12.17.14.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 14:39:33 -0800 (PST)
Date: Thu, 17 Dec 2020 14:39:33 -0800 (PST)
X-Google-Original-Date: Thu, 17 Dec 2020 14:39:31 PST (-0800)
Subject: Re: [PATCH] RISC-V: Place DTB at 3GB boundary instead of 4GB
In-Reply-To: <5b73f3cfc2c278acd4b0afc36c5d7fa764bcc9ae.camel@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-46db8e2c-05a2-4333-99de-af0d7e13e71d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <Anup.Patel@wdc.com>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 14:35:10 PST (-0800), Atish Patra wrote:
> On Thu, 2020-12-17 at 14:31 -0800, Palmer Dabbelt wrote:
>> On Thu, 17 Dec 2020 13:48:26 PST (-0800), Atish Patra wrote:
>> > Currently, we place the DTB at 2MB from 4GB or end of DRAM which
>> > ever is
>> > lesser. However, Linux kernel can address only 1GB of memory for
>> > RV32.
>> > Thus, it can not map anything beyond 3GB (assuming 2GB is the
>> > starting address).
>> > As a result, it can not process DT and panic if opensbi dynamic
>> > firmware
>> > is used.
>> > 
>> > Fix this by placing the DTB at 2MB from 3GB or end of DRAM
>> > whichever is lower.
>> > 
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > ---
>> >  hw/riscv/boot.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> > 
>> > diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
>> > index d62f3dc7581e..9e77b22e4d56 100644
>> > --- a/hw/riscv/boot.c
>> > +++ b/hw/riscv/boot.c
>> > @@ -203,9 +203,9 @@ uint32_t riscv_load_fdt(hwaddr dram_base,
>> > uint64_t mem_size, void *fdt)
>> >       * We should put fdt as far as possible to avoid kernel/initrd
>> > overwriting
>> >       * its content. But it should be addressable by 32 bit system
>> > as well.
>> >       * Thus, put it at an aligned address that less than fdt size
>> > from end of
>> > -     * dram or 4GB whichever is lesser.
>> > +     * dram or 3GB whichever is lesser.
>> >       */
>> > -    temp = MIN(dram_end, 4096 * MiB);
>> > +    temp = MIN(dram_end, 3072 * MiB);
>> >      fdt_addr = QEMU_ALIGN_DOWN(temp - fdtsize, 2 * MiB);
>> > 
>> >      fdt_pack(fdt);
>> 
>> Presumably this was the cause of that 32-bit boot issue?
> 
> 
> This fixes the fw_dynamic case if you use more than 1GB of memory.
> The other issue was with the kernel. I sent the kernel fix yesterday.
> 
> https://patchwork.kernel.org/project/linux-riscv/patch/20201217074855.1948743-1-atish.patra@wdc.com/
> 
> Can you include the kernel fix in your next PR ?

Not the one I'm writing up right now, as I want to get the new stuff up earlier
in the merge window this time around.  I'm planning on sending fixes during the
merge window, though, as we have a few.  We have tomorrow off, so I should be
able to get through all the email and send it either over the weekend or early
next week.

