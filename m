Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF03471C3F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 19:35:37 +0100 (CET)
Received: from localhost ([::1]:48600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwThA-00044S-KQ
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 13:35:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwTfN-0003Ob-BT
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 13:33:45 -0500
Received: from [2607:f8b0:4864:20::1030] (port=33750
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwTfL-0000pa-Eq
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 13:33:44 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so11202619pjj.0
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 10:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I6K7p9UAGSkywjqU0Lyrwcms77bfWHsEYDhZODspA14=;
 b=CFDWSrw6XknwqsdhlRI/2f9hC55Pq12K7IAn4e+5FCw6/94IK36YPwdBT7EYPxZI/P
 EXWw/uIUcPv7DDPOZm4OQ1MLPVanzkEEWF495V5cWN9a0A69xzUuNoyIV5kUAIRJt/6F
 oq4cz82TDeo8nGIvM1Uc5xu+XP+aEWTJ0wt5eXFqDAPhY8TQLf0SkNSa/+U58ZldV1jo
 KPnhqwjfzsWHLy2dlRk38QYVi1mr2M6JJJVXm0DSHuQ0SFlXYWkHNPhWBcJBH/GT8mvc
 fsa0djyZjK9icz/VsZrwmegJK06ZsLg7I8FxfBuMcIMDB53re4kGQKuIvPDl0ZG4vrnU
 loBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I6K7p9UAGSkywjqU0Lyrwcms77bfWHsEYDhZODspA14=;
 b=HSeC5g3BW9qZJzJMWuNNqFw3CbccyxyH2USkEKvc+YsYbEPbp5TWQKHlIw9WS4wvLt
 J9AGW1sI6RJT7DhQUkgeVxe2AXtZgWspqDeRy3eB4CkRTyhSybg79pu2pclBxDexASI/
 yMNjSFU1TLOfKJAwExcqxeDAGkcIQp8iNCoOUgHL8MXDdNkrCNluFjgRZniYSCxzOgsZ
 57x0GzT0dYJmgpqlIDL7CIVAEO3ucABOZXdQpGlDfOieSNDFM0wCqU9l1ctQ0l1kcAB6
 ONbjVcgJNgv+oqK/z3wvyKOqrJgMZR7xMT6ImlFJT1BNq63Ateq10pbxNe95oeslJXTC
 O+ww==
X-Gm-Message-State: AOAM533yYryMS4IqKgK0IUYexR0Jm6WYy1HiRBqsIw1oKqW+Lr3g/ZB8
 SsPebdlPJafmQa/a7riK99qR/A==
X-Google-Smtp-Source: ABdhPJwkQsSJxm3MR4gIynN7aQ0WDE9qMmy97GRupkmJHdFURLRDH9xjlFtyuDp6kE0+OTErTaQogA==
X-Received: by 2002:a17:90b:4a50:: with SMTP id
 lb16mr39278391pjb.147.1639334022116; 
 Sun, 12 Dec 2021 10:33:42 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y8sm10080491pfi.56.2021.12.12.10.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 10:33:41 -0800 (PST)
Subject: Re: [PATCH 07/26] hw/intc/arm_gicv3_its: Correct setting of TableDesc
 entry_sz
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf8daf2c-f082-d6c7-3889-e80d16fa8ed1@linaro.org>
Date: Sun, 12 Dec 2021 10:33:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> We set the TableDesc entry_sz field from the appropriate
> GITS_BASER.ENTRYSIZE field.  That ID register field specifies the
> number of bytes per table entry minus one.  However when we use
> td->entry_sz we assume it to be the number of bytes per table entry
> (for instance we calculate the number of entries in a page by
> dividing the page size by the entry size).
> 
> The effects of this bug are:
>   * we miscalculate the maximum number of entries in the table,
>     so our checks on guest index values are wrong (too lax)
>   * when looking up an entry in the second level of an indirect
>     table, we calculate an incorrect index into the L2 table.
>     Because we make the same incorrect calculation on both
>     reads and writes of the L2 table, the guest won't notice
>     unless it's unlucky enough to use an index value that
>     causes us to index off the end of the L2 table page and
>     cause guest memory corruption in whatever follows
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

