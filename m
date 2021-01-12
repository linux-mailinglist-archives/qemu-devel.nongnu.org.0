Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B76C2F292C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:49:06 +0100 (CET)
Received: from localhost ([::1]:34442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEQL-0000n8-FG
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kzENy-0000Fv-MX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:46:38 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:57246 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kzENw-0001r3-Uj
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:46:38 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id ABA3D41281;
 Tue, 12 Jan 2021 07:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610437591;
 x=1612251992; bh=WfVOY3sHPxIUMl3Iq1ki8NbSYH9tSqh2VpKGD7HE7hw=; b=
 nwKBCiLyrDqhU4OZ4OgK28kEQTMmr7T+7HiW0exZWblVYrZt/jpXgCp1ih0+85VV
 s36/1OpnotBC1kN615bo6h2VsWm2oojja8M8qrXeJ5F//aNjeBbGrHBtiCneGu8J
 aEmYE61xsPGeTBqFxhhBTp7T241+rtn0Zs5dDn8BCv8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ma3ghYMzaJfy; Tue, 12 Jan 2021 10:46:31 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4D2EC412FC;
 Tue, 12 Jan 2021 10:46:31 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 12
 Jan 2021 10:46:30 +0300
Date: Tue, 12 Jan 2021 10:46:16 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Hill Ma <maahiuzeon@gmail.com>
Subject: Re: [PATCH v2] hvf: guard xgetbv call.
Message-ID: <X/1TyPrA1LeEqS6d@SPB-NB-133.local>
References: <X/ts5kQD31VLIn0n@Hills-Mac-Pro.local>
 <X/vWU7/pPpXZfVOC@SPB-NB-133.local>
 <CABpQrUMmmo1RECW0qpROfZmFdPSFwG2HFwKiZiqkWxU+hqCvZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CABpQrUMmmo1RECW0qpROfZmFdPSFwG2HFwKiZiqkWxU+hqCvZw@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org, dirty@apple.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 09:44:40PM -0800, Hill Ma wrote:
> On Sun, Jan 10, 2021 at 8:38 PM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> > I'm not sure if eax should be modified with mask because the mask has no
> > value per se. I.e. eax &= supp_xcr0 from below should be placed inside
> > the if. It'd express clearly that eax is not modified unless xgetbv is
> > supported.
> 
> Like this?
> 
> -            uint64_t host_xcr0 = xgetbv(0);
> -            uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK |
> XSTATE_SSE_MASK |
> +            uint64_t host_xcr0;
> +            if (xgetbv(ecx, 0, &host_xcr0)) {
> +                uint64_t supp_xcr0 = host_xcr0 & (XSTATE_FP_MASK |
> XSTATE_SSE_MASK |
>                                    XSTATE_YMM_MASK | XSTATE_BNDREGS_MASK |
>                                    XSTATE_BNDCSR_MASK | XSTATE_OPMASK_MASK |
>                                    XSTATE_ZMM_Hi256_MASK |
> XSTATE_Hi16_ZMM_MASK);
> -            eax &= supp_xcr0;
> +                eax &= supp_xcr0;
> +            }

Yes.

Thanks,
Roman

