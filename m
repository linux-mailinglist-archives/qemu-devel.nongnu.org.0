Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD15B96B1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 10:54:06 +0200 (CEST)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYkdI-00072W-ND
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 04:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkQQ-0008FS-Ep
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:40:46 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:46592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYkQL-0008Ut-Kv
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 04:40:46 -0400
Received: by mail-il1-x132.google.com with SMTP id l6so9304182ilk.13
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 01:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=yF7qBdUjIQdwa3COgoYp4O3WBol8PWDAWuaa8XLKE8I=;
 b=hRHIhHe/HBVKZFGahzE1JpSSN1oxaKb65lmotOohPEIrWgy2jcIaPo5iLly4yxywTX
 qFGAmGucM3rXAPhGXUI4F7cIUu7X5jYogv4o5zQCNTzzllaVV6CrHUUCOVbFsjzb1DtC
 Yb140lAYSIP+YApYh8lswJDAbqzWYKXVHXyk/K4wLcYWB0v7V9IOQf5OExA85T9cmxpP
 9RmKKut5UXufndhJa5+Usk/qlKf+F/zQgNJKO/W2XNkeixD7vrr7hH6hmCArBiZfRu0a
 91KIiYU9HWVcX8pYbxAh67ubXdDOrsTdWhMXIoYUEn9d0dMney2xKTaVcFgut2lCOM46
 06Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=yF7qBdUjIQdwa3COgoYp4O3WBol8PWDAWuaa8XLKE8I=;
 b=vhqQZ18vckPne8hNLm91v867cvnlPPh2UhY6uHZCCLyTYwvbM7EWPMZvNMmgZgQYQH
 RpyDBWc0pTk6lNjQCA2uaLg5jZfptm/RiK3tVnN26UuQW5uYCuW84TMjM2qma3EJKUJh
 stj/8rHBPOpwobVd/myt5y+rit3Uo9LgoTud3+QwMQRckf+Yzv0fyVr+YWOC36VLRupZ
 rCMeHwWbpdRPtbQKfYAvqa2nXc21h/y8igXOa5EGfesa31VRcErc8tdEh2Txu191C9xT
 pySREStV/FPBAhnItI7a9o+/V+ndkg0Y2XsC3Nigfk6DsfrBE7Y2gslPE77t42g4ckVP
 xIEQ==
X-Gm-Message-State: ACgBeo0UNaBy7PE4e+BncP+MV2jnafcUCQgEfBNOamGV5dlfyKWSmBI/
 Fby53RBxsN6MSOVGssx1lb3uwQ==
X-Google-Smtp-Source: AA6agR7NShPYDLINvxxZ2gkD/092F+Jy5qJDYzRUbpJjda3NuGaTiryAEiXEZPB2CNxyxcuWE14QUA==
X-Received: by 2002:a05:6e02:164d:b0:2f1:9b43:9157 with SMTP id
 v13-20020a056e02164d00b002f19b439157mr16922367ilu.94.1663231240291; 
 Thu, 15 Sep 2022 01:40:40 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf?
 ([2605:ef80:80c3:3064:7ddf:d6a7:e3e2:a0bf])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a02b0da000000b0034c15d1269fsm828333jah.100.2022.09.15.01.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 01:40:39 -0700 (PDT)
Message-ID: <e7c77bbe-9433-ffd0-8352-50d0cb045319@linaro.org>
Date: Thu, 15 Sep 2022 09:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 28/30] tests/docker: update and flatten debian-toolchain
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220914155950.804707-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x132.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.583, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/14/22 16:59, Alex Bennée wrote:
> -FROM qemu/debian10
> +FROM docker.io/library/debian:bullseye-slim

I'd rather you be consistent about debian-11 instead of codename.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

