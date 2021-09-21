Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623641384F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 19:29:58 +0200 (CEST)
Received: from localhost ([::1]:43934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSjaf-0004iO-4s
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 13:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSjXd-0003Im-VI
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 13:26:49 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSjXc-0002RK-F6
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 13:26:49 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k17so130513pff.8
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vMJy34frxm1PqMc6ZakVy/6RRktWJalnOueCQ9NE87I=;
 b=j0iPBKlN94/0wkMMK82cP7Hv50E5Aa79ZuY77ZOXz1I/Vq5qH2nWppYg81JWue54mF
 2wuDpGL/83VctB5ONcPHWB+JyQO1MVK17h6cbOgQKxhDWdVKd1IC3muasmE3d1PhEnD1
 BSEoW8Z3HUEZ60NQId4zr8ULCVtKF3Ba1GFc+KsVhj0q9F31DZzIOIPLaif3MKo8LkJN
 32ViNM/9ESJFzbr/iJjpAT9tAEYhJioc7Bl+1JYWY1ByZ0P9vX2vuJHgnqk/1AjTsZRq
 8dEi8X13YGcU4vb/VeexZlOGCna/BjdtEcteb40OsyvNdxw2sj2NHHsG0KSmLItntGu3
 N+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vMJy34frxm1PqMc6ZakVy/6RRktWJalnOueCQ9NE87I=;
 b=KcHq0H0qMsR0CTkJgzA0tC5d5Vyi0JfnsV+nMTpoqsOpC5I4gy5PbvchzIJIxgWAvO
 KKrUN/lDX5rvOguCXOr749qqifEL19zfyKANrDJA9GPTWRtRuHv/OAiEbh3TKRXgwWX2
 NyWEII79UBUW6dCO+VPOaVIyRHz9EW4Qdbw9DZx77nVI2+HWTaIryy9de9XzcE6ZPRsC
 SKcwC0b9dmJrfuZ52fA7xbkErgDKZ0XRo0LRPblJkIaCiOjUIyz6IwJ1T2f75NkHUxKP
 VP0ZnEjWHlJKCNB9nRFW4YSXq0shShnFskujGFbXxde+KHQOApJVBVfvTIHJ2T5NRJmz
 4UVQ==
X-Gm-Message-State: AOAM533MVu6McqlNO9mrxJT3xV1mILs8cTJOw/+H7krext3FKR4hynQb
 qFQbudlq+MrDXlWH2v5ELfhLA7RLTxhjHg==
X-Google-Smtp-Source: ABdhPJyiShUg2HAVjHlTC0a7VwAVnKbQf6LMJ7swcFLMNxM6jHT3NqvZtIjOaa0osOpf/iF7fE8ZZg==
X-Received: by 2002:a05:6a00:22cd:b0:43c:9b41:e650 with SMTP id
 f13-20020a056a0022cd00b0043c9b41e650mr31194423pfj.60.1632245204027; 
 Tue, 21 Sep 2021 10:26:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w9sm3260796pjk.28.2021.09.21.10.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 10:26:43 -0700 (PDT)
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
To: WANG Xuerui <i.qemu@xen0n.name>, Peter Maydell <peter.maydell@linaro.org>
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
 <CAFEAcA9QPxceBR4hn8FpNbX44y3d28rRmyzrkEABU8dChdBqtw@mail.gmail.com>
 <af8eb7dc-f194-aae8-f3ac-544c88d46e5d@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c397f5a-f6e3-6407-88b3-4afb517761d4@linaro.org>
Date: Tue, 21 Sep 2021 10:26:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <af8eb7dc-f194-aae8-f3ac-544c88d46e5d@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 9:09 AM, WANG Xuerui wrote:
> I think cpu=loongarch64 but ARCH=loongarch should be okay...

Make it easier on yourself and keep them the same.


r~

