Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73816B2ED2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:43:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paN4x-0002vb-Lr; Thu, 09 Mar 2023 15:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paN4s-0002uq-E5
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:41:31 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paN4q-00071E-Ez
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:41:29 -0500
Received: by mail-pl1-x62c.google.com with SMTP id a2so3310714plm.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678394486;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xbWg0R7JeTUN8Nov/NvIJX2oP2Ceq1o9xKIJUCF9ZuA=;
 b=LXyiwchp79nGeRk2Ska4C4zkrk/8SmaEaJdbe7aRA/t/IQMjGwxvw8zlxLG88V6gNP
 Bg+BLjx+M/gYePrEjJyFXFlUqgMp5hLY0uOC04MQ3nVDIEBdpxKQNE5qlVzE7/ETWsCU
 SolBA/pjMGn4TP6ov+gwsmDjlz/LEYYRA1Z5CyBhSYIuUGdbc3Bgu10djoApBW6Ds2cQ
 CqSqA/LEqw43Jq/KjZcwGymowy52yHDphXTUe/kby2N9nLCZOHnOVBIalOutL5hprAVb
 Gc4HhR1wed/18T3NZPnmfpu8sTZkN+inACkCz6c312cLM+wtFlfa6MeY7fmiwc1y5deU
 S4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678394486;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xbWg0R7JeTUN8Nov/NvIJX2oP2Ceq1o9xKIJUCF9ZuA=;
 b=7EMWQGt/RmXFr2fJvLvMO/Hz0YfwT/NKbYh2+S989WMJ4KsFHzeXMGdRLbKDpaU7/T
 +gSuXPczF29R/s8BgaCfgwO17JwSiedR+qC2gmZXPHCuqNrg04Qx32IgA1X2EPDBKLxJ
 slqWgW+HI6FYDQ9VgHRLQQpQQjrxSg4dno+DN2NIKOuWzqXHIfz7OtiRHknEwa9H1efg
 QImu6fC4N/GnZp6xQVqAejObnG4Yf+YYEFwro2l50pRP/+AT6gRAbuvT4FuczoE2B9ho
 AETqmvCcYfyOLSdK+r95F5B1e+urO48d5cEc7DazM78vtUh2mFUrBDWmtc2VaCpWOdli
 euog==
X-Gm-Message-State: AO0yUKVK8d4td4slbeiqQCi/Uf7Edz8QP+4sS5Zlx94la+fv1g84l7xI
 YqMjBUbXarbVElGDFfc97Fty6A==
X-Google-Smtp-Source: AK7set/5ljSgKNqCf/Bsln9BpJBGXqEbkxa4W1cMRxq+aRWMKyJ+O5PjIK8DRpMlMVL5nJBbHTK0iA==
X-Received: by 2002:a05:6a20:429f:b0:cc:8360:8cd2 with SMTP id
 o31-20020a056a20429f00b000cc83608cd2mr22248428pzj.25.1678394486588; 
 Thu, 09 Mar 2023 12:41:26 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:bf7f:79a0:a976:bdaf?
 ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a63ce51000000b0050336b0b08csm35008pgi.19.2023.03.09.12.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:41:26 -0800 (PST)
Message-ID: <66fc9079-8277-5839-e682-c0fb1851f709@linaro.org>
Date: Thu, 9 Mar 2023 12:41:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 10/11] target/arm: gdbstub: Guard M-profile code with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-11-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230309201434.10831-11-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 3/9/23 12:14, Fabiano Rosas wrote:
> This code is only relevant when TCG is present in the build. If we try
> to build with --disable-tcg we currently get:
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub.c.o: in function
> `m_sysreg_ptr': ../target/arm/gdbstub.c:356: undefined reference to
> `arm_v7m_get_sp_ptr'
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/gdbstub.c | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

