Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953A6885C8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 18:58:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNdqG-0005DK-Em; Thu, 02 Feb 2023 12:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdq3-00054S-B0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:57:35 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNdq1-00022v-Df
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 12:57:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id jh15so2643863plb.8
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 09:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M6jS0CqXT05TF8VGyyPb39G9NGW2t9U8pkO4RoVI5SM=;
 b=HQZk/kFhzG3vnC1H8kwsNLOdhx0sVY3/j9/k50gLqk4zzNfeikIBYJttvgSU2Nmj9D
 6nO+IGdAWoiYKV28fPVBH2f3qgicWpg0RfP1d64xumvKycThTcBgt8qv2QbTfgLYx2Sv
 Cy7cCMRREc7kqsDF7f9awgcApc03JgTIUBnRN8VM59RUjHxxxtCt35Dha/3v61TPJ+Gt
 JGDMVsJbLrWh91l6t+2cDFqKP3dC7qB8rizpoK2ahyowuYTja638GMMNHNYK/gnQWcKB
 VcW3+bJaGPUyvBhHt3eVUof2VEjONSkMFPO2GGEMFoBXCnODEzzjryojWLTSbmcnUPic
 ZR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M6jS0CqXT05TF8VGyyPb39G9NGW2t9U8pkO4RoVI5SM=;
 b=bM+F1qKkx1RTQE1LPme6oyzX4gC5iSSXp2SEjG0IGETTh9xmzE7treTWrqB2ZFYEZq
 oMamSFv/+S4lukcDAZtdDLcPC9/GpxLkq7rtU99mwwNPr7H+vLi7rla9r0mkONhFy3l0
 bF3aJ2odn7WdPIWkcQcmv3bi1kbXUP5Ec0eXob8yjwrM1StD7JsqUP7ccMmgfpGuilVu
 c2pobfPalWyu7jplHv0ziwWbdDtPtZ+ViMQFLmZykijd5em2DKNsI3tPAqA6GQ50SJ/Z
 aFkw4sMhaT1N68KQPyixprOLBHdxFD8uHocibdJUVIwMYEVZH+GVodAWjFlAIQ3+ns+6
 s80w==
X-Gm-Message-State: AO0yUKUHtFSo2omBXc+gUeD+atfC2yEh/xH4/DCCFy273iztpdk3Chd/
 2NuGaD/8qZCBBRsPorDptXjQgkfU6v+XfIC/VUZxgw==
X-Google-Smtp-Source: AK7set9NV+R34TEquL4WPUZ5KPvHg3bct1tvvvisNla4i0TzJBW0INwwD8vFjPGmroH8C55eiHuA/I5poy5k7SFcqwA=
X-Received: by 2002:a17:902:f552:b0:198:a5da:bf6c with SMTP id
 h18-20020a170902f55200b00198a5dabf6cmr1810195plf.9.1675360652058; Thu, 02 Feb
 2023 09:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20221223090107.98888-1-agraf@csgraf.de>
In-Reply-To: <20221223090107.98888-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 17:57:21 +0000
Message-ID: <CAFEAcA8Aim73+og4dr5hD93mTZ8xSWZ-oxMSEY0x6Zs+vTC2pg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 23 Dec 2022 at 09:01, Alexander Graf <agraf@csgraf.de> wrote:
>
> The finalize_gic_version() function tries to determine which GIC version
> the current accelerator / host combination supports. During the initial
> HVF porting efforts, I didn't realize that I also had to touch this
> function. Then Zenghui brought up this function as reply to my HVF GICv3
> enablement patch - and boy it is a mess.
>
> This patch set cleans up all of the GIC finalization so that we can
> easily plug HVF in and also hopefully will have a better time extending
> it in the future. As second step, it explicitly adds HVF support and
> fails loudly for any unsupported accelerators.
>
> Alex



Applied to target-arm.next, thanks.

-- PMM

