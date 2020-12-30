Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7FB2E7D01
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 23:39:20 +0100 (CET)
Received: from localhost ([::1]:54458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuk7e-0005Rl-Cm
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 17:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk5a-00049l-Hv
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:37:06 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kuk5Z-0000g1-6Q
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 17:37:06 -0500
Received: by mail-pg1-x52f.google.com with SMTP id c132so784012pga.3
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 14:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gp8A0yWzZKPMbq4rW1oqmT8ZXZHB3NWiwHwY3t8Pxvs=;
 b=NPYUqwfCt8BTX3uRAfHDA57+OoXzUZUZ3Vv8NvUC/S6qZiF7J/heGjte5iCemR7Ruy
 w4fBfBd2sRkdXClejlQdo+c9D5uAnni3PWt67vh4pr2+KeynjtUpu7xAA/MzSN9Ebsxx
 pZkwK8wSh+q1HDoRM+ZBTa9zKcC9EWDmAbxQuwlWtwoiOz44qNGhvUWoSphudJ2wT3fW
 ++ybXoSFw8B6L6ZyS3AZWligxkoB+DKCIIrTNoBfb6NAOElB+K1edg6y/aWBpV1EQq9E
 AReiwcz50b8vj2CoNju2huf0aUCdKFa303Q7gd3YXdgR1ZsNWxYQVouaHFY9jEQk8tl6
 JMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gp8A0yWzZKPMbq4rW1oqmT8ZXZHB3NWiwHwY3t8Pxvs=;
 b=hCptTobOCrP45pcpHwTW5z2wihGZlH/phXBz0MlBdsTBhczOKExWWVTeN7YbsMdbSV
 i6t5P6uMj0kB3vikUHCYyPDquzCdVpQuNEzZAVOmT8pk+vraZ09aw3TeFrnABAHXBqyA
 QbR8t0bfh2g1ymz1D5777hll1PFcVrLPDJqhsPagKdTJNtdUbz07GEf00BOoWGBILefm
 oWvfCboo/SXeb2VP0vJ/n/dhOANOiRR5bt142jpq6QHHfIMj2p8osh2/N8EGvnmNNHju
 AmMEbx4PX5/Fr2BBjyERWuO2sMACjEVDGCllP9pCi7S6QOLaQPKmv6RDm24Pcn+3wVIN
 oC5g==
X-Gm-Message-State: AOAM531gf9SgFYzR0+ndrqRYcW0IpDM/BXesa/69EA2gH2wgk6w8gVPf
 oqGLXZtMiGDDNCJjkFo1MhY19g759+X21Q==
X-Google-Smtp-Source: ABdhPJxP2Ny9xHJcULrI81AmtAuju5uoZZML2nHXIOFxzSC4xvlq2+sfv3Hec0d3YVah+NIk+Dh8Rg==
X-Received: by 2002:aa7:8a0d:0:b029:19c:2209:7b59 with SMTP id
 m13-20020aa78a0d0000b029019c22097b59mr49755663pfa.81.1609367823714; 
 Wed, 30 Dec 2020 14:37:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 h4sm41231159pfc.185.2020.12.30.14.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 14:37:03 -0800 (PST)
Subject: Re: [PATCH 3/3] target/arm: enable Small Translation tables in max CPU
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <20201218143321.102872-3-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c1fb01f-78ea-9f87-940b-246ea236277a@linaro.org>
Date: Wed, 30 Dec 2020 14:37:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218143321.102872-3-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

