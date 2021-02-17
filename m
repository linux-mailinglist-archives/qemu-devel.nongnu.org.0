Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142DB31DE86
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:45:26 +0100 (CET)
Received: from localhost ([::1]:32886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQtA-00031s-Jm
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCQrl-0002aw-ME
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:43:57 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCQrk-0003Xd-4g
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:43:57 -0500
Received: by mail-wm1-x336.google.com with SMTP id v62so4372901wmg.4
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 09:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u7xa4r6x8iEbBMX74ob8J9rvs6SCPzYGDzbkaOp19B4=;
 b=r81K5iV22CBh1X+8nDxJXU9f6GZwhm6eNMkr3F1YfsyGpvbpN94IAbGUboSDZxb9qw
 eSAMUJtSVPNmNwv7EhC9VsS4vxv/K94QmcXZyzKC/42k6ZP0qaR38FHpC2Ubzs3eeLw+
 pj36/IoggYUKToi3VNjw8vwukJfaJOA/WeVH53OGFWmXIiHoLrkIzoTAdai8YjAkf4oC
 SNiBcUSC/ie/FSpQmrunnbsBsTsEJqe5d9GqGyZKAKpuj0W+1HQ31XS4E8KxVy+c4u6v
 MJoqNnj6RJjdijx8UhZtKCSZGIkdVDia+BNZsFFr6sOeV8WURscZuo96xyFU8/k5ious
 SGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u7xa4r6x8iEbBMX74ob8J9rvs6SCPzYGDzbkaOp19B4=;
 b=Qe4AQKWhn/DMspHSMfyu70GM0M1ARC0K4tyJ9Jl0iI9mpLlybnvmh+SgK3i15fVdbE
 tk1AnMoYKdIbnmh+9E5yVS4BGB8p5IMxhZA+60eniHCdVciR19wSAfcHZ1sLQjpkPrst
 dP7R+G8Z1LPerVBcaAMKcalhWh7sICGrEO90JWzApyiCRffJhVw8gG2UKmOUPFVjNR9i
 5XlEyK+OV1YebtnB0wA2tBMqAQ+R3M34v5YnEcSpm3fclU/H3orgBmvrXbuJbdd/H/4L
 8Ep5ephQkTLRR940I6U9KdJEnXffG3UzXf66ZuC8FN6+8XrPavVTBjoMY3O4a/v3UT/x
 uEww==
X-Gm-Message-State: AOAM531KUMPn4sbUKZN/cGqgFjruZuStwNGlihVYjL/dyqqGUE2pgVKq
 RG04AE8NvJ+m1lhmcTYejWQ=
X-Google-Smtp-Source: ABdhPJzEQRRU9z4qn1BSq8bTe1nXd1b2+4CMbmzBjcXsM3wNTNuiMxCZtt2VcBKk+nH2x4idxqLlCg==
X-Received: by 2002:a05:600c:2351:: with SMTP id 17mr78062wmq.2.1613583834613; 
 Wed, 17 Feb 2021 09:43:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s11sm2302201wme.22.2021.02.17.09.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 09:43:54 -0800 (PST)
Subject: Re: [PATCH v3 22/23] tests/plugin: allow memory plugin to do both
 inline and callbacks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210213130325.14781-1-alex.bennee@linaro.org>
 <20210213130325.14781-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b49f3b22-5f20-2124-af9a-e07597ee75bd@amsat.org>
Date: Wed, 17 Feb 2021 18:43:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210213130325.14781-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 robhenry@microsoft.com, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/21 2:03 PM, Alex Bennée wrote:
> This is going to be useful for acceptance tests that check both types
> are being called the same number of times, especially when icount is
> enabled.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/plugin/mem.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)

AFAIU looks good.
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


