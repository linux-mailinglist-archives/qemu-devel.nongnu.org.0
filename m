Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F7C307207
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:53:49 +0100 (CET)
Received: from localhost ([::1]:37990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l533k-0008SO-Um
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52gM-0004QG-EZ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:29:38 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52gK-0007Mh-Lg
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:29:38 -0500
Received: by mail-pj1-x1036.google.com with SMTP id lw17so4401730pjb.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LRy2lLVc4NMsTqe41EfewxI0H/jmCDanwydmY6YZPYM=;
 b=B1Hiwk/wBziCJj/00aBDLEAQynu5NTA7q8WO4eek4V0LQxZLg+UuG/pRuzRYLdwXWo
 xfqHZJIEevviF2PPTE1htXntYv9eVx1z12G4xisDqHM3ZQ42xhNYX+NcLdBpcwjM75CV
 hZFmBRWP0YavIR3aUodZbaAznIcTjIDEmWr7n5M15QUyJUj0PR1WWVKaEdRZfpfV58VQ
 0aJxwqvzIs624xygfKOVgj8WsakIlEdn855jIjOjZFg1dpEH/SayLeI8OcHdHeBh1/fA
 iIPrS8bBBclIpKK3HhQv53qqMkqo7mFk3ZTCn/fFq9Yk7fAl31jj9tdXhR0cTjXYjttt
 Y5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LRy2lLVc4NMsTqe41EfewxI0H/jmCDanwydmY6YZPYM=;
 b=iTyJRP/6mNUcUdpUKqTzpcDzd1f/5KuBAcmGuYqN8mUzks7TlwaudM8HYSPDj8Sj98
 f0yYApwpPOjwvwUXLo8hFL5a8Spzk+PgnqxGE7R9zJF+wHaUk4XUOT2C5k4BD5R3zZGa
 S2xkd4vttgqgIXQuCa7izQVAkjIYVQ4ddbQWGRHBeQfYLw58m5Ho1CSfiRAxUD8eL1bd
 dxVsvlJ4dVAfe9mNGFYShSBmrmoews2f/8F1QZr3Cuq+NENSvwK2yd52dbbc4lU4Xnmv
 Z2XN4RzyheEVdkMJb9kUOr6z7WrJ8Qho+eEP6UznlFRopuYPUcp4SDhqETuYQwHh6eh7
 XAaw==
X-Gm-Message-State: AOAM533niFY6uTxzUQL0rYUkdsrMz4Hu/jCXOG6CI5ic10Smtvq+KyYr
 D2WfOMSVOrj+vFHQ7QiwDFB8cw==
X-Google-Smtp-Source: ABdhPJy5Hd8MXQLfQ0oeiNJM6rSMow1+/zJMkFDhpTVdMgtEMup4DNmD8OgJZrZw5TbV++Yamt9BxA==
X-Received: by 2002:a17:90a:1042:: with SMTP id
 y2mr10088104pjd.204.1611822575083; 
 Thu, 28 Jan 2021 00:29:35 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id o190sm1521054pgo.50.2021.01.28.00.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 00:29:34 -0800 (PST)
Subject: Re: qemu user mode fails to run programs with large VM / built with
 address sanitizer (was: Re: [PATCH v4 4/4] meson: Warn when TCI is selected
 but TCG backend is available)
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
 <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
 <bbe4adfe-5bed-c37f-78c6-b120cb192aae@linaro.org>
 <a8aaa601-dcb4-ed87-d7ba-f6362942b596@weilnetz.de>
 <87wnvyw3eh.fsf@linaro.org>
 <d265dadc-45e8-3813-4e2d-cde007c389ac@weilnetz.de>
 <87tur2vyif.fsf@linaro.org>
 <7615aa95-79b1-45d3-f998-6ba3f2f33f35@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <defbdb94-8571-bd6f-588c-1b7d31864d7b@linaro.org>
Date: Wed, 27 Jan 2021 22:29:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7615aa95-79b1-45d3-f998-6ba3f2f33f35@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 8:51 PM, Stefan Weil wrote:
> The problem occurred with a locally built tesseract, but I now found that it is
> more general.
> 
> Any program which was compiled with address sanitizer uses huge virtual memory
> (TB) right at the start. QEMU user mode tries to allocate that memory until it
> is killed by the Linux kernel OOM handler.

Yes, we have an open bug for that.  It is not a trivial problem.

https://bugs.launchpad.net/qemu/+bug/1898011


r~

