Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A73F6369
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:53:40 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZgB-0007ci-Hf
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZS6-0004DB-UL
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:39:06 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:38506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZS5-0005Bf-5u
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:39:06 -0400
Received: by mail-ed1-x531.google.com with SMTP id q3so32661749edt.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RSB9ckUKGuMuZcltOnYYlS6zzjSM3aZQiZh1jDZ+2FA=;
 b=waMvYsbiihA7+ZPuwHEKUz7PlFOfhwSWyJyBt1K8+w+uHnOQ/L1Rzz0bVHlXRKxJBy
 EK/QxZeZyRoa7HdjW2olItgSp/UqLJEfRm/ZVV+YOfUwF06TsWt+ILdUSUROtov5vAJk
 tQkZWl2OrqDJ5wKUooRYkDCPPgr82AsFybljrV57RDFyc6iQWSD33DRCj3GbHEDSPHwL
 sNbgjOMCb5ZABWXEzPQauSmCgshzkbqELE7otcAbcIyVcRLlKJaPDWoSIyFK5kHmVkf7
 Ektxed5MG+b3mYvcQOpmQn6on614gG09HDfFvzlVpFyJxJHQDzIc1qBb7Hx9ZdztxG6o
 ShtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RSB9ckUKGuMuZcltOnYYlS6zzjSM3aZQiZh1jDZ+2FA=;
 b=V/1qQ90fNz4a8ci1JCGdZ+3WxSpLD2j1fw3jZQv9xXlRyYlpr9AkPeGbxSLaxVaqbg
 ew6lAheEy034tQ0nKATSRXl+xKMw06OvIAi0114UBKnmMewXxVYoKNm48gQxCQiRa21B
 K44grspOYMzZu9Q/DniWDOse2R/BCoKXVlDCYvj7R/yFxPKHpYhP2wTjC7sc4gITgOU3
 AHVPIdTTsOFr2kioMiG51evKxBiCFEmDyVO1s0QOkZZ+ZqpVaRRDMFuZJ65mfgF76il6
 eSkNfvBAbUHw2y85cp0f1tFHHjGZrMZNZIasdXuXmQY48tkYjvhqnbduQrRYiL37/hhZ
 uVdA==
X-Gm-Message-State: AOAM531SxtDmjSoYzN8tynbnKylgZFmgjmCjnvpL/pclRHfNsCnWvzJH
 nX9H/px/mr/uJOS82re4rYnOdWL16MctqnPJlE67yQ==
X-Google-Smtp-Source: ABdhPJxwgvXhQtZerxwKoPZ5UwbrfAut2W7R/1ZUm4s0anub/D0S+Ty3aTUA+12IKPwfyV/pBBr6HifDxtdHfelBkV0=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr40406640edw.44.1629823143673; 
 Tue, 24 Aug 2021 09:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-18-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:38:16 +0100
Message-ID: <CAFEAcA8t7bnD=aotNs7VCANLtZtP8FaOUNyy2fAvuDAnuieFFQ@mail.gmail.com>
Subject: Re: [PATCH v2 17/30] linux-user/i386: Split out maybe_handle_vm86_trap
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reduce the number of ifdefs within cpu_loop().
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

