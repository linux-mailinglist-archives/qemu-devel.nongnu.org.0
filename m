Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEAD39C9E4
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 18:34:14 +0200 (CEST)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpZFV-0005bD-LJ
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 12:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZDs-0003up-EK
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:32:32 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZDp-0007a3-Ij
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:32:32 -0400
Received: by mail-pl1-x635.google.com with SMTP id e1so6215173pld.13
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 09:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gG4e7Uh9+IJ15/BlXfh6KJGlCMUHqhEZ3fJEfi6uFqY=;
 b=o5t6RPPo+F2Lm0GOQZKqYa0kwD/gJUycTnvCy3jCthHKqofSRemjH7V4SU03HFoy4m
 eDtW65SCHfIFqC4gMKEL3HQ5xhWCFEvPr5P7EAtTIYxjZUl9UDJ3pgsghe+1QAAXENL2
 tKd+v5DPwA58+F5lOf6dyZKQkgv4GetFkGryZbnUiUw+xxRZCUPkvXUpuqnl3iNauJRk
 lw5UkroEViGc5K077ZU45Z7iXI1UTNSdbXiLY20xqujrAwJieX62/MGthCbDIfo6K38J
 7rsdSB8cyZX0qypN0dM8qaFnZaOcybH6qD0bgip6d/bnkMxf5P3Qu12J2gkrP+6FJ9us
 6Enw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gG4e7Uh9+IJ15/BlXfh6KJGlCMUHqhEZ3fJEfi6uFqY=;
 b=SYQaDiwEZ4naeMO+9rdtIqU4gVjBoTx9pswDBwel/bI3GggyIyYYCQWZw+STggaybw
 D1LHAfaSWXclVNeN/xi0+6+7zOAvpi0giSnOBFTJOn0s2yZIslVHQtabGJgYIjqXZ0nV
 hT1nekF7H1k3rqdGHIlxM5Qtl0I3/qSBAK07Q9rvXDNrjHQE3Z8Sdc5qH6Q76PTu6TiZ
 kFH42qL+mWI6R2viWgTNEgJjF5U62BFcMZJjCq7cf6YnlcZY52JoaRJSHxDe6oIl8xhn
 uh4iQyPhfao/V6v+RjX+JfjD7BLd33CAJqOj/SRDzFokhTD5nk4ZiOJ6i8za5sfL5UJ9
 wfNw==
X-Gm-Message-State: AOAM531stlkwTbz+HzR419gq+lV+Z3vlgITeKHNYHUZL/c/5bFC6Mm4B
 poLgPesAAOEnDzS0wok9FokrmA==
X-Google-Smtp-Source: ABdhPJzaDbTcHf4mMZTidtz11rlPIgPln1X4/ps+cYBs2SqMBHuGQs5af6C8wn6cg67d+XBq4XRznw==
X-Received: by 2002:a17:90a:de07:: with SMTP id
 m7mr23301197pjv.100.1622910748376; 
 Sat, 05 Jun 2021 09:32:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s23sm7248663pjg.15.2021.06.05.09.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 09:32:28 -0700 (PDT)
Subject: Re: [PATCH v16 66/99] tests: do not run qom-test on all machines for
 ARM KVM-only
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-67-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eb4a45cc-8cd8-b5dd-a767-50a4e17d9cd3@linaro.org>
Date: Sat, 5 Jun 2021 09:32:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-67-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> on ARM we currently list and build all machines, even when
> building KVM-only, without TCG.
> 
> Until we fix this (and we only list and build machines that are
> compatible with KVM), only test specifically using the "virt"
> machine in this case.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/qom-test.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

Similarly, qtest_has_accel.

r~

