Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCD34EC62
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:28:31 +0200 (CEST)
Received: from localhost ([::1]:40898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGIA-0003h2-A7
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRGHP-0003Hs-AM
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:27:43 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:43551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRGHN-0002CA-Rk
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:27:43 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso7097693pjh.2
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 08:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EuXVpC2sl/gjOJYCbFSy7nx1IfujSPzhsEQKCQqZ5oE=;
 b=oVGsx1/sptSjO2W4XLWZNQoOTGPxRqK0K1fvQtbsD8IGKW0ih9W+KiVwzvCSv45bJ+
 EsDCe2JS27pXsiqQnpId4Q3RDIoCIwuNTcEQnfi8RytdMxUmpDrJEjqKSIinOnQKD4Di
 ZNJFAYhvgdqLOafIVO86MkBa38qA/uHK70aiYpYR0mF03BKo9xlb1q0oyxWBz4wfhvrw
 VHv+Alq7Gk0A5rHFx8BmWdgxUtFh6K/5X+baNt3wYuLq75aWy5bHLR//tnCjgHL8JJgd
 MV4C2hIgl5ZJzLaMmUme3bM+SCJB13pA2OYqTLyc3nu+8q08Uh2jd3QaQwU3Bu7xl/GN
 qQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EuXVpC2sl/gjOJYCbFSy7nx1IfujSPzhsEQKCQqZ5oE=;
 b=nPZY/i1MN8+o+WQmyI0/aPQTXFDEqnTqF91QGIHWZo1g903jHFpW21TsiLpVgNPErk
 Jf+yPD2ZNTTt8dc1UEqjwj2vxg7KMiQW4PO9XAViaK+iqM0bwM09QCucS2jOittXHhhO
 FwtF/JtUKZXPo+TVxEif9iCjDhfDi8lIcNUSAMTgKSmk4tb+Li/eJjk4V8upjC0rjxjk
 X8v2us6AEmAyfxBzBNE94K9/PqZaQ4kAvXK3mDHqG7LztRX+kohgLJ3H32fhFn2mjy7K
 Wx89rlW6wE6+csR6M8y7XgYMjAhCFaXBd1ecm+FNvcABfLmgTJwLw24YRCuiXUcmeC07
 I+yQ==
X-Gm-Message-State: AOAM531n2ALeMS5/QkEUrA6tWA/FjVRb3xzJ9asa9uiUivHQYH8yIPJt
 TvZMXZC2rSQwCOlTXc4v+Y+A0g==
X-Google-Smtp-Source: ABdhPJwORn5+n8coB9/b8wcjMrsrUWhmfpV5Bbk/kH3wBSkEkNiUzh8azBJ283phN8gbrOJi1ytFpA==
X-Received: by 2002:a17:90b:92:: with SMTP id
 bb18mr4662567pjb.40.1617118060438; 
 Tue, 30 Mar 2021 08:27:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d6sm20843463pfq.109.2021.03.30.08.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:27:39 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] tests/tcg/i386: expand .data sections for system
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5925802c-b462-dcad-7b89-2a1003ab28ac@linaro.org>
Date: Tue, 30 Mar 2021 08:27:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329110303.15235-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 5:03 AM, Alex Bennée wrote:
> Newer compilers might end up putting some data in .data.rel.local
> which was getting skipped resulting in hilarious confusion on some
> tests. Fix that.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/i386/system/kernel.ld | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


