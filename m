Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF14E585E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:28:39 +0100 (CET)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5io-00056x-VX
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:28:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5e8-0001n8-Fo
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:23:48 -0400
Received: from [2607:f8b0:4864:20::102c] (port=41977
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5e6-0001xb-QX
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:23:48 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so2705246pjm.0
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=XfnvXDMgDz5Ov5P8GByxzMR7rb1pnD0n2CvJPmL/yzs=;
 b=mvcOLvDtedMpZ5MfA4/q6BiAFmutE+coStsanE7z1PvSYYJWFSnhl/d3315PA+Mva0
 De0iY1EGFm/d+aiOb+8Q824timPGXrxlZJ1hRNgoZr7rn/YD0k/ZftnxdLc4Bb6mGrIE
 m1QyRGeY2H6hiBI5DXcCiZe13zgpAl6x/tZRH17/CMdJs/J1P1NzMWeLj1XkMWEZASyz
 3ECCNZWFtyECnjq7li+Ss66kU3e0KUUYVruGDh1GiHRlgAQ9ZtR3F8NdzVS3limCwLPn
 1KB+JihWmNRs4j+Uyn3j7RQxXT7AAqVIOu1/I0DR/P15obZY60C3w8xqCrH4rjBwIKw3
 4KFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XfnvXDMgDz5Ov5P8GByxzMR7rb1pnD0n2CvJPmL/yzs=;
 b=fIHr9AOPibz7E1ZIBRIWFgc6bDmW4sfNAvI8NJsyYrRfmnvz+YRx++6YLzDETMfp8F
 sFwus/hMDzVyNsz1+apfSiBykElB/yzQ0oO4nA2cMBzblmNaNBD+rGOXI9vPOoc8sTfH
 4JZ1xwLJlkhjNaM8JiM2Tf+XHqPNFNqDbdFs7aQFDubdQPetVIz0lATyIEg71TpESX8F
 bDR8W0aVCEhwV8G6l4dlxRf35bk9t+3weLa1lLDiUMyIUcMOwlSe7vvBhRj9YottAuN/
 Sgj0l9a/E1e65NqHrIb3WsuAJHlj6qtNdwdta5OKloX4hzxXy7uOfgVZI/E0yudDIqkv
 DYNQ==
X-Gm-Message-State: AOAM530VmuCSY+QKbFfsi0MvDwMBCJ8mAP6ucsye+941Q4IirXp3lo1j
 pP5v1exJYRsavmU+mBmpQjMSVw==
X-Google-Smtp-Source: ABdhPJyWnuvL011Gue/XnUKDxD37rMzt2UJRK46C7I4IIRsmn6Wnap0dzX0wSi42X+LGDhTRkSi8ow==
X-Received: by 2002:a17:90b:3e8b:b0:1c7:852d:e843 with SMTP id
 rj11-20020a17090b3e8b00b001c7852de843mr1156620pjb.244.1648059825324; 
 Wed, 23 Mar 2022 11:23:45 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 gd10-20020a17090b0fca00b001c75d6a4b18sm386789pjb.14.2022.03.23.11.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:23:44 -0700 (PDT)
Message-ID: <65d28fae-6571-a4bd-8022-619f3be71944@linaro.org>
Date: Wed, 23 Mar 2022 11:23:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 14/32] util: rename qemu-error.c to match its header name
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-15-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> The header name is more appropriate.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   util/{qemu-error.c => error-report.c} | 0
>   util/meson.build                      | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename util/{qemu-error.c => error-report.c} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

