Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEF44D1BB7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:29:00 +0100 (CET)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRblj-0005dp-OP
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:28:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nRbkF-0004Ui-52; Tue, 08 Mar 2022 10:27:27 -0500
Received: from [2a00:1450:4864:20::12b] (port=36578
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nRbkD-0006QD-Mj; Tue, 08 Mar 2022 10:27:26 -0500
Received: by mail-lf1-x12b.google.com with SMTP id bt26so13102310lfb.3;
 Tue, 08 Mar 2022 07:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NK5FwXTjSOeG1iVlCN+mXirX4i0K5bwcYnvkqJBj7jw=;
 b=VppRiwz7iBao4xgxiDgCyEtVHaYhaPfw4EY/4AYahzhcUka5YSP9osUTmkxmnlXRfx
 Jfdiw1nQa5zkwb5pCjPrFoZxedvamD/hZzP5XpeF1mVXRgo/kSUjsLrwB9vNySnOEgx5
 sfCkwv8/7BZIs8vYSpzd6slwA02im5KmGbW4yo78YalJXQDLkTkECD40/hxz4aCzUJrD
 gsCnbcqa/VCiIAmsQ9+OxXf3rfF9DIaGZJJ8PUSzYlqyQG5mzDxbrd/xlBZixQwPxH8e
 421rK/0WccOGzhQeOgAexFJItn+jrw4fkWTPVSwqm85wDCeNcWO5px8xvr7Uiyei475t
 cXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NK5FwXTjSOeG1iVlCN+mXirX4i0K5bwcYnvkqJBj7jw=;
 b=Dfvwl2Y34ohaq29xOG/e3ESU+Ryr6Jqhy0mPwWnL8IRZFCPUtyT+rCOPqsjyRKUdcx
 4Mhh16WBaB/pkRM19Njiisl10sakkdjOeDEpkIaSdduV2oXuIz8iG7SdJ2uGcV6Tw2vV
 HZI//u2JbLqZjHrOnWsgVth+HOzIfZY9FaERVxEKNkLh3d8/gZr19SdmoVfq0UAVgIvJ
 w7PdO+UmN0FeYhX5qLyFv1Xwxadw2uaQvkeD96LhBxAQhmgaKbKvbRTBBcZSmL0WJGwT
 Hoxub6CtJ3KBfaxBPtKyxRIsp1m8/lgptLMhbHrhV8jt3x3RIkr3GDv3yyWYxZ1c1SSN
 M6WA==
X-Gm-Message-State: AOAM532w/MNtjuGXBSCunI4PqAKl7fC/7gLaYdtCpKDrFzOs0lBfCdCQ
 cLMIEq627XkpsFJDPkDe3OM=
X-Google-Smtp-Source: ABdhPJyIBJJ9zoPwOiq7BikoWAZwnjfKe3/91kKd63QmbxNEAv9BRLNuCJjEtTLfdEy1PD3PATCgCw==
X-Received: by 2002:a05:6512:4cf:b0:448:4bbd:3762 with SMTP id
 w15-20020a05651204cf00b004484bbd3762mr585369lfq.441.1646753242453; 
 Tue, 08 Mar 2022 07:27:22 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a0565123c8c00b0044826d6ba04sm2051621lfv.208.2022.03.08.07.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 07:27:21 -0800 (PST)
Date: Tue, 8 Mar 2022 16:27:21 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
Message-ID: <20220308152721.GU3586016@toto>
References: <20220308150207.2546272-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308150207.2546272-1-peter.maydell@linaro.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 03:02:07PM +0000, Peter Maydell wrote:
> In commit 00f05c02f9e7342f we gave the TYPE_XLNX_CSU_DMA object its
> own class struct, but forgot to update the TypeInfo::class_size
> accordingly.  This meant that not enough memory was allocated for the
> class struct, and the initialization of xcdc->read in the class init
> function wrote off the end of the memory. Add the missing line.
> 
> Found by running 'check-qtest-aarch64' with a clang
> address-sanitizer build, which complains:


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


