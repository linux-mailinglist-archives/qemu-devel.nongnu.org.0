Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C76933CDEB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 07:22:15 +0100 (CET)
Received: from localhost ([::1]:46936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM35q-0006jJ-1s
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 02:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lM33m-00064Y-Am
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 02:20:06 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lM33k-0005Bw-FK
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 02:20:06 -0400
Received: by mail-qk1-x72f.google.com with SMTP id l4so34200375qkl.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 23:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xa8lEQsaui5Bd4Q9zs21cUobprOLGQPxtJNVvsraVnQ=;
 b=T2SP8PdtsW3ltkt5air6Ah5igDXXbdjrAXA+5tiLAt5MxILjXFQMuEcw+FFBd6a9vT
 ikhp6M3B/tjPo1OlJm7vc4TKDklwEhJPP8chPdoPK414+J3Rxr0KdQ1LWnnfzHIvDhMs
 ELIzSck4tkegpyaIXV/vwFK1qBfDbT2hpkbPx/zuJoCQo7H5O5VFbeVu1S+0nLxjSFvb
 Zvyrp4ziAOHa14XdkEzwxteoRvl1FNTf/aiQJnEs4pxV4gnXGXPwn7tyba6EQyMdKw+a
 BVSbZqO+evxFvIADeTaubswuyXROXIXeJkwmlI3/3rObTdJoKXX+LUrHSSjZJcbgZoWo
 lGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xa8lEQsaui5Bd4Q9zs21cUobprOLGQPxtJNVvsraVnQ=;
 b=Hu8WhBivLezauaBatYca+KM6MEdxKh0wqipO2WTqDgj8jcWXZfJx7xJ74FadS8CuJ+
 6XnNaS51wVr7eqas4r6w0O2nfzhuQ03dkMPsaSWHyhI/lXXcd+VZcMcb/gFnJBWPqHSD
 c2BR4pejZDbrDvDd2cXogJFZ33F3pxWOLWXJNOB9q7FYYpgAIl+ab2H5W5y2a4jOs8TM
 6wc5qQtHYn/R1Q4bsV6VhgJWr+Y6ya4mHI51Nlr6ykBMM962t45g+lsNApY+tyAgEfq+
 BeY88cwFzcavw8QWtmBvkuoeQSR1kz3XAcIWnc1/F3f2wKZ5yehyJtfySWZRoi0VNwf4
 necQ==
X-Gm-Message-State: AOAM531Log9U7PojkL+PAKGD/GBJnCmifHfDJt/8JD64XjmYTR/jMTns
 A79H+i3BfjgfmpMUmxA8zmArXUGr4KTELQgZemfMbl40/9P1VYiN3QEusdcDWrCgAXg3L/OATyQ
 UFlSEXnGaDwTgeAlCMkdE8929/dmqiiljQ8v3z1bDorQzcfeQFwktn5w01h9ZfRgqPr/yM+I=
X-Google-Smtp-Source: ABdhPJwaO1uhnLoo7bQE8cL1Vbk+9GvZlqhq1hsKlsWpY0kBDrI0BULG4vnOGXyAnlSOgw7rIngcSA==
X-Received: by 2002:a37:988:: with SMTP id 130mr30406486qkj.120.1615875603279; 
 Mon, 15 Mar 2021 23:20:03 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z24sm13890387qkz.65.2021.03.15.23.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 23:20:02 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <970813ec-f190-6faa-e1d6-763ba3a6ed60@nuviainc.com>
Date: Tue, 16 Mar 2021 00:20:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 12:24 PM, Richard Henderson wrote:
> On 3/9/21 6:29 PM, Rebecca Cran wrote:

>> +    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
> 
> The manual does not explicitly say, but I'm certain that this should be 
> a signed address, when regime_has_2_ranges().  Otherwise it would be 
> impossible to flush a range of kernel addresses.

I see other functions have

uint64_t pageaddr = sextract(value...);

Would that be sufficient here too, or do we need to check 
regime_has_2_ranges()?

-- 
Rebecca Cran

