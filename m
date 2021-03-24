Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7B6348129
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:03:56 +0100 (CET)
Received: from localhost ([::1]:32978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8nK-0002x3-QB
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Xn-0005YG-8s
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:47:51 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:44934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Xl-0002Ho-Pk
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:47:50 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso24002586oti.11
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q/hPCxfkApMa8HRvEfq82+jq0lFEs6ZIFGKLN3TGGmc=;
 b=WjbI0aUkqj0kqN5xHRzInA9Agb0aYdIrO43lkLO0zWyQu+iSGvHm8GxdNS7GBE8yyN
 v7i6/H9p6MVwiWLBxldOxTlMBXbqWCXuRXrGn7K/rv2Xj0qG9VQC94MqRIimIrsM1VlT
 Jbnm/Zt+jtXeEZyvXiTSYimrn46hFc2NNdP8PVwo5dA+3Mbp/RvrLjAC6gER8OcSWIHV
 RxGBiYRWkJEQr2n/pD5yZ8T+79aRz+LHV+5O7Qy6vKB1mD6sMTu8ZglhXfoumZ8rk1yX
 T4bnZEi78TuivuMoyRec312yFeVrXETFPflGykhGzmFTxXFJS9RP/32wt0m2iMhRrcbs
 y6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q/hPCxfkApMa8HRvEfq82+jq0lFEs6ZIFGKLN3TGGmc=;
 b=TtDOSSnP1IovVZtn0m8zmjOuJt0hf3byoJGFLsazmpK9vRTxa/38NsxAbFmiaQamoz
 nL6EobTUGVirh3Vyn54X24k9Ivid1vHb2Rao2u8QZOZ3WrlwQMtTqRyeGzN4cCvSj6F+
 yD2mTahdJuzwgxh4zOL/esaX33yc0AndNyOjiVaFMzfAV4z2CdD7fsb8JerTSupjMXNA
 CcMHYF7I/FTNH1B8YmuwVfCEF6uOPdRE3+POE6HgS4YyeOZPzF92p59fpdG1F3pbKj7R
 X7W4ofNFUNoM27ZysF0geueKVY8UZ6ENaARQddD/YcBCQlHBe8BUfvn4Gi4M87QJzmXo
 H2Tw==
X-Gm-Message-State: AOAM531T3HeDGw3SUB41oHLQN/qxzrMAEgS1FdgClbGZq5pEB4ojrMFX
 K7nsgdvkdTwSXG/WEsflV9K7pg==
X-Google-Smtp-Source: ABdhPJw+zq2fjIIprgXz2Vhv5ioluJBzBkSDv8VWIJQntkCQVfkflloLsnzhxSWHcfnCV5iNUF8YDQ==
X-Received: by 2002:a9d:921:: with SMTP id 30mr4267864otp.49.1616611668614;
 Wed, 24 Mar 2021 11:47:48 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i15sm693954oou.10.2021.03.24.11.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:47:48 -0700 (PDT)
Subject: Re: [RFC v11 18/55] target/arm: move cpsr_read, cpsr_write to
 cpu_common
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-11-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5dc68761-5e2a-8e63-2e32-559caa2a88c9@linaro.org>
Date: Wed, 24 Mar 2021 12:47:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-11-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> we need as a result to move switch_mode too,
> so we put an implementation into cpu_user and cpu_sysemu.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.h        |   2 +
>   target/arm/cpu-common.c | 192 +++++++++++++++++++++++++++++++++++
>   target/arm/cpu-sysemu.c |  30 ++++++
>   target/arm/cpu-user.c   |  24 +++++
>   target/arm/tcg/helper.c | 220 ----------------------------------------
>   target/arm/meson.build  |   3 +
>   6 files changed, 251 insertions(+), 220 deletions(-)
>   create mode 100644 target/arm/cpu-user.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

