Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7B368DF6A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:52:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPS8g-0007rt-3E; Tue, 07 Feb 2023 12:52:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPS8b-0007pK-1D
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:52:13 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPS8Z-0007Pc-FR
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:52:12 -0500
Received: by mail-pg1-x52e.google.com with SMTP id n3so5474850pgr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XSJ6C8pkRNg8mkmcCvzgVsMd48AVM2vioBD16Q5gCHQ=;
 b=fMqvW6MZ2QKORv/grUk/y47PIK3jsFcsDCP8yuFhJdLJlJkc0HR9v732wdbCsyFKAB
 K5kFu/S3SV57vpHG0ZuONMVrMZHpYgafxZt6ukxt99IxYHOFpNrPW27fNnGXI9otseHX
 K+Nx3a+5uNrXAjGpkNxvHTvbnx9IfPX28Kg6x/VNSEqCaNdWh+ZGMMrc0dkizSh0vB2W
 vRmQ/fxI5Tu1h3CZrnAudRqtTEIeEJvlvlwX96PKqoePlZXBhESE9f1B/XvjVEGRJj+B
 srezQ+fqBR3daNV4rV0RIrsfUdZ//UvG239CG1OooZCDsaiPVes259vi+5bYvvCvehSR
 J6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XSJ6C8pkRNg8mkmcCvzgVsMd48AVM2vioBD16Q5gCHQ=;
 b=FBvEvSxLShJEOpnB+wwP18c08jpE2Q2a3++aTx1lecTkNelYCnh6vwq8khGlb83Muw
 GV8V0XCOs4JZo5ExJEt0NnR4gonA8dEBPMNhtYb8vpZGOnwzcCc3RpIEM2MGFyPVjq5h
 WEDHtY8aJmQmjLgHAX0E6OsKNcC49Yas82u3HJaJBJSAig9VjyCvfbuJMUFEULzoysMQ
 1KkImOzBLCjMXGEiTc/MChtV1xjdSrlbeZgciauFWJqdgEVqvfP9P2sS2wlc7b4XTIyi
 mi8GhTySQe0gsc9YmotTMUB1anF+LAcki2dHFtqC8NxF8RByJsmL67e5IKOiHC4/OO8L
 DsYg==
X-Gm-Message-State: AO0yUKVQyNKp9utim+l+HE9tvNFl0CdcXpR977xJm2o0K7U4uGuhr4jE
 uMemczvvn2eukCbiGUnqNNQuDLtNuc9gdlowbqaIvA==
X-Google-Smtp-Source: AK7set91JIiGg2bCJF44oK31p7QqTOFBdjkxDcF8LuOAP8FzT4kr34roy47HH/k1U/Xfs6KwpbbdCOdQm4zY/nFgFiM=
X-Received: by 2002:aa7:956c:0:b0:5a7:f2a6:5e1 with SMTP id
 x12-20020aa7956c000000b005a7f2a605e1mr475961pfq.23.1675792330200; Tue, 07 Feb
 2023 09:52:10 -0800 (PST)
MIME-Version: 1.0
References: <167579147730.28776.7263330829354840538-0@git.sr.ht>
In-Reply-To: <167579147730.28776.7263330829354840538-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:51:59 +0000
Message-ID: <CAFEAcA8rBdUs6Ri37KP=hc2ZarRKCTDGq=TxHr6xAhe7KkfU8A@mail.gmail.com>
Subject: Re: [PATCH qemu v4 0/2] ARM: Add support for V8M special registers in
 GDB stub
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
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

On Tue, 7 Feb 2023 at 17:37, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
>
> New in v4: Moved arm_v7m_mrs_control out of the `#ifdef
> CONFIG_USER_ONLY` block, unbreaking the user-only build.  The downside
> is that this function is now taking up space in the user-only binary,
> but it can (presumably?) never be used because there are no user modes
> for v8m cores.  Let me know if you'd prefer for me to wrap `#ifdef
> CONFIG_USER_ONLY` around the v8m registers in the gdb stub.  Also, let
> me know if you'd prefer a separate commit for renaming and moving
> v7m_mrs_control.

We do support the M-profile cores in the linux-user executables,
so this code is "live". The view that the guest program and
the debugger should see is that the core is always in
user mode (aka unprivileged, Thread mode).

thanks
-- PMM

