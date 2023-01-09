Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE5662C6B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:15:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvjb-00076E-CJ; Mon, 09 Jan 2023 12:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEvjZ-000764-Vo
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:14:53 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEvjX-0004lH-97
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 12:14:53 -0500
Received: by mail-pl1-x636.google.com with SMTP id jl4so10210835plb.8
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 09:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2fo5I4eosm7rw66c76Lpw0km116k98aAnY9C9vvgl/U=;
 b=m0H7aHKgggjAu1wT5OZ7OwSGH5Vb+CHpeBfgzfgSFfjjoU/JLAB7mZTZ6ai3SH7wZs
 VxLzxTq1DUn5khWKLVwkAJKQ23pw6Oxt2FndrrfLpsBeanrEGMtRdMc0K9XaAunCQCYn
 nlCj3ora6LRIoQJCR1x7W9NUkJ/55DbFvJNbf2zxbvTNmErNYE8lfPfY6xKHc3wMAfhl
 f9a2o3KjuTW0Ok0FIu9SvQSJwwJOv+u5oY8gMLjAuBzzAYnFzz10vqVitarGAUgo3+re
 hYeX/fCEF1XRBzDrsqdVLqy2wKsKs1rFG7rvm27TnEFh+L5HJDzc2ixLWmTXrVJy/SC7
 GPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2fo5I4eosm7rw66c76Lpw0km116k98aAnY9C9vvgl/U=;
 b=ypwkOyu2+sNuNreB3GH3VCImHZtgJeW8+Jq3b9Xa4IPTOC1E3Df8hex4WyNB0EooDs
 X6WfDTTFMdDuaJSIJRqOUr4bFKSE3rYv2/m3/moOJxWTrX9aM+y9+ErjIGkUyqvSn0bB
 O53jmJ++0ee7Bcd/BH2OOBEupUqJjW+gR9r8RzY6Gqm+JAo76e1nXK9ZshNGGxA+ksF7
 fpF+Snj/ouAO2gHpWyWcxrj+WlwEZrpNeeVIfzOW6AEuUvkhe6UcYl6fBCJYZhQcH+XS
 L3unkqcXCe6/MZT7YFy4nQhwkNeCd8bUAmdsAwVBIDOHun4Y99XD6WfSJP5nFj5rjnQ7
 nF1w==
X-Gm-Message-State: AFqh2krBpvfn441RVo5tsqysWZmrcoMugpKy0yC9nlTM2edN6K9a4pDr
 xt5Dq2c1fF2EYc9pGQ5qNhfQN1yQtjaRIwCNZt3FVI+PLEQ9lw==
X-Google-Smtp-Source: AMrXdXthySO9HMG032Trj4stJK/s0yp3WwJtGbhLibiEx3zgSvSx5uKa+pobjiCakFC/pqcUBTaiL6hP2nwK8c514D0=
X-Received: by 2002:a17:90a:77c7:b0:219:e2f1:81ad with SMTP id
 e7-20020a17090a77c700b00219e2f181admr5234035pjs.19.1673284489923; Mon, 09 Jan
 2023 09:14:49 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 17:14:38 +0000
Message-ID: <CAFEAcA_C0orpsqaOFHc-eNXySUrDiXsi6zmcRfn3aJy-0c-KQQ@mail.gmail.com>
Subject: QEMU cirrus freebsd 13 CI failing with 'Undefined symbol
 "rl_set_timeout"'
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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

I've just noticed that our (optional) FreeBSD 13 CI job is
failing while running the qemu-iotests, like this:

+ld-elf.so.1: /usr/local/bin/bash: Undefined symbol "rl_set_timeout"

Full job logs from a couple of sample builds:
https://cirrus-ci.com/task/6541458329567232
https://cirrus-ci.com/task/6036627739377664

Any idea what this is about? It looks at first glance like
the bash on the CI system is busted because it can't find
libreadline, but maybe I'm missing something. Are we missing
some runtime shared library from a config file?

(I didn't notice this immediately because our 'make check'
logging is so voluminous that gitlab truncates it, so you
have to click through to the gitlab job log, find the cirrus
URL, then go look at it in Cirrus. We still really need to
trim down the amount of output we're emitting here.)

thanks
-- PMM

