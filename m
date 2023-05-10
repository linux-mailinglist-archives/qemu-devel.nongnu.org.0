Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFCC6FDD72
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:08:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwibU-0003tC-2r; Wed, 10 May 2023 08:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwibR-0003sv-5W
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:07:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwibP-0004lc-DT
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:07:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30786c87cdaso4610700f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 05:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683720446; x=1686312446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fLR/FBm42fTU6tpqDUtK3XmU7QcAY5Yfl+VrQtH//qU=;
 b=F18ylllXOqMSLAi/kLQIRMUbEKAaerXWa5aopm4LF5TygOiufvib7a8geziHm8bBjE
 86rSuAOXGSmtkYXENBjXd9Up6Sjtt0ntto3JC2hOVyjWv1PB2TS+wpz4hrnJVt7uEU+N
 RJd+KCDpW0Z3NsY1MyHpC9Qr+/NdzIJFs6Y8cspnadBHSi1s+dZ61HU7KYNhASuW+wzr
 GpGEjFkA01qlS3kEF4ZEiIxQXfSjIuEnLX7b/wp/3jsQkOWY6z9toPfei6WEGOKXhkXZ
 lUEcTSOZgAt+wSAbM/ODPIObsvqr3ruLbw31hYxm2gmwwE9i+zdbav3yvNR6une3dCnU
 Tkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683720446; x=1686312446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLR/FBm42fTU6tpqDUtK3XmU7QcAY5Yfl+VrQtH//qU=;
 b=QgbulCBfnL1SzuZYHvcrH8xYFqLCs7ICDsiu1y1ZhQiLuqGLqo7EwWZvPDpcQ/9+Yy
 xCG/3C+xYL9nsRaOHy+MMFUEoxf/ckW5t9mf5Z6VmYgUUEfpGuca+KDe7quRWZDHv6Sw
 q7dtN9D/7E2pyjrW884aPblOU0oVZ9xtfn8mvNqX+dZKCLGeEqK04WPt4o5P3PUPAPum
 MWkHFzoqCKZClvxZNgJfFhhu+kj6rj7aN4jXPUA7oE9sMQJdY0ROF5Ac54gNw51s9MB9
 GwZ5lxSN0DdAWerl1RaCXJzvBSeFqSVTylwB1tH9HHE+vmDvn4jQdI32BkRH+NK/d0FH
 +jSw==
X-Gm-Message-State: AC+VfDxrFgoJeIEVpR7ReeZkVPbW6qzHTZ5cVTzae7wHdBPQUPZVu8KW
 nfqVCNwAkO6pz7kiA1B/HOpCcw==
X-Google-Smtp-Source: ACHHUZ5UhXKxyvYsEOa5vxzyJC8r06d8a7U2uky0hVI0E20wA+801cYr5fJ9rLt/gKpE3Uubu96QLQ==
X-Received: by 2002:adf:e849:0:b0:2fa:27ef:93d7 with SMTP id
 d9-20020adfe849000000b002fa27ef93d7mr12751717wrn.42.1683720445845; 
 Wed, 10 May 2023 05:07:25 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a5d680e000000b003079693eff2sm9265345wru.41.2023.05.10.05.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 05:07:25 -0700 (PDT)
Message-ID: <a89bcd27-95dd-fa12-0d27-f35d1aa8a68c@linaro.org>
Date: Wed, 10 May 2023 13:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/3] VFIO updates 2023-05-09
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: clg@redhat.com, avihaih@nvidia.com, minwoo.im@samsung.com,
 k.jensen@samsung.com
References: <20230509215923.3186420-1-alex.williamson@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230509215923.3186420-1-alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

On 5/9/23 22:59, Alex Williamson wrote:
> The following changes since commit 271477b59e723250f17a7e20f139262057921b6a:
> 
>    Merge tag 'compression-code-pull-request' of https://gitlab.com/juan.quintela/qemu into staging (2023-05-08 20:38:05 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20230509.0
> 
> for you to fetch changes up to b5048a4cbfa0362abc720b5198fe9a35441bf5fe:
> 
>    vfio/pci: Static Resizable BAR capability (2023-05-09 09:30:13 -0600)
> 
> ----------------------------------------------------------------
> VFIO updates 2023-05-09
> 
>   * Add vf-token device option allowing QEMU to assign VFs where the PF
>     is managed by a userspace driver. (Minwoo Im)
> 
>   * Skip log_sync during migration setup as a potential source of failure
>     and likely source of redundancy. (Avihai Horon)
> 
>   * Virtualize PCIe Resizable BAR capability rather than hiding it,
>     exposing only the current size as available. (Alex Williamson)
> 
> ----------------------------------------------------------------
> 
> Alex Williamson (1):
>    vfio/pci: Static Resizable BAR capability
> 
> Avihai Horon (1):
>    vfio/migration: Skip log_sync during migration SETUP state
> 
> Minwoo Im (1):
>    vfio/pci: add support for VF token
> 
>   hw/vfio/common.c |  3 ++-
>   hw/vfio/pci.c    | 67 ++++++++++++++++++++++++++++++++++++++++++++++--
>   hw/vfio/pci.h    |  1 +
>   3 files changed, 68 insertions(+), 3 deletions(-)
> 

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


