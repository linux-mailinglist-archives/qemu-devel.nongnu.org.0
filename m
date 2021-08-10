Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806853E86A2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 01:41:51 +0200 (CEST)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDbNW-0002Ix-J9
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 19:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDbLs-0001WO-0c
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 19:40:08 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:39480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDbLp-0004bG-8B
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 19:40:07 -0400
Received: by mail-pl1-x634.google.com with SMTP id l11so215852plk.6
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 16:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eEe3RKzOGtvMMmIwPOb7yYSgUnv6/A2D2u2IyJrNpCE=;
 b=P+b5dLm3R8Dml8osDyA0xS5bh9vAHZJOESbZ9KWGTP4y3KoHsIaBaW27NfB6NQUzRU
 dlDGXlydjaaTzic9epKE1YhtYRiIZoJXLQl9Je7MgX/xQonXQV32D1SgazAEtsGXCw7f
 wZBMuG0jeek6AdDpAvBK6IRP37PhvZZOe2EeojQgqIyNLyQnPaAPiq2cjhQnwPS7BcE8
 w8DdQKasTSZdwWoPNjyCLvgbVcZWqgOFEdt+QDgrTWoXZyzkM3pLUMuTYwduewl4bN9Y
 8TIBiPzDyVxJFFV29sXr+6O/q3+M4u2DyR5wfU8DoMS2rF8wpRnVTcENskodDFZx2uuy
 9beA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eEe3RKzOGtvMMmIwPOb7yYSgUnv6/A2D2u2IyJrNpCE=;
 b=ZDhWlxHpeUtbuqfK//1Yx/c0ytGiIxFBt6M8YzTgF1ooSdwfff5XUt34DPvbFoUPdB
 7EggC9ulu8acveGDfVqb4PSqlexp0+ojxUUIu0+S95B1RLUSd8/QHZAJA4QWu1YKmhPw
 7kBx6weht0PsER757GJcWt7m+arB0/kGd7gsNPTcgHRvZz+eBhPJJSedMY39BYY/FQ0T
 Wb/KF8hoVs0MDz4eM/O4WFDcHxhOwXmLF9akXSbb/CKktCFJYHL8Mn37OCNGLdToPI0h
 vqROtffBdmPXvSDBdrrvafsTui4+PonnLWO3imelKfYzwnx96iGSusJZGm9YVyHNpjg7
 AKcw==
X-Gm-Message-State: AOAM530CIYKuXHyyv9btTajFMn2wpT18c2bm+5C7Nfkj1pWgmJOQatH1
 Snkf1eDeCMyjiXefDtP8J4No4w==
X-Google-Smtp-Source: ABdhPJywXuGtPm6rxSP7lkJz2akm/ZmXtytycPz1FYz+EFHUTKNlDhx12ECM0IstG4yAQZ8Bqup3mw==
X-Received: by 2002:a17:902:da82:b029:12d:640e:ed4d with SMTP id
 j2-20020a170902da82b029012d640eed4dmr617022plx.56.1628638803672; 
 Tue, 10 Aug 2021 16:40:03 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id t8sm4337095pja.41.2021.08.10.16.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 16:40:02 -0700 (PDT)
Subject: Re: [PATCH for 6.2 39/49] bsd-user: Need to reset CPU after creation.
To: Warner Losh <imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-40-imp@bsdimp.com>
 <4614b70d-4950-6689-82cc-66b743329889@linaro.org>
 <CANCZdfp4uZVyKU46cTF8QD1P82xRqKuVdPDnQYteEvXLN2ptag@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <294a0492-c645-36cb-7a6e-8a24e72a96d1@linaro.org>
Date: Tue, 10 Aug 2021 13:39:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfp4uZVyKU46cTF8QD1P82xRqKuVdPDnQYteEvXLN2ptag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 12:40 PM, Warner Losh wrote:
>     Slightly amusing that the line was removed in patch 1, because it was ifdefed.
> 
> Worth folding?

Might as well.


r~

