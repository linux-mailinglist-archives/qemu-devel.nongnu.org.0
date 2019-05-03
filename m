Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D21267C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 05:32:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMOw7-0007GJ-3A
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 23:32:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMOv4-0006zk-Qj
	for qemu-devel@nongnu.org; Thu, 02 May 2019 23:31:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMOv3-00045H-NV
	for qemu-devel@nongnu.org; Thu, 02 May 2019 23:31:30 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMOv3-00044x-HL
	for qemu-devel@nongnu.org; Thu, 02 May 2019 23:31:29 -0400
Received: by mail-pl1-x644.google.com with SMTP id w20so2024912plq.3
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 20:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pof0ijxe474HhzHaYgMyYdYOtnSha5NYjK7IMptKBtU=;
	b=UgTRFNrylZXUr0x7sQB6ZNS6xtTGhOdFYDrYVMUngMh3sopYwGH3WGhlWhZhtHCkzf
	/blLMRgV2vzJBiQvRIPF/1lfuMf4AFfljsifn57a893siVy5MDM0nBsUJzAZWkjJ0ins
	o3CbX+kgSc3pMg24Pt1W3GNNEGRj92U5CFR59xHsFyAibnH009RP5O89cnIeSBIaPV58
	HAQJ1SM+IL0FVR3j4NoJWEZn9gRSr7fgw8AZt/qvvruiNfuRddqg0yQIuevskWY9jkFr
	OkWkv6UGMyRmlM+Hh0Gstbcn0ZnGPeoYvBYlO+3ZzbjvgouppbDDUtcJbGbuc1ph+iCC
	DLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pof0ijxe474HhzHaYgMyYdYOtnSha5NYjK7IMptKBtU=;
	b=rLzC+G5ioomDurbtMKlMNLbKfrWMHBWGilMlMazvTnxm/R6wyE7ESj5TbyR9sj+yJp
	hL1w5UimbTi05hFGgd0qc2rYbRXi96jfRvSeH9NPvRUa7lY7tfgrQ5XRI1ZImEj2o47E
	66qmFshds7VLoqePr1U4CogUB5Q6LL/Ylh+c/xKd93dczipOPt3w8SJ/x7tehU11+5qJ
	JInKfuqdP1KyaaWCDZGiEwqCIoAMQiTxtT+Dh1Hgbhl/+OLXL95svOz5bP6cm4WliQDD
	aK4MIC5ygVOsMgL0m7uIe+53ZpF+yM8YIUx5rO8CucFleYJ1VyEmsfTzUmQFb9RGcMz/
	xQsw==
X-Gm-Message-State: APjAAAVeF6U13S2nJ6KlPhjPGCZtguNfU7srwBKI3JuRcBC/UxXcIwl3
	5ex/uwhqapgglOHgKRRni6Cmn0XjfGY=
X-Google-Smtp-Source: APXvYqxoXZ7mTkAOtOYWpPEfFEZ/d54LEynQFBQLkQewgwItGusYr+48v8RaTLxCSG7TXeIV5A5ljw==
X-Received: by 2002:a17:902:141:: with SMTP id
	59mr7556988plb.132.1556854286524; 
	Thu, 02 May 2019 20:31:26 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id i3sm798951pfa.90.2019.05.02.20.31.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 20:31:25 -0700 (PDT)
To: Cao Jiaxi <driver1998@foxmail.com>, qemu-devel@nongnu.org
References: <20190503002206.9751-1-driver1998@foxmail.com>
	<20190503003707.10185-1-driver1998@foxmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <46c2245c-3133-8335-226d-007b6e22c2f4@linaro.org>
Date: Thu, 2 May 2019 20:31:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503003707.10185-1-driver1998@foxmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-devel] [PATCH v3 3/4] util/cacheinfo: Use uint64_t on
 LLP64 model to satisfy Windows ARM64
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/19 5:37 PM, Cao Jiaxi wrote:
> Windows ARM64 uses LLP64 model, which breaks current assumptions.
> 
> Signed-off-by: Cao Jiaxi <driver1998@foxmail.com>
> ---
>  util/cacheinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/cacheinfo.c b/util/cacheinfo.c
> index 3cd080b83d..eebe1ce9c5 100644
> --- a/util/cacheinfo.c
> +++ b/util/cacheinfo.c
> @@ -107,7 +107,7 @@ static void sys_cache_info(int *isize, int *dsize)
>  static void arch_cache_info(int *isize, int *dsize)
>  {
>      if (*isize == 0 || *dsize == 0) {
> -        unsigned long ctr;
> +        uint64_t ctr;
>  
>          /* The real cache geometry is in CCSIDR_EL1/CLIDR_EL1/CSSELR_EL1,
>             but (at least under Linux) these are marked protected by the
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

