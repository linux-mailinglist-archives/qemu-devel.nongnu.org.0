Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3F30674E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:56:30 +0100 (CET)
Received: from localhost ([::1]:38588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4tjg-0003WA-UL
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgreenaway@google.com>)
 id 1l4tiS-0002z4-3Y
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:55:12 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dgreenaway@google.com>)
 id 1l4tiL-0002sk-96
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:55:11 -0500
Received: by mail-ed1-x529.google.com with SMTP id c2so4417813edr.11
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EezcKOm4qwtQaLEdmCws0tPBu7UMv1rYyn5daq+boFA=;
 b=pJv/94t/lywgLR7xHowiJDhLlzyKfu8cvUt9eRWoC/TnJVoGsEMVLsm/Mei0ozSwDs
 OzuQhSJylGfbVgDj5ZwAIGGAzuyVN25bm5GtpwBP4SoA6VZR7bOouhEDUV895XSPldem
 xQ9hJVR+MqDdAymGSSVqcHZVpKeIZipatD104uBRCaUze896dbX8PIazRUZ0lVwWTzXw
 2c6+NHryFmicKMBVgsy7RL2P4Vsdid37UYxJZs23yBmNMMJsn9x82mj1a46yMX0nEzIY
 uY4aIESKvq5iFLVEATHQLKw2uVf+33UDZYDR4GolFpyr2cropaah+u9vIAOFaduoa1qn
 LS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EezcKOm4qwtQaLEdmCws0tPBu7UMv1rYyn5daq+boFA=;
 b=gCxyIQf7k0YKe6DM9MDsXgyFe97x/BjUFvWtuOYJop+vG8lBYvdfk9Pq49KAiIU1Yq
 n2fsaMO3F051IFmZnM4txWFhGRuCzl06Wmml0LOaZ4oTWTcHXdrI5VdIDY3W+Jynlyd2
 l+b5kVYX7vQ27IgIOGOzyFaZKESIqF/SbB8gfAVTcShy1212Kpt4+gGHNqulCnJYF8XC
 pUeUA/0DQKGIt8LTkRePIBRllX+qCnyoDSYPWxqaFzyAYk3lTDVKdEYLhN2npskQ4cpt
 4Fr4e6uIt9YPrG25XIafxOFu0nprdTzzIi3dDrVGn+bOSQ3zXQyDgBWd4BtkBxaPAqsp
 jsPQ==
X-Gm-Message-State: AOAM53329S2PA7owCKQVtNvbDUpqG4N/MN80jEFGUgKdNyXOZ0TqhauW
 3LQqBoQvkLRg3tUvKWnHC+5vX519egSN8twSF0pdxSTvqn00xQ==
X-Google-Smtp-Source: ABdhPJzQp0E6k9TqqJUALQhlsKIQLyqsNlsHhC2PRFF+lApb9o/dSniID2XXz3Ga/5R7Dqpq1nBz6q6FRTQPEN4ZE/0=
X-Received: by 2002:a50:acc1:: with SMTP id x59mr11089306edc.43.1611788101466; 
 Wed, 27 Jan 2021 14:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20210114063958.1508050-1-dgreenaway@google.com>
In-Reply-To: <20210114063958.1508050-1-dgreenaway@google.com>
From: David Greenaway <dgreenaway@google.com>
Date: Thu, 28 Jan 2021 09:54:35 +1100
Message-ID: <CAPs2x8=H+mMgnRWPO5WxS9z8ZvbVr3hPaGFqHjaPQDc+0ASG1A@mail.gmail.com>
Subject: Re: [PATCH] target/i386: Fix decoding of certain BMI instructions
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=dgreenaway@google.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14 Jan 2021, David Greenaway <dgreenaway@google.com> wrote:
> This patch fixes a translation bug for a subset of x86 BMI instructions
> such as the following: [...]

Gentle ping.

The patch is up at:

https://patchwork.kernel.org/project/qemu-devel/patch/20210114063958.1508050-1-dgreenaway@google.com/

if that helps.

Cheers,
David

