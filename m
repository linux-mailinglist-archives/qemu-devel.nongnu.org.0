Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5B6631D92
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 10:59:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox3YX-0000Xz-95; Mon, 21 Nov 2022 04:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ox3YV-0000Xi-JV
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 04:57:35 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ox3YT-0006xh-MF
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 04:57:35 -0500
Received: by mail-wr1-x42f.google.com with SMTP id x5so14948601wrt.7
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 01:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pT7XQRECAxix4vRQQKSZOaGUJfofTibIGh1I4LUFnXU=;
 b=BHYqHYekFCj6N/WaQ/8Jsm/zc9ro3OpGcKBtdEZmuX++8aPLe4WE887qzr50+PrQnN
 cY+FI62clWMd5uM0NDt8KzJd07LSHOYX21i40TfBNa1QaGxqKS9tU071TU5rFFkKwh9/
 4QJ6IXfi/+073l3+SGXqgP73TAxTfzm/Vur0d3C6MLRw4d7tSGUorHsW6gfcrH46dsfe
 aJHYGQP3aecUoGt/R1PCdLGg2hznplG3NAUsC70eycAv1N+iwhHdxOp0l0DJ3kAx4lM3
 ly+iokli6eVyUr2gZ8gkTF/hrII35vsk41AnRoYKY4RgSyhwdbuCphzeCf6FeXcmLu2n
 wEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=pT7XQRECAxix4vRQQKSZOaGUJfofTibIGh1I4LUFnXU=;
 b=PpkaVQ4PBqj1lBfg/gQEnjfdy+NviQL476Tp5V37JXICeNTYZltCUtnxvij5T1afIt
 PPoHkt/yIcKAtc2K2R8seyy11tGuk/h12pXyw98eBwVM0LcBTbTkRWn+QoZilH3T1AcT
 w1ZKGjU2FPXHDPj3GEvdaG/vyE2ACfnNt7J8doKxdeSiO7Pk6fJiL0g4y/Kt7YzfTepC
 5x/9GmteNtaNPMtrMOO8CbOILfT+x72Ul/bLmVH5fdYah12LJLSY+Xf9uewJgq1ajIFD
 Hn85fn3FLC+gl6naovaKZz3OhNx5OiqrRHZ5Etw65yDXF605wBFcEjbQ0v7GyFdSe8gU
 iuSA==
X-Gm-Message-State: ANoB5plYJbiUfig53Yj199X/+jli9U4BCkPfg+YoG4BhLRaFh5Ubv0Sd
 Bq/PwAomdTCgL3d+j+BnOkSBdA==
X-Google-Smtp-Source: AA0mqf4E2uuCs4TVYRmT4BE01yljotGboBOmarI2g/545zgCeth0efiTXBH43Sb4RQdD3qqq1/sMWQ==
X-Received: by 2002:a05:6000:1187:b0:22e:3177:1401 with SMTP id
 g7-20020a056000118700b0022e31771401mr10203606wrx.148.1669024650743; 
 Mon, 21 Nov 2022 01:57:30 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm21467599wmo.0.2022.11.21.01.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 01:57:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C1FB21FFB7;
 Mon, 21 Nov 2022 09:57:28 +0000 (GMT)
References: <20221118091858.242569-1-richard.henderson@linaro.org>
 <20221118091858.242569-2-richard.henderson@linaro.org>
 <87k03s75c5.fsf@linaro.org>
 <702c1474-2dd1-1e09-935a-427b97a24652@linaro.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0 1/7] qemu/main-loop: Introduce
 QEMU_IOTHREAD_LOCK_GUARD
Date: Mon, 21 Nov 2022 09:55:55 +0000
In-reply-to: <702c1474-2dd1-1e09-935a-427b97a24652@linaro.org>
Message-ID: <87edtwd3zr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 11/18/22 05:30, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Create a wrapper for locking/unlocking the iothread lock.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>> Cc: Paolo Bonzini <pbonzini@redhat.com> (maintainer:Main loop)
>> You might want to review Paolo's comments from:
>>    Subject: [RFC PATCH] main-loop: introduce WITH_QEMU_IOTHREAD_LOCK
>>    Date: Mon, 24 Oct 2022 18:19:09 +0100
>>    Message-Id: <20221024171909.434818-1-alex.bennee@linaro.org>
>> So it would be worth having the WITH_QEMU_IOTHREAD_LOCK() and
>> MAYBE_WITH_QEMU_IOTHREAD_LOCK() helpers for completeness.
>
> I don't see that (MAYBE_)WITH_QEMU_IOTHREAD_LOCK is particularly
> useful in any of the cases that I converted.

Fair enough - as long as they are easy enough to add later. The WITH_
forms do work nicely to wrap a particular area under lock and make
things visually clear vs the LOCK_GUARD which basically holds the lock
to the end of function or exit.

>
>> And of course the name cleanup.
>
> What name cleanup?

  Also lots of bonus points for finally renaming these functions to
  "*_main_thread" rather than "*_iothread" since, confusingly, iothreads
  (plural) are the only ones that do not and cannot take the "iothread
  lock".

>
>
> r~


--=20
Alex Benn=C3=A9e

