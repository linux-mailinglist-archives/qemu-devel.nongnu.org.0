Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254DD6FE1BC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:43:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlxW-0005gk-DA; Wed, 10 May 2023 11:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlxR-0005bv-Nb
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:42:25 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlxM-0002be-6B
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:42:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so4808230f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683733339; x=1686325339;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vEuK6MRroitmzQdbO2aFAieaALwsk9MxNHsrR4+k/GU=;
 b=DwMyN4aim9EihPoNNN7AmmvcRIsvJrI+p2dZumwZ39TJ4+ZhO67bIG44sa8No039OO
 8fUJdOAHZabn132mmlI0+xIbDbdqvJNakaOshOjgcyRYaeuXsCS2KM3PVHBvfzvwxSpQ
 ayO6/T73hLX6m8lxofFTvfCC8a8DK3L8Xs4TPjqKvCVInfoyRRxb3UizcgQY/c+aBaFR
 pzi+Kjt8GQL7xFcg8evDloJRZ+AZLqynHRR+wD9Eodhpx6GL1sQyYakEL2Ca2QEXQqXv
 VO8IzVfpL9jQVxcz1Ae5G/L6j9Mv+y2LQB7SKyp7OtkwUXtXPJzHRdmZZ81FHMwwExT3
 vUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683733339; x=1686325339;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vEuK6MRroitmzQdbO2aFAieaALwsk9MxNHsrR4+k/GU=;
 b=HMfSGG5bgwkZHudqeIpWxd3/DUWMBY9YN5YsO7Y0EBsGooMETJCub5Bm4NPLCswcH+
 3dnlFM47C8elRG7FpF3z0nDYUsa71yIRidRyHcuGaVEbsS8nYCBmR8LC1sdApK+lEloS
 3fjIFCG2BaT75XOPoTUoznloqhnHj1o/Jb00mkg1ww0W4ooGzlJ0ZDMEfwGlNocFuqGr
 MFILtuRa6jLbLTOHQriVltFBQBAHNzqEP/zpUXRCQjZQa7TW1owE0OwJcS2yb6TtABUe
 SCvdX3poiFZ1NLi5JoppuJZEJOc3P5udgUC9163bMa/b8bAoEBkICVSIEzrJTY8R5Hmh
 2VQg==
X-Gm-Message-State: AC+VfDxi8Muu7qFaqvqsX0yrPL+M+sgBnhr1FsVLx54rootnV9yRsDV5
 xPvoxwWFiEPDau7AFOeH5FV7Sw==
X-Google-Smtp-Source: ACHHUZ7ALyZAglVNbCKV2qE+CPU4IJvxKU6yz2wH3RlNyjXsAmDnltkivh/gGFG+hjtu8NVdw0+DOA==
X-Received: by 2002:a5d:4904:0:b0:307:bd64:f5a4 with SMTP id
 x4-20020a5d4904000000b00307bd64f5a4mr1303148wrq.52.1683733338740; 
 Wed, 10 May 2023 08:42:18 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a5d6051000000b002e5ff05765esm17693659wrt.73.2023.05.10.08.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:42:18 -0700 (PDT)
Message-ID: <5e78cf87-03a7-8c11-62ff-3ad189cfc115@linaro.org>
Date: Wed, 10 May 2023 16:42:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/28] Block layer patches
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20230510122111.46566-1-kwolf@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/10/23 13:20, Kevin Wolf wrote:
> The following changes since commit b2896c1b09878fd1c4b485b3662f8beecbe0fef4:
> 
>    Merge tag 'vfio-updates-20230509.0' of https://gitlab.com/alex.williamson/qemu into staging (2023-05-10 11:20:35 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/kevin.git tags/for-upstream
> 
> for you to fetch changes up to 58a2e3f5c37be02dac3086b81bdda9414b931edf:
> 
>    block: compile out assert_bdrv_graph_readable() by default (2023-05-10 14:16:54 +0200)
> 
> ----------------------------------------------------------------
> Block layer patches
> 
> - Graph locking, part 3 (more block drivers)
> - Compile out assert_bdrv_graph_readable() by default
> - Add configure options for vmdk, vhdx and vpc
> - Fix use after free in blockdev_mark_auto_del()
> - migration: Attempt disk reactivation in more failure scenarios
> - Coroutine correctness fixes

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~



