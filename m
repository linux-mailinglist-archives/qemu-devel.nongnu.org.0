Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A493AA403
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:10:47 +0200 (CEST)
Received: from localhost ([::1]:40036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaw3-0006yx-0Q
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltau8-00059K-4z
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:08:48 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltau6-0004l6-Jw
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:08:47 -0400
Received: by mail-pf1-x436.google.com with SMTP id s14so2959585pfd.9
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=khG+hA/oWW+6XaCQoI4l+JWpJIjB/Ndrx8tXNAgi58I=;
 b=i6cyoQMXH4nHUQNPbAe3lGkmHE+/5SPEsll0Ut0Gf5XVnOfmSd5OjWgzUDHn/SR09d
 XUJyTEIFTIZ/VX81mSfZH2ebdoIN7/7fCYU21JvSOvIGQlPES5g3TmHJNxlgFP9QnTVN
 nE+AW8CsYpUEwkl/Dkz8de2yZT2giLnDOjTLKpzs5BHxy/NRH/r5wUDo57dvUtDfRPcE
 C7DwDRoevsaXZ0J1ixtLo3a7xRKGYOZCP0OA24u7H4U8DMsDaXWQ+FBxrTYRb8jalrrZ
 9gM7VgXlAsE2Iu9DopXi5vP5s6n7nc/hN4sgQo0XTtLBfiU/85k6bNV+GlAUkc/BaVMr
 AXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=khG+hA/oWW+6XaCQoI4l+JWpJIjB/Ndrx8tXNAgi58I=;
 b=opwdreHB9jquzwABQTK/bg07X63bUTV3riujv4CR6z1Z+X4ZwG6TG/HTORI84+wJzk
 wL2e0z7M0Mkb50oUlD3W4Fzgj9FX0pRgzo1CYAJSj6GfnaKTafdH7GlIDEwBmbgW2eAv
 MzXBWN6u76RZQRWza7Tg6UIy31gGPyQUSWUD9bMhME+P/cFEAlobM9TrJ0pDWNIiE/Id
 1KmZAk7191EXc02tF0Lf7VYigrnK41YimOdppfyYTwJWMluGMYjF9eGijzMoUML5eUHv
 EE4w30INZoXonQjYVKwE8F0uTlBWe+Ychc3HxEjIVz7JJNzznfIlCVZRU9jC6Pf466Wx
 wGlA==
X-Gm-Message-State: AOAM531mtyeQQQeEFkRKXmltc1HnFsYBl85t0j9tOgaO2MiKFN+9g8QC
 d/AlxJytuCopDknYA47e87KL9A==
X-Google-Smtp-Source: ABdhPJx0jbPRlfwerm7iHGmu3a7EWuqxxmT3XwVpQTGGHMKCBLhYBzx55/jV+2YqVf9kfzXO6aEkdA==
X-Received: by 2002:a63:490a:: with SMTP id w10mr1118282pga.286.1623870525037; 
 Wed, 16 Jun 2021 12:08:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g13sm2852462pfv.65.2021.06.16.12.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:08:44 -0700 (PDT)
Subject: Re: [PATCH v4 2/7] block/nbd: Use qcrypto_tls_creds_check_endpoint()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad68021d-94a0-a097-cf09-150100fab03c@linaro.org>
Date: Wed, 16 Jun 2021 12:08:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616162225.2517463-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:22 AM, Philippe Mathieu-Daudé wrote:
> Avoid accessing QCryptoTLSCreds internals by using
> the qcrypto_tls_creds_check_endpoint() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   block/nbd.c    | 6 +++---
>   blockdev-nbd.c | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

