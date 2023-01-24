Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B1679829
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:37:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIXT-0004jB-A1; Tue, 24 Jan 2023 07:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKIXQ-0004h6-IM
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:36:32 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKIXO-0001WU-Db
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:36:32 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso11234026wmn.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 04:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/jmj0bm8hbXshSV9bm9+ECE6W+CCCImwewlV3J76MMI=;
 b=Av9GyzZzs6wzKA84oqKrD1tp57t8AWyEaHLFa7HsY2hVBpq/UJe6mrzCk14JJ+HZBZ
 xqzNfqNPZq+qqTyW9roMOOxR6ueLv5rGu9JtesBWnnU7Do19viPJ7J5vRSvhLQkPeiCG
 wZEag397OzYJI9V3lO5TjW8Zizkw31SYTxiy0zcOv5eQ/kCCYp3Md89KgmiCxE6+X+1P
 2HZYOXvhNNiHvGcQSFM1WOW5XU+LC6QYwAudBKYb5/eUfS1s43c+8Urz8htJvaFKJ0Xq
 k+1rb4yppWdLWRkqx5IW7HTnFM6xLW/PmA3U/LdlcgT6hDWqJYjGRDJ6Ot4bc0mg51lK
 PJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/jmj0bm8hbXshSV9bm9+ECE6W+CCCImwewlV3J76MMI=;
 b=n6icUGfRxs1hSlUrrdkaoguFjqoevfvuENc5FV8B95ow4ZHQ7oMJ7Eq4XZ/17JmvmX
 jDev7nDyeGjlbE9mM91H1bjc06wJYmJS3NsdFwRI2f2AzJsNtTjDjV0TXAaubESg1HGs
 FQffDzNjVJYwUbk0uSmvfabHDY90JaCpm3Mpq3za7RGeNyvEJJ3HFi5jv+XQB+etqCYg
 5z7vCxVKpB+zTlKqaAEtd58Px6FLlcMMUwU7cVgslotn6BrvtK87yTR3oMsh/AfH5MIp
 E/beoVzgz5QLFQbqQDUzb/2vbeMmf6oK8vlblGzOLKnbenWqYlUYWIJVtcOQEm4jILvC
 DuUQ==
X-Gm-Message-State: AFqh2kpNm+yvRKFwQe10CevJN4973TYfsFjZ9Bpi6NMxnTKguNb4xctg
 veFLvGcppkGe7+cZ0Z7LqgkL6g==
X-Google-Smtp-Source: AMrXdXv+BLOpPKiFUB0nx12qt3fqrSCvgTALIqSiALO1mWeseImhUTiqbu2oped63tZ8oARLFKv74g==
X-Received: by 2002:a05:600c:3d19:b0:3db:1810:8c9e with SMTP id
 bh25-20020a05600c3d1900b003db18108c9emr23460780wmb.38.1674563788942; 
 Tue, 24 Jan 2023 04:36:28 -0800 (PST)
Received: from [192.168.37.175] (173.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.173]) by smtp.gmail.com with ESMTPSA id
 c3-20020a1c3503000000b003dc0b0e1e47sm2717027wma.48.2023.01.24.04.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 04:36:28 -0800 (PST)
Message-ID: <42b8ea1d-47a1-bcba-20e3-b0dc69343369@linaro.org>
Date: Tue, 24 Jan 2023 13:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] po/meson: make i18n module optional
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org
References: <20230124034632.1268545-1-anton.kochkov@proton.me>
 <Y8/BPOx5Y+5/TKVd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y8/BPOx5Y+5/TKVd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 24/1/23 12:30, Daniel P. Berrangé wrote:
> On Tue, Jan 24, 2023 at 03:47:24AM +0000, Anton Kochkov wrote:
>> This is necessary for Muon build system compatibility and
>> prevents the following error:
> 
> This raises the question of whether we actually want Muon compatibility
> in the first place though. IMHO one of the good benefits of Meson (and
> all other modern build systems), is that application maintainers no
> longer need to worry about portability between the many OS specific
> re-implementations of 'make'. Personally I feel pretty unethusiastic
> at the prospect of going back to that world by adding workarounds for
> incomplete re-implementations of meson.
> 
> What is the compelling reason that users of QEMU need to use the
> imcomplete Muon re-implementation, instead of sticking with official
> Meson releases that QEMU maintainers actually test against on all
> our targetted OS platforms ?

Not really answered the point you raise, but a pair of commits seem
to prove Muon usefulness (by the QEMU maintainer who did the Meson
change!):

   commit eccae02d99dfcf32d5c5db76f59c8f6ba25b5cb0
   Author: Paolo Bonzini <pbonzini@redhat.com>
   Date:   Thu Jul 14 10:43:46 2022 +0200

       meson: remove dead code

       Found with "muon analyze".

   commit e3af71e9009de156665df67b9bdf5bc192aae215
   Author: Paolo Bonzini <pbonzini@redhat.com>
   Date:   Thu Jul 14 10:43:57 2022 +0200

       meson: remove dead assignments

       Found with "muon analyze".

