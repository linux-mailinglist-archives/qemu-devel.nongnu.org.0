Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6A49D49D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:38:33 +0100 (CET)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpzs-00023O-95
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCpv3-0006Tc-F3
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:33:33 -0500
Received: from [2607:f8b0:4864:20::62b] (port=35494
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCpuz-0000ZC-Q5
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:33:32 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d18so773669plg.2
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IEAuJUw+/qJq2DwdZPcVqqEaZ7UqaiFDy6xY72lbOLI=;
 b=dhNZv50lhWCrNdHJxXlao35OUlmNHGd1X266Eua1kIqyp8GF8ndgrZjdfVnJiTkHoS
 UT6NXFkezDZMDEcpNbRzTszwqBR6lbhNOgMUmDAGpqVcFIfVJeaHmU/J/EjjWXW0FsN+
 zNPOdm4zqZPbXxYWqGRs54UnoDRus5IK0c1ey+etcwYMN/Oln/g1+XdziuYUyn5yPoRw
 ZW8zyOu/oqPRnTIwQaBcK9KjAsZ+k2kOVPYhuTUjEE3uvvPT6wS41IX4+CItHAQ+dlr4
 ZyjWz4kC7cpqehJCSWWFaCdjZO7goInDyARuIpQKY922Wim4s29SakkmRphz92Pxte6F
 n0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IEAuJUw+/qJq2DwdZPcVqqEaZ7UqaiFDy6xY72lbOLI=;
 b=kDTPwUTVw8YxNlGB21GgNiYDHdt+lQoIwYl1NuYvA+EKKWPTOlg737AKiZDWhQ65dT
 5UuKSkERHvnqvNXT8OwNMuRgM9mLGakTCCKImzjgGW7m3wOdDuhmtf8eQwIpOjp7V3ck
 inFcIMh0kLqFewesMVuS3FrqGyaX8W9pbUj4wI2XYwMw3j1I1jfz4Sgmrr+Uc+gI3U1Z
 gYxikokS9u7EThe5zSNOi5/DS8upZdjZUoaYbWoMWveGoW815dgzu9RsOM7rYR/OXcwC
 aT6CmSTPC7NTxCkEhGxGo+N4CbplvaTd3QgdB+O2fDsjEq2+xmFeU+S0v7Uzc01EotcL
 YWPA==
X-Gm-Message-State: AOAM531q12rAAVT97MbsXNEXtbi7ICBfSvB2EoUWU+QYawdD27UYBm5E
 hV5643DSgK0TJKqGcnewN3CC3g==
X-Google-Smtp-Source: ABdhPJwoEYL6+qA7Gw25kIZq79JndQtIMdmmM+XBU3bM5PuMUuVhPe9+rOT6dbwO7p1SItktNfoJHQ==
X-Received: by 2002:a17:902:d2d1:: with SMTP id
 n17mr362112plc.91.1643232803968; 
 Wed, 26 Jan 2022 13:33:23 -0800 (PST)
Received: from ?IPv6:2001:8003:1d71:4f01:4dac:f487:9ea0:53e8?
 ([2001:8003:1d71:4f01:4dac:f487:9ea0:53e8])
 by smtp.gmail.com with ESMTPSA id d4sm3043171pfj.82.2022.01.26.13.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 13:33:23 -0800 (PST)
Subject: Re: [PATCH v1 21/22] target/i386: use CPU_LOG_INT for IRQ servicing
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-22-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a063cebf-dd68-1ea4-6050-f64f53960163@linaro.org>
Date: Thu, 27 Jan 2022 08:33:15 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220124201608.604599-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, Luke.Craig@ll.mit.edu, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 7:16 AM, Alex Bennée wrote:
> I think these have been wrong since f193c7979c (do not depend on
> thunk.h - more log items). Fix them so as not to confuse other
> debugging.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/i386/tcg/sysemu/seg_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

