Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4F92D7AA3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:16:06 +0100 (CET)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knl5R-0007Ls-Io
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knl0d-0003Mt-NE
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:11:07 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knl0Y-0006BB-Aq
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:11:07 -0500
Received: by mail-ot1-x342.google.com with SMTP id f16so8636669otl.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XmoXDestb3B3cbvKUcASKMhVQwpa5/1GAKyeY6epvTE=;
 b=P1OKWKKI6yHCI4PBPFrFQxH8oZv/CfpYbIhOsUIxYs9mHdQK4Dx1A/0SXW8jGcGSzn
 VLAMGvRzZL3LWgnDe1Glxu4O3HGbqC5DqIG9AY+tYak1xWQ2gNf50VVnItWaKFPerlgE
 1LfqaBSDpgfIR8DM5851HFC4OuHEJeDRVF4NtHpY/cmA6zudbMqUy+woAFhTdWnmZXfi
 xCxe+Lv8ao5FLESiXq8KdGZKoe4JMPTRqQ3i16pnG8vHY6IoCiCgezKEyp9WaS6bUv6N
 mVVWJgjOnqxYwIrDRvKfIir2SZBspQO052JikyNEbZmAwFYlArnkrgFoQhTZDL/5koPq
 ir0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XmoXDestb3B3cbvKUcASKMhVQwpa5/1GAKyeY6epvTE=;
 b=hxGnH7PGUJLSUoHkIN4EcR9Fm35v8U/NpXb4lZvFEIaDQiU15ySOyBbn3J7efqNiD0
 BInk1jLKVGbhV/z/dBU3JzxY6X4TeYVVjBwOfX7fbabsA6juWigZAmVcfuUe+onxg5zS
 4KnGQPOfMnqW2mJalIZJ3QjO+pnHEhG1I3nR3BLHq81CC8t0E1lwURT3RaXnP9NL3/ku
 CZDibxJ/AGpmlE3YobvcMRQLmGZPSHLO0vRO+labs+rpSSQuEpB/dTC6ALXw1H4wSvgP
 jYQfVfEJ0dgYquDF5+u4r19OdfgYQAY4sAFNFCsKSVYrZirynn/9EBwaGsYqzLjrP0wy
 /rkQ==
X-Gm-Message-State: AOAM531XCRGskgpnFuzH9xwnzIrB/si/Or+zH5XSC2Nf0L/StzLUptI4
 9iezagqMpsN2wEEthZWqmtqvtA==
X-Google-Smtp-Source: ABdhPJz8m2pdJqu8TMFkXdBixoeeUYNDbpVtVVJ0rsJBdQA5ch393D/yyGfoQqxCB7o9HnoWtfR6cw==
X-Received: by 2002:a9d:73d1:: with SMTP id m17mr10189104otk.187.1607703059885; 
 Fri, 11 Dec 2020 08:10:59 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h93sm1908974otb.29.2020.12.11.08.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 08:10:59 -0800 (PST)
Subject: Re: [PATCH v11 08/25] i386: move TCG accel files into tcg/
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201211083143.14350-1-cfontana@suse.de>
 <20201211083143.14350-9-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a119be4d-885c-0212-3461-e6c1bf6cd6ff@linaro.org>
Date: Fri, 11 Dec 2020 10:10:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211083143.14350-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:31 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/i386/{ => tcg}/bpt_helper.c  |  0
>  target/i386/{ => tcg}/cc_helper.c   |  0
>  target/i386/{ => tcg}/excp_helper.c |  0
>  target/i386/{ => tcg}/fpu_helper.c  |  0
>  target/i386/{ => tcg}/int_helper.c  |  0
>  target/i386/{ => tcg}/mem_helper.c  |  0
>  target/i386/{ => tcg}/misc_helper.c |  0
>  target/i386/{ => tcg}/mpx_helper.c  |  0
>  target/i386/{ => tcg}/seg_helper.c  |  0
>  target/i386/{ => tcg}/smm_helper.c  |  0
>  target/i386/{ => tcg}/svm_helper.c  |  0
>  target/i386/{ => tcg}/tcg-stub.c    |  0
>  target/i386/{ => tcg}/translate.c   |  0
>  target/i386/meson.build             | 14 +-------------
>  target/i386/tcg/meson.build         | 13 +++++++++++++
>  15 files changed, 14 insertions(+), 13 deletions(-)
>  rename target/i386/{ => tcg}/bpt_helper.c (100%)
>  rename target/i386/{ => tcg}/cc_helper.c (100%)
>  rename target/i386/{ => tcg}/excp_helper.c (100%)
>  rename target/i386/{ => tcg}/fpu_helper.c (100%)
>  rename target/i386/{ => tcg}/int_helper.c (100%)
>  rename target/i386/{ => tcg}/mem_helper.c (100%)
>  rename target/i386/{ => tcg}/misc_helper.c (100%)
>  rename target/i386/{ => tcg}/mpx_helper.c (100%)
>  rename target/i386/{ => tcg}/seg_helper.c (100%)
>  rename target/i386/{ => tcg}/smm_helper.c (100%)
>  rename target/i386/{ => tcg}/svm_helper.c (100%)
>  rename target/i386/{ => tcg}/tcg-stub.c (100%)
>  rename target/i386/{ => tcg}/translate.c (100%)
>  create mode 100644 target/i386/tcg/meson.build

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


