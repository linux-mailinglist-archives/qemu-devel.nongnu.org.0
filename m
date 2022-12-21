Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C4652E4D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:15:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vBh-0006eO-9Q; Wed, 21 Dec 2022 04:14:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vBc-0006eD-UU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:14:52 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vBb-0001sY-63
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:14:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so2218692wml.0
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r5qKuD68MXav2f0IQcNyD/BJS+ftp1AGnuDuAz3F2Ts=;
 b=DsKGrksRqaepjLseQgbYBUotWEGmcBINe1m1EgqH9HzWBGePWym1C5tyqusMX6Ub0W
 x8vk9srjHA33Va90eTLA2eXPQa6GX7Wmxs8doPY0TzyOGHj1eXf1/6fSTVjtk9JblYyB
 R/yFqyLnBgBXatXjyrz9VLow6bIj0tJk7oEWNdtHLk2hDaX5Bz3DH19svfFRwp6/qjrj
 hHq34EjStcM3m6IbwngvaWY6MRQIBAwjH+EFHjaQiD4gINCKiEzUnGJ6TwIYfM0bmSe+
 b4FJraUnaTk58RJD57eGGhM3eyf/6UdSfhFfsWuC5Qs+RFNfcTy65VIC9s87TiVcxLUZ
 2f5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r5qKuD68MXav2f0IQcNyD/BJS+ftp1AGnuDuAz3F2Ts=;
 b=xHMVYuuLByZO2b+EYLi3vzu7gp6zKc4cnEBPY598J7Soh7vanR9wEdDvuLH6L2w2xQ
 sKwePPpLD1PWKjaP77ga5cUNIsCKDLk75OEhifxvVG7/IkOsC7E8ug0Nnu2VYPrgmYPl
 fSS5/YThC3uNwUcH3gYzkWmtQCsyX6R1LBXouZv4UAlV+j2FmxI+37L5dshMxWAu/s3K
 w9C3cNTDGxYV8H8lqT9lf9pW30jadKLLTw5YHuELyToS+uapW3TvHK5OoMGdpfhwq5MP
 vYzwsfbhIjs8pgVyvacv8A0MrJauETPmNtrablVLSyHFl+9h8xW5qZgm7KHTiBgoZ3g0
 CL9g==
X-Gm-Message-State: AFqh2kpxBg9Jhq7qjlcjqYpYRRd1xRS40WkaUF2a+W/EtDmYsg9Eo1ro
 yakYA23zIP4OCyWkueJzJMzEhw==
X-Google-Smtp-Source: AMrXdXvsskjFLSklWHuec/xy5ZPdXR4W7CKsLgvIcSrIrZuK+Pzw64OhZWgecrxUhlaWYAWq0nc1uA==
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id
 p9-20020a05600c1d8900b003d35cd60781mr1043027wms.37.1671614089281; 
 Wed, 21 Dec 2022 01:14:49 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i25-20020a1c5419000000b003c6c182bef9sm1827077wmb.36.2022.12.21.01.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:14:48 -0800 (PST)
Message-ID: <b5fe914c-3736-f082-1fda-06acf23ddda7@linaro.org>
Date: Wed, 21 Dec 2022 10:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/6] configure: repeat ourselves for the benefit of CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>
References: <20221221090411.1995037-1-alex.bennee@linaro.org>
 <20221221090411.1995037-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221090411.1995037-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/12/22 10:04, Alex Bennée wrote:
> Our CI system echos the lines it executes but not the expansions. For
> the sake of a line of extra verbosity during the configure phase lets
> echo the invocation of script to stdout as well as the log when on CI.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221202174746.1218017-1-alex.bennee@linaro.org>
> 
> ---
> v2
>    - only add the extra line on GITLAB_CI
> ---
>   configure | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


