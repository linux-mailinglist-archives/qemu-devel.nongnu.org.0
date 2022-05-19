Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B71052D3F3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:29:16 +0200 (CEST)
Received: from localhost ([::1]:55022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgDK-0006qW-V5
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrgBo-0005C8-2n; Thu, 19 May 2022 09:27:41 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nrgBm-0005Ec-I5; Thu, 19 May 2022 09:27:39 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 t11-20020a17090a6a0b00b001df6f318a8bso8791108pjj.4; 
 Thu, 19 May 2022 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=aAfMhAAVU/jNB46Wq+jQDLgAFRhYtLEWiQlsvJKBnxs=;
 b=D1mc5pOP7O3YSwpfANiDt5auXIaOTcYVA2yQXf5X9l2LmzRhF0b6jAfRBqeuaRdTTC
 mHuyrHvcpXu6HKaIhDTTVp4uS2GBfZeBC3wjPgarJ8j2e9hiEU3xGbovaTQlPMQqMMSB
 lUHhlb8cvXK9myIhVs2ACv4ylq0fzw8ztxvQkOWKtydtztklj4fY/9idMvNjGalXWuZt
 C/POJ0/cZNyL49XIoo5H4sV7D2ZyE24epzGxW3H14GsJZ1haH6/hfW3zzFQf+zzoAhhf
 jAQi4dEJoOo4+/vmGty2ZIssoQu7t83h9RlFF0o4QJ9cOF2xGWukSTQ5weWGEYH33gy1
 NCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=aAfMhAAVU/jNB46Wq+jQDLgAFRhYtLEWiQlsvJKBnxs=;
 b=B9lxL54uV1Pf/CNW3xBSO6ck57MzMAiApDm+1LCQ/RetbCiQQiP7G0shC/p65l+JFm
 9ruPM3ddwns2FRkXxvICMtBgQz+Y4XNz2nOtlJHiW69j0Zxq+in0iJKqcpW7ELn6mucX
 ye3+12qmeybw2WHpNHulQHFrYQQoswgYmqDTzwjgaL3nkk+E497D+SyyKzVY54v7vVN9
 4z06fW9YM5KF2tlBnoIpUk5nZMOl7kFfr4+1xPFLMKerftxkR/tmyFMYG8E0RVQ9MvBc
 7m4NlvX+z7LcoCh5DCI6NyA3BaK1Kh6y4KtGrRlg4SX3WzYt20XRdq4Jv8qXmJ1IM0de
 Ivbw==
X-Gm-Message-State: AOAM530QPzs7I9xCkiyVKm0Ri7VOaKzYMnSvb2ucPF3tmBvweJ2n167R
 2fP0rSRAUu19SJ+gzv5KcXGoDg9BHQPLCg==
X-Google-Smtp-Source: ABdhPJy5Zm4ReuH1rMQDh1IR3MOb/bHSg9vCUau3Ul/1BA4p2mwxHgQJRBkm+B61Juu5ssvTdQwmCA==
X-Received: by 2002:a17:902:d502:b0:161:8e01:b4f1 with SMTP id
 b2-20020a170902d50200b001618e01b4f1mr4837108plg.137.1652966855206; 
 Thu, 19 May 2022 06:27:35 -0700 (PDT)
Received: from localhost ([118.208.131.68]) by smtp.gmail.com with ESMTPSA id
 3-20020a630e43000000b003c14af50626sm3485902pgo.62.2022.05.19.06.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 06:27:34 -0700 (PDT)
Date: Thu, 19 May 2022 23:27:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: g_assert(cpu->halted) in mttcg_cpu_thread_fn()
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Alex =?iso-8859-1?q?Benn=E9e?=
 <alex.bennee@linaro.org>
MIME-Version: 1.0
Message-Id: <1652966220.h07etcvkcs.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I hit this assert in a ppc spapr guest with several CPUs.

There are some paths where cpu1->halted is set to 0 by cpu2, e.g.,=20
h_prod(). AFAIKS this could trigger the assert if another thread raced=20
with the thread that is halting.

Is this just a false positive in the assert, or is our handling of
halted wrong?

Thanks,
Nick

