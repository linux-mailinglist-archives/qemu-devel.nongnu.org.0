Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495DA2CA69E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:10:43 +0100 (CET)
Received: from localhost ([::1]:33820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7If-0004Gk-Cm
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7Ha-0003jG-T7
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:09:34 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk7HZ-000893-By
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:09:34 -0500
Received: by mail-oi1-x243.google.com with SMTP id s18so2079626oih.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9413uWbCOHAyYVe7UpQ0OVZPp989TNi2ypQujH/Cf2s=;
 b=XynCgvoF5821nffJJv0kf6ySADCX7Ud8wqDao/gywJU0AFMIbWytlY7+XF+St07vww
 44taZFIQh376aachM8fEaGWvgL/XCPmRUkVevdJVJU1I8yIFmbIzOJ5KGcMKgTYzKDyy
 NVhamyBclA50J+8Lkvs/TfjDKx0ZA0/9nyJjINhyOXXh0D2LAQkRVP6Bou0mGLTn8sh4
 7tNRseVI/2xzLZLkd0ohOwFIU+xs1jcGzPE8lGrFDblYcLRJKWAKVXxNe/ZstPf/0ZrJ
 57C48cdVcoc+qunMxS3lqIFAbDtu/I0recG1nMPNwoc1E4mNs8vcRH2QIYDQTQKBV+od
 yOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9413uWbCOHAyYVe7UpQ0OVZPp989TNi2ypQujH/Cf2s=;
 b=HpiuCNeNbqifUNMrqDfKgueIFN+HJIrdNxEwuw3SuWAXaDhyqmvp87/pRbBBLfAO4l
 xuXAIHw8IgX0NidASCwIc5vODeQs3fViRaLXr/VG9OD6jXP+RxjfbGG04kujs2F4IMT0
 Rp69qq+A0laoF21Vv/9+gBK8oVEYwTdCvAF4FFlwJOws2Jr/glZBvMok34m+Sr1vjswc
 ti5R0ma6LYYYMsNHyJ46aHpe6szcg/0U9/IO4/vH4cqIb26qkLB/3ptJvX+N/eg6OT2i
 yeb71DF0pI32PaLOIQomJyDsH0lB1L3eshAerBvNgJ0pmtWX4Kuv3qN+fPriSTNEiK0y
 KUBw==
X-Gm-Message-State: AOAM533KodZ0WjJ83C1QfCT8iHzupgPEcFA00kaf4F2PXe6sMBwrN2b4
 4QSOOAWDZaBOW3g8/QPpmZDhGf1+4tKXrdiW
X-Google-Smtp-Source: ABdhPJwf3YhYn8nifotNTgNQIsIA9AlhcLNL8U/HY0A5oZt8TF+56cUFUl9iWp/RbLyIh6ojzTeXSg==
X-Received: by 2002:aca:452:: with SMTP id 79mr1989364oie.108.1606835371915;
 Tue, 01 Dec 2020 07:09:31 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id f34sm419143otb.34.2020.12.01.07.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:09:31 -0800 (PST)
Subject: Re: [PATCH v2 20/28] target/arm: Implement new v8.1M VLLDM and VLSTM
 encodings
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a20d1c0-7734-edb4-8078-ab18d2834cb3@linaro.org>
Date: Tue, 1 Dec 2020 09:09:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> v8.1M adds new encodings of VLLDM and VLSTM (where bit 7 is set).
> The only difference is that:
>  * the old T1 encodings UNDEF if the implementation implements 32
>    Dregs (this is currently architecturally impossible for M-profile)
>  * the new T2 encodings have the implementation-defined option to
>    read from memory (discarding the data) or write UNKNOWN values to
>    memory for the stack slots that would be D16-D31
> 
> We choose not to make those accesses, so for us the two
> instructions behave identically assuming they don't UNDEF.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/m-nocp.decode       |  2 +-
>  target/arm/translate-vfp.c.inc | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


