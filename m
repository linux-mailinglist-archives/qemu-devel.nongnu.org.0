Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325B75A57BF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 01:44:02 +0200 (CEST)
Received: from localhost ([::1]:33598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSoQC-00066E-W8
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 19:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSoNi-0004Xj-2K
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:41:26 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSoNg-0003db-7X
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 19:41:25 -0400
Received: by mail-pg1-x52b.google.com with SMTP id c24so9090348pgg.11
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 16:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=W746ASlkcwVN+wQFhXExJktRB+SnUvJJrZA+kehuQmY=;
 b=Wz1o3emLGeZuGUKjMYLUHAi2VagKH7Nepw7PFBcKgq+kcI8iyp3+ms8gfFKw11zTOR
 P9Siay/dVE0repFwThkGMNBceta7y6EyqSUk2kLoL9g6q1o1s+/DnrNfzDhiIAuT+QJX
 2yHmHxUeX6ehWBoqCW2moqkdBh0z5oMdWea4ohLtlXvJtgNFm/gPbGEECNrB/Opvu/0p
 wOEh7YdDqRTcKWnmO9fGJR8QCMLtPO4miSsHF1YESqLDV02kapWSBg/BMCZC4M1d1GLK
 Duut6Kk369hOHJFipCwFDKVmSHZBy+OvJwnrlj+hhwE4e7H0QRpkwZL9E06pD6H0BHOH
 KieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=W746ASlkcwVN+wQFhXExJktRB+SnUvJJrZA+kehuQmY=;
 b=SE9AgG6Si3kbTRX3IwQgiR9EG6gS4B6iU1CNjoyz4JOzB/qP1FtGlVgp7s5au4OsV9
 ZjsRfhRzQRmIKSX0MWpPQVgoOiDOIJNOXyxkZQOuL7C3QqsbpMbA/5PTUTO+9N9VI/7j
 GlvzJypZFD0ZAl8Ykldda5GL/pyYVILStBVYWlHlf6eKO8GtgYsK614ktOhLa/r/W9IZ
 u1lVJpeuJ38K/Zb5YvGz95gAcej08DQamsdn47eLJjFUJ1emtShUIZV/gb3A3fuYZZd1
 V7m3FMAGMg2PgNEPXxzcOJ6ffeFBJ2tlInPnAIrzmB9vRoUkYJofCzuE+lExVGjwfaDy
 msjw==
X-Gm-Message-State: ACgBeo2kPIABXauDUwPbVjfea7nmGa7Kt5h6jnkoQIu8li2XpDOZ4l02
 IG97SxZi+8E8jANf3whY6Wdtbg==
X-Google-Smtp-Source: AA6agR7Tc2WId6FCtfTsjX4Tl69Re/5292GNh9CN7wj1Y6yrsb94N+QtHLArDN3uBymvv2bhPls1Tg==
X-Received: by 2002:a65:63c3:0:b0:42b:5b03:ce57 with SMTP id
 n3-20020a6563c3000000b0042b5b03ce57mr15722429pgv.436.1661816482819; 
 Mon, 29 Aug 2022 16:41:22 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:ecdc:4f14:189e:85b3?
 ([2602:47:d49d:ec01:ecdc:4f14:189e:85b3])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a170902ca0b00b00174f62a14e5sm1758348pld.153.2022.08.29.16.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 16:41:22 -0700 (PDT)
Message-ID: <885ac804-27b5-bf62-d432-a783e99752ac@linaro.org>
Date: Mon, 29 Aug 2022 16:41:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 13/25] gitlab-ci/custom-runners: Disable -static-pie
 for ubuntu-20.04-aarch64
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-14-alex.bennee@linaro.org>
 <5bd08d1d-c590-3542-e66c-f0a4f4ecb69f@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5bd08d1d-c590-3542-e66c-f0a4f4ecb69f@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/29/22 16:16, Philippe Mathieu-Daudé wrote:
> Shouldn't "--extra-cflags='-fno-pie -no-pie'" be handled by the configure script while 
> processing the --disable-pie option?

I think configure just passes b_pie=off to meson, but yes, this could be improved -- 
there's definitely a disconnect somewhere.


r~

