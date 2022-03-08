Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0694D2165
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:27:56 +0100 (CET)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfUx-0002q3-H2
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:27:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfSV-0001wL-BW
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:25:23 -0500
Received: from [2607:f8b0:4864:20::1030] (port=52170
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfST-0005TG-M4
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:25:22 -0500
Received: by mail-pj1-x1030.google.com with SMTP id cx5so260694pjb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YFPwIE/2bnemDv2oi/s9MvMzLWThY0n7DmGocU11ULk=;
 b=tqsn8UbuT2i/y5HQB6F93SV2jLbqog05xoNp0lrOpqKE+IJSW6OWac2JRKLrtvIddD
 hynskBL2BiIP0P/33DaKKkoWdB7k3Y5ZEuXaevFt/9ESYXCdVE7j2RrpVDgjTd4JzIA5
 GlrwKpbJbmhjXGQ9nUqH5Mk5KkYyKJlNECPQYs6hBCDFqoAgBw1okZ7bHX3Vn+dEKY/X
 6AguhFR8IDwWVTAGFjkU0AzcbU+99vz54kGSV3cNu1W3AWLRy7VPTJ03iJsA6wiy+HUE
 0E7f7z6mtX2iWmKSQeS4QKwDvu4Xvf+4gy3BIkO6PyHPz04v6l3QGTKtZAmOZ+JM7lZW
 3x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YFPwIE/2bnemDv2oi/s9MvMzLWThY0n7DmGocU11ULk=;
 b=EVT5B8xL044Brr4veyE6Y5t5RyoFkGPNMa6M5JBuz2vbJ7s8NxGfmF4xSLfLZCnH5/
 J+JMvr/X7/3g/+xXKfjWdP6H04G3b3AMYId7koqpgZL83FMSOAuPo7cBsH+hSsE12QM0
 Rt1TF0k+J99350JHlnqZbMDLcM6gcOxOsKYNYIQCrzgpjr+yi7lEK+IUnaX4aByeiteo
 V/r5br5j2ZGP8L5sAlPSlF8cEVFtc5KkZpH3AGw8/XTaMTbWcOYCFnR1lbDTd7lcgAS6
 LJcZkRUNzCjFcnG1pJjvUmV79OVXyFaAyVisut2RKM2tYKqdhQ9x/G9RVkgNOfCnNuM9
 0NBw==
X-Gm-Message-State: AOAM533q04u7+VMYqTqefGbzFP6y0YUI4Eh2SvR/axfbkExUKvGvqj0j
 nHC1vzsQYZC/3RDKIwyAScV2Qg==
X-Google-Smtp-Source: ABdhPJwDz7G86uR5eauYf9v0USrE9Nj+v5Spn56UsYA+KzQ2E6vQweNrkV8IYq/hxeszUKC3Z/W6Hw==
X-Received: by 2002:a17:902:e842:b0:151:e3a5:b600 with SMTP id
 t2-20020a170902e84200b00151e3a5b600mr13127966plg.153.1646767519941; 
 Tue, 08 Mar 2022 11:25:19 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 z7-20020a056a00240700b004e1cde37bc1sm21166940pfh.84.2022.03.08.11.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:25:19 -0800 (PST)
Message-ID: <67fdaadd-b01a-4215-0c68-8295cd24031d@linaro.org>
Date: Tue, 8 Mar 2022 09:25:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] Hexagon (target/hexagon) properly handle NaN in
 dfmin/dfmax/sfmin/sfmax
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220308190410.22355-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220308190410.22355-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 09:04, Taylor Simpson wrote:
> The float??_minnum implementation differs from Hexagon for SNaN,
> it returns NaN, but Hexagon returns the other input.  So, we use
> float??_minimum_number.
> 
> Test cases added to tests/tcg/hexagon/fpstuff.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/op_helper.c  | 14 ++-----
>   tests/tcg/hexagon/fpstuff.c | 79 +++++++++++++++++++++++++++++--------
>   2 files changed, 66 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

