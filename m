Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D16A98DE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY5kK-0008Tm-82; Fri, 03 Mar 2023 08:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY5k0-0008CQ-QE
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:46:34 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY5jy-0004EE-SG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:46:32 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p6so2768911plf.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 05:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677851189;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hlhv96rxXpfcg8OIWSdPbFQCT1oPSOeXf14jeKTQSi4=;
 b=dk3WLVfUuBTv8PJw+b8BTLvRNq6PT3ZDUCKXTFEbhaSUozTi1bUDu/m9ef0M2kAPlZ
 NoUp4Z0IrcwB5GF+0kZy/5Uy2g9jPjDlukwboigfBds7/iC4lUY1MQOLR2ZODDnR+DC5
 mudQsN55gzJyLsZ0mmyf1wDCP0ggbPeRT41/y1xu/V8nlGfXFYIAAMCdzffmXEQt9gJK
 i9ge5c3crfaXu2+Kal3gJYlxxhA2VkILLZkXFbtoohtFF3SU9T08LM4npFdXh9h6f6b2
 BmD1r0XzhQNGdtkMNJW7qHZOZdzhtl6/q0lWsYPuDmNdB3SpxhRSl8fWqGm5jBEYsHrr
 2XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677851189;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hlhv96rxXpfcg8OIWSdPbFQCT1oPSOeXf14jeKTQSi4=;
 b=BkUIVzK5lcF7x2yNyH3aYhxlTz52Vyqv7Hm8HhoFwCnytprYh/DXGDm/lumXVT4TBV
 3WOJvDnTVIl4FTng8RcpKyjMCzzDN2z/jL4Mpcz0l8vXK8FpqupRt0Lw+eLTs+yo6sY8
 4yBHn+feuMGMOgzzVJDblcZgLG9JnqsTai0AALZgfeILWgegcKt6hEcJoI4fJhjev/bM
 gdyKxeQ0DQWkWq1vTQvqp7cwupkguFW+4wX+k/xHTmAIpp77KtSZ0AxL4Z0qjFID26Nx
 pyL2rr/BcDcAhaG9IlR9eUYxlpJvygCWyZWySUW9Pj7Rb8Ymjc5CYDXOpMZeJNoIPywv
 DqhA==
X-Gm-Message-State: AO0yUKXtl3E1bpbpkgUxI8u9CIdXwOw/ExDFUFNQ6u8uTOyFkFzw4E0K
 prNfPCvJC9eP4GMZsEEmXCg0UA7wVPxrgMeyeal/kw==
X-Google-Smtp-Source: AK7set/c4foH9nhL1ZLpEHkF3FSN8GZlzU6njHw+9pqQSqRi9LqAEbfDP+jtZXcV30L+gF9Wokrlex4FyuCFZKiAdY4=
X-Received: by 2002:a17:90b:f12:b0:237:5834:2808 with SMTP id
 br18-20020a17090b0f1200b0023758342808mr642172pjb.0.1677851189125; Fri, 03 Mar
 2023 05:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20230302123029.153265-1-pbonzini@redhat.com>
 <CAFEAcA98FkO6_buQentxpUK5Zw_5=8NYf0i0R8DymZKmfpFg5g@mail.gmail.com>
 <d0a89b2ae5b601f37cacd5b525d81309597b975d.camel@infradead.org>
In-Reply-To: <d0a89b2ae5b601f37cacd5b525d81309597b975d.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 13:46:17 +0000
Message-ID: <CAFEAcA8LFXmkf3-QHXp5m607WXLn+n5RR5usxiQbAHezF=9m9w@mail.gmail.com>
Subject: Re: [PULL 00/62] i386, misc changes for QEMU 8.0 soft freeze
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62a.google.com
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

On Fri, 3 Mar 2023 at 13:44, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Fri, 2023-03-03 at 11:03 +0000, Peter Maydell wrote:
> >
> > Applied, thanks.
> >
> > Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
> > for any user-visible changes.
>
> Can I have a wiki account 'dwmw2' with which to do so, please?

Per our irc conversation, I've created one for you.

thanks
-- PMM

