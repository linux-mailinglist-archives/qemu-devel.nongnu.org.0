Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942AC69DD17
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:43:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPAV-0005Ym-Hl; Tue, 21 Feb 2023 04:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUPAS-0005Wr-T6
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:42:36 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUPAR-0004ve-9a
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:42:36 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j2so3518560wrh.9
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e1wgq/+2XhsLWI+30YmiIhg2oiOGO85EyF3V/8S/moc=;
 b=DC3TNbzqhh7keN5MgfWVZrVme5n1LkrKdR0xJSh1iGu3dMyWZn03B0ic/ZzJk5PLPG
 ZWB9/ZMVKwWef8/DF1/pacJZrJ9QDZ5usUMVHvFnt9+Og91e/15XHWTbHG2vjL6IvS8u
 4rsHOSULq9XAYBDUNscEhY5cAbG5i3T3zjjW3nt+X1+eYyrFkrzHvi6C5S4QyS8uephG
 D8ymkkmdQkFHWkHd0uoqlRNUaUOiKE9T/kkirjDTc93bPrRiR8dmJR+vNLeBbIpGsAX7
 0vI1S/yeKNq6lHETmoCYyBui+pmyIfwRoVsBbjjbhbrkB6pTvU3fVDWIwtODyGSqivYQ
 pRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e1wgq/+2XhsLWI+30YmiIhg2oiOGO85EyF3V/8S/moc=;
 b=F7zLZW5wQGxHMaTeYxDTeWUpDm0+4suWXDECWNDyGwWOPHV1ydci1aSvG0XekxAnQt
 g1rpuBEeMQiyuW6z5ghbJE9x9ITF5wbPdIdUsyVWKHLuqsHpWd5YBIfEHcJCta4Wi75m
 2nKcpzMzvQISO1mRz7AeNC7VlgLROF8IdKM76qQyPvobk4FHSi+6pOmLV++VneWAAClf
 7BN/aaukY6mK7Eu5CNCrFyANW5LMCES6Foc7hbLk0kiiVH43uuhL3QNrEUK0wJ+wyDWe
 c205NM+/LQn4vQsVaBs5+BUAQfktyzXzz83viDhA2Ay5fxhBsSa8cNMXemKkzJLDLSOG
 Lmhg==
X-Gm-Message-State: AO0yUKU9S9jhxq6kyjmSQl+jZKrXtdoYSk5nH5T+l5nQoxCEc1vsoRzZ
 D1BUXpbWH7EXC5Mapsv2AR0YLQ==
X-Google-Smtp-Source: AK7set8qf2Ps5fkoFOSzCGGq4FWD3A5Allplzs1+Kl1wV4yGFv6IuHYSXW+Y1FTLI6ipC+sL1f/UuQ==
X-Received: by 2002:a5d:6187:0:b0:2c5:61de:c3e9 with SMTP id
 j7-20020a5d6187000000b002c561dec3e9mr4820956wru.40.1676972553266; 
 Tue, 21 Feb 2023 01:42:33 -0800 (PST)
Received: from [192.168.10.97] ([31.32.81.187])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adffb4f000000b002c55b0e6ef1sm4666758wrs.4.2023.02.21.01.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 01:42:32 -0800 (PST)
Message-ID: <9133d2f1-62f4-d847-b2d9-de73221e3061@linaro.org>
Date: Tue, 21 Feb 2023 10:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] qga/vss-win32: fix warning for clang++-15
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Basil Salman <bsalman@redhat.com>
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
 <20230216134911.6803-4-pierrick.bouvier@linaro.org>
 <7d1224f9-d83a-59f6-8577-f942e399502c@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Language: en-US
In-Reply-To: <7d1224f9-d83a-59f6-8577-f942e399502c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

RG9uZSENCg0KT24gMi8yMC8yMyAyMDozMCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3Jv
dGU6DQo+IEZpeGVzOiA5MTdlYmNiMTcwICgicWdhLXdpbjogRml4IFFHQSBWU1MgUHJvdmlk
ZXIgc2VydmljZSBzdG9wIGZhaWx1cmUiKQ0KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0
aGlldS1EYXVkw6k8cGhpbG1kQGxpbmFyby5vcmc+DQo=

