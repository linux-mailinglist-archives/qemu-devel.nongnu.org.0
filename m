Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C2A346A6C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:49:28 +0100 (CET)
Received: from localhost ([::1]:50768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnxv-00030P-Ap
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:49:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOnw6-0001yz-9l
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:47:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOnw4-0005Rm-SG
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:47:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id d191so11786102wmd.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 13:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8tFCp2ymArc8d49QKGJ2sy39L3cSsZ6DGVdzfsZHBYQ=;
 b=nK/3cLkYyvqvDiVt0+3+X62K+yhLaXv5sdoC2rUnPUaVvUHJxovW+qFQx6+q5HToHu
 PLUGGn5P9NX9X9mDvggptFs68mZq7hGmWEu7b9g6XA/nYLAIIQBec32IuCtS7spgpXrd
 VhKKKlYKoR5HI1P51iBlu0u61LU7KiWH5og5Y3AR4swDKBcOgJbEtnccGR3HuqslH78I
 4OcArUO5D6nju7oJ8FpaJMyPnKk0N7vjMmY5f0bNLbm+vp6wCLaQZ155XLEcl0X7S1Cf
 vVIqBWtNxJEg4h7pniLJxDbuS81a+gQH008z42iCTrYhEdSM0y0wymCaW9se5IPdJktV
 XfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8tFCp2ymArc8d49QKGJ2sy39L3cSsZ6DGVdzfsZHBYQ=;
 b=mFrfCoAXQ6f1mGsfJNXmTpi6YdBury4lbEcWDp/+qYmQWPKmDq4ZiyniGYFYaLUYki
 NQ3fOOLexQCNDjYy4m4mBpiqtFOhmtxR7Km5biATuDthaFaQFIpSnhcsFAK2tRWjy9vu
 iUbV7P3pulKrTDWWFt2tRIHNk/XJtM723joJUzZA/UDGivqm11aJOf7FKwR7Zk6yhM6I
 xmfg1eRYBQcKUrzd0qzYla7FTa/WOOdWiOy2PSfFEnOl4yx3RUF0kpoh0TsEBY/vzCm5
 ydP2PwmoWk2Q+iYqzgG75Zij1ZemzMq68LBlQ+2cZM45eXAzID8XRoell0MkyR6FhYad
 W7TA==
X-Gm-Message-State: AOAM530WWU0M/OdIQ4ay1p5V09eEHj0sjTy54ErQ+mIfPJvofONlIYNI
 AQV7br7kKYn6b6lVfXTY6kI=
X-Google-Smtp-Source: ABdhPJyQGMzihZZlIEcYVhkgr6GTAJzIUtDfWNA7rwg5d6mYZauDSlySnDogr7mLiAIGywi50qTmFg==
X-Received: by 2002:a1c:9d51:: with SMTP id g78mr5148731wme.5.1616532451025;
 Tue, 23 Mar 2021 13:47:31 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m3sm26816wme.40.2021.03.23.13.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 13:47:30 -0700 (PDT)
Subject: Re: [PATCH] hw/pci/pci.c: Assert that pci_irq_handler() inputs are
 valid
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210323164601.27200-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d914c97b-f8b9-94ba-bfa2-5eab7544a14a@amsat.org>
Date: Tue, 23 Mar 2021 21:47:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323164601.27200-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:46 PM, Peter Maydell wrote:
> pci_irq_handler documents that it must be called with 0 <= irq_num <=
> 3 and level either 0 or 1.  Add assertions that the caller has passed
> us in valid arguments.
> 
> In particular, if a device model fails to set the PCI_INTERRUPT_PIN
> field in its config space correctly to indicate that it has an
> interrupt, and then tries to raise an interrupt (either by calling
> pci_set_irq(), or by getting a qemu_irq from pci_allocate_irq() and
> then calling qemu_set_irq() on that) we will now diagnose this device
> model bug with an assertion rather than engaging in the undefined
> behaviour of shifting by a negative number.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/pci/pci.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

