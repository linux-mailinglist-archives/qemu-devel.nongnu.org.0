Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153253890B9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:21:31 +0200 (CEST)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljN4k-0000N5-6m
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljN3M-0007rr-9I
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:20:04 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljN3K-0002UW-LU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:20:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id t206so7420725wmf.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dTh6fkS+Novw6lDk44zfIEkpJJ1WJGv3T8yS7EQJmTM=;
 b=qRI6PX7Oj0+UtHGRo1Q9q87zyn2nsVZ9tbpiitueiYY2reQeYbXPeV/XCk9DyblR6H
 4WmQbBOKpwFQuVrZqxsV4g5EVTm5yqIbWxiahgA9hnK4GBmzm0sByboPZ7C85viIuG53
 Tnuv7D+noeFxZE4f4IdfLeBUpbaDsUQa7+Pp2I0qjBQuJ+o3R0eIiqlziPvhOkcNAZfF
 hGd3SnlsgpTMKOgOLp38iAPtgIgGDjExUG6B2E3CoJMiYiWV2Ebw5MsvFiYELsGWPfUK
 VRuM+AsuWLtQO9vs4vif7/8T+WC6SaCCjBE/tOTL8nD4b0xbCWzb0nQmiChQI4eePlb1
 EUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dTh6fkS+Novw6lDk44zfIEkpJJ1WJGv3T8yS7EQJmTM=;
 b=DP2dHM9n8qh0zFDftKVb47AT3/DPZhwHEbXqqKN9t6LE4dUmwjC7XIoeI0K9bbW37d
 zFHROP9S8mot0IJxyM/78I5wdLpu35UC1c75D/flZ36T5tTbrRMI1KvXN03trbIcmJ62
 kmPZqB3gqyf6+/nAiiIFvTe+veVaVeyS2QYFHwrDgRsDG9Xf24XiRDsxOfrtC/UMbtut
 L5/wKe10hu1wSU1g1Wec6GeeF18KAphvI5K22zBB1QYX3f4vCRike5i/69SXBmU34I4P
 0LybXLscKFYfvOv/gRphUhrTv0Y02h6xYf+8M0DPFPkZ1KQlXo+PzgRUHmbzxbCOziyb
 jZIw==
X-Gm-Message-State: AOAM531hQFq7xlkPwGL2e6VQaWycg9yTt0OSRsaOj0eUtn1mOQH1UnfC
 GIo0dG9VdPjPXaOvdS01o04=
X-Google-Smtp-Source: ABdhPJzVYa/CKg3lYciXDHeQurSo8SP7hT/MJl7zr14EWISUcbkSbb7ag1Ndd1roFYnz12NenAuG7A==
X-Received: by 2002:a1c:3183:: with SMTP id x125mr11356536wmx.80.1621434001224; 
 Wed, 19 May 2021 07:20:01 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f26sm6169943wmj.30.2021.05.19.07.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 07:20:00 -0700 (PDT)
Subject: Re: [PATCH v4] target/xtensa: clean up unaligned access
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20210519104557.16940-1-jcmvbkbc@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4c31e5fd-bbbb-639b-36d7-b2154fe860c8@amsat.org>
Date: Wed, 19 May 2021 16:19:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519104557.16940-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 12:45 PM, Max Filippov wrote:
> Xtensa cores may or may not have hardware support for unaligned memory
> access. Remove TARGET_ALIGNED_ONLY=y from all xtensa configurations and
> pass MO_ALIGN in memory access flags for all operations that would raise
> an exception.
> Simplify use of gen_load_store_alignment by passing access size and
> alignment requirements in single parameter.
> Drop condition from xtensa_cpu_do_unaligned_access and replace it with
> assertion.
> Add a test.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---

Based-on: <20210519104433.16870-1-jcmvbkbc@gmail.com>

>  create mode 100644 tests/tcg/xtensa/test_load_store.S
Except this asm file,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

