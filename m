Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22753A1D87
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 21:14:50 +0200 (CEST)
Received: from localhost ([::1]:40272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3f7-00032S-Ll
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 15:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3dR-0001I9-N2
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:13:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr3dP-0001Wf-NV
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 15:13:05 -0400
Received: by mail-pl1-x636.google.com with SMTP id c13so13174792plz.0
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Vhp6+mtLXHVv/+nq0t1zmaxJuHmutmXqaQJUEwn+3ig=;
 b=PCS422GmbCe/NJqbo2gc51H65XMdUJEdp4f+9IwHP1ouM9sVBzWGj096wCstD1Nht8
 De2Id3GvfH6ZdPxlHsazY5s/5YW4k8+qI+I8C4I9mrm6ViVVb6ET83pMbLmW5Uu49Jkn
 RDosNsdbvxfH1T5l67Y4bZQo7ACeiIzS02YeMLsrwHB4mVuY4NLFu3ZiFGfcsXhzJ1OY
 svczYxYjH55AWpzIUrn4BlODf+lKXEwzzkNWdVtPoeyYEZ+5ZVWru4rOsZv5uYalbg66
 4q9Evd5Y5blxlgf1vBhOH9s3xIwqi63y2BkbKJPdFk7OaNbTrve9e6vfReo/KTNgJK64
 2M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vhp6+mtLXHVv/+nq0t1zmaxJuHmutmXqaQJUEwn+3ig=;
 b=dGVnGmJ7qXOK/2R3NkQwo6NQkW7kybpVAHpOlNqMSrpLdd5ZHqWMivIMbWjJSNIuMw
 aj9Qz3GDJsv6BJWKJBIgydahXQXtenZEUJQnK92Kw9y4oMX4oB3L3782R4WJKpkc+I0P
 nRlkkWR/hQQPaGTH+bv2vF0uybTR5R3hefcQh+rlHyvD/5NvzaxKAC9igQxtbC4WD8Ue
 vnkleM6ciYx110pJKdsEnR78rrfyutQYCDKrXzJ4Siht2TbaefI68E9gkQesg2szG70G
 nw/A6QY5UougAWY6Qflc5HJ8qrBVkp4DIASyx1viTBVrwNro8Amy4rGPeWGhWECAvIz9
 aZQA==
X-Gm-Message-State: AOAM531Troxqaue0RaBewl9P0KbNi+rkossA+qw4aCoL1886iq6+EP41
 B6nMMXpoYQb1dALTcqEmTJBv0LVupPZGXQ==
X-Google-Smtp-Source: ABdhPJyYFPc2bcKNcrc2Z/+hRt1Fi0jucL+BiQY0uv/giASWuuX1WfVQ4Qy6QsdLJk8et56EVmC5jQ==
X-Received: by 2002:a17:902:b288:b029:111:4a4f:9916 with SMTP id
 u8-20020a170902b288b02901114a4f9916mr1221510plr.24.1623265982325; 
 Wed, 09 Jun 2021 12:13:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s13sm489707pgi.36.2021.06.09.12.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 12:13:02 -0700 (PDT)
Subject: Re: [PATCH 41/55] target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <254b9e4c-864c-d443-de22-b3fcbbb955a4@linaro.org>
Date: Wed, 9 Jun 2021 12:13:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 6/7/21 9:58 AM, Peter Maydell wrote:
> Implement the vector forms of the MVE VQDMULH and VQRDMULH insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  8 ++++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 27 +++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

