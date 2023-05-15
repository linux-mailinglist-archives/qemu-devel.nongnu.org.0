Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B2D702ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:53:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyYca-0002Iz-Hc; Mon, 15 May 2023 09:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pyYcU-0002Ib-Fy
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:52:10 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pyYcS-000579-Jv
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:52:10 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3062db220a3so8282301f8f.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684158727; x=1686750727;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUisRIk4ng2hXd2O5EuTg5X8FetAg+3ha2uLRTkUZYk=;
 b=uNNeVhFIaYmNjZ1fLu7sYVCh8DAhUrl7mv8cGjHV8nqaG/etRrBWZKgO5oCyeRXQ8D
 tnSn8q8xR+DHR6MTM6Kwf6qmtbBoduUvDWtDsX6KO582T2pwcZU9W9JmbCkoQ+m+L/eK
 fX9WHBVhUuGx7hWAOoMTYMeZwh1AF3nf6VsjZbbfn+yg1PdJkyO3SsD8HjJIKUB+SOz8
 hDsP6AiIhkE+IMniWbKaj32BKOt6Jmqf7AdSXN/iABeQjJICQdOyvHqOHt9+wMhlrTFC
 isM1X0aB7U/qV4pIVFd7oFbwlbyywnpE9q5beN8bWhRGVbZnlwt3GXT1Unie1AgBxq5x
 77BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684158727; x=1686750727;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sUisRIk4ng2hXd2O5EuTg5X8FetAg+3ha2uLRTkUZYk=;
 b=QAd1OKjwD3HiE+MwOb6gfi13gx2P8NvR0je/23IOYSV97IJrWUW7rIYpcHpnqmeoMf
 BtvxL07qMI35ud/0cZDvirBj61d9D9BhRkd+poY8st3v6L7HsvZUeM4+Dum4Ol4K0PMe
 k8XT0T094CzIUEqVgP+xhlpHCJwTyEItW/fp9kvwE663hdq/mFyFI/9qcnikJWRcVHHT
 05U3GXlWdTfzO1UEV8rFNUzdObHpYpu9sM5MlvbiIelZuhnC/sJIHjmScHY7KclvZjdQ
 VBzU44LDvCGDoW9jD8GvR3v+vu0Hn+ZMa1qkVDFZeaxcZXW1jqBGSlwIkO7VrK9FlAS4
 gyCw==
X-Gm-Message-State: AC+VfDyKrZJHjakyDb31bub7YRDVfpoNs4a+7VaLI4XcRtCxqmU43DTT
 4ywOM8yDSd3dYoRc+X7ZTmeiOFQrONWV1ehHwwFUag==
X-Google-Smtp-Source: ACHHUZ4x0Gc6nro11TG4DYkYodig9AJXHZeGb7xZiKYHJ+vIzcFywf4GMcYLxmxexhsRtSP9wiLgHg==
X-Received: by 2002:a5d:46cc:0:b0:307:1bba:ea61 with SMTP id
 g12-20020a5d46cc000000b003071bbaea61mr23553484wrs.44.1684158726664; 
 Mon, 15 May 2023 06:52:06 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a5d4dd0000000b003062ad45243sm32615350wru.14.2023.05.15.06.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:52:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD8EA1FFBB;
 Mon, 15 May 2023 14:52:05 +0100 (BST)
References: <CAM2a4uxjURNAUcMemWj+mJOvNjgHbXQ-KgiRdRghByM7pBVROw@mail.gmail.com>
User-agent: mu4e 1.11.6; emacs 29.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gautam Bhat <mindentropy@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: Resources on deeper understanding of Translation blocks
Date: Mon, 15 May 2023 14:45:51 +0100
In-reply-to: <CAM2a4uxjURNAUcMemWj+mJOvNjgHbXQ-KgiRdRghByM7pBVROw@mail.gmail.com>
Message-ID: <875y8tbt2y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Gautam Bhat <mindentropy@gmail.com> writes:

> Hi,
>
> I am going through some translation code for existing targets.
>
> I would like to know if there are any good resources on deeper
> understanding of translation blocks? Also some advice on the best way
> to read code related to translation in Qemu and trying it out maybe
> using the debugger, printing etc? I am getting lost trying to make
> sense of the translation code.

We have a section in the developers manual that gives an overview of the
translator and how it goes together:

  https://qemu.readthedocs.io/en/latest/devel/index-tcg.html

Generally for following code the best option is to use the debug flags,
the usual is:

 -d in_asm,op,op_opt,out_asm

which will dump in order:

  - in_asm, the guest instructions
  - op, the TCG ops they break down into
  - op_opt, the TCG ops after optimiation
  - out_asm, the host instructions for the block

as this is a lot of data you can limit to certain address ranges using
the -dfilter option.

Remember the above options will only dump the code as it is translated,
not each time the guest runs it.

You can attach to the guest using the gdbstub:

  https://qemu.readthedocs.io/en/latest/system/gdb.html

and stick a breakpoint at the code in question. If you have the HMP
monitor enabled you can then enable the debug options and single step
through the code and see each instruction translated and executed in
turn.


>
> Thanks,
> Gautam.


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

