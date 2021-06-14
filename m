Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836C73A6F50
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:43:15 +0200 (CEST)
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssUM-0005P8-Kh
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssT9-0004Tz-SX
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:41:59 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:40872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssT7-0002LN-2H
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:41:59 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso213124pjb.5
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=nlEDPKKPnqNmWmp71TyymOVGqwxHdrV6AwXYAG7oLFE=;
 b=l5cpxUnAAzt6oZ2UPD3ZxTP93Al4u03gFLZC2IUbSouzCFiSCErEJtvpsu9xPAHNV7
 dkQjs7VCjDzWhDX9LbR05GgFyMjcGAYY7zklXy1/aWwvRcIlCAAROgvUZtnPWhd5NMjO
 U46VgwjoMS86LKq/NQkfkzD/s5rLh7W3IEVJRxgtj6TYgMWFTG+4dRkDFRNdpMQlLzxF
 +PHo9BwD6lWEotvG2OeLqqia6TvOKzi5XpC+jYxyLva0F5qOTvGjM7zPbUHB7rv2ZXS5
 ltT4yjPQi/eevgVJmSWedFLe/HYm6uxG9FryohDK4tgmiXDyCgPBxvisTzXCb57MOMIH
 LH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nlEDPKKPnqNmWmp71TyymOVGqwxHdrV6AwXYAG7oLFE=;
 b=BemuAorhWiqU25b5D9jmihRxZlXM4TaGW/5PcSRSLzOwtat4BIgIiAricHxM0r5KiS
 evZmvNHHywcvEUYSnRdgzwvEDI51YErRFfB+XBQcF64k7BN23/q0SnXJikETZsEVv/Zn
 qvvkSlpecsTKyM6dg56BIZayJVBLSOp1U7BABQ2xausxVUbF1fIJyWXbyXSMQvtK9/1v
 lyxq2dFSsiMWZmzDASVscvr213Pf1QXcJBHmHuSaErflbM6knwV4CZaQvXf9R52j5MaU
 M8iZfqOsof557zizZgSUqnR75hEPZ4RPe1mHb41fDF8E5NG1KbCIne+3QhnQ5QnbsLi6
 /yEg==
X-Gm-Message-State: AOAM533Y+FDuzVg4+mguqJRTbG55/QgvB8OzFuEXCHKJQftgdqk1fg06
 Nx7x0Qk0Iq1WiLNMaVPOJCbYcdy840Qd4g==
X-Google-Smtp-Source: ABdhPJzNyFWrG2ZpGpbzoMTIryCIl0YsdXQKegq5lMDMkrbtQjX0CvVwxU/INSQQ6ahXnauSJ9cbzw==
X-Received: by 2002:a17:90b:d98:: with SMTP id
 bg24mr20092424pjb.41.1623699715735; 
 Mon, 14 Jun 2021 12:41:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 nn6sm12495338pjb.57.2021.06.14.12.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 12:41:55 -0700 (PDT)
Subject: Re: [PATCH v2 13/57] target/arm: Move expand_pred_b() data to
 translate.c
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4153f1d7-2bbe-78f2-04c6-14c83a5dd155@linaro.org>
Date: Mon, 14 Jun 2021 12:41:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/14/21 8:09 AM, Peter Maydell wrote:
> For MVE, we want to re-use the large data table from expand_pred_b().
> Move the data table to translate.c so it is no longer in an SVE

vec_helper.c not translate.c.

> specific source file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/vec_internal.h |   3 ++
>   target/arm/sve_helper.c   | 103 ++------------------------------------
>   target/arm/vec_helper.c   | 102 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 109 insertions(+), 99 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

