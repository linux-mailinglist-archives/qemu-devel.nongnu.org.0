Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E5645088
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 01:44:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2iWo-0000aF-Ur; Tue, 06 Dec 2022 19:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2iWn-0000Zz-AD
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 19:43:13 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2iWk-0002gg-4E
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 19:43:12 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-14455716674so13376683fac.7
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eZXlSgw+3YSfdihfFdzVVExyX9qX9sbumCT8zoMCqHc=;
 b=jvBe+Wcz18oDAC1nFvddwFGChJhoKb8cPA0uRh0bN5p5SQ2XB89xka2UNuWl7yA1U+
 zntpJRu0J6W5EhTWkRa9ClhfKwgoA3ffOBAiELxHrV+epOYS8sIQu0E6Us7li3BM3Wc6
 IC7/z5i1vTX7oMxz//v+WvTaXoN9AKmTvNac2siU8MzXyF3GJLSPD1rbHu5joTKoAuFL
 djjFXBNxm0YJBeHcKHHwuTkPX+3qWKLz98A1ipCv7JYFEbKQCj0R8TY51DVnSXGedUK/
 1ldQZCPowAqr3b4tPubT6IzgJnBgyWR/jdL7pS6KKjeifhOOZuWye2Qm6+yNhLnr5y6F
 FPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eZXlSgw+3YSfdihfFdzVVExyX9qX9sbumCT8zoMCqHc=;
 b=oxeTrN7c/w7DRkOr7RqlGohqXwbbdyW5ZnHzOf+X2xT+tbzFDrDIULFXEHnDhpaMg1
 0rbNrmdVxbyRAOvqAEAjEjeRWTIZma/pYWZohz0vjE/CE0AynSlGJdJ2BGculxTNAoyN
 Unj6IZ3rRJahRm5UWMna6A4JfHiciZuzVLg4LhsvPaP+RbJh9xoEV4GiQ+u9DKGa0drh
 hec/iJs0DHyBpGo3bW/AcMDIu8G7aOKa+Hk9u9K0A3N2QzOBj05Q9QWAVrn7yYKJJNcG
 L7wkrMcef2F3gcgMGYcmD1u4oovtcgPJjMxYxUs3cm2mJBxm32KboU55xY89rg2vtELo
 VsaA==
X-Gm-Message-State: ANoB5pkPsTi1UFsd9ep9IXEPqQhZebHwuNLxEGs2l+9BDiQSDcWlabYH
 NYnJjDtmdFPH9VFxmnqMrk+l1Q==
X-Google-Smtp-Source: AA0mqf6bw23Iocr+LFPyTm4ICVNDobgaXxC98rQMCgeercJ4Mi1vkmhEReopwtad0yV5bNP2CT3LLQ==
X-Received: by 2002:a05:6870:a78a:b0:13b:c612:b5ae with SMTP id
 x10-20020a056870a78a00b0013bc612b5aemr40609140oao.203.1670373783240; 
 Tue, 06 Dec 2022 16:43:03 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:e6fc:c295:e710:da09?
 ([2806:102e:18:70b5:e6fc:c295:e710:da09])
 by smtp.gmail.com with ESMTPSA id
 o31-20020a056871079f00b00143065d3e99sm11548272oap.5.2022.12.06.16.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 16:43:02 -0800 (PST)
Message-ID: <60d11ef4-40f5-6743-202a-549f83899efb@linaro.org>
Date: Tue, 6 Dec 2022 18:42:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
 <20221206192947.fi6c3ftrueuiqmch@heavy>
 <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
In-Reply-To: <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 12/6/22 16:22, Richard Henderson wrote:
>> Wouldn't it be worth keeping XILF/XIFH here?
> 
> I don't know.  It's difficult for me to guess whether a dependency chain like
> 
>      val -> xor -> xor
> 
> (3 insns with serial dependencies) is better than
> 
>      val   --> xor
>      load  -/
> 
> (3 insns, but only one serial dependency) is better.  But there may also be instruction 
> fusion going on at the micro-architectural level, so that there's really only one xor.
> 
> If you have suggestions, I'm all ears.

Related microarchitectural question:

If a 32-bit insn and a 64-bit insn have a similar size encoding (and perhaps even if they 
don't), is it better to produce a 64-bit output so that the hw doesn't have a false 
dependency on the upper 32-bits of the register?

Just wondering whether most of the distinction between 32-bit and 64-bit opcodes ought to 
be discarded, simplifying code generation.  The only items that seem most likely to have 
real execution time differences are multiply and divide.


r~

