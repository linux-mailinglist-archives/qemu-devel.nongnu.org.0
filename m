Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF726F23C5
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 11:06:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psgVb-0003Ug-Kc; Sat, 29 Apr 2023 05:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psgVZ-0003RB-IV
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:04:45 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psgVX-00005o-QA
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:04:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so337023f8f.3
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682759081; x=1685351081;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DDEJPXNpa7BwqWM7ocIRq7pyuDSglyHnZQmlMUk8lBI=;
 b=QR7NgCL96+SZ5Jv5aYhJxsScXs6cAbFaIv/DJIUD+aOcvqZtToCTItcM7E/fwYIOKm
 vq3zHr8onXs41HDynSrrE/kND84+r5jX5rBHRdBzJWhWt/xV08UVBXSP5uKoI8gjScWn
 JsGaheRin8SUcqOuh0vTshjibe7jNJNCuXob3XdB/MlQ5aMY1ylAHZYNflLYUPT8p56a
 kmbmW4VuqYuIvoOEOnSls0VClmZIjSR57cefXuQeDX0Qh+yYX1IhkwnOmdixpSTIHEKJ
 fBajGRQJCRtGgywSAwUvsJnjsGGlIhyUFuGIQY6dKLEN6mAPO5GVE9OpbCsQAsVohS6u
 gMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682759081; x=1685351081;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DDEJPXNpa7BwqWM7ocIRq7pyuDSglyHnZQmlMUk8lBI=;
 b=KHC6am0sTs5+UgxWqNkvdpFPIBAjXTYHSRZorx/yQIdQb19lI15Mp8phzeg5HX8ZQB
 u1wCVGzsTTMYmoQfrXLl3VPC9B271ERO3tOTPhgW53IC5lU4YilXVz56qaOjeSIwguvO
 W+3E5vha1y2whh4jue6ObMEhzhQjQItlqsJvGbEOdw4v5VVBR0vP7UbTrpPimTNcJ+WT
 p6z7udj73FvMKItUh7Q/Zpl2e9bqWyZF68YGgRkglWwyQp4/pIsF5Bn4XFF38xNGL2Ft
 yYUHHjQPM8bb0XG00f+r4zZilUXneUAuT2khNrmESQ69o20WKXoI40vgHoa6yWee/od1
 NUOQ==
X-Gm-Message-State: AC+VfDw1S9GCJHnweaP3wa0gctaVPQ+iQ66mMec4U6ZJmiu0MAfVIqk8
 IvRvEaR6RNBK8Xi8qCRbxmuBuw==
X-Google-Smtp-Source: ACHHUZ6XYlsbHfqxateemR0+23itMGdFubwoslvMr8pokT9nWoP2Tz2o2h6iW+tFHLb9caCGL92b+Q==
X-Received: by 2002:a5d:6805:0:b0:2fd:c43a:b713 with SMTP id
 w5-20020a5d6805000000b002fdc43ab713mr5699390wru.7.1682759081514; 
 Sat, 29 Apr 2023 02:04:41 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 hg7-20020a05600c538700b003f1940fe278sm23205704wmb.7.2023.04.29.02.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 02:04:41 -0700 (PDT)
Message-ID: <5776da45-34cf-a52b-9caf-c0f88cfc657d@linaro.org>
Date: Sat, 29 Apr 2023 10:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/17] QAPI patches patches for 2023-04-28
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20230428102901.1685375-1-armbru@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428102901.1685375-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/28/23 11:28, Markus Armbruster wrote:
> The following changes since commit cc5ee50fff9dbac0aac32cd892a7163c7babcca1:
> 
>    Merge tag 'pull-testing-docs-270423-1' ofhttps://gitlab.com/stsquad/qemu  into staging (2023-04-27 16:46:17 +0100)
> 
> are available in the Git repository at:
> 
>    https://repo.or.cz/qemu/armbru.git  tags/pull-qapi-2023-04-28
> 
> for you to fetch changes up to e2e9e567f0e23971cac35ba1dee7edb51085b5f7:
> 
>    docs/devel/qapi-code-gen: Describe some doc markup pitfalls (2023-04-28 11:48:34 +0200)
> 
> ----------------------------------------------------------------
> QAPI patches patches for 2023-04-28
> 
> ----------------------------------------------------------------
> Markus Armbruster (17):
>        qga/qapi-schema: Tidy up documentation of guest-fsfreeze-status
>        qga/qapi-schema: Fix a misspelled reference
>        qapi: Fix misspelled references
>        qapi: Fix up references to long gone error classes
>        qapi/block-core: Clean up after removal of dirty bitmap @status
>        qapi: @foo should be used to reference, not ``foo``
>        qapi: Tidy up examples
>        qapi: Delete largely misleading "Stability Considerations"
>        qapi: Fix bullet list markup in documentation
>        qapi: Fix unintended definition lists in documentation
>        qga/qapi-schema: Fix member documentation markup
>        qapi: Fix argument documentation markup
>        qapi: Replace ad hoc "since" documentation by member documentation
>        qapi: Fix misspelled section tags in doc comments
>        qapi: Format since information the conventional way: (since X.Y)
>        qapi storage-daemon/qapi: Fix documentation section structure
>        docs/devel/qapi-code-gen: Describe some doc markup pitfalls

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


