Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DDE32DADF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:10:15 +0100 (CET)
Received: from localhost ([::1]:50614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuIY-0001KL-1d
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuGn-0008SO-9d; Thu, 04 Mar 2021 15:08:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuGg-0001s7-DY; Thu, 04 Mar 2021 15:08:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o2so10382698wme.5;
 Thu, 04 Mar 2021 12:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vP9JF+um6MQ+RS0fZ0xnewm8FDXrolA4Mitk8Rl3Zkk=;
 b=QuXO5g9ggreMX7O/Firvy9qcB6yXuy3QmsVezVK8sCGACUkf1FF/DE0AdlbPviIRMM
 cdJP+NVEpn2sWqCE+kznYTgSgyzI9Js2dXqnzElMFIAuvFuBDvU6n9itcQPy4FKANkeA
 PU51M5IUlBfBrFfnNAOIzjScmVZeNENF6N1hQwobKHRXG+f1odok66oMb/4GCPrzbbVl
 oO5mnl4ROMnm23yfQEb2mm1im103gRV4IbG5HdmLoanwcVpkU+6GKBzK8gGCUW6cGnOF
 8BVUEoT1QfNtKSUR7gq+IpN+mSuZXsPYaW+RyM5TwnMKfSlGeaOlI1AXmIYhlKG9xAGH
 SOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vP9JF+um6MQ+RS0fZ0xnewm8FDXrolA4Mitk8Rl3Zkk=;
 b=I5M3NY3rt6/imiqdETHuNKRiEnjie9WftyNwP4jMaBX6mvHd3jwO4TsymFMjbOhyGN
 MgL10nGfSNiBftBqVQePccGI5R6KDdqLMK1Vucu2yNLH9Fbmn8AbbWwRWk47oExDmiTy
 ICdOU9+rEBf5pW4d2/PdP3q/8Y/693EzqSfzK2SaQzDtcvGXJQovhS7njuky6kg3MhI+
 V0fG4wADc/eHHS8V43HLJkkKCL1LwmCFKJ9iHvdBDCmTGkozonMt9wCC0K9OH47vxmy8
 4AUc+2VOyUnJujpTfLQ+CMzswfx5vJMGtDOzUM58UTQ8ejQVFHVvTsJozTvynQYP3QsG
 HE5Q==
X-Gm-Message-State: AOAM531aBxMn+WFKv9ZyH7/CmfHrie5dlDXE5Ttbu/QEkjA9rweAV4Qn
 EHKp0LaM8nFGZ05b6mNDMqs=
X-Google-Smtp-Source: ABdhPJy6FiXGEAnOnDo7D/sYIF8fXHBR41iNJBBcUfI3clkzPn1/FpqnpY8QlN1rY5x9EYqquOT4Wg==
X-Received: by 2002:a1c:2e8f:: with SMTP id u137mr5497769wmu.178.1614888495818; 
 Thu, 04 Mar 2021 12:08:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm485628wre.78.2021.03.04.12.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:08:15 -0800 (PST)
Subject: Re: [PATCH v5 5/8] vt82c686: Add emulation of VT8231 south bridge
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1614719482.git.balaton@eik.bme.hu>
 <1481a5c8dcb06769f9bca9e6f07e735b501a59a8.1614719482.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5088a2a8-b0bb-edcb-a288-4d1c4957e280@amsat.org>
Date: Thu, 4 Mar 2021 21:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1481a5c8dcb06769f9bca9e6f07e735b501a59a8.1614719482.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 10:11 PM, BALATON Zoltan wrote:
> Add emulation of VT8231 south bridge ISA part based on the similar
> VT82C686B but implemented in a separate subclass that holds the
> differences while reusing parts that can be shared.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c         | 84 +++++++++++++++++++++++++++++++++++++++
>  include/hw/isa/vt82c686.h |  1 +
>  include/hw/pci/pci_ids.h  |  1 +
>  3 files changed, 86 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

