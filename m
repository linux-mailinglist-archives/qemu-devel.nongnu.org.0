Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3F6F6993
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:11:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWr4-0003KI-BG; Thu, 04 May 2023 07:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWr1-0003J1-PU
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:10:31 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWr0-0005vk-3B
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:10:31 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50b8d2eed3dso527050a12.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683198628; x=1685790628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xoZZBjwB84SjOz/HHJiQf2Sz5pUbmlUh6+Iz4TJiwjQ=;
 b=dDISpJ+iAL1rLpgzjr/lrhLBxcFFUhpnrjOHQYLtvs/fEWbZm83U9W7SLhlqzoF2QU
 vbfP1umSybpE93lN+bdKALo5bYU/rri6UOv2t9OTeK4o0V5IitFdxWRkdvqs4WEZTbK6
 hY/3//3ZP+oJWmROKV7mSxiPpLgScCiI8TkX53BMElpJdl+RcrZBB8mBgL/NzAaYY9Wl
 x6nMTQujt0Q4ehJVDqEYQe8QAmtvACX0pFEH8rYdpDq+bVvBRMtgEa1JJo0ROEauZ/Eh
 yrO08jACkl1WX1wpOTfYDQILqKoJWNBD3f6qH3ZzzpncthqrFrgsZ+5wEOCrkywsfy91
 zBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198628; x=1685790628;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xoZZBjwB84SjOz/HHJiQf2Sz5pUbmlUh6+Iz4TJiwjQ=;
 b=HLjwuy1xNfSckPRCyqpGCApgQPgiiNtNcKMCbEsKdqaGp1d7vhN3Xtqa8+2nWKv1Iq
 3Fd7SLS+YvpZ6Bm9nQXlhtUyK3v//PvN3laj/dtIsXXCve+T9kgwkHRmYlYP85wintIF
 ZixtXCtASaFLS27kcIyRfNmfJQfHRmpKNA1q6g5DqTCxoItkQU0goYtWKw1fOp9cokCu
 UAmLGKXCJQsKoAnlF9JyFGLJf5iHVdV9fypwjOKxA/YEDmtmPAkd2MziRgfJtS3q2C/d
 Ziz/jEI5hekDhr6m3UUkNrCXNU7vmBTqG6BFp6+WpbqWHEOcB3JLY9kfQf3GHdZon5hS
 ysUQ==
X-Gm-Message-State: AC+VfDzQvijNxTJaPwJX8EGtCw61n+S2Hsf4pMcixBxjTVGIh6lYqsnD
 sDRyF+9IJiAcwVcWu8Vdriz4QXppNRiNB5eA6bLhMQ==
X-Google-Smtp-Source: ACHHUZ58rhT8unVhV1ge1F4HqcK+pzLQK3lKcxc844FYTxovNYGkJRIcsx4uA5w2EwE0Pe7vSIvsHg==
X-Received: by 2002:a17:907:8686:b0:94e:d688:c36d with SMTP id
 qa6-20020a170907868600b0094ed688c36dmr5935760ejc.38.1683198628228; 
 Thu, 04 May 2023 04:10:28 -0700 (PDT)
Received: from [192.168.66.227] ([91.223.100.49])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090639c600b0094b5ce9d43dsm18699438eje.85.2023.05.04.04.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 04:10:27 -0700 (PDT)
Message-ID: <6db84566-e0d4-e519-55e7-16b9188d8670@linaro.org>
Date: Thu, 4 May 2023 12:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/6] Misc QGA patches
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230504095657.239048-1-kkostiuk@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230504095657.239048-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/4/23 10:56, Konstantin Kostiuk wrote:
> From: Kostiantyn Kostiuk<kostyanf14@live.com>
> 
> 
> The following changes since commit 044f8cf70a2fdf3b9e4c4d849c66e7855d2c446a:
> 
>    Merge tag 'migration-20230428-pull-request' ofhttps://gitlab.com/juan.quintela/qemu  into staging (2023-05-03 10:29:30 +0100)
> 
> are available in the Git repository at:
> 
>    git@github.com:kostyanf14/qemu.git  tags/qga-pull-2023-05-04

Please adjust your .git/config to use url=https and pushurl=git@
so that you automatically get an https:// url here.

Fixed by hand while applying, so no need to re-send now.


r~

