Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DED5EE1BF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:23:41 +0200 (CEST)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZqW-0006dz-JM
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZiS-0000IX-9B
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:15:20 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odZiO-0002Yl-AJ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:15:19 -0400
Received: by mail-pg1-x534.google.com with SMTP id e129so6569083pgc.9
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4Ll5nOkXugfpmndktJ2XIZzXTzpB5b8+X9bdfzJh6DM=;
 b=wbIgwkZxuc0ChLnZ/g75qz57VRxQHGh7cIgIxkDT4I4/Ha4zZImU8PxgiFUXUZMl6D
 YMgY/yCrwX4R3Gpi50QgGYpJNlHc7XN8+uy6+omx0V4dafm3DeTJOyTKqMVFW2raUap3
 JrNL5lg3rGQ4jdTLD5tzTPELCaWIqCc7cSjDP2QC2KpNTkZBksyJAmr889VyqtQC8Dsb
 RyCTbXrgV8N7FOBsC6079ls+9CChdrxO5Y4qNtb8iMCXPMZCw8KYjSGs0c5INTeP6qjF
 95Tbovh+/61j9zGcA+wHe6Ks/1wF1zCsyU7ajF1C9lbu0xJVvC02iv5dUEfWTQGugIQA
 oFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4Ll5nOkXugfpmndktJ2XIZzXTzpB5b8+X9bdfzJh6DM=;
 b=xLL9g3SICEoBaom3kMnJPJ9lq2LHZz+MWBEPquhOeuK2R+YhEvkW+/TL8h6wawP7Jc
 aKk8SFwrph7CWJIYE0WbHWqdyEbywsWxCKw1RwoNYvkHdECB9aOn+b1LEAk3Pf9h/003
 g0UW1Zck9P/IzZzmKu3cUZQKsOdVgeLpAZp9AmqlHN4EPDVJeOIJG3buKaekJV9NeX6H
 V+Qr4CpeZ5qeSWliGsV0KNs7VtW1jUkz9lfyCSgknG3BCSZLnbenaEHrgLEt+BkuGyNt
 /2MWLiaIZzPHisj1DgNSUxP2xxyVfZPy10nfvJCNeJ+47yQYkGXt8CXEOE192KbDGHdi
 +PzA==
X-Gm-Message-State: ACrzQf1ZLSZQgQxw51ze4arMIHomXngA6BfFGHtzfBJR8Hb337rGS5C+
 Sy/XUXOjj0DPsLmNYRz2OwMWnA==
X-Google-Smtp-Source: AMsMyM4PzxbiMctB7g9d8NH2PuCNJ0M+tzOlpIZkLlG8M2/qYpo3ZyHm9Wg90nft3Lo6AJ72KyCz9Q==
X-Received: by 2002:a65:6a05:0:b0:42c:87a0:ea77 with SMTP id
 m5-20020a656a05000000b0042c87a0ea77mr30089751pgu.75.1664381705989; 
 Wed, 28 Sep 2022 09:15:05 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a170902ff0f00b001782aee4881sm2635641plj.153.2022.09.28.09.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:15:05 -0700 (PDT)
Message-ID: <292273b6-2a62-92d9-c3fd-d2a8a790de5c@linaro.org>
Date: Wed, 28 Sep 2022 09:15:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] tests/avocado/machine_aspeed.py: Fix typos on
 buildroot
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220923084803.498337-1-clg@kaod.org>
 <20220923084803.498337-2-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923084803.498337-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/23/22 01:47, Cédric Le Goater wrote:
> Replace 'buidroot' and 'builroot' by 'buildroot'.
> 
> Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using buildroot images")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

