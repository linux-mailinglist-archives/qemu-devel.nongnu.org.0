Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357A55BC18
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 23:16:24 +0200 (CEST)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5w5n-0005nM-0l
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 17:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5w1K-000416-H6
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 17:11:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o5w1H-0003Me-Ah
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 17:11:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i1so10274763wrb.11
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 14:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/jEdd5mUt3FP4JRvKBdThJ2OhdkiFW8ceRKMcJGFggQ=;
 b=MjnlAeqbBV0T3xiWZQCY84n1w0jLZLTZTmq/eZ/IIcbW7t59muV2n46AUH2nuGgyfv
 2qt22iOMLizM2cpw8bYTXI57o6l11QP5mpW2N9GQJAPiFZmoQOXyaN99cYTqkP8mjT2J
 tq1gBGCYLYKMdC9bsye5Ne6k6WjF0o01auprqOBwdvPku5094O1+yXI3geq+pcGgIO3+
 KS0Y30+7VWOJ7QpUlZ1WpAExLqu5BkPL573eTcbiWTb/tFdDX3g/Wbe+/kJMuLlae/s5
 0Csv1Pe/yXrhCO0OWIXCMJYlwmA6CADpFjOIbR8JSDF+xOSxABND216/39DEB3VI7cNo
 3K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/jEdd5mUt3FP4JRvKBdThJ2OhdkiFW8ceRKMcJGFggQ=;
 b=5c41KoIJLtK/D3g8Wwdi/IgSXu/JuwGJTJqjsWPPFGJCOvxKwWoLgox3HevSMQkCso
 64bIX1jWBggBhLMK6LnshvC4Hur8dHbon4W52EBqJfzP6hRLUjDspMIoW+03o/89P0N+
 PLCVgq9zEhxSpV82lZxK2c1RAj/mWgCRspOaq+hL+vnIrHsTxcuFurFo9U1r6UvZJcWF
 qBo5T6moNvKPIS5gz1dGLi3pme+3mAQL43v9XfgIVwC4ofONABoy29VYh9tRCa0SmDuj
 7ktLW1QKH6AbRpABIfX5T8jPtbnMEibeX7XeKJEYBMxYfw6z8ewaoau+/xwKW1fyBf7+
 qevg==
X-Gm-Message-State: AJIora9OOpQvJ56XBhqpW0LqnHJYcCOIkNdWTTAqAQY0urB1wlxbWbRx
 W2Z5CKQ/pnYPSWOJiKTfLzN36A==
X-Google-Smtp-Source: AGRyM1uKKY1u2DNgeFi3th7v+K6MtM1gzbo5jddjb8GFRXNHNcGLG1B2YBa9s7p5QAXXMZE7lyhFMg==
X-Received: by 2002:adf:f8c8:0:b0:21b:9bfa:c1bd with SMTP id
 f8-20020adff8c8000000b0021b9bfac1bdmr14217930wrq.304.1656364301250; 
 Mon, 27 Jun 2022 14:11:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o6-20020adfcf06000000b0021a34023ca3sm11388315wrj.62.2022.06.27.14.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 14:11:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAD301FFB7;
 Mon, 27 Jun 2022 22:11:39 +0100 (BST)
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: Slowness with multi-thread TCG?
Date: Mon, 27 Jun 2022 22:10:34 +0100
In-reply-to: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
Message-ID: <87y1xhke0k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Frederic Barrat <fbarrat@linux.ibm.com> writes:

> [ Resending as it was meant for the qemu-ppc list ]
>
> Hello,
>
> I've been looking at why our qemu powernv model is so slow when
> booting a compressed linux kernel, using multiple vcpus and
> multi-thread tcg. With only one vcpu, the decompression time of the
> kernel is what it is, but when using multiple vcpus, the decompression
> is actually slower. And worse: it degrades very fast with the number
> of vcpus!
>
> Rough measurement of the decompression time on a x86 laptop with
> multi-thread tcg and using the qemu powernv10 machine:
> 1 vcpu =3D> 15 seconds
> 2 vcpus =3D> 45 seconds
> 4 vcpus =3D> 1 min 30 seconds
>
> Looking in details, when the firmware (skiboot) hands over execution
> to the linux kernel, there's one main thread entering some bootstrap
> code and running the kernel decompression algorithm. All the other
> secondary threads are left spinning in skiboot (1 thread per vpcu). So
> on paper, with multi-thread tcg and assuming the system has enough
> available physical cpus, I would expect the decompression to hog one
> physical cpu and the time needed to be constant, no matter the number
> of vpcus.
>
> All the secondary threads are left spinning in code like this:
>
> 	for (;;) {
> 		if (cpu_check_jobs(cpu))  // reading cpu-local data
> 			break;
> 		if (reconfigure_idle)     // global variable
> 			break;
> 		barrier();
> 	}
>
> The barrier is to force reading the memory with each iteration. It's
> defined as:
>
>   asm volatile("" : : : "memory");
>
>
> Some time later, the main thread in the linux kernel will get the
> secondary threads out of that loop by posting a job.
>
> My first thought was that the translation of that code through tcg was
> somehow causing some abnormally slow behavior, maybe due to some
> non-obvious contention between the threads. However, if I send the
> threads spinning forever with simply:
>
>     for (;;) ;
>
> supposedly removing any contention, then the decompression time is the sa=
me.
>
> Ironically, the behavior seen with single thread tcg is what I would
> expect: 1 thread decompressing in 15 seconds, all the other threads
> spinning for that same amount of time, all sharing the same physical
> cpu, so it all adds up nicely: I see 60 seconds decompression time
> with 4 vcpus (4x15). Which means multi-thread tcg is slower by quite a
> bit. And single thread tcg hogs one physical cpu of the laptop vs. 4
> physical cpus for the slower multi-thread tcg.
>
> Does anybody have an idea of what might happen or have suggestion to
> keep investigating?

Usually it becomes clear when running under "perf record" and then you
can post the top 20 functions in perf report. It's usually some event
that triggers syncronisation between all the threads which is a costly
thing to do.

> Thanks for your help!
>
>   Fred


--=20
Alex Benn=C3=A9e

