Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637684C4F5D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:14:50 +0100 (CET)
Received: from localhost ([::1]:48900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNgzJ-0004d8-7a
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:14:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNgwq-0002VO-A7
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:12:17 -0500
Received: from [2607:f8b0:4864:20::102e] (port=36658
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNgwo-0006zU-Um
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:12:16 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 g7-20020a17090a708700b001bb78857ccdso9394368pjk.1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=DnXXwaFk0gEeQXm2Jxr/MUdYzTep0jWPfKu2GkCYtqs=;
 b=RUGUbSwzxPHBhLtyfRsf4L8GAQeGZAPaVGKVOtU2rgQfYI9fdnh3T2vvq8UDZ3SC+b
 SDvCiweN8QIUt5wwb9yAWRp0H8XuqTV18HE40cFoY1EZtOve25nijvTE5Qudc9t+k/C1
 /Sig2Nxdrhe9t0lA99jBOh55r64mrsI0X0LgOfugaEMlHklFNtPyop5LDBw7exdyLmAv
 W5h9ALnKU4FcQ21jvqnBmEaYWqt1RLPT721imGXszX+/jGom6VL98Pnhfur43ORC0446
 3OvyghOeiggVvwW+YYcmxQMhYvkQ6YyCmylbPNJW06Ry/U2gE9ipzseiS9t+Dfmsymlo
 +6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DnXXwaFk0gEeQXm2Jxr/MUdYzTep0jWPfKu2GkCYtqs=;
 b=xlbRNz+gdOTZfgKPurz1fXWRiKBFNHBzJxPMko1ZIm8nm85Z6/SU2uKefxCeLAVstD
 BXB6vJMyAx5WfpvGmTzleGL98pd+2kKhxrBevsav/Q81jST2e14vNW0pbp7lE+1caLwy
 zaJ/jXzoEOV9vRdYPvnokG89KMVNRbnjFqPU+vHgP/IRasVWRDD4CzGom04WpsN+zujF
 f69WwOzhBYHXrtGTmYTaKDpR3FN6pN8sKtVwEctsjCDBXM70Jqb0IdQlJerkzAAaznIA
 AaeWYFyjLYIg1pb31/PQbWBriMNghmisUAe1EJv4AkokTQtxXG1psT/uBAXrViPl34bA
 PRug==
X-Gm-Message-State: AOAM5301B/lm6/k51qlPz+Klr4RITiU/UdkebZpM9D3YvkEQa2FHSqYp
 8cN4uITR7SLUFwwqJNlfPt/j0g==
X-Google-Smtp-Source: ABdhPJxGEZGUwjiQ71sE6Fl1wEO2BrHnLis3eobkl43EHOb9rPUOk1x11QBF3sPVTumtrCMPqcE0uQ==
X-Received: by 2002:a17:90a:10c8:b0:1bc:e369:1f2c with SMTP id
 b8-20020a17090a10c800b001bce3691f2cmr4715378pje.193.1645819933566; 
 Fri, 25 Feb 2022 12:12:13 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 s3-20020a17090a5d0300b001bc2b469051sm9890018pji.29.2022.02.25.12.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:12:13 -0800 (PST)
Message-ID: <7d8b2267-7cdd-1faf-21f2-e933d3885fe6@linaro.org>
Date: Fri, 25 Feb 2022 10:12:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/18] tests/docker: add NOUSER for alpine image
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225172021.3493923-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 07:20, Alex Bennée wrote:
> The alpine image doesn't have a standard useradd binary so disable
> this convenience feature for it.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
> Message-Id:<20220211160309.335014-3-alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

