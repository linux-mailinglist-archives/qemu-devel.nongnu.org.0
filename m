Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD5B64A305
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:19:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jcp-0007it-GE; Mon, 12 Dec 2022 09:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jcj-0007hO-O0
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:17:41 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jci-0003gY-0C
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:17:41 -0500
Received: by mail-wm1-x32b.google.com with SMTP id v7so5536313wmn.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=nSRu67GqImA4L6PgdWWhDrSlEHNKooPuQKb5X6sO+Pc=;
 b=RUCW3fynvYWVZgurbDty/pfx4CaTNssZo5SY4K1qhxpR8LQT2Ipq0wChCJCbXc1idX
 cw4sOUQnJa7CwSi/xx37vCqRgrt7pg17EARQx9ZEAtmbEYonm296oSFiGLvnREWylpNC
 Z/osaiREYrGwGFuPJzXJH0uLJLHPGvWWsfpTUjpGIs+Dewr5UEjMu2dlkQAAaAHJiy7l
 cyudnZpypeMFnjg7yE5L9PBpC7JRjd3qozxqOuN6Xs+mlX2S9pVws2vSRU7/vKJC5uCi
 m3V8/iILpLDeVyChDL4kYU1wcQHwfJ/pRVJEj+8pws8PWnTd986USPLnTU1LhAOa03mX
 88uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nSRu67GqImA4L6PgdWWhDrSlEHNKooPuQKb5X6sO+Pc=;
 b=oCp+FMXfQFGLJnHLw8gS1kb7camvCAV9FgSwIFWa27cjWN9a7Xb5Gv7EXeG92mgNTt
 x1IZWPXvM+wWzn6Y87XTAOy88NW4MUaukvnnpmoL8wvFpLGd2IpF80slaoqF11GaKfFF
 O8o6rZis7o/g8OlpqwP6nXOIYXqK4+20WnlUpkzHvi4c5dBOUExcWQKE+Q/UwjSAJ9Zm
 kqOjUz/RbsWoMNlKPSbZap6CIDQ9rbnxOcf+xQ2i7aH8MVV0TmG6EVmVDuVg8+1BJBO2
 5+KPRAnyHlI+IT29+R22M+I6fXtVvPlLr84CnakX2cjmt0709b/58s4Y+oNwWZIVWAwi
 LdcA==
X-Gm-Message-State: ANoB5plMiffoLcTKBjcPF/N/Gws/q/cO8t9EeSz35njiJ2p6tc7Z5swN
 y+Wk2bp06AyWzH7l4iQg5uE=
X-Google-Smtp-Source: AA0mqf55D1aE/V5oJ48J4jPQan1R2PsxzI7JttllhzcT5HUhWBZGAYzMY1RJmUcKY5fNXHoi+X4idA==
X-Received: by 2002:a05:600c:34ca:b0:3cf:7624:5f98 with SMTP id
 d10-20020a05600c34ca00b003cf76245f98mr12871859wmq.18.1670854658342; 
 Mon, 12 Dec 2022 06:17:38 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a05600c354a00b003d069fc7372sm10271251wmq.1.2022.12.12.06.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:17:37 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6138b852-084e-a266-a659-14b0c9580d53@xen.org>
Date: Mon, 12 Dec 2022 14:17:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 11/22] i386/xen: implement HYPERCALL_xen_version
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-12-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-12-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:56, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This is just meant to serve as an example on how we can implement
> hypercalls. xen_version specifically since Qemu does all kind of
> feature controllability. So handling that here seems appropriate.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Implement kvm_gva_rw() safely]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/xen.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/target/i386/xen.c b/target/i386/xen.c
> index 708ab908a0..55beed1913 100644
> --- a/target/i386/xen.c
> +++ b/target/i386/xen.c
> @@ -12,9 +12,51 @@
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
>   #include "kvm/kvm_i386.h"
> +#include "exec/address-spaces.h"
>   #include "xen.h"
>   #include "trace.h"
>   
> +#include "standard-headers/xen/version.h"
> +
> +static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
> +                      bool is_write)
> +{
> +    uint8_t *buf = (uint8_t *)_buf;
> +    size_t i = 0, len = 0;
> +    int ret;
> +
> +    for (i = 0; i < sz; i+= len) {
> +        struct kvm_translation tr = {
> +            .linear_address = gva + i,
> +        };
> +
> +        len = TARGET_PAGE_SIZE - (tr.linear_address & ~TARGET_PAGE_MASK);
> +        if (len > sz)

Shouldn't this be (sz - i)?

   Paul


