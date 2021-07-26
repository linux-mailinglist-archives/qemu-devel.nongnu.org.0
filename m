Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E69043D66CB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 20:35:07 +0200 (CEST)
Received: from localhost ([::1]:46590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m85RS-0001jm-Hq
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 14:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m85QO-0000hY-F0
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 14:34:00 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m85QL-0002Ja-45
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 14:34:00 -0400
Received: by mail-pj1-x1035.google.com with SMTP id b6so14102622pji.4
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 11:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cdar4dZ2M5OOVhe0Tv3LgED8iGdbueIMHQpXppNyFwI=;
 b=SJ/+uXxsPNJ0xDiUBfZ/oj4Al7b0p8tqwBewS7Jw5DNZjdfc2g85REwX5AX/R77LhW
 3nyLA+DsXHvDWl2+Sg1BmFc/Nz7Pn7EukGxmbxGgBVJChMvfif2DL99g3NoW5Iy6AmSG
 /PzZt2FAhTpXo/OAnG1kD6Qx/bjJRcErwlMZ6Pli846nUEVCxytnrzc5bPjUSmFxbUSM
 ypwy0Zm7Sy/tMcMtEgeKia1GL/psVAfwMJQedcA69kkbkcPqm0n3e1BIqzwVcW1Ma2BQ
 ElbRHBxtTDJzS2Y4s0pae+4m8P8hGyNPuUnFC4fz8Cv7u2OB6tsrXxLYaZFC/6A9XNN+
 G+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cdar4dZ2M5OOVhe0Tv3LgED8iGdbueIMHQpXppNyFwI=;
 b=eQ1PwzCHy2Yqt8q68LlM4+cW1m0GOlC3HsglGYjzusirH0WcIrI6PKVP6HLnJeJAF7
 6ul95XaAQYwRCRGuylRA6w8oS1NzIZtI9PHn+GO6duRA5TD9ONtTBohUQTxOxEtsf+X3
 sQBIwFccyUo9uL1e0f7TvnJMcNxycnVwvXR579LK4lrFZ2iLVCe+GBiZA/kkGNBG1743
 pjG1GbG6UGmzpttTGOlfDE34/0TtUHJVSq0ccFp2oSndJh7r723ttERvpnRjC3Rpq3zx
 nVO9GWeNcmNEPMeb+gAhf+cD/56YKK3CJpkEcI16G73JJsYUnqQhEUJ+T7dy8xXgA65f
 px1A==
X-Gm-Message-State: AOAM532XcK/93g1O/7unifl1RZ6AyMfeiFp7dXbIz9os+9wZuK273oSu
 CAg43ojw02sq2UIaf7pMo47dXYAFm1vtNw==
X-Google-Smtp-Source: ABdhPJygGKNY91Cp0GCAcEHU5mNSopV9Ua7wPKPQGYO7BjSvGFCtwaoMTLqqBzLGE40GzzYmK+OCMg==
X-Received: by 2002:a17:90b:514:: with SMTP id
 r20mr6103284pjz.80.1627324435559; 
 Mon, 26 Jul 2021 11:33:55 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id j13sm468980pgp.29.2021.07.26.11.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 11:33:55 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] target/arm: Add sve-default-vector-length cpu
 property
To: Andrew Jones <drjones@redhat.com>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <20210723203344.968563-4-richard.henderson@linaro.org>
 <20210726145951.g3ywwhcfstmsi7vi@gator>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df4f3bdc-5110-b321-e173-1a911b7e7c4b@linaro.org>
Date: Mon, 26 Jul 2021 08:33:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726145951.g3ywwhcfstmsi7vi@gator>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 4:59 AM, Andrew Jones wrote:
>> +SVE User-mode Default Vector Length Property
>> +--------------------------------------------
>> +
>> +For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
>> +defined to mirror the Linux kernel parameter file
>> +`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
>> +is in units of bytes and must be between 16 and 8192.
> 
> Hmm. If a user inputs anything greater than 256, then won't it get
> silently reduced to 256?

Yes.

>> +If not specified, the default vector length is 64.
>> +
>> +If the default length is larger than the maximum vector length enabled
>> +with `sve<N>` properties, the actual vector length will be reduced.
> 
> Here it's pointed out that the default may be reduced, but it implies that
> that only happens if an sve<N> property is also given. Won't users wonder
> why they're only getting vectors that are 256 bytes large even when they
> ask for more?

I guess adding that 256 is the maximum length supported by qemu should be sufficient?


r~

