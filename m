Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F87F5EEBB2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 04:27:37 +0200 (CEST)
Received: from localhost ([::1]:37404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odjGy-0004tk-04
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 22:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odjFB-00038B-5W
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:25:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odjF9-0001tt-9G
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 22:25:44 -0400
Received: by mail-pl1-x633.google.com with SMTP id w20so28267ply.12
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 19:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=T0nSfkOpGK7eTQ44l7ChLEAZswdf9lFm+4oXLNvAjFc=;
 b=tq3tPeEbdHPQo5r8oXZxmpeZx+QcnNol5vvy3i/yWTXD/7+WQ9syvjqvdV4tUuUnw1
 kiTd1FIsuexRL6IrnTPFKcyYyDG1M0pXpvP+KqTgkbceOUxpON/AsLO6zJpTJqtey7Jk
 Hkjcp3YekRKzNsR0bIv/0tCVG1TlyoMK5fnxoXjwGJQt912xGPu/KRNMdd4Sma+jqEjl
 NrbY7o5cxq1ECEkQen8N9omjmjQzJ7oAsYVrCMc1uXp/dYYJOAH14jWT02USAOf/JSt3
 +9gxKrTU6/yDk2SGD2Q227qBPnSR2drImRDKFx6TTAOcFjXoqUr7cmSdI6N7AHA22ac+
 h5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=T0nSfkOpGK7eTQ44l7ChLEAZswdf9lFm+4oXLNvAjFc=;
 b=pCtxCaBAUtJsa50gbcmYS0IZMTBtZJd1r/hCJWpWVKA6/IiehL902tLSvREWEs31ih
 d3yu67GynHAJBe8GgMf/HQz1L5kjgt7xS/Y6frgqlgfuO3nQnhslbXfLQFf0eG4cGJFV
 U+xP+KSk+C/TNuj1c2eYVykoBukAaBsyZGGrxFDVgbDXM9EpxBtHkcjHgRSq7B22xFq1
 8Rntm67fZPdFYaYwS3Tz7qZtBcLPP2nZNJ+1q+vRoSEG55VHg834mOVDCNkAQnjkDr6a
 BbyydUuv5Qh+FGuNywetnV4K6NkSTEpSOyKb+hUHfnvZhfpUYjyRHsEIysF2PcA86/i6
 9HcA==
X-Gm-Message-State: ACrzQf0+xnYq8fzKa4Ta05p2vxk9kLSpfU+2uHc2xNz0lknxT1Fp89j3
 /1Yft1Q++GbchzeQ0zE37XnAyw==
X-Google-Smtp-Source: AMsMyM60igP1Io3FUCxXo+RysUVTnp1WVz28KmTzUuJgctvH6ZD8gLPGVCMgbpJWEhHt7EskXicU2Q==
X-Received: by 2002:a17:90b:4d81:b0:202:d535:d324 with SMTP id
 oj1-20020a17090b4d8100b00202d535d324mr1102907pjb.133.1664418341780; 
 Wed, 28 Sep 2022 19:25:41 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 y14-20020aa79e0e000000b0053e85a4a2ccsm4750649pfq.26.2022.09.28.19.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 19:25:41 -0700 (PDT)
Message-ID: <862c7f95-43e4-2d86-25af-615f110c6add@linaro.org>
Date: Wed, 28 Sep 2022 19:25:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/3] hw/loongarch: Add memmap for LoongArch virt machine
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org, peter.maydell@linaro.org
References: <20220927061225.3566554-1-yangxiaojuan@loongson.cn>
 <20220927061225.3566554-2-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927061225.3566554-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/22 23:12, Xiaojuan Yang wrote:
> Using memmap table for loongarch virt machine type, this method
> comes from arm/riscv architectures.

While being data driven is nice...

> +    hwaddr base = ms->memmap[VIRT_ACPI_GED].base + ACPI_GED_EVT_SEL_LEN +

... these indexes are not really better than the constant they replace.

Perhaps delay this until you've more than one machinestate against which this can be 
properly parameterized.

> +static MemMapEntry virt_memmap[] = {

FWIW, this array could be const.


r~

