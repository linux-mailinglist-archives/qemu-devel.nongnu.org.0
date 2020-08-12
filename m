Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E876242E49
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 19:50:19 +0200 (CEST)
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5utG-0007gq-8K
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 13:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k5urM-0006Ho-9a
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 13:48:20 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:43822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k5urK-0004cS-Kv
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 13:48:20 -0400
Received: by mail-pf1-x434.google.com with SMTP id y206so1374470pfb.10
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 10:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/D9CsbLRGlgR3+bpTAcYqbtG1Xp24A8kPxeMyv55O8I=;
 b=XXx1tdhiUd2M/rp4yUCaZnxIgb5m73w9u7/1yuYjF+8uMZ/9aJqHiohmLeScTWMkIF
 ajP/IlVZJyWUXDSEmsdzFUwIYaKs05p7CvywULLqcQd9P/g7O4rRnn+Di61WgIyDCxHX
 KL2ze7WpwXuvmf/is5v+WIhRs/OLDzo18ZAyaaj6TogPPdTRiFZJI2mP5CqAv6gWRG95
 rgoxYjto+miscIVxgUiflLiHRvSh12br8I2s1TXkLNBGMDaEA1OclgHVmrsU01vaGkPZ
 n5tuMMCyfI2u0haSiYeceWDf8BtM2hHBUn5SYKonejGXL52dXjHjOtzuBa0TWt1btXtY
 Nd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/D9CsbLRGlgR3+bpTAcYqbtG1Xp24A8kPxeMyv55O8I=;
 b=szKLXLt6vC8y4Ybh6DxUDiZCbifi8qqVGkNQQZMKDuOLc47LuiXt76/gCVkTML41sV
 p0+RbZE13DiGySCiGSQIMRZWXQF59MACq5yuVWdcCtRMlGTCbWPkEZNDcX3sAMNM4qAq
 iqKhdm3JspEKaq++0RhoOSFheh7+ODsfp5nHIeuhF4PxW4LYUA/wzSI5NwEoHToGiC0A
 JhOraIIwtbxwlNkFG8NMu3yKmanzHRpKMtZAtQ1eoUu2o5s9zkzholPDDkymibVTkRzo
 1Q3CFR7PxTYKaYtgxMK7gCTQNmzbGx0lkQDIEqhqLF8VHjZ1rrw3itSk3MAK9aVtVxuZ
 6WZg==
X-Gm-Message-State: AOAM5311lnCy438bC0tlEdZi32qGFTRwFJ6KuBEbUZb0ZsftrZVqanrR
 rqIA93kVXVnFQ1qH7trnAm8JRA==
X-Google-Smtp-Source: ABdhPJz+tccEDGK3D0wrHhXAc37zroiS/qZCLPVTj7AJRXQGxTcpoVRqEdBgU/mHWdpt81lcNGpl+g==
X-Received: by 2002:a63:d612:: with SMTP id q18mr267547pgg.292.1597254497416; 
 Wed, 12 Aug 2020 10:48:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id gz7sm2686482pjb.45.2020.08.12.10.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2020 10:48:16 -0700 (PDT)
Subject: Re: [PATCH-for-5.2 2/2] hw/core/sysbus: Assert memory region index is
 in range
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200806130945.21629-1-f4bug@amsat.org>
 <20200806130945.21629-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3bdbabe-dada-9e7a-14d3-8fbe80cbe823@linaro.org>
Date: Wed, 12 Aug 2020 10:48:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806130945.21629-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/20 6:09 AM, Philippe Mathieu-Daudé wrote:
> Devices incorrectly modelled might use invalid index while
> calling sysbus_mmio_get_region(), leading to OOB access.
> Help developers by asserting the index is in range.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/core/sysbus.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

