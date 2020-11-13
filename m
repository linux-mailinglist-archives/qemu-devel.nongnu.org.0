Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE532B18D2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:13:46 +0100 (CET)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdW5R-0005Dj-Es
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdW3W-0004OX-4q
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:11:46 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:40285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdW3U-0001y2-C8
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:11:45 -0500
Received: by mail-ed1-x541.google.com with SMTP id p93so10028435edd.7
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D3718KrCdKwADXxpYT6OUExFH6MEmkX4SKc+dE5BmJE=;
 b=sDcxpOjbumuE1RE09iySGFYF/gXj26VPSVM3uvUnhdVoYrqFNMZcyWJyAmsdNKyjTm
 0B3Xb9uWZO2dcX6fSXbS/FBWOKJ1qJXuiUgc8/KVEEPfUKPgaVKv/T0FeQ18y93NMD08
 4wMMzXQQ6n7+QEFBfl/Re1logzu4KxHt8dTyjkVkKTORKcTS4EcxcYkcsvHEjA4yyfcb
 osSt3mqkIrfcz67iI0T64FJlDHK54LEH42LgoblLldT2ILM3i/1XEANaM2OWhDmiTP+k
 XeEkrxY27mGG8L/U6upp9fbcyPNmlTzkxDRm9yTBSgqlnZwRas1yeU/frkh9InZWqWEv
 6KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D3718KrCdKwADXxpYT6OUExFH6MEmkX4SKc+dE5BmJE=;
 b=mfiPdxNsHg2Gujy0EV6UfkeZZ+T4Fgj9RONu66je63i5DrJ0JaD4OKzs7boU+FWWE/
 /CsxR0kUArYI+rFvU2i+jBbfb52LNMg+R43JYm5wr/UcETXaF3iA4ZCn2njybL1mzixB
 gdPeXNixSFpjGW5070yf7n1khKqt7H9E/HF/YnHbbBXdpiw1AsvykDj/8LNHr/zOfbuw
 RIAlpduhqfSv+N4WCgPNkC8k0IV/+a8Qtapb3VHsBEzjD2Iltv6GjaWUpIKex4J2T2wn
 fD15GRMiLMpdi/D8nBKHRdRJjCM2AqBkO/YPeyZiCkw5Xdja60/9/ZO9i+7YA9UVZKd8
 WCZw==
X-Gm-Message-State: AOAM530BfyqzGR86AbFHOiCK7nTHbsFdsiEwEQZN03rpyvWIorJPwxja
 1aml1XhiCSr4LH+fL5RVE1bIoPmtAKZNAm1xnoFFPg==
X-Google-Smtp-Source: ABdhPJzarCMwVJuogJbHFDJ0K294UrPdPAjUyWaP9UlrWJ3JsvpOB6a/KhSYz7Up7AOOEC8F1fJsdRGA/cuWZXB6j1c=
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr1732469edt.204.1605262302079; 
 Fri, 13 Nov 2020 02:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20201113095854.67668-1-changbin.du@gmail.com>
In-Reply-To: <20201113095854.67668-1-changbin.du@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 10:11:30 +0000
Message-ID: <CAFEAcA-3A2s3b5+kVPmDfPxG=gypOhD8agrqx0mUYt3gZKbMNg@mail.gmail.com>
Subject: Re: [PATCH] arm/monitor: Add support for 'info tlb' command
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Nov 2020 at 09:59, Changbin Du <changbin.du@gmail.com> wrote:
>
> This adds hmp 'info tlb' command support for the arm platform.
> The limitation is that this only implements a page walker for
> ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
> not supported yet.

"info tlb" needs its own entirely independent implementation
of a page-table walk? I see this is how x86 has done it ,but
it seems like a recipe for the info command being perpetually
behind what we actually implement...

thanks
-- PMM

