Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D0D6AD2E8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:40:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKQL-0004ek-AB; Mon, 06 Mar 2023 18:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZKQJ-0004eH-7n
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:39:19 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZKQH-0006wm-8o
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:39:18 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so14849140pjb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 15:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678145955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tLg/LoFys28z734DKXgO7jeCDwY4lE08frQSOMa8LeQ=;
 b=hl1z+qkOHrR06TlJcSyxbQI+0WJhSOboQCRSpLXIW5bat58BrMMLU+oedimAlshcKr
 Q2HY/5RsNIEfxzUGIKM7aWIfDuvHr5Dyw4hT/fAg3L+bPFvCEgKvBAuX4oz+V2QWipKw
 PK939tyqT+Rm7WGMd22hJ9OfMcrKT039TnfovTrqSJ3Qqljzf9YWdOi8A7KhbwBBih+b
 TR6LsHK7VxFIf6FYnTqV1G8rloU/L/AwAIHyN4qsY2xZeUVBSjJqgMRu8jQ9ZJCs+S4Y
 qnltNl1pBSYhQAspqHb1WpKTOxfzarKuQdsSYA9/wJNioKONxSkbo1pwtBMu4EO/IUwS
 wG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678145955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tLg/LoFys28z734DKXgO7jeCDwY4lE08frQSOMa8LeQ=;
 b=HGhSnLvUcOOkRRx7W/q9TF84IrYlDpPDbMUM8wh6VItEFgLbSCq6ZifZDj8UB6AjR2
 adR5L8pI0xriGWZ2mzhA6Zp6y2+7qWZ8Y/kjHZIsSZbgUC2CodXs4k8jVplKkRGnCEqL
 XDH8ZUtKCwez5uJ62AfqSFh0rGCyVBid33ya+FaeOvruOVznzq3A2KM9qbDRiW/5Z6Nk
 6T3/e3EoXzyLMkc7KEhHeGe3vcNHxlsAp9TpG/yGIvxnV7mpknGQjpcnzDTp7CuHPeoD
 XnmUOnSjTmUzcksKe3q/rEQ36Q4djz9NWzVYoeW7dfPJK/9hhNH8b26bBetc9Yocerzw
 GAtQ==
X-Gm-Message-State: AO0yUKW5z21JftGnVnLJfEmoO+Zcn81mD4guj8iegTdpHPi4LBTMjmM8
 ZJ7ZSQWpbOXXjDo+Cd/n27yjRA==
X-Google-Smtp-Source: AK7set++gB3d79m1NCV0ZUg4wBwx5O26xGW5G8fKfnySnHIgRapdhn0veUf0Kf0oGv1ORiSYhRsmBA==
X-Received: by 2002:a17:902:d381:b0:19c:d537:754 with SMTP id
 e1-20020a170902d38100b0019cd5370754mr11718275pld.56.1678145955247; 
 Mon, 06 Mar 2023 15:39:15 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a170903230d00b0019c13d032d8sm7219036plh.253.2023.03.06.15.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:39:14 -0800 (PST)
Message-ID: <10e49543-b4f8-f22c-a9ab-e6340c6a0074@linaro.org>
Date: Mon, 6 Mar 2023 15:39:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 8/9] async: update documentation of the memory barriers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-9-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230306223306.84383-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/6/23 14:33, Paolo Bonzini wrote:
> @@ -107,11 +114,8 @@ static QEMUBH *aio_bh_dequeue(BHList *head, unsigned *flags)
>       QSLIST_REMOVE_HEAD(head, next);
>   
>       /*
> -     * The qatomic_and is paired with aio_bh_enqueue().  The implicit memory
> -     * barrier ensures that the callback sees all writes done by the scheduling
> -     * thread.  It also ensures that the scheduling thread sees the cleared
> -     * flag before bh->cb has run, and thus will call aio_notify again if
> -     * necessary.
> +     * Synchronizes with qatomic_fetch_or() in aio_bh_enqueue(), ensuring that
> +     * the removal finishes before BH_PENDING is reset.
>        */
>       *flags = qatomic_fetch_and(&bh->flags,

Per this new comment, about the remove finishing first, it would seem that we need 
smp_mb__before_rmw here, because QSLIST_REMOVE_HEAD is not SEQCST.


r~

