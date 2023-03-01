Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE3F6A6C24
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 13:12:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXLJP-0006L6-8X; Wed, 01 Mar 2023 07:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pXLJN-0006KQ-1K
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:11:57 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pXLJL-00058p-2d
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 07:11:56 -0500
Received: by mail-pl1-x631.google.com with SMTP id z2so13708026plf.12
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112; t=1677672713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FBoEKNBx+PVfPaMdXiiUfjN7GfBhaPkm5221w9X5/FA=;
 b=lKR9X29izJzmK6RCsEa1Apki5oq7LVLuKgpDB1IvjD02iRqQR9n4ybojSLl1gmsRs3
 dGqd7vmffnwXDapmNYEjMXRD3rbV8S3QP66eJX8HB80BPwXNsKxPXhWH0XXHz4zljsDh
 eagS/dQLV0P2/YV1Bq4LtQCPay13QQqZaJ0jeUNrq4VHUICCt1QgrtHcYIbOEVqLmHAq
 IRbhK1a+rdIb4ZGx9ZX7gshdIOJqbsI6sPRPS8pfGQ6l6mBkWPjE9d847rbyEWPGFbH+
 XN7OJDGteqJ6VIfbmWq1FaFjrK4wBlULcPocYVg+qVlHuQY6jAY3VWpdcRIVO3X4IbN/
 jdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677672713;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBoEKNBx+PVfPaMdXiiUfjN7GfBhaPkm5221w9X5/FA=;
 b=fNkFyY1PuVaYXT/k4GznpRZFBM/tqS9FzTe5s+OzyzMD8yc48JP1CdtAgaaDMCRrc1
 uB3Dt577HseXarSxJUkWMt4hpU/wxACYLHhRlXn3qYI7PSZQyizir6o9fIKJTi0plDZl
 n3+TbcxcWIlaowl5MUPKibSXNx83txeWcwXpQY9mV1DNXpFU1Bup1sebA6VLcjEB3AYQ
 avR7txA1bXyCBYVC72xeROERRXM1nBET6qA+UUS1srNRKHOH+fN8U9SWb9gfzJAQURg7
 iHeB7mQRVodEDKliANySVoX5wSYqqFvrCAvozx6apgE8AcfI4jwdSgV8viiyPZI5FeXu
 8HgQ==
X-Gm-Message-State: AO0yUKVNR8SG7mxa4QcyYoAwnPUdyADnBSqxy+tJYepv6xmGKCjA9fN/
 4t0JqzrTcwkCOKB7dBmAn69HFg==
X-Google-Smtp-Source: AK7set+LTU54ROM2jytST8LGdl9Hq+x9zyvABMtv52cCAEq8f/8dHJv8Vh6rYco8EhErQuXER3UODA==
X-Received: by 2002:a17:90b:1c0e:b0:236:7270:ddbf with SMTP id
 oc14-20020a17090b1c0e00b002367270ddbfmr7260948pjb.21.1677672713258; 
 Wed, 01 Mar 2023 04:11:53 -0800 (PST)
Received: from localhost ([169.150.203.33]) by smtp.gmail.com with ESMTPSA id
 ay22-20020a17090b031600b00227223c58ecsm7919118pjb.42.2023.03.01.04.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 04:11:52 -0800 (PST)
Date: Wed, 1 Mar 2023 07:11:48 -0500
From: Emilio Cota <cota@braap.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH 00/27] tcg: Simplify temporary usage
Message-ID: <Y/9BBPCJHNCQWTRL@cota-l14>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <Y+Y6Dt03hwfWLd5J@cota-l14>
 <abd9ad4a-d2b7-fd3e-1e67-db9d067bd0c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abd9ad4a-d2b7-fd3e-1e67-db9d067bd0c0@linaro.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::631;
 envelope-from=cota@braap.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Wed, Feb 15, 2023 at 20:15:37 -1000, Richard Henderson wrote:
> On 2/10/23 02:35, Emilio Cota wrote:
> > I ran yesterday linux-user SPEC06 benchmarks from your tcg-life branch.
> > I do see perf regressions for two workloads (sjeng and xalancbmk).
> > With perf(1) I see liveness_pass* are at 0.00%, so I wonder: is it
> > possible that the emitted code isn't quite the same?
> 
> Everything that I checked by hand was the same, but it's possible.
> It's a tedious process.  You'd definitely want to turn off ASR.

I've checked with -jitdump and perf whether there was any difference
in the generated code before vs. after for the most common TBs.
They were identical.

Benchmarking without ASR didn't make a difference, unfortunately.

> My current branch has __attribute__((noreturn)) added to all of the liveness
> passes, so that they don't get folded into tcg_gen_code.  But I still would
> expect 0%.

I'll bisect the series in the next few days see exactly where
the perf regression begins so that at least we know where to look.

Thanks,
		Emilio

