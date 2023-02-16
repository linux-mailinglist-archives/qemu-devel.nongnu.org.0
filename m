Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E3B6994FF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:57:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdoP-0005VG-Dt; Thu, 16 Feb 2023 07:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdoI-0005Se-J4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:56:26 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdoG-0006Tf-6J
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:56:25 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so4004309wmp.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DWNzeXDYa5Q+N3xw5nFPU0mYbAvIsHA93QjIHPil1d8=;
 b=mDXNpzK3YMMWLmQ5Y/tQ2W+6rze0y1afl9wY7IVw/D1GGk4+lg/Lec9a+fAbukKj1H
 lro1DKDlTySKPxoQ727wz4mPSU6BeFOVBpw4X+mMSXYcTHg0q20wCT4i11VoTdoVC2CA
 bRRBv/HIjH+wRK+NgV8oYwUjG8jIswXjyWJD5tqb5KRZjviFjQb4FfjxzT6PBiKiZY62
 briwK5KxD5VsTtmXE6RzBPo1RALFWANEHJux19taPMiO6Mo7VRzXeEMmFZRtW0RjULKq
 hA9OKbAQ2zhU6xsyA1QBOYxSU8vBAWPLHC41ITm20wrE5XoqSV3dcpRrRzWuGdiMHvBo
 APEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWNzeXDYa5Q+N3xw5nFPU0mYbAvIsHA93QjIHPil1d8=;
 b=fas8yyEoSj/92wOo1obh+yOS5918+9reL0avtaYmIQDgOs1ZfP2OP1JUwWZm8FFubb
 qo61nU84pu+3g/33YwjimgezlFp+f38zeIZRW2hJXg3whQ+Ic9ltQeJZ/wprrcPL0E12
 Zub81NpkNWsVWlbnVP8gjaxo1xSwDRI9nAv4HBxP3s6QQexr5GHjGVU63jdMVM3HtzMh
 s7nCDMLe1tRoAy+gTyUifmG4UiDZb+fcIvi1OwpwmT7HrIhW/g02Yo2Bkqm5x4b0yrY0
 PJRYSB6nP6LjZYPB5e6JQNZv1i0Rhog4zbdIGGNfxcVPnFGgZfWGwXevxYXvCVzgPlOO
 RWgA==
X-Gm-Message-State: AO0yUKX0JlBvDMA1aMFcYZ1CDdNqvdJ7ydqpDp1PCY+H1cV6srvj3pkj
 sbS3USaZwq7f/OLnMy1FBvgSYvfLFAPmT93RZQs=
X-Google-Smtp-Source: AK7set9WZ70Q3FV8t0JBrn8XyTg8uEIHYvDCSHu6VabiNWIviwPdxTu/WLTfEjYF2x+FFGyqb+E52A==
X-Received: by 2002:a05:600c:1d25:b0:3dd:c896:d2b1 with SMTP id
 l37-20020a05600c1d2500b003ddc896d2b1mr219883wms.0.1676552182336; 
 Thu, 16 Feb 2023 04:56:22 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 b7-20020a5d5507000000b002c550eb062fsm1498474wrv.14.2023.02.16.04.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:56:21 -0800 (PST)
Date: Thu, 16 Feb 2023 12:56:17 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 03/16] hw/arm/smmuv3: Rename smmu_ptw_64
Message-ID: <Y+4n8aJkQu/479Ir@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-4-smostafa@google.com>
 <608e2401-83f1-e7c6-af17-25da22df76a6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <608e2401-83f1-e7c6-af17-25da22df76a6@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Wed, Feb 15, 2023 at 05:53:23PM +0100, Eric Auger wrote:
> > +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> >  {
> >      dma_addr_t baseaddr, indexmask;
> >      int stage = cfg->stage;
> > @@ -384,7 +384,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> >          g_assert_not_reached();
> >      }
> >  
> > -    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
> > +    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> May need to rename the trace points as well
> 
All PTW trace points have a stage argument which is set correctly
from stage-1/stage-2 ptw functions:
trace_smmu_ptw_page_pte
trace_smmu_ptw_block_pte
trace_smmu_ptw_invalid_pte

trace_smmu_ptw_level is the only one that had no stage argument, I can
change it to be consistent with the others.

Thanks,
Mostafa

