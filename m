Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341844E6B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 23:26:50 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbXFA-0000Jq-VZ
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 17:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47590)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXBy-00074h-Vk
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXBw-0006Kj-Rm
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:23:30 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35646)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXBw-0006K0-Lv
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:23:28 -0400
Received: by mail-pg1-x541.google.com with SMTP id s27so236724pgl.2
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+PhFHDqEdtLwS/tvs7fSztDQszEBBsq7OUkTnqZnXXQ=;
 b=KOeVJ7IVKOEgGqvaz+NwIQIDpyXyXj6g4JTI9tktoE58AzY7OnVcj7guaZvk0Ny+TO
 K1DYmdGxVQowgZFhiK+5P1y5xlc0Pscs5R0Y12Lq7wwvaaB9bUdvi9PG/VYKxnenOV5T
 hp3RMEMcPqN+3BIRx99yWmPlJ4MRnvtcZ5WyIyO0venGCAuD/9/kXv3meBeBpKgsqQfb
 XM0MHMXeZ+ZTrsS4eHWZu8UyN//w5RxlWL9cnjuEEmG1zG0+drDvLKbfCzT8i4zeMOv+
 tk2WhQ4b9I4g7Hq4GsJ0ePRHwV3JoSp/MQTwFR8d2V6IQdZ5xvSDNOpA4iIdFOza1Hbm
 1w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+PhFHDqEdtLwS/tvs7fSztDQszEBBsq7OUkTnqZnXXQ=;
 b=mkdeuVauNNfyKfvB6gtvf3r88yeZUgkGFyz/tf6DVaIefvwrQ9WFL0QDwod4q9HEMj
 9htBXYV5DTgiDIrTk+3eJH/RGOEOjLo4jinRjqdgRV+FD5aJaOVPSRJXG3LjfT9VdO0E
 7/hZWd9ecvQBk0umB+gcr4cUUE0/WDWPRUh3RTKuogF5VbyE+q/IH1Z1E9Slo3w0mHwA
 +nP7L2oJPb2CRZnWCiDkVi3r5ORk+dw+F8CfIWBs8Hlj8Qcay0bg/+03uFj1L668iH6h
 GHiYgbfIlxLlhxgazlnSmQqXTQP8EFA7Ej3OQYeT1NhM8h305CNEguzJDs+C9l55MOHM
 yDBw==
X-Gm-Message-State: APjAAAVPAZDkkR5Bg1hn23NBsp8941p5J8fyXY4NGkWJbS++nzsOUGzc
 LMyXNmCqFEmGS5wpY6O2yoCfifVdshM=
X-Google-Smtp-Source: APXvYqz4/zcPpm3zfo6Nd6wkuEz33/0o5awGbnVtkuVJzvewciZxCdBSp/b2xSwpQ2HBFtx88uzH4g==
X-Received: by 2002:a65:624f:: with SMTP id q15mr32315936pgv.436.1560461007244; 
 Thu, 13 Jun 2019 14:23:27 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id b128sm593016pfa.165.2019.06.13.14.23.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:23:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <09f6f0a2-2964-fb95-d099-e3f06b14d824@linaro.org>
Date: Thu, 13 Jun 2019 14:23:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH 02/12] target/arm: Use vfp_expand_imm() for
 AArch32 VFP VMOV_imm
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

On 6/13/19 9:39 AM, Peter Maydell wrote:
> The AArch32 VMOV (immediate) instruction uses the same VFP encoded
> immediate format we already handle in vfp_expand_imm().  Use that
> function rather than hand-decoding it.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 28 ++++------------------------
>  target/arm/vfp.decode          | 10 ++++++----
>  2 files changed, 10 insertions(+), 28 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


