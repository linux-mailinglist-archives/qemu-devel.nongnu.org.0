Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14793F62A9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:27:08 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZGV-0001O8-VP
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZFF-0007QE-FL
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:25:49 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZFD-0004ua-JE
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:25:48 -0400
Received: by mail-ed1-x534.google.com with SMTP id dm15so7546663edb.10
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QtUtxZ6EcCrdVwqePPxC35xSEMsKvH2/wyroQeD+NKg=;
 b=FlTt3kHWkI5bzQO0HiuAwnilrWHyoxHncMYNzLz1PQ44oIw62qoKEOmJ04U8d0wB9h
 kJQL1I7RPLhGzcDixe+rhcyrzkuhMN25XvM356g586WASzcT5VHgJCM0e5xGUwmRCcdJ
 9yxQZTzgQAGhK3SMm6gZYBLggqnQfbbjZ4WoUxemhlHGCYSh5gNkaTCcHSqHVewVODjE
 rPA6gFIUX3rmsLy9E33b6pqbdJjbtENFECJTPvjKpzZAFToXL/Yn6MKGM+5jJTAye80E
 1wUzQyTFiHlaBZhbgLhdS8LE5T7Nx+WlDOnIRo92/BZbsl1FqU9scRPFlPgzDB71EsOH
 YHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QtUtxZ6EcCrdVwqePPxC35xSEMsKvH2/wyroQeD+NKg=;
 b=FXgUdjbRA9ULLbdOsmAKlWgIW7olQ8UOnO5kQXCIQwLvlOBrvCcBC0PEASyqml4fSV
 3v7FXnXLrbFMa/1JIA7US6iZulOzXePyyJTTkemzTJsFEH67c6fERSj3DKaEQNv9o+Bf
 RUU6fQsJoRgg9NN6OwD076u+KDIJUMA5wDPw6+tT5WWVa5Q9YybiE24vdHfp0t2alOro
 YMYnMeaKQwUcF9BlXAHyluOoC35GVYaW9Ygo8F54oTyrgm43mJWJbXbesAJYMRUEmDj3
 B6jz3AHZZXranM5wL+i2P/XCsfdvCCMhCixNVW7jR2186cyToKZf7u0CMMFTS6bwsreT
 YJeQ==
X-Gm-Message-State: AOAM530wq4zr54QtK9QNHG1/E5vVQpOXcA/HUaC8A+c05j7ePCgl8uSc
 X5UGsc3lKfeH01YlnTSpgsEuG3IXKUoY0xJvvvnusA==
X-Google-Smtp-Source: ABdhPJzaLC3f8NkRVq908PUrqJq6QF+2MctNy9dCpqT+jSX/CLoiYXuOvL/Qlk+0DdWWzmB4wuWudB0Vo0p//YBhJ28=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr40357384edw.44.1629822346169; 
 Tue, 24 Aug 2021 09:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-12-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:24:59 +0100
Message-ID: <CAFEAcA-aUtfmuREmdPid1vdi8_pA03aJEndeJhspp9ioRXqsAw@mail.gmail.com>
Subject: Re: [PATCH v2 11/30] linux-user/alpha: Use force_sig_fault,
 force_sigsegv_code
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

