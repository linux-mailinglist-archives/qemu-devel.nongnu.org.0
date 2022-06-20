Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28125524C8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:46:32 +0200 (CEST)
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NLz-0005uk-PF
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3MGp-0001Bh-Nw
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 14:37:11 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3MGo-0000Cr-4M
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 14:37:07 -0400
Received: by mail-pl1-x634.google.com with SMTP id g8so10479808plt.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 11:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jkSxeM1l5xAvRzxYlZI0BukIFAhL1liSZ8Vi5A0wWeg=;
 b=N6ihzdJNIIJmzrQQKfehWnsdD5XsWv8n1rbwlDYu+2JXWkQCfL5RoIQ6lzhbPsagng
 TJSouGNSLVfUcw1EjZFNRL9Y+A5SsQ+9hHL4pDLiPbTlB0/qBTwwCKed7MlWiKotDTtX
 uR6IWmjxJjlR+zVG+mzz7hpIhXC74m9jIwLfrhjngj5pX0f2Wtd88UJNkJxUwfDojADb
 Ja+o7Gvm34D8dl07k5csxRtDnrfypj7j3W3akcfOgFViQhqkQjzdw26eRhvqxZQ47Rzw
 RIvb0Iw9EBwUyLzvmoT5mq7NqzAbsaTcGtGzvvnS6ToEyQB0ZYtQ3r5YAlCuift/T24Z
 8ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jkSxeM1l5xAvRzxYlZI0BukIFAhL1liSZ8Vi5A0wWeg=;
 b=hfPacf8xia4NXWD5MK7D4/3eN6D4K0ZZnF86QBx9JbCOZ1wMnbegNB4r31YudLHMrn
 BvakV2t6kGWhpisQgvvQAEVS2siiI+TRlK2N3sYNQa9ASF2dOYBqpgWM88KBy5Lm9BgU
 2A9a8Wexv00Luv2HawIN+3V/kpCPlX/k8nzUSp32NtYUeDh4LipBTD2oWvIMnL5Js0Qw
 UxiugrXIxmyzlys3CM8TJy8y3l0bAIzqf5+KGhEht1u2Ya3e4+14s+6A0i+2CYyDyaY/
 lZi3HHZw63jA/fGWQmPz54vDOyhFkDzgQ4F2mwOvWMQbQMuxa4lgvXoCLSvUMUzk2pw+
 St3A==
X-Gm-Message-State: AJIora/dLLgpR17kceyriZKgyLUCRCkvqeNEYkjEW7oMaXoI1otbNLfB
 XnGg/jmd3T7hOaNyMnW8egqeFQ==
X-Google-Smtp-Source: AGRyM1tEModbBFs31aNk2hXGxI2EhQecp7d+Ag16HbgNDOuwzwowgA2BGF/qkJ40Jxt+gRPxyAaheQ==
X-Received: by 2002:a17:90a:5e0e:b0:1ec:aa3f:8dc1 with SMTP id
 w14-20020a17090a5e0e00b001ecaa3f8dc1mr6744481pjf.145.1655750224382; 
 Mon, 20 Jun 2022 11:37:04 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170902d48500b0015ea95948ebsm9132954plg.134.2022.06.20.11.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 11:37:03 -0700 (PDT)
Message-ID: <56962c28-acfd-a3d5-f150-9826e30427da@linaro.org>
Date: Mon, 20 Jun 2022 11:37:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 03/10] bsd-user: implement chmod, fchmod, lchmod and
 fchmodat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220620174220.22179-1-imp@bsdimp.com>
 <20220620174220.22179-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620174220.22179-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 10:42, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 46 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 16 ++++++++++++
>   2 files changed, 62 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

