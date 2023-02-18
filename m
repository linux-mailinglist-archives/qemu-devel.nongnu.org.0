Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD469B809
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 05:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTEoC-0000Nz-SE; Fri, 17 Feb 2023 23:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTEoA-0000Ne-Ou
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 23:26:46 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTEo9-0000cr-8r
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 23:26:46 -0500
Received: by mail-pl1-x636.google.com with SMTP id o9so107447plk.12
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 20:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yDXgu+LzVItUr6ymCGt9467fm3bRW73QUz+8B4Ljll8=;
 b=TenXUygiIoPWkNKVIeJtqYICqy+hDfLoP9sQaIbouZ16LEyUrwvm/jUh9EA7Cpk2/u
 RArMfhABG8dNPu2t3vkw2WHNkL9TghyAHDauFHfLF5y6/keEfMs2K7ErtMHF9+wOMchI
 Yv7MEUTJ74Svg43tKIPuApj6HoZ/BUKXz1KSBQrczt4fMyqHzFrelTC40EenbMu6Zf7o
 aH41pgENjUrX3H4GInGNafms90yFWt+5V5ZPvTe7lt9CIi3F0vEQHPxntTjLMF49eMh5
 qF5ylJBSNaCxgigfF9pdxX+eR1EpWBdh9Bq+WAwU8deI10ofDzmbKHOwmzUdFi8UE1Am
 RE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yDXgu+LzVItUr6ymCGt9467fm3bRW73QUz+8B4Ljll8=;
 b=oyilhqXo0+cZ0vFxG5x1w8t1FF+QIEF8cqCOWqj4s0eJ3w1wV0VM352HoD/Mijc7Hk
 57rgM7M5d7hBlpxTPUmEgszniVbV1CEnkg3FXX0I5JnH80A6NofT6U0HNRuxiKuHrJCO
 IFnZnDr4CWcYv69RW1CR22/FyHusm+nD0k2sF7nYWyEAjpjIuF+DgClIu0rabLIlbPxd
 /avpl+vCA0oE3vgDC3QgQJ8VF8dPTgJnhK9h0KdsbOEy+EbtvwmiT201U42zAI3tEDH+
 jq/yfhs02EyMlywQ0TJTvyeOFAcOwt5dcWq0v3xwYnf8kKZbF6r19H20ZSXK5mRQPB+U
 7nIQ==
X-Gm-Message-State: AO0yUKWUI7JqKuL1ADbPmzxcj7Rlas5xmYhcLiBew889RxhB35yHWpHS
 KUILS+CHhKRxhmV+Y4yyVoI3Yg==
X-Google-Smtp-Source: AK7set/81z3V56Cs1nbzGENr8RXpagB/nmBewNkkQG2i24GA0lVSZy5qkeL6vZAgkdeMpmMpbtqjdg==
X-Received: by 2002:a17:90b:4c4a:b0:233:b20f:e646 with SMTP id
 np10-20020a17090b4c4a00b00233b20fe646mr4119742pjb.0.1676694403407; 
 Fri, 17 Feb 2023 20:26:43 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 t1-20020a17090a950100b002308e6e645bsm3589500pjo.49.2023.02.17.20.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 20:26:42 -0800 (PST)
Message-ID: <7d0021ce-6992-492c-85c1-9d203a913187@linaro.org>
Date: Fri, 17 Feb 2023 18:26:39 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 16/29] target/arm: Move cortex sysregs into cpu64.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-17-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217201150.22032-17-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/17/23 10:11, Fabiano Rosas wrote:
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index a5191b57e1..b0bc8a3cea 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -1,6 +1,7 @@
>   arm_ss = ss.source_set()
>   arm_ss.add(files(
>     'cpu.c',
> +  'cpu64.c',
>     'debug_helper.c',
>     'gdbstub.c',
>     'helper.c',
> @@ -12,7 +13,6 @@ arm_ss.add(zlib)
>   arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
>   
>   arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
> -  'cpu64.c',
>     'gdbstub64.c',
>   ))

Not keen on this.  I think better something like cortex-regs.c.


r~

