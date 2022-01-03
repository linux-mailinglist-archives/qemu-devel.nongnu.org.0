Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92019483559
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:10:02 +0100 (CET)
Received: from localhost ([::1]:60194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4QqO-0002r0-OJ
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:10:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4Qo3-00019Q-0P
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:07:35 -0500
Received: from [2607:f8b0:4864:20::1031] (port=39656
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4Qo1-0001PQ-Eo
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:07:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso38180269pjc.4
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zMDSUk+S5mMZYl6o06d8M5ho4q/GUY7dnMxhENTc9SQ=;
 b=lLvTo7c23k6xYjocBrdd+imADTuRGGVBH6DCmCeOncb/GFHrn5lqzTZj3IWkW/xGAN
 GaxB08KXqS8J0uAoNN0+09Z+YOjTlgK5sowidw1avqFEKYtxiY6LSNxL3Vbb3EgS11GO
 GF4s8Ftcorrq/tzcc0HjvTVzoQ5YwlGZ3fKdk+7G4+W3vlbv+yHsQwqpOenwR2l3gy+s
 y93AMdksgo0r/kHbG55XyWyB2HbFmmyIFgTb9mPT5vnnj+9odbJvNd2X9skzrDymYKjR
 axb2XMUkM2iKGeVD6RkfgIXBeruRGQB7hYv9v5DK7GRuMlaamoz3o7dsMQPUglV3MkJq
 IZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zMDSUk+S5mMZYl6o06d8M5ho4q/GUY7dnMxhENTc9SQ=;
 b=uW1LdkcGXiahA4ZRI9I0GyFHo5CVHsTqo5GtXJYZBtbqjtrXuY7TApWfSbTcHdCLcc
 MvumtjPcJ31kBIPCfZVub1BQmcw5XBdEELXgrilHb4KxiJcHccMUzB5qyK+6Xg30E4FN
 +04OUThzZ/xueZA2c4peQm7cA8qBput97UItviqTEkQJ+qwDkl4FAS2kod1h0E4jRkkP
 sZMoC9H10fE0btqN89nT2KE8jFHkCsHqkBqF5K1DrfGC4xUkl3YjnQfB6WTvwuXEhTCe
 F/nggoP19Phz0FUgXVJJ3R074AYZ02696qLXMYbWvIs/k6qqrhl/V293Tsq0Zzlwbuq4
 bAiQ==
X-Gm-Message-State: AOAM532XffnC3/in7vpVpzgEfOmrNRZmakHwC76WEkAqAd0Q2HZYys8d
 +T5v1YAzlLiG4iyo3kDlg74h46ZFsfUV2w==
X-Google-Smtp-Source: ABdhPJyZPwMla2TZE64ECYlbJBkrDmTUQ8c6WtqvtB1Sduzh8HSuYoOzVjj9xXewjPk0KTpAgkrvRg==
X-Received: by 2002:a17:902:9a08:b0:149:7da0:b7ad with SMTP id
 v8-20020a1709029a0800b001497da0b7admr34063200plp.84.1641229652040; 
 Mon, 03 Jan 2022 09:07:32 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d13sm33725570pfl.18.2022.01.03.09.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:07:31 -0800 (PST)
Subject: Re: [PATCH v2 4/9] ppc/ppc405: Activate MMU logs
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220103063441.3424853-1-clg@kaod.org>
 <20220103063441.3424853-5-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1f8c7e0-db31-62be-0b8e-ee647ecaa832@linaro.org>
Date: Mon, 3 Jan 2022 09:07:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103063441.3424853-5-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/2/22 10:34 PM, Cédric Le Goater wrote:
> There is no need to deactivate MMU logging at compile time. Remove all
> use of defines. Only keep DUMP_PAGE_TABLES for another series since
> page tables could be dumped from the monitor.
> 
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> Message-Id:<20211222064025.1541490-4-clg@kaod.org>
> Signed-off-by: Cédric Le Goater<clg@kaod.org>
> ---
>   target/ppc/mmu_common.c | 164 +++++++++++++++++++---------------------
>   target/ppc/mmu_helper.c |  97 +++++++++++-------------
>   2 files changed, 122 insertions(+), 139 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

