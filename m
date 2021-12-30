Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B5348207F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 23:07:46 +0100 (CET)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n33aL-0000gE-QD
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 17:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n33Xf-0006dn-Hp
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 17:05:00 -0500
Received: from [2607:f8b0:4864:20::52f] (port=39443
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n33Xc-0001qM-GI
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 17:04:58 -0500
Received: by mail-pg1-x52f.google.com with SMTP id r5so22409957pgi.6
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 14:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YKxE/u697Fy7tHFdfstn9rAvLC3TMyPW/Xh9GGO+SHM=;
 b=jxjRhXeDvhYgt0VOxb4Zd7QqRO345Dztb8w+yBVPkQRDRGXP++VKvFrySQl0moAXb3
 nBuBmFbTNqw5hu0zVQD/kqEVjRoKx6mXDMwlQGMuQWUwBOIkWFmOesgC3PwjHH7iu+AY
 c6hLPRNOYJWldggAHANp5v4aF8/WLwos+df0T01ki0tBx0c3dioe8sMarGDyw1MAHDBH
 P/nojKgqbJDHCQqPv3l0eaRz0XkRqz6nPgRChWKvR1DjO5Gm2E7dXSAErHECFBS9kSe6
 ch+ILWfRZ9YNYHWhXyfj1wAeBSyJA2gYKlAtk2RNBts+RNTjWTqq3lAtc9VCffDSoklx
 TgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YKxE/u697Fy7tHFdfstn9rAvLC3TMyPW/Xh9GGO+SHM=;
 b=17SxZGiuxsMFfIVUSehdPP5HCiGfk5cHnkZnKk0wBlngxuukMdMbxeKFi4Od+es2IX
 pSqANSa+YLDNcGboDzzellyRVPgnuxs8G+EHGdTofOSNWerv+UVDXqKY9E8PyRDkbYKD
 oO4yiji73/gAPB0uQN99MnN6mHHeVmQDG+ia7Ggb1I9x5WKxFbsHM2gMIX90uoRrqGyP
 h0XCzPvHFfodvmN96Vi5IfFovLDtPgVfrUD2IhjKAuV1r7a9rPPiIhFfS/34n2CRM/Sv
 kuzJwwd05Rkdpt8qVXWBm4cHjOXHrDYRaXDnYwOYYdN41rO6hdHT2LgSfb1MR9Pz1acf
 Pjew==
X-Gm-Message-State: AOAM5326KXxPdYn4i4EvvXUU6aMXO56SLCvEMN6iWIFzvdzda2A3YoJZ
 xY93SYz83YpIbaR0W36/sJzLJw==
X-Google-Smtp-Source: ABdhPJwrFsXHkaYkLFmIabX8Oy179nAP73uZ5VGsXtU02j8pxLIF2Hw/IdimneiSyJ+cuCXDTjr5QQ==
X-Received: by 2002:a63:290:: with SMTP id 138mr28799443pgc.425.1640901895244; 
 Thu, 30 Dec 2021 14:04:55 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:23dc:65c4:ecfd:93ff?
 ([2601:1c0:6101:be80:23dc:65c4:ecfd:93ff])
 by smtp.gmail.com with ESMTPSA id z19sm19903200pfe.94.2021.12.30.14.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 14:04:54 -0800 (PST)
Subject: Re: [PATCH v2 2/5] target/ppc: powerpc_excp: Add excp_vectors bounds
 check
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211229165751.3774248-1-farosas@linux.ibm.com>
 <20211229165751.3774248-3-farosas@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b53df0ed-790a-b6e9-d1c2-68434ed2b1e8@linaro.org>
Date: Thu, 30 Dec 2021 14:04:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211229165751.3774248-3-farosas@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/21 8:57 AM, Fabiano Rosas wrote:
> The next patch will start accessing the excp_vectors array earlier in
> the function, so add a bounds check as first thing here.
> 
> This converts the empty return on POWERPC_EXCP_NONE to an error. This
> exception number never reaches this function and if it does it
> probably means something else went wrong up the line.
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

