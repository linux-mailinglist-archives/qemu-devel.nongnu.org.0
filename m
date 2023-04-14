Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174706E2611
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:47:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKhk-0000bV-TM; Fri, 14 Apr 2023 10:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKhj-0000bJ-DI
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:47:11 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKhh-0007hf-V6
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:47:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so9932337wms.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681483627; x=1684075627;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mcfvAEVch0dhU7QvSTjbOX4fD7f+NMXlb2Hqe+gZ6s8=;
 b=Bkes/aubqBZxy0Z8orjJ0on6gFXyrmXk6gzF13UsDdVJ76m25AqEBNmnzoUlp1fO20
 43ZMsmJj2zswC/HoRXVOJANilXmQ/CHbtp684ctvE5orYYXvKUyAI/r9tBpVVZxf8b1Z
 Q7+TzoSAxO2fqB/+FZDfPSnpJBtBsF4Sg+nVq7G2Cn9FXwYRHBzXu/T0/HYEbsQ4Dze0
 nYoefKYwE6ogSrvSpgEIDzGzkGC3fMGHuDZ+KVnhFORUFUWIvAn3avwnrGaonoqlZRiX
 PSqsmaQbvxgHDFy19RchjeYN/2VBnTD0h3oxQtaux1gmory0JomB8Xf+A+nJg6/pVBI5
 OwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681483627; x=1684075627;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mcfvAEVch0dhU7QvSTjbOX4fD7f+NMXlb2Hqe+gZ6s8=;
 b=ec1qZBcjau0UmjGPQzkA19Sx3uSWjJXqHOWma7Sjmv34+asLQNlROeFXz0BZafHVLG
 hczR4RudU930/hmM60+mSFdOrIFn+eFK0qIv/EU1tEhRcdt0LBtowTudQYB/9bSkb1JC
 jZB6JeyoMbmDWEAfiwQI4DjaLKo+/AqDumEcjnbDffm7kQUpztbYc3c1iz+bCPkxxO6Z
 vhrH/W2ikGh7n7usg33Dz5th+MhoJE5Wa1TzpUGXegZZHGF+c4ZRYXAN33Yk+q/rJxoJ
 i5SDVG2t8vsJya7KQuzH4rFDUFdZ3vbmiDeT6dgz+B2Leh4VDD79+ZSPsQVdRbul8s6c
 xZ/g==
X-Gm-Message-State: AAQBX9frsARKrgmgMtCEdTQA433qbDjllPDAg4MDMGAkAiQC0Eg6c0xO
 v+cWomjN8+k2hI2eQhO1swa0xA==
X-Google-Smtp-Source: AKy350Y4+465Fd6nBnxie0CMkjCtkvUQTQFn0/Ce+v1HJ5A7UYY83p7XHAPrHwh5BadNN8vjNrvyJw==
X-Received: by 2002:a05:600c:229a:b0:3ee:9909:acc8 with SMTP id
 26-20020a05600c229a00b003ee9909acc8mr4800676wmf.32.1681483627423; 
 Fri, 14 Apr 2023 07:47:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003ee20b4b2dasm4398989wmc.46.2023.04.14.07.47.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:47:07 -0700 (PDT)
Message-ID: <245ea725-f22a-93ae-bbf8-e894fb7d1e73@linaro.org>
Date: Fri, 14 Apr 2023 16:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 09/40] Fix references to igb Avocado test
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-10-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-10-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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

On 14/4/23 13:37, Akihiko Odaki wrote:
> Fixes: 9f95111474 ("tests/avocado: re-factor igb test to avoid timeouts")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS                                        | 2 +-
>   docs/system/devices/igb.rst                        | 2 +-
>   scripts/ci/org.centos/stream/8/x86_64/test-avocado | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Oops.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


