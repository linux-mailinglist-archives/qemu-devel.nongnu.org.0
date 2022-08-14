Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D7B59266E
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 22:54:44 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNKd9-00043y-EA
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 16:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNKbn-0002j3-2j
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 16:53:19 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oNKbl-0006Hv-Ip
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 16:53:18 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso5248419pjl.4
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 13:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=H5IeZ+hhSAZ+ybSP0+31Nf0MYRYwL7qKI8YXNBcIqBE=;
 b=w2vIFf/IVJV9WT2VuRAX2peYGmGmXgfuV70bDpITdAAz8i68KnmkfpASWcr0sOlqLR
 iL1nmEbyykHH3iCzGf5a2XZEqxshWkgIoW7DJ65sT1IrgAFFq1UjkCw00X0ZBNgfkOUU
 gYZkH43QaHSwy0cfDuvMWdeiUn+eE6iRo+64f9qcOVAQw14/IG0N57u4GLknWHJaYkYi
 s2/CFkPKUeJLzYKNGOUWv9ZSfxFA6VUfIOg8fkLsFh1mrFmUFjjePqOMPqOvUhXj8HZW
 LBQgCVV4XD83SE2U0OWIrzzp3Jr8WSAg7+DRerxyZ3PfZXwePz2vl9Vceh5lHaDVyjU1
 5PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=H5IeZ+hhSAZ+ybSP0+31Nf0MYRYwL7qKI8YXNBcIqBE=;
 b=66ltwt44bQn9N8BHwg2JgpcS7WDqUEQ1rhpbONlz0ZZXKi7d1UYkquBIw8QrjrbMdn
 6YNgvmV+V8oUnJ6jcfaeI0/u7tYw4NQxQYNmhqeyup5HIk61QeE+gjOGsJOzPecXPTA/
 pe4fX1B4sYRpXcBsCB7XTct4AfVZNNk520ChFQXhGm1K6jQPNKjA1QDbsVAfRuHsJ9si
 +jXWG7KaAsUcNG5ApeUYRs51x0u9BlZ8ivlK+Y3C47Wb1Svw9sGcWMkYX+dfhIDRjNq+
 gLfDtmOYs1VGmik4uJNe1AUJAWqW1D06MAIosNv98oSkkueIvhlwOUPPk6HclVmazYSQ
 tpsQ==
X-Gm-Message-State: ACgBeo2ZtZ3OOpGRn+JGx7jGF+5JA1i9PNPiYNhN4UWi3cRCPKZQRPoE
 75cSU/enIl65pYZQDbg+5Ps6ww==
X-Google-Smtp-Source: AA6agR5JK/w79kgc1ZezXKBmIBJ7XSAEC6D2Ce4oezwZeGuYUF7NXb7degAGTOHPSPt+WkzuNnO6Nw==
X-Received: by 2002:a17:90b:164b:b0:1f5:15ae:3206 with SMTP id
 il11-20020a17090b164b00b001f515ae3206mr14652069pjb.140.1660510395718; 
 Sun, 14 Aug 2022 13:53:15 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8012:29b7:7129:d9b8:d112:9475?
 ([2605:ef80:8012:29b7:7129:d9b8:d112:9475])
 by smtp.gmail.com with ESMTPSA id
 z4-20020aa79484000000b00534a7a127bcsm2372837pfk.164.2022.08.14.13.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Aug 2022 13:53:15 -0700 (PDT)
Message-ID: <1c4ae4dd-7365-1d5b-0608-31ba04ee96e0@linaro.org>
Date: Sun, 14 Aug 2022 15:53:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464"
 to "qemu64-v1.00"
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 WANG Xuerui <git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
 <20220814145522.1474927-4-i.qemu@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220814145522.1474927-4-i.qemu@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/14/22 09:55, WANG Xuerui wrote:
> From: WANG Xuerui <git@xen0n.name>
> 
> The only LoongArch CPU implemented is modeled after the Loongson 3A5000,
> but it is not the real thing, ...

The 3A5000 is the SoC, as far as I could find, and the documentation of that says the core 
is named the la464.


> In general, high-fidelity models can and should be named after the real
> hardware model, while generic emulation-oriented models should be named
> after ISA levels.

This wasn't intended to be a generic emulation model, as far as I know.  There are missing 
features, but presumably those would eventually be filled in.


> For now, the best reference for LoongArch ISA levels
> is the revision number of the LoongArch ISA Manual, of which v1.00 is
> still the latest. (v1.01 and v1.02 are minor revisions without
> substantive change.)
> 
> As defined by various specs, the vendor and model names are also
> reflected in respective CSRs, and are 8 bytes long. So, rename "la464"
> to "qemu64-v1.00", with "QEMU64" as vendor name and "v1.00" as model
> name.

Eh, I suppose.  I'm not really keen on this though, as I would presume there will be 
eventual forward progress on completing the real cpu model.  We simply won't give any 
compatibility guarantees for loongarch until we are ready to do so.


r~

