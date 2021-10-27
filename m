Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3343BF8A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 04:21:12 +0200 (CEST)
Received: from localhost ([::1]:47210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfYYw-0002oz-Nf
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 22:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfYXa-0002A8-Az
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 22:19:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:45807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfYXY-0005Yk-S1
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 22:19:45 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so914058pjb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 19:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d3XU1luYAaJWgr4yOleNDxR8WS8Od3WI5HbLKncJxY4=;
 b=WtDfQYEksBJlSuwV1oNBIKcDlX7EmukhYMp61d4R+k+tfGlUD0R0ZuVMAC/im2GHSK
 JpwLBm7JS4kEnLCBgf1FeUWlCfu8tHJOX5gigbcZFXcpyxBLJigJAiO0yYvY2oRFFmqa
 iyas+pSsT+cXTlCGdqH+/eCBurh8SxWn66gCA5v6J3n4HZAumZeFq8g5ZQCges9CpSJU
 nWk4YUoQ3+kU4l3NAtBOKRS/4lMSLpIaMqJH2aoZWrRiub4DM1jIkKEoZMvhoH57/jGS
 zGuuwgvoMflvbPGbSNwsPuabIyjyw2R6SQg6YnEf1W23d+t2BkvXwwCQyCr/1Ef+ixsn
 V7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d3XU1luYAaJWgr4yOleNDxR8WS8Od3WI5HbLKncJxY4=;
 b=ecDl7KK7LZfMBy2k9XthatxD0z5jIg2fcXXtNHhBHkgmMN8kEHZSU3QOrAQYmniDKY
 WWiVaVz7rOOzRGgOw29kh5UmT3i8ypQ6eEdETpFbS4j+x9ylj4TwJTpFDTobdP+WbjEV
 C9xsSjhTGw9Pj24rGyTCsDf4G1/o78YTjj/NnHZ5zYjdzp47cnJEK8MDPuGPlqD6xDUw
 MQ+eAJj/fgjSFGnLLtke6AvNk8LA+N2VgK0HEMaUqzQuhcs1tgTwwwPnKZ2be/5UZOfO
 ds8x6t3y+R4s/D3ETlkTYmd56v6NZZXCjw4RNLxKMyX24JWIXhZ/tGZZk1R2nIs3ra13
 rf3A==
X-Gm-Message-State: AOAM533rqHSNCqX+t1uz4g0wApyLkXOgvcOY2vo2gxCX2cJEg+uZCGt8
 GD5TSVq7DgQUSQxigtaykbvHsg==
X-Google-Smtp-Source: ABdhPJxPQpUzpR/RIhL/+QcW4rHZh/4ocxhB/aRVuDWrzdRAI0XYZsmcEnmGKRuH42FWFX0dWv/usA==
X-Received: by 2002:a17:90a:f401:: with SMTP id
 ch1mr2764077pjb.136.1635301182287; 
 Tue, 26 Oct 2021 19:19:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id nn2sm2236343pjb.34.2021.10.26.19.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 19:19:41 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/sh4/r2d: Use error_report instead of fprintf to
 stderr
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635298341.git.balaton@eik.bme.hu>
 <a4711f8ec7ff38175c2d57f55704656af219aef0.1635298341.git.balaton@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86daf802-6f16-3671-56f4-653d3af2d6ac@linaro.org>
Date: Tue, 26 Oct 2021 19:19:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a4711f8ec7ff38175c2d57f55704656af219aef0.1635298341.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 6:32 PM, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan<balaton@eik.bme.hu>
> ---
>   hw/sh4/r2d.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

