Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18F16066AA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:05:09 +0200 (CEST)
Received: from localhost ([::1]:58752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYyd-0006XN-R5
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:05:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYqE-0003Ql-9J
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olY2E-0006On-0s
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:04:42 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olY1b-00012j-TW
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:04:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id v1so6079714wrt.11
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 09:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RJNy57y669FVQSQJq1AhfVteBVdI+rZ5mILWNbgGtg8=;
 b=XWT9dz406fXZhCgnnYu1g0eVg1nkDMd1mfsdQqDNVX9cojLQPGZGbVDX5yVopZjbeE
 VKRI1NdSW/ybwHn1pb5+Pc76Ha86gtxdObP8zib7DxCUcjmwC+yKpQj9uxJMS3b7A/Fq
 VreZuZORzJwJdpwUKpaQz1hP4oqHp4jkM/uiyZ9VZVBSgi9FRNe01AbmT7sQDCrD7+n5
 j7ayFXCn0qd3kpgYj8aFs4Xpzlx9k3jNGYB+hE7X5Kt+k5SFH/xiam25ac4WpZD5+DEX
 eVUezTzD8/SuVg0dKu1241Xc7X7W3QI2C6fVOCCQaXos4ZsoR0EEghdSrVO3KnokhbYs
 YNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJNy57y669FVQSQJq1AhfVteBVdI+rZ5mILWNbgGtg8=;
 b=E2NOg1sSxewGb079Ofz9Da7JTpTzOO7Ictgs7AFQuiyas5lw2Egfuz7U98wng+HZun
 OfcV10kV40ptQqAasF11GmKB7SSQERWyJEgxIW/2kzAZTWX2guFUiGhnEI3MzmRddayW
 G2d91exf/N4fCFEzMNGNYzQvbCWhR3wbomNbzCj11dhsMyQSYhEvGhYdAa/+P6c74Abg
 LSO1pifTIcaTPGqUKIA5k9SZzWphIQ6oS0a79jW0107RPN1ICiZv+2x707DvoDIgIVcD
 4QobN/0rQAtOB29bTDqezmjckwIzBFt4d7EdXMlDJRiLMSibpeGPglERQAbt9KVoYzPf
 8Jpw==
X-Gm-Message-State: ACrzQf3ZSA7X6nRkFk0ee4I0GWTZChmzXMxd/PQ+PB+H7xiYLC0ZULio
 ARz3Pddmn1XhMDZ/0Oh17B7fhQ==
X-Google-Smtp-Source: AMsMyM7g4yWfxildyGzoHwTrjOaDovtqK9GEjp0XmV1c/pu5yJ1SnhK+GXLJxC6EvO9wc1smDfuVgg==
X-Received: by 2002:a5d:4887:0:b0:226:ed34:7bbd with SMTP id
 g7-20020a5d4887000000b00226ed347bbdmr8726904wrq.561.1666281842224; 
 Thu, 20 Oct 2022 09:04:02 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adff2c1000000b0022ac1be009esm17242661wrp.16.2022.10.20.09.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 09:04:01 -0700 (PDT)
Message-ID: <b94fb082-6564-d951-fce2-6f9e0add609f@linaro.org>
Date: Thu, 20 Oct 2022 18:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 22/26] tests/tcg: re-enable threadcount for sh4
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020115209.1761864-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 20/10/22 13:52, Alex Bennée wrote:
> This test was marked as broken due to bug #856 which was fixed by
> ab419fd8a0 (target/sh4: Fix TB_FLAG_UNALIGN). Local testing shows this
> is solid now so lets re-enable the test.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>   tests/tcg/sh4/Makefile.target | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


