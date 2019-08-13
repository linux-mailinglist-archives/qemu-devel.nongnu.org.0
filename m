Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B738AE56
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 07:02:02 +0200 (CEST)
Received: from localhost ([::1]:49396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxOwb-0004SK-Sf
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 01:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42419)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hxOvC-0003yy-Eu
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:00:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hxOvB-0007vR-Gw
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:00:34 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42689)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hxOvB-0007v1-7P
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 01:00:33 -0400
Received: by mail-wr1-x442.google.com with SMTP id b16so9786721wrq.9
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 22:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DXCBPslxt+/uUI0QKdcykCk2c5gkhbiF+DM/6uLxnUo=;
 b=senn4ignaYpikDjLqBVeJjACqzmWpRJWs+FwDC+RAz4Rm+a/zW7Fp0+sQ2s8HmOJ2U
 jZw17ye/1NRufpdWBI2LT+wHhHBibn4OVoZMn4IksQ76+7YnogsTLwof1SE+GxY9080r
 dhVEuY7VA4qjuW6m2d04+5ooebzqI2ASAPLJccz2b5EajDV5K3eYqS5DyIq6lQFOTL7/
 0nuFj5cLQyM2fPs5X5m0sWo7KUTDffqffiAs3QLshDXYszNF0qj7UN6QeCU8wCRZ8Po/
 Dp+z/eujVTqVHV1JV6/WbqO54g9rKmJAAxNwrltfXfPWzUVLzXYYcF17q+xJmiAcfgqe
 dE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DXCBPslxt+/uUI0QKdcykCk2c5gkhbiF+DM/6uLxnUo=;
 b=XYXrvwWfhndCGaiN0r0u83yz0jgGn3HNYqtoqWzEykxedEGmIbh/x2t2zUg8uf8dNB
 T93YE+LxYQJ8GOdXCt3IK/fNTx3bVHLOUVkeGhgNA+HcjDf2MCmWJD2S9DsrW27ALksG
 lHs33G+rUbmw9JT2JMsphP7+cBhi3HBoP9fZPPuTwu9a7OOedEG8RVStuzT8VuwYXCnD
 S1Nk9NGLdM0vzS2QQjZOURg5/PG5CNyF8fTe03cKsQL52D37OxGoLN05PFCFrzN3lukf
 pPei61rLaoi+kV8DKT5unFmOvjJEb0ZbW28khRSnNcNp+ZRWnO8Th1jn1tGPcSpz2yyZ
 7mww==
X-Gm-Message-State: APjAAAVsafWp5F8IF9zA63xtxIO4MUvZGDGb/MwOkj4WzTkkYZyG4kEy
 oyVC4Bk+deoVoL2zwBFBddLpKQ==
X-Google-Smtp-Source: APXvYqyacCeGk+XGqoOe3dJ7FyBzFpul92ME/h2BaogatJEUChIxUmV3gkhcgdShFSEKZfhIvxzc+w==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr44064405wrn.37.1565672432143; 
 Mon, 12 Aug 2019 22:00:32 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id j20sm17640902wre.65.2019.08.12.22.00.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 22:00:31 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190810041255.6820-1-jan.bobek@gmail.com>
 <20190810041255.6820-13-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ef17f026-5a3e-0fa7-4583-aff85ed591df@linaro.org>
Date: Tue, 13 Aug 2019 06:00:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190810041255.6820-13-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [RFC PATCH v2 12/39] target/i386: introduce
 gen_sse_ng
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/19 5:12 AM, Jan Bobek wrote:
> This function serves as the point-of-intercept for all newly
> implemented instructions. If no new implementation exists, fall back
> to gen_sse.
> 
> Note: This changeset is intended for development only and shall not be
> included in the final patch series.
> 
> Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
> ---
>  target/i386/translate.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)

Actually, I think this is a nice preparatory patch and should be included.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

