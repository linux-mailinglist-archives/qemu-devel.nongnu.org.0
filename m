Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0536F5C0E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 18:32:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFNo-00064r-0b; Wed, 03 May 2023 12:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1puFNm-00062h-Fx
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:31:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1puFNk-0002ii-FK
 for qemu-devel@nongnu.org; Wed, 03 May 2023 12:31:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso33763065e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683131467; x=1685723467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UuGHsehsGI6Es291zJSGyeFgIQ370eU/4ENt0MxEVT0=;
 b=kk8FPAsm422dYeCg85xPvdQEKho092eu/UH780JUE6+PC14rw4RdyDBmS7miVU8zkB
 dYaQAyJfGyvgp+SQ+VttdMlMVw1oqQ1tDAW4q7+1ogIYoVqyRL4FrB+bLMYPQ4E3seVg
 48H0xVUr4RUHniWtazbgPn8ofx/zXxMTr7Q5ELlZc9xQHhcN2KIjAVLbK1pXDQVz6yym
 FnMKgZvenSM6gf34udJzeAf8x+ctjLSyQOeSXK6F5NQ+IIX2e/+VaBGl27sM3HT6ew3y
 kxpHu3U2ZTk1X6BPznkjrB30DwQKdqVBBhRoyib7BiBO8MgcLJovmwRgv/E/nJ8M4bnT
 bpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683131467; x=1685723467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuGHsehsGI6Es291zJSGyeFgIQ370eU/4ENt0MxEVT0=;
 b=KzNSxm5Gq6i2Ai1W1yO7rYKn4T5szBcuLc0LfXa93FWZtJWYTUOeY2RhoOvxHaIZbf
 McBK5ubdQI0EnWOLz7ZQau08b3hevbU9H8oDSJFf5GJpBoP+u6qBGxlee5ZH8CH0n4j7
 GMif6TchjjsWlzPZ8i17LC9HhYsZ9whYuPDKujpTtiaLE3NKN+opcWG41iHd9pbEV1Xi
 tf6oKBb57VKZd01COKWcMyOdZt8ywSkN3evsEDrXUyNx1kOMidbc6otuQXutQnyOfy8i
 Xfh6hdyHvRohOrY6kXlk80p4nv85OjmLNdX57T2LTwg5RUrGcdidact4iYV9jKq5cjyw
 PYEQ==
X-Gm-Message-State: AC+VfDybgUs2jfdQXeohtsq+GqbT2KEHW+peFJdv12iocIEl/OzlrNqd
 uaMqQvPaJgto7Rh2a2XD65NHcovd7ls=
X-Google-Smtp-Source: ACHHUZ6ympucnTIeT+ZkU2dmSV9drzo6+N75j2PiCzL3hL2ZTWfWu08zisQsbzDhim55zjKjoy3BwA==
X-Received: by 2002:a7b:c398:0:b0:3f1:738f:d3d1 with SMTP id
 s24-20020a7bc398000000b003f1738fd3d1mr14838656wmj.4.1683131466661; 
 Wed, 03 May 2023 09:31:06 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm34673327wrf.73.2023.05.03.09.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 09:31:06 -0700 (PDT)
Date: Wed, 3 May 2023 17:31:05 +0100
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Linux OpenRISC <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH 3/3] target/openrisc: Setup FPU for detecting tininess
 before rounding
Message-ID: <ZFKMSfkJupFHXtrl@antec>
References: <20230502185731.3543420-1-shorne@gmail.com>
 <20230502185731.3543420-4-shorne@gmail.com>
 <933ff5d8-3875-34ac-9bc4-ed06f74efad7@linaro.org>
 <ZFIl6db3isktCOk8@antec>
 <e3fabb1d-7bf6-f251-9649-5a813b409200@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3fabb1d-7bf6-f251-9649-5a813b409200@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 03, 2023 at 10:41:42AM +0100, Richard Henderson wrote:
> On 5/3/23 10:14, Stafford Horne wrote:
> > > > +    set_default_nan_mode(1, &cpu->env.fp_status);
> > > > +    set_float_detect_tininess(float_tininess_before_rounding,
> > > > +                              &cpu->env.fp_status);
> > > 
> > > You don't mention the nan change in the commit message.
> > 
> > Right, and I am not sure I need it.  Let me remove it and run tests again.  I
> > was just adding it as a few other architectures did who set
> > float_tininess_before_rounding.
> 
> What that does is *not* propagate NaN payloads from (some) input to the
> output.  This is certainly true of RISC-V, which specifies this in their
> architecture manual.  OpenRISC does not specify any NaN behaviour at all.

Thanks, that is what I also gathered from reading up on it.

> It's not a bad choice, really, and it almost certainly simplifies the design
> of the FPU, as you can do NaN propagation and silencing in one step.

Right, it makes sense to optimize.  It doesn't look like any of our FPU
implementation do that at the moment.

I will check with bandvig who implemented the FPU to understand his thought on
this.  It at least deserves to be discussed how nan payload is to be handled in
the architecture spec.

-Stafford

