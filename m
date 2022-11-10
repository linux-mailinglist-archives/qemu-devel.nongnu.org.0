Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3123623A98
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 04:45:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osyTe-00058I-C9; Wed, 09 Nov 2022 22:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osyTb-00057q-93
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 22:43:39 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osyTY-0003fc-Ot
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 22:43:39 -0500
Received: by mail-pl1-x62a.google.com with SMTP id d20so460942plr.10
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 19:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f/U+jXcrnvblc9DPK9gu7LEVFtN1/S5/pj255KLxNWk=;
 b=dMy/p9mfL+7rdQFZP/2okfUSWuijCQojhNVCIkwVdGC4mdxmqz8KrI4BwLHmaOG5fa
 gPeOoQWa4AHEWjpEkFxvK/E5XnKAXdhpUbuoI9K/pyqYoy830IAnWd04S6fmmz8tCsOQ
 YA13BoPNEuG46gFmouyfIAXrkrdGLmK17DzIs+b4QOty0x0WJs9TT9/Wnv8xZueZgYNv
 tEi4ckrkuOSmcQIhC1gIeSVIH/1wUWbWVYPcEPZLZEvxSwm+7/gyRA+6Wfu9a31Pk6G7
 HDWoIu8ybzPcfBYcrv2svU2QGQ05tmEbZ/OjQrF99EhGcPNjeYzIjKo/zDq56M/5QKfd
 jozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f/U+jXcrnvblc9DPK9gu7LEVFtN1/S5/pj255KLxNWk=;
 b=XxChIXG+bcHclVwihS44e6JLm1M2kC560eWyuxEz2DtVXowAW/MyYZ5kq7cZP5DNtS
 vhBm6D/e/ETOfJnYvE1wciPGDjJ+NfDvs35aEiva8ixYcBV9OWYJDOuI87E9HKqRZgJX
 usPPRJzBWCM+r6abF2bTXZybn4eJl7rrfJWSm8yiPLUhNDvtNrxdpgWVhVESGzEPvgn2
 14buuFh9Jy0wHxCRgGMyobh9WtptYgGMHyK51S+P8JKYE6zP1STtc6DCZfXVGwN5IWsc
 mQAJ3NyRSS9ytAdLHI4C9h5LQPrjQdayD9t01gvYhlD1RrIqkzoKpnmeu3EY289Lcc02
 GHAg==
X-Gm-Message-State: ACrzQf30Y8awZVcEX1U3PtwIRBvLa4wMTIP1tcVRquqfKnr2PojcOavj
 Hy9IgAGh64wy2MyHJdqsEWRyvQ==
X-Google-Smtp-Source: AMsMyM7yQUKov5TJOMNVzrS/rkCAGKa0KMLn76dlRM9TcCDH5LMBveUF1OmEh+pbwzLBX1pirHe0oQ==
X-Received: by 2002:a17:90a:bd04:b0:213:f087:446b with SMTP id
 y4-20020a17090abd0400b00213f087446bmr53523446pjr.122.1668051814356; 
 Wed, 09 Nov 2022 19:43:34 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 w124-20020a623082000000b00560cdb3784bsm9030121pfw.60.2022.11.09.19.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 19:43:33 -0800 (PST)
Message-ID: <43f92886-cb13-3f80-a307-9bb1d9515413@linaro.org>
Date: Thu, 10 Nov 2022 14:43:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] Use a more portable way to enable target specific
 functions
Content-Language: en-US
To: Tom Stellard <tstellar@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20221109220307.226283-1-tstellar@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109220307.226283-1-tstellar@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/10/22 09:03, Tom Stellard wrote:
> This adds function attributes for avx2, sse2, etc. specialized
> functions.  These attributes are supported by both clang and gcc and
> are necessary in order to build the code with clang.  The existing gcc
> specific pragmas were left in place due to a comment in
> utils/bufferiszero.c which mentions the pragmas are needed before headers
> to work around a bug in gcc <= 4.8.

GCC 4.8 is now below our minimum, surely.
We should be able to simply replace the pragma with the attribute.


r~

