Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B32B81AB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:22:48 +0100 (CET)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQEJ-0007g6-5F
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:22:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfQCu-00073x-JS
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:21:20 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:60362 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kfQCs-0002OZ-K7
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:21:20 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 671C74131F;
 Wed, 18 Nov 2020 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1605716475;
 x=1607530876; bh=SFlVQVGrj2fC4a5X9UJI7cUDEjx8dpdnjFJ7VUZMCHY=; b=
 jVlNHGyA/FHBvmGFTvLZLeFfx5NAKBnstcAw6TOke6+SpV3Sd1UR3V+SNlilL4/x
 h/ewts249eykhA2ic3CzxYwG7JsS1s80Oun3TOb+T1vlAJpTLb+CnfvT7C61eF3a
 u2FI8RnPmpkYakAt25D+vQ8tybyy/2gOkHoiMuux464=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNzJgDKTEQ_9; Wed, 18 Nov 2020 19:21:15 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 38D074136D;
 Wed, 18 Nov 2020 19:21:15 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 18
 Nov 2020 19:21:14 +0300
Date: Wed, 18 Nov 2020 19:21:14 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH] hvf: Fix value of MMU_PAGE_NX and add MMU_PAGE_RS
Message-ID: <20201118162114.GC81070@SPB-NB-133.local>
References: <20201116201322.29262-1-jrtc27@jrtc27.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201116201322.29262-1-jrtc27@jrtc27.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 11:09:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 08:13:22PM +0000, Jessica Clarke wrote:
> These are meant to correspond to the error code reported for #PF, so fix
> the definition for Instruction Fetch faults and add one for Reserved Bit
> faults (checking for that is currently a TODO in x86_mmu.c).
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>  target/i386/hvf/x86_mmu.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/hvf/x86_mmu.h b/target/i386/hvf/x86_mmu.h
> index cd6e137e79..710adb82b5 100644
> --- a/target/i386/hvf/x86_mmu.h
> +++ b/target/i386/hvf/x86_mmu.h
> @@ -34,7 +34,8 @@
>  #define MMU_PAGE_PT             (1 << 0)
>  #define MMU_PAGE_WT             (1 << 1)
>  #define MMU_PAGE_US             (1 << 2)
> -#define MMU_PAGE_NX             (1 << 3)
> +#define MMU_PAGE_RS             (1 << 3)
> +#define MMU_PAGE_NX             (1 << 4)
>  
>  bool mmu_gva_to_gpa(struct CPUState *cpu, target_ulong gva, uint64_t *gpa);
>  
> -- 
> 2.28.0
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

But I agree with Paolo that eliminating HVF-only definition duplicates
would be helpful.

Thanks,
Roman

