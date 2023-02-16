Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7FF69965D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:52:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSegK-0007Kk-79; Thu, 16 Feb 2023 08:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSegI-0007JX-LE
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:52:14 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSegF-0006TD-Kj
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:52:13 -0500
Received: by mail-wm1-x332.google.com with SMTP id r18so1605825wmq.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2/13tiYI81FpDKKddFvA7ILvHfUZPvmt2iXRLFgT3x4=;
 b=h7VGCGcAdZB5bW9dXaQVi4uXOdPLZwq4zcwLhIdRpwd4uJrBCSdxiWJTeb30W6m1Bo
 P3viYnWPa/WUsm2gCm/p0YMyMJJAakrbyrwvoVei4o1aPNoMHxMtV3PhdEMtdYIardZ1
 Z1HnRg/4ICUYZbu6y1Ddjev2/YxdyqCnyVt1CJRL0198qKUP1UsgoO3+Xjxe7GIuCtjS
 r41qJQMCmxjf+iOrsF9Hkk9uV9CNs4yZ/Ed+auyXbxRZuSWXeGynH5w2nWevrehlnwdN
 RiHZmnLrGvaggE3Rg6bCQFKhWZubylhV6j6Qer6+LB0S/WGMVKHc01VFx1YCB8r2OPnG
 Hx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/13tiYI81FpDKKddFvA7ILvHfUZPvmt2iXRLFgT3x4=;
 b=WgnU+REIsksGLqYEIsaNI4+uA0+xTU4QCwrNnvMLE8ql1VL8OTkBJNTGaqjvmk5+p+
 ZjVCIqrw8RVYFAh54zOSlDveyr23ylammJqX6sSDvhkz1cxLLZ7rH/oMcsZYRVAh50vM
 QR3UhPDdXyj840DbjAQiRuf1eVu9XASJh4YuvuoxoLqHHqaRA1rPGow7VC1CXBaIjm0W
 hjwhF0fgPCPG1wkxgWYASYCCIoGacnS1swP1cM4Nu940AsfCt+Ef/9Z7DNN4M7sGdnJN
 +DyeARWZ3Gt1UEcN5mK4hGRZ/fqbr4A6WcHff7Z0CYFpPaSaIKybiiTgkRpRpOZVM+y3
 v2vw==
X-Gm-Message-State: AO0yUKWM3vMdOp23j3LngjDcyj2JnfyWE+x5xT2T52xdNc7J1FnT7FN7
 5mfGM/uE7+MeOxauRV3kFNipkA==
X-Google-Smtp-Source: AK7set92bBVAze4Ssofqn9JFwmAOBFhtm6VmaKY3Oy10sFF44kEVayu5hYixvx1o6QgZm3KFTcY/ng==
X-Received: by 2002:a05:600c:1d8c:b0:3df:f3cb:e8cd with SMTP id
 p12-20020a05600c1d8c00b003dff3cbe8cdmr224199wms.6.1676555530100; 
 Thu, 16 Feb 2023 05:52:10 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 a8-20020a5d5088000000b002c567881dbcsm1569703wrt.48.2023.02.16.05.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:52:09 -0800 (PST)
Date: Thu, 16 Feb 2023 13:52:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
Message-ID: <Y+41BbcL2WxCfbTk@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-13-smostafa@google.com>
 <Y+02xgL5RhO3vh6S@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+02xgL5RhO3vh6S@myrica>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=smostafa@google.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

Hi Jean,

Thanks for taking the time to check the patches.

On Wed, Feb 15, 2023 at 07:47:18PM +0000, Jean-Philippe Brucker wrote:
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 541c427684..028a60949a 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -56,10 +56,11 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
> >             (k1->level == k2->level) && (k1->tg == k2->tg);
> 
> I'm getting some aliasing in the TLB, because smmu_iotlb_key_equal() is
> missing the VMID comparison. With that fixed my handful of tests pass
> 
Oh, I missed that, I will update it in v2.

Thanks,
Mostafa

