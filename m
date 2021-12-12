Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51385471E5D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 23:53:22 +0100 (CET)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwXib-00005i-0C
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 17:53:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXhO-0007eM-OS
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:52:06 -0500
Received: from [2607:f8b0:4864:20::102e] (port=38689
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXhM-0003bQ-Rt
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:52:06 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so13343309pju.3
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 14:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eaecWj3ClF70OpjfgoNu9V4FG7Yk8ViKZhU2WNXXo7s=;
 b=S+8Qw4r2iso9UTQ+TWhosE79sLU1XB+osJOQHyvdEygMz9nwELnA+TG0TEHwPwnGWL
 B+mm+pDYVUl/qO1wZoKGu9QPL7Z2qTBesNNm8TpJwCOZsVFTpdcsupAUuyC2WhY/NI5q
 rgXgOosudpLJAVOpTdOFumldZsKDUBfYBvZp0pdYRDhx3EKSJjNSD5R8rWQmB+/1GQ2h
 8l9qOmTTrWLIphd5cBxF0YdRKVbaAsjA0LM9uYHCUVbiZnxAvG6+EuboYcFTcmIRsxwh
 L3xlBxf4M+oCLV9p1g5ma508ZfPE+LVLRtR2VTQHwXPsUFATWkm82nk7Sd+L5HGtFJVr
 iHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eaecWj3ClF70OpjfgoNu9V4FG7Yk8ViKZhU2WNXXo7s=;
 b=cgSU9bbs4tqffIO18bftKjL0iWr7OjWIkCm1qxGCxWQV2TkVQtoqJeupXmFTMjV+gE
 e1Be2wBIUrEAGGCScl/EHgGVax3VIqa0QGiyQZB9I+6Y+sq1hzZDw/2+iho5cQEbP9M7
 x1H1pD1CUs4K2IdRr93vmtXvED9dB+c3B4EjkKGETrmvoSeddHOS1BkMwrbAwrf4OAKw
 ql+JV/iF++BsgaV/1YbbA0c/yLffhrQfVXiQjzIh6KvLV4F9EjWi7Yo8pL78uv8XT3Eq
 btNqV+tOw57rP7hdY7sEdhw6y8yFJLxOM2r4NHTdGo6HtOCqlT1CcengjJQ/82BHpSIF
 /eHQ==
X-Gm-Message-State: AOAM533qTrKHiH/YQSg1/Ce/4k6ZH9GHKHVUJR5SZie9kbfebvNNaWA9
 IEp/WG3HIVADF0rxCFpNuiQzow==
X-Google-Smtp-Source: ABdhPJytKZLy+OxrpaR/vSPaYZxatrzuuD62oxGMb6Uwmp/xj5mnaBE/8aXhjnHNHEVraUWzFewBZQ==
X-Received: by 2002:a17:90a:ac08:: with SMTP id
 o8mr40486927pjq.87.1639349523431; 
 Sun, 12 Dec 2021 14:52:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id n16sm4976301pja.46.2021.12.12.14.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 14:52:03 -0800 (PST)
Subject: Re: [PATCH 26/26] hw/intc/arm_gicv3_its: Factor out "find address of
 table entry" code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-27-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8406add7-f2b4-67cd-fd09-e0654ef16570@linaro.org>
Date: Sun, 12 Dec 2021 14:52:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-27-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The ITS has several tables which all share a similar format,
> described by the TableDesc struct: the guest may configure them
> to be a single-level table or a two-level table. Currently we
> open-code the process of finding the table entry in all the
> functions which read or write the device table or the collection
> table. Factor out the "get the address of the table entry"
> logic into a new function, so that the code which needs to
> read or write a table entry only needs to call table_entry_addr()
> and then perform a suitable load or store to that address.
> 
> Note that the error handling is slightly complicated because
> we want to handle two cases differently:
>   * failure to read the L1 table entry should end up causing
>     a command stall, like other kinds of DMA error
>   * an L1 table entry that says there is no L2 table for this
>     index (ie whose valid bit is 0) must result in us treating
>     the table entry as not-valid on read, and discarding
>     writes (this is mandated by the spec)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a worthwhile refactoring on its own, but still more
> so given that GICv4 adds another table in this format.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

