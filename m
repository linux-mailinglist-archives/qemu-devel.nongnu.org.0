Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233534807D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:29:21 +0100 (CET)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Fs-00072p-7M
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8B9-0003Vj-0q
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:24:27 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8B7-0006B4-JC
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:24:26 -0400
Received: by mail-oi1-x231.google.com with SMTP id n8so21776692oie.10
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hRUQCxuixHU5cwXtZPSFUZqi/AONYIO+99OxEoe/qDk=;
 b=wojQWGDOtgRcQQXomqGVuNsqaVHLzdQJxBkd/pHjvSV19dSu4GiI9RC/nBdWDU8cub
 IQhN7B3lwEswwe9hUC6Z2OesJAcn8c9HfE4pwnmFVQFynw2s2+qJuCt84G79TDmUSVlY
 KSaJpblcRw/jqf1Xr8RpoIKg7ikq7zxjEkqdknu3Zcu29L32LD7PjOPQoyxZaLWVNitj
 mJ3zN/8Dqz0snlvKjBUa7cd6/FEChEusiESq415cy1Pikvn93z+ZQAgCCdUCMyIN5YjZ
 Y/7uNVTuCQEq/sdLK1JgLqONtJkvPBnrsOmQUD3snIstSjNj6NxdoGwwpnCkqXdkzP3W
 yd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hRUQCxuixHU5cwXtZPSFUZqi/AONYIO+99OxEoe/qDk=;
 b=jvQ56+HHVkBrJoLvH1U9CrN6cRSmZ2QU3iCU1EuqyUHyrXDM+VW1DIMZSFKXVPSuP4
 SaKzXXbH4V8EQUetGkCRQRC1E1llet0NzSBz0CEsFZ+ZeIEwgi0R7ER+PKkShiFEEpfA
 iK+o1BS5SOg9Zkv5FOsXJXmr6zpvOdpJeLymYLVy/PFuHCW9Q/ckv/d+5tDM/aQn6+2b
 k2Sl55/Pz+Mmrwo7rxnOurQW8HdH/PpIOMbhIZxGQTRmUt79zBR+qo5f3Kz107yaVI9m
 voPuMR/qd1UshgtiRwjd/32OywGZ8EKp7EfrPjDdkD6LfzASUz50tjVTx05t7xrLkY2Y
 8fmA==
X-Gm-Message-State: AOAM5330xIbsANwFjj6PzRHUPg3DJ4gbuy+3eG22i7oTZWGXWoq4s/8q
 qU6BCfQ2sHSVnaEYVYZSVN3V9g==
X-Google-Smtp-Source: ABdhPJysMtIaVu59OPBP4wvuVRxJZqSfo/nzHjtdOexPd/I9Ay3JCX7NdIO6FTeTkAY84MMGMdAxDQ==
X-Received: by 2002:aca:4d8f:: with SMTP id a137mr3256482oib.132.1616610264455; 
 Wed, 24 Mar 2021 11:24:24 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id v30sm717965otb.23.2021.03.24.11.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:24:24 -0700 (PDT)
Subject: Re: [RFC v11 10/55] target/arm: split off cpu-sysemu.c
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-3-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9708e8a3-6f7f-a288-2cf0-2d9132e8ebe7@linaro.org>
Date: Wed, 24 Mar 2021 12:24:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-3-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

On 3/23/21 9:45 AM, Claudio Fontana wrote:
> move work is needed later on to split things into
> tcg-specific portions and kvm-specific portions of this
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/internals.h  |   8 ++-
>   target/arm/cpu-sysemu.c | 105 ++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.c        |  83 -------------------------------
>   target/arm/meson.build  |   1 +
>   4 files changed, 113 insertions(+), 84 deletions(-)
>   create mode 100644 target/arm/cpu-sysemu.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

