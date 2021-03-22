Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F291D34496D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:40:41 +0100 (CET)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMfZ-00080A-0O
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOMeY-0007a1-Kq
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:39:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOMeX-00041t-9V
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:39:38 -0400
Received: by mail-wr1-x432.google.com with SMTP id c8so4708651wrq.11
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3hglditzSVVxP1HLSvD1W4+iYyKnKELxZeF+ucOo6j4=;
 b=b7EQh3tqxvPejGHTjV9W+kS2gJc1HWVMDqqPnmR6oVkpjX+B55ui/5F5nMgahXS20J
 L4zwMq6x5dLH3ejWYwqe3d1QyDvR4JtHS7ervlictbXF50IPAZkEEuI1zTJEXpc8RfUh
 HsljcQqGTXMx98uB6/JeT9vJegrUHm/Crin+Tgp8p2ik9V5lV95bXF4SKMdHtNjWAyu9
 KN4JmVd/wB4ldX7cEEM1bE6pjpOxCWup4eU16q+xdBigSDOrTAk/7Ddxg7T6qYeZiTgO
 AW5Fv8iEAnmD99GfgwemfD1mv6t6NbknE8SQ/NZ7Kk91sHOOSxdSLAw3eLtgh+LNa7sQ
 qSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3hglditzSVVxP1HLSvD1W4+iYyKnKELxZeF+ucOo6j4=;
 b=nAoqAMH4KQKfoJ263n0c4O3nfvHhZOWuHih1my9E8BfhuIuo8KTqgdsznlXLkvaALs
 WVG6nPdggRlNHrsSXzgQBfEj8o5wQzRTBGlTDz0ThXxnasjN18yR6C3sIQ12ig/SiTDN
 41lwHs2S+hscOSwf4a+vgWAYQm8zj3cyjX3cqL3ECMXoO6RIPHmeRDcK4jsXlslhhiFe
 ZuneXFZh8gMAtgTnZ5CCAkFLeMZ9TiVMs/ML7wYvVii3/VPIA34f+7O39DIrM+0yvAdH
 kkzOrmnskV07RgvNEdhvEThZ9yyz/d+Y8j/ksYtDC4MjiMdZET0ue6go9BGktY9lQZfg
 RB6w==
X-Gm-Message-State: AOAM533Tgv/nXcNdI+TMeZO9D+TJkIQx9z/xdojKDYi23requn7q1aKQ
 AfXI60wgKHqmHEMKAVdHUfs=
X-Google-Smtp-Source: ABdhPJwEQPnmf5Y1Tah447OP7b8oHKoHmNbBX2m6MeyrgxKns3Jn5dIXM7SY1z9tSoqrL4xoohbRPw==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr165644wru.218.1616427575681;
 Mon, 22 Mar 2021 08:39:35 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f2sm20434486wrq.34.2021.03.22.08.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 08:39:35 -0700 (PDT)
Subject: Re: [PATCH v3 for-6.0 2/2] tcg: Workaround macOS 11.2 mprotect bug
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210320165720.1813545-1-richard.henderson@linaro.org>
 <20210320165720.1813545-3-richard.henderson@linaro.org>
 <6155888a-e1af-0a47-a669-1bc12c4478fa@amsat.org>
 <7b4307e4-d7ea-f0fa-9d40-8324d37aca5c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ae809747-5b83-40c5-379f-5079eada6dd3@amsat.org>
Date: Mon, 22 Mar 2021 16:39:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7b4307e4-d7ea-f0fa-9d40-8324d37aca5c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 4:00 PM, Richard Henderson wrote:
> On 3/22/21 4:03 AM, Philippe Mathieu-Daudé wrote:
>>> -        rc = qemu_mprotect_none(end, page_size);
>>
>> What about:
>>
>> #ifdef CONFIG_DARWIN
>>
>>             /* ... */
>>             (void)rc;
>> #else
>>
>>> -        g_assert(!rc);
>>
>> #endif
> 
> What does that buy us, really?  It seems like it just clutters the code
> with ifdefs.

No problem.

