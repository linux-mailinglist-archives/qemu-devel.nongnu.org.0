Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084338387E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:59:51 +0200 (CEST)
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifen-0000MR-Tq
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lifck-0007I9-A9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:57:42 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:44821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lifci-0006ta-PG
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:57:42 -0400
Received: by mail-vs1-xe35.google.com with SMTP id c21so3353981vso.11
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 08:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/9sOr1ZEvcyyU0w/MpzYh9wF+YHS2pbGW4t2oAXUp5M=;
 b=MvkjwuLOFt3m/x6Z10rFzixTsXRvrgyVgwz3AVVpEccOtbvbMErJwpUyccA2tlsSKn
 kCxXGVdj9FVEgiBWWKQLAeS4H6QiiHLU7vbmzcvpju4DPSHRA7BGrUmJBeDio20QqSNd
 FEJLWMTlf6rVTLxC1csYJHpsLK/v3amuMG1haMoNqaFiRETKPM9AKD+UpPjZYdLTnUiq
 cmnXnXQV1TNHs8cdDdRvAU0iHdcPxHNcV3Zzmgb4gaC3SPq4gAAfy88fJohNqvG+uLrN
 Pg7GiUyT6HBLRGGykBlBIKmFCmsqfi0+RRDBx06pEuL4SpgEdVh17cHYzpR3lTLxZJm7
 KHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/9sOr1ZEvcyyU0w/MpzYh9wF+YHS2pbGW4t2oAXUp5M=;
 b=qlufaGDWBgNLGngwznqBENyIMygJCOm6aK9C9JBylgk5t6HSiu5U5RNMohimwn9L7a
 RYS0DE8J/yPvVmvElBJgnSjc7mT+AULPufoTT24Y5PgQdd7QO89XZdG9Fyjq2k23CGdl
 ogHVFmeXqbN1fqGknls4Ahw7p8ISfrI9GHC2OD8u5R9kgXprTCrX29EWrxmh0rVI0VML
 NhIj8ws3qvVVsgLJuXUI0jCrVEmpvzwJCJdl8jgoFrVL92ebqTd0ktiBTN+PXAK69Rtj
 jZ/G48pA9ucQATVkMLKVBZR3Z7ZuOzGWymnHJNySfYPYfTyvrHAlfy/LYFAz7tpUy2ci
 +/Xg==
X-Gm-Message-State: AOAM532S7T2J7dF6zqtgcibpWLv3U0qzANc7IrWQFv6Ooju2g06+K42l
 0v/DP6WQVPBGhaK7iuSG+RQ5ZQ==
X-Google-Smtp-Source: ABdhPJy/Jv81WKtu4qtSFpgIW8lSmBd9EqBmypBoN89YQUdIP+3TPsU2chQYnNQbfeRed6y9UNt9bA==
X-Received: by 2002:a67:fe54:: with SMTP id m20mr881572vsr.37.1621267059852;
 Mon, 17 May 2021 08:57:39 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id x144sm2338335vkd.42.2021.05.17.08.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 08:57:39 -0700 (PDT)
Subject: Re: [PATCH 50/72] softfloat: Move minmax_flags to
 softfloat-parts.c.inc
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-51-richard.henderson@linaro.org>
 <4a35ce8e-941a-b067-89c3-b655061aeb13@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdcb630e-831f-b2c5-c134-6925623d06f9@linaro.org>
Date: Mon, 17 May 2021 10:57:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4a35ce8e-941a-b067-89c3-b655061aeb13@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe35.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 8:14 AM, David Hildenbrand wrote:
> This patch introduces two issues:
> 
> 1. Comparing two negative numbers is broken. We have to
> invert the a_less result.
> 
> 2. The check "flags & minmax_ismag" is broken because
> "minmax_ismag = 4 | minmax_isnum" and it, therefore,
> also triggers for "flags = minmax_isnum"

Thanks.  I guess I should assume from this that these tests are not enabled, 
and I should fix that as well.


r~

