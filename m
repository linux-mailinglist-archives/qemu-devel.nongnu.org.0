Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D33A6FDE6D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 15:24:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwjmz-0006ry-Od; Wed, 10 May 2023 09:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwjmq-0006rE-2q
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:23:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwjmW-0004cc-Mh
 for qemu-devel@nongnu.org; Wed, 10 May 2023 09:23:02 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc22805d3so11047175a12.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683724979; x=1686316979;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BvcUGRmDi6/zImt76Zf/HMgpMB9VfiVMvHuZ6pSLuWc=;
 b=GIqpGSHS79d0J/jFzp4wEUxaHxKytfUp8twvNhqWFyFtl0ltOqkKmSD9gty6cuPu8A
 pNIA0hwexOQYZtcZzKMAUdYbNM5V+TsEyaAM/V7PO3lEUMvDX9Qe/BoAeYguuLIsrUcl
 /Qyyrba2zjgb2Vow22Rj/46N7HIxC6uhu0UdxcQGymuqWmuGNX7tlyLh69jHpXJ3Xkv3
 C+DNfvGxF6ilzo8J+bxbXqWXTIxBosl57TVy4QkKMprmIiFmUzlN+DOeCwG6eIyxDqFv
 bnk1cmuvgX+8iMQV8qVBZlfCVtyfstsDqGoLUH09Z4FYsEQTg0HfB6Xn4XKzn5nOwMxj
 SemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683724979; x=1686316979;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BvcUGRmDi6/zImt76Zf/HMgpMB9VfiVMvHuZ6pSLuWc=;
 b=PbMyQVjNPUUqBPQPBO/tKWJ6ZZTcZVBr0uONdZh0VJUWsZqCbYyQPvMQDoEM7Ew4gF
 u2PSSqpOs7rCLHzhsgD47hUe/9wFaMkmr8w1uEkKDKEtchZCOFqwWdjTpPbStf43YiaC
 mYdgHRla6mWpxUmCmuVS5pLQMdR77aPRu/syZgoWEJMHoNZFb6IKlNuig1VmsrX8o+A/
 6xBcC+BmC3HOjj0BzVI6U3ThZDbDWnab/ZKK9UpnUUBZmDjxKx++/RAbWavAntkA1B7l
 2/DuuDcRZ37/43r4e6GmLTN35WhvAKv1lyzhQdPTx5OftyYYjelUMG8NGzftwmomNPlr
 7+aQ==
X-Gm-Message-State: AC+VfDzqd/D8iKfOcZzp+ZqXE9mLlOh3LUui2gD+nWKsVLtCbgcHNb4F
 8TrdzoX7Uy2Mt6dBKpO8cwMeZy7+nLctaMp8NM8o5yT4EBb59TZ3
X-Google-Smtp-Source: ACHHUZ4fh+UPI5/SqYDdwpqLBRViO5vVTG9efftwsz/MpqJMuDj0jdqmiUqD0FcaPKaXDluQLMzoBEdWckVB3B4PrJM=
X-Received: by 2002:aa7:d6cf:0:b0:508:3f08:ea0f with SMTP id
 x15-20020aa7d6cf000000b005083f08ea0fmr14277844edr.28.1683724979180; Wed, 10
 May 2023 06:22:59 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 May 2023 14:22:39 +0100
Message-ID: <CAFEAcA8SNErngCkt=gsxVSiGXQ0BhQp6y+0fLtBxSmb7-_Ko1Q@mail.gmail.com>
Subject: Avocado not killing QEMU processes on test timeouts
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I was testing 'make check-avocado' on an s390 host, which currently
has a bunch of tests that time out and fail INTERRUPTED because of
various endianness bugs. I found that when the avocado run had
finished, it hadn't cleaned up the various qemu-system-foo
processes that the tests spawned (and so they kept on running
using CPU in the background).

What's the mechanism that's supposed to clean this up? I think
that the top level avocado process should never exit without
making sure all the processes that got spawned have been
killed (with SIGKILL if necessary).

thanks
-- PMM

