Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E860569869D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:54:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOmi-0004tY-J5; Wed, 15 Feb 2023 15:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOmg-0004hZ-7a
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:53:46 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSOme-0002Y3-0c
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:53:45 -0500
Received: by mail-pl1-x62b.google.com with SMTP id e12so4003676plh.6
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=puqXxNMTcc1oNfsi66X34gXhtYSOWynNXSH/R5ML1Kw=;
 b=z0xLo4QOkRNn/l+f0lYt9JqPhbBGiowl4l4VUQed+G5t6KB1qWU5KJ+VSXybHCXZWU
 JOIgSl8I5xp0lRySt090g2Uuk9aDf2faGXrMdvhN1TRRUbyCXtXA7/WtaDuICd6lpYps
 nnz10S60YqYS2eO/RwSj6udC17ulAlwjwigOJtIEWP+IfNeizQOT7FolGBMqzdMchPfP
 qwnh4mNKTPhIbfA28/DBWKSUHLFw/VZhIczO6yofGI/1OnephzaRqG4mI3Io0sLrjEuZ
 SZrM0e089f+Pjg+p4wsM0ziuSuvFbxOSAdsJ6QkZLYcm85CxxlMFeAbXLSGU6jAoyY9f
 Z/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=puqXxNMTcc1oNfsi66X34gXhtYSOWynNXSH/R5ML1Kw=;
 b=dFHPmLPeaCVMdTKOmYuQWpDJshX5FXwfdTx5ABSoC9G4ADyCm7hw/B3ZFdxz6D1Iuv
 QrN2u8MFHzGHFpRy3vQcWn9oScxCMCoMt7/pdF36mAd7thaqzo9FOjAylWKJzXLVIU4e
 R0T7LG1+Grk6pG6OiTgmSgWRZRe+38kpehVNIs/ceuHsoXP/MHyKloj7kfL/3cpsh8wt
 b5ZvJ3NAFbOO0dECMQTWrsB0QXMPSua931dZF+CDAYstuaYI+kaSstX1snmTQmTojMkp
 ZV92DvTQlhGwzgbVcLe3G/GNXTvaiQxDJd233JXBcxGS27nc6klM0JGqsOoTcgJKfbPB
 B6hg==
X-Gm-Message-State: AO0yUKXSwvFPv4lh9dkgFYDB4N37lreZ5Qjp/HUJvzGOAp5TdrWKPaKP
 43L7+/e4t3nSbRvEMfJgKwzIMQ==
X-Google-Smtp-Source: AK7set8ZTQmvcdeZIf5kaNDCpUdtQuaPyF0vTomkBGu1FiwdRWAWQ2FAjw6hlCKB8y5/Z440MLKuuQ==
X-Received: by 2002:a17:90b:3eca:b0:234:721e:51e5 with SMTP id
 rm10-20020a17090b3eca00b00234721e51e5mr1228672pjb.10.1676494422062; 
 Wed, 15 Feb 2023 12:53:42 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 f17-20020a639c11000000b00478c48cf73csm10713392pge.82.2023.02.15.12.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:53:41 -0800 (PST)
Message-ID: <bfb844d4-d726-edff-c90b-87d5ef606a37@linaro.org>
Date: Wed, 15 Feb 2023 10:53:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215192530.299263-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 09:25, Alex Bennée wrote:
> The 22.04 LTS release has been out for almost a year now so its time
> to update all the remaining images to the current LTS. We can also
> drop some hacks we need for older clang TSAN support.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst                        |  4 ++--
>   .gitlab-ci.d/buildtest.yml                    | 22 +++++++++----------
>   .gitlab-ci.d/containers.yml                   |  4 ++--
>   .../{ubuntu2004.docker => ubuntu2204.docker}  | 16 +++++---------
>   tests/docker/test-tsan                        |  2 +-
>   tests/lcitool/refresh                         | 10 +--------
>   6 files changed, 23 insertions(+), 35 deletions(-)
>   rename tests/docker/dockerfiles/{ubuntu2004.docker => ubuntu2204.docker} (91%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

