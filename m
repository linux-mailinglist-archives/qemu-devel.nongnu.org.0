Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460095A9A10
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:23:43 +0200 (CEST)
Received: from localhost ([::1]:52344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTl6b-0006wy-A7
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTl3E-0005Ff-QO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:20:14 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oTl3C-00057A-B8
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:20:12 -0400
Received: by mail-wr1-x42f.google.com with SMTP id s7so7671841wro.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=gMOnn9gDpjwtYhQQCgK5O2Z/ZyrwcDOqRamVM830Op4=;
 b=C9j96OxW4ftBhQss2V4JUQdTH09v8eWoRBaPVWqdIebhA7/0HjF8yHMxN6YFpfvkBX
 0QTA6mpFjZUfTduecu/QA5uGn5xel+iyFvPxNNiVBSIssZt5f4yB6kIeh1aHZQUI39EP
 v+oEQeWkoZQLIAcsnAJ0alszJob6EVbuyZHDyDxN8OvsVrPdOl9JptbSgcSAY0j/2KJZ
 5dj9Iu/a487qQvG2yXSnYbw4hIUSph0oc8tgH5Rna5/JSSAt0zYFDAAxTLeAN9kFj+1l
 u89wjN5BGVF1qPyt+lCOJfiu7lDhK0FXFnTnrdY2MKHM1AQ4/7hjUyvLgPp+s/EwyAGQ
 YDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=gMOnn9gDpjwtYhQQCgK5O2Z/ZyrwcDOqRamVM830Op4=;
 b=QS/ThVKh2HEU0vVTSvnpGE+rPuuBkJmIqKDj6Sk9yIxtWYu7Z7xJN18s0cR/Smz4U7
 esI1Doj3W+QJ8tkIv86BH/mBo3vTUyi1pLe5XTfftPNxfAhicd6tXvWpg9OEqh3IL08x
 mlwjCnUwT59xFJxkqB+xYe5Lk5qvTJlOzkwgFIh8ltZhMu7eMGaVGQI1GEd70fU4ir0x
 huazZLiYb3wM59xO1VKpSi4AYOvvM91FSv0n+BhlfpXl2OWbr0+5DVcsv2Bi/WYoKcw+
 b/8ax25plOm4PCKh9DEa3ntsPMFNcYgL2ZV/0iDTfe7JmnxJfzKjoeQQY0f6oMwdxA0I
 ahhQ==
X-Gm-Message-State: ACgBeo3Bmhg/VDaFKBjjyIsP/Pv+JiLW9TY9UPsIXOgw61JvKr649qYa
 EsevV+YK9gYnI9yz+928LILhRg==
X-Google-Smtp-Source: AA6agR7KNMo07Owf60b9jPr6EkefkWNzrBBar+ECVFvjenB8aP7ji2f7jfR7fSJfHE2/6j5vd+qtxw==
X-Received: by 2002:a05:6000:1c14:b0:226:deb1:d7cc with SMTP id
 ba20-20020a0560001c1400b00226deb1d7ccmr10267679wrb.494.1662042007836; 
 Thu, 01 Sep 2022 07:20:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b003a342933727sm5955773wmb.3.2022.09.01.07.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:20:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D67671FFB7;
 Thu,  1 Sep 2022 15:20:06 +0100 (BST)
References: <CAA_GOyF3YxqT4-9gv-u-3pSK7zPZq7YiGCpsUUvmYbuE_h33_w@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Tom Clark <tsc288@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: TCG IR extraction
Date: Thu, 01 Sep 2022 15:18:35 +0100
In-reply-to: <CAA_GOyF3YxqT4-9gv-u-3pSK7zPZq7YiGCpsUUvmYbuE_h33_w@mail.gmail.com>
Message-ID: <87y1v3mb1l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Tom Clark <tsc288@gmail.com> writes:

> Hello,
>
> Thanks so much for reading this and I appreciate any and all time you put=
 into this.
>
> I'm a dev working on a project that's using QEMU as its basis. I'm intere=
sted in extracting the IR representation of
> translation blocks, preferably at the instruction level, to do some
> analysis on it.

If you are purely interested in the instruction level you could look at
TCG plugins although they deliberately don't expose any of the details of t=
he
underlying TCGOps.

> In various documentation around the web
> I see lots of references to textual examples of the IR so I assumed it wo=
uld be possible to extract it in byte format and
> convert to textual myself.=20
>
> I've done a lot of digging in the source and found the code_gen_buffer an=
d determined that's where the IR generation is
> being written to, but I'm having trouble cross referencing DisasContext, =
etc, with that global to actually identify individual
> lines of code. I'm also assuming there's some kind of framing going on, s=
o I don't think that I can even expect it to be a
> simple buffer of bytes.
>
> So my  - is this reasonable to even attempt, and if so, how would you go =
about doing it?
>
> Regards,
> -T


--=20
Alex Benn=C3=A9e

