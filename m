Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878C4391FAA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:51:36 +0200 (CEST)
Received: from localhost ([::1]:45502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llycx-0003SF-Iw
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyaa-0001kQ-UF
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:49:08 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyaW-0000eG-So
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:49:08 -0400
Received: by mail-pj1-x1036.google.com with SMTP id t11so1336482pjm.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kUAAJ/3E7FqNYumNlo/l5qvnAtNEy6nX6cFsekw+imc=;
 b=Gf3nhv6RdMWmEH4eBQH0lnsmXDhqupBCJ3udC7QFPNS+hV10VOewT5Da4OpIoSDeFh
 NdeFB9IRfi0PUIlCdARl0QH3qZxtLgkitAOTXNL3LDz1MY4NCC5Qnpr9Qrv0mFIKrq8o
 9N+/R8WvGYEs4jWUuaIuSJzVWCZ3eBy9Dzfu23V+GjD1W+hh8UhbtzJ0rmeYo6z+SmHJ
 LBNPRbyniqlV3VO4clviw0Bel49O2cPunF8y0AFBaD0TsnZnShweZJjHsmYw9ec/4fAM
 b9vMTBtrylTkZx0NCxmRJ27VLlio5w922XB1eAYmoJRxcY0YWQisCZ0h+Tw9bI3LhlY5
 JaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kUAAJ/3E7FqNYumNlo/l5qvnAtNEy6nX6cFsekw+imc=;
 b=KTqtufKuohBjKzW1/v4STDh1qb1AZLF4RDSmQHK7cFhj14SEmsDn/P7FKEZMzU5Q+7
 YujkR7IsjPTwyvtWbZ9ie3r0r8aO5uETAUcFTaDc7M2wytCbDoWEv1KFRAd101UqiSNv
 RfWC3K+1sP7IsMp7LoHxChX8MpHNlKrjuPaDt+5WkhoryaKQRzW+5kBjWVSiC7Bx+p9E
 g9C+oGy6YT7IJd+j1KVuSY9D7e9/3Ep2ZmN7OLEKH9++QzQ5mTs+OGJ6WIU12eMH1Kpu
 KPlAuMfmcBpn49BXZtbfYw72qx8fYIOE4gwRW3qAGw7zgCHXSyyAavFxcT57lM8i4ibm
 4fsw==
X-Gm-Message-State: AOAM533WN7xrikWH87fCTcMdk9dYY5J0RxK8b1qite1afFKM7wFw6Xny
 WPXn/L1cXoi1iKUPitai+H2vYA==
X-Google-Smtp-Source: ABdhPJzLN1d+ouDD6EWA5YG5g6+ZG2PO/ubhXaUweAcdr+VZ5bzM7lJ4ZKysYDjinuNeCLh3q9iIUg==
X-Received: by 2002:a17:902:e309:b029:f6:49a7:fb97 with SMTP id
 q9-20020a170902e309b02900f649a7fb97mr32632343plc.78.1622054942293; 
 Wed, 26 May 2021 11:49:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w197sm16164634pfc.5.2021.05.26.11.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:49:02 -0700 (PDT)
Subject: Re: [RFC PATCH 03/15] accel/hax: Simplify #ifdef'ry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03b7fb1f-ce54-39a3-09a8-5b9e42fed71f@linaro.org>
Date: Wed, 26 May 2021 11:49:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> -#ifdef NEED_CPU_H
> -
> -#ifdef CONFIG_HAX
> -
> -int hax_enabled(void);
> -
> -#else /* CONFIG_HAX */
> -
> -#define hax_enabled() (0)
> -
> -#endif /* CONFIG_HAX */
> -
> -#endif /* NEED_CPU_H */
> +bool hax_enabled(void);

Similarly with CONFIG_HAX_IS_POSSIBLE.


r~

