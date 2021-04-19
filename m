Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F723645D3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:17:33 +0200 (CEST)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUiS-0004E2-23
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUhD-0003er-I8
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:16:15 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYUh9-0000RN-9h
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:16:15 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z5so4414346edr.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4J5sr6PwANRancW/ie4I7xlz0adNZGtOCEgqzGoDJlg=;
 b=kGpIg4JsScFv39USW8WPcgvZKIZt3OTvpj49d0Hjr4ifg2S2xLNEksptwmJq/+b4LO
 EQd3Et2Ywn4MxHArBEmSXAJUJqDgJXmwV2r3XAMiai99fJSuW6ud8z4swnQLYQxzMQh/
 RVaqs7ptnD1TlnU9ER6Z/Ox43QOk5Be2N9O3A0n4NmcoroljtQgwBx74yRNHJWwvjftq
 2/v2YluXnT1tVTI5AY+GSbg87+Av1BOFfTaSimn9YAW7YQDx1svDZhMUvLVRNGFElrh6
 3/nJ9GlxD0VIxR62eLh8zPhxjepLInr/+ly+ZrPTSa19I7B1yOr+vDaIo/daetIaIN6U
 IgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4J5sr6PwANRancW/ie4I7xlz0adNZGtOCEgqzGoDJlg=;
 b=pw7L5rN6H8wfLMgAkFr8XkJ/JcuXQgevdh11ftaEwXbvXSNHz20JKYX8atWN1PATFb
 CuUoFGbm8oloPDMzVhn3nJpgQl52RwXMBKrVFs1/PIl7d5Fn5Vs9jETWeF3QpOafJeLZ
 3aiakJCIYC+OYJzkllqe2KqbfI3fVSJP711DVyHG8O2Tjyz1dn4Zcomz+YSPZ4aMAU6i
 ubIASIOQCeYFbdmA7x8niIxNWHJ1NzfcY4ukU24AT1S01v5b1QBr34KnoX20CUNsfvFQ
 RTHEDud6Y2wsTzvwOn1WHGlqcWRlmQYGBqz/oTW2UR0xHaEUD04Vrw8ve6tUqsc1WLAx
 HjjQ==
X-Gm-Message-State: AOAM530WN6sDRpGqpNSsDsC+x6fXStJhpsIAU74GDlYACzmLd+qBMBUp
 K+9o7Bz1QoZSo7T6M5rnXdrDPkNdS41u5dRBfWZcBw==
X-Google-Smtp-Source: ABdhPJxFx/WWYRpjYVMRGZT37w4TVj6AUhha8/1MKPwDcCzc9tIKixmj+qoYCBVhiX6gAqPK045SRknhicO29zPPZ3Q=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr25502887edu.100.1618841769353; 
 Mon, 19 Apr 2021 07:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210331064713.1782-1-jiangkunkun@huawei.com>
 <480ded69-5141-9eed-9326-365260d05fe0@redhat.com>
In-Reply-To: <480ded69-5141-9eed-9326-365260d05fe0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 15:15:18 +0100
Message-ID: <CAFEAcA8AMX3DEMND-4ZUnDuOOE4EoG8f3z_jwyeUZgiRKKJJLQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Support 16K translation granule
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "open list:ARM SMMU" <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 09:41, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Kunkun,
>
> On 3/31/21 8:47 AM, Kunkun Jiang wrote:
> > The driver can query some bits in SMMUv3 IDR5 to learn which
> > translation granules are supported. Arm recommends that SMMUv3
> > implementations support at least 4K and 64K granules. But in
> > the vSMMUv3, there seems to be no reason not to support 16K
> > translation granule. In addition, if 16K is not supported,
> > vSVA will failed to be enabled in the future for 16K guest
> > kernel. So it'd better to support it.
> >
> > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
>
> Looks good to me.
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>



Applied to target-arm.next (for 6.1), thanks.

-- PMM

