Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07FD33C1A4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:25:13 +0100 (CET)
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLq1p-0006c1-1R
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLpzK-0005MJ-DX
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:22:38 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:37191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLpzI-0004aV-Sa
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:22:38 -0400
Received: by mail-il1-x133.google.com with SMTP id k2so9921251ili.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xdFBCOLtLsDZUvUz5W/soxdcKAKBGypfiQhichNXhOU=;
 b=uvlTguDE4cFQS+jQD/355i9gtV4bv7lxYnC4QcOmtkeO5LsYYJZB9sD5E0H/ii2/wz
 QuU8gc0KeP7HfI2FzeNemRcNTblzEfliQKmBbUJq05GmBzzkvNCygySNOwhq1zYDyrsK
 zNKhEVCFVTIOwaA8wkSPDsL6heXc9SYyrQBpULtUJrrhFZtFfgKpgzhDMqTghVtmAWhT
 ALy8/8/DMyS+z7VvGaHbBwEDQBPWLuNALtJ0WIdDUb3yKsKtMNawaGgexsLUdbp1/iWK
 yAwX0/Iuf71nu4XrS49tT3SSSkGrIbcWKfuiUbZQf/dhTiz/eLKUWUTl/1G5MODm0Uzb
 gnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xdFBCOLtLsDZUvUz5W/soxdcKAKBGypfiQhichNXhOU=;
 b=RhphOPplvBDzkzxVxwP/CoYGMI61Ve6xaC2+ao6mWr3wXwXooQe4duotkQCUjnYdO2
 3MD7ePR6/vzyDpAOx6z1XD/g0v3GsefS3g3DVqZOnY+gLh2sxV08uxY/T7QzHtoaYvWP
 QCYu+/VevLL4gIS5SFRYe4uMuAx3/DhOrWgfzUVKb3AiisRGvZ/clMorc1es+0Vk35/W
 xRnVGCE79cSGEUM7jBHdfv6XEuCAUaQQarsP+WwGz3V356e/hKS+okkRvHpWAEmPfF3R
 IGlkXcLnjDFOgauxEOXb0OXxa7Hv4kTCwtyu0DOj607XeN+KU6MRv8HLClh++haGZej7
 9kUQ==
X-Gm-Message-State: AOAM531+Nj8XZRHu9KCilB6Pintpb0Kwunmf8qNONZovLWjw5v5sdRFW
 YCbvQCH915A16c4EATfGYJLgHPnpAiF+O3ZvzTk=
X-Google-Smtp-Source: ABdhPJys0M12PH9djYrFiSg9zNJ0A4Okzs4Ck6pmD3c/B2VxPN+3GPC7vsUcLwS1iucMwq/X1Zn0GbHy2g+O9MO+KoU=
X-Received: by 2002:a05:6e02:2:: with SMTP id h2mr300054ilr.81.1615825355734; 
 Mon, 15 Mar 2021 09:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-2-ma.mandourr@gmail.com>
 <871rcg9z2q.fsf@linaro.org>
In-Reply-To: <871rcg9z2q.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Mon, 15 Mar 2021 18:22:24 +0200
Message-ID: <CAD-LL6hewvhVYrH6XAxouL5x3BK4izoWCVnEw1+h_bAW9bH0kg@mail.gmail.com>
Subject: Re: [PATCH 1/8] bsd-user/elfload.c: Replaced calls to malloc/free
 with GLib variants
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000059036e05bd95a8ec"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000059036e05bd95a8ec
Content-Type: text/plain; charset="UTF-8"

>
> Given this is start-up code I think you could use g_new instead of
> g_try_new. As it will abort on no memory you can avoid the early return
> check bellow. Also is elf_phdata never persists beyond this function you
> could use g_autofree (and use g_steal_pointer on the one case when it is
> returned if you need it)
>

I would also split this patch, one for each function you convert.
>

Thank you for the valuable suggestions, these are obviously the better
way to go. I will hopefully employ them.
I'm now busy with my final exams. In a week or so, I will make the
changes again and properly, split the patch, and then send it as a
series regarding this file.

Thanks
Mahmoud Mandour

--00000000000059036e05bd95a8ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Given this is start-up code I th=
ink you could use g_new instead of<br>g_try_new. As it will abort on no mem=
ory you can avoid the early return<br>check bellow. Also is elf_phdata neve=
r persists beyond this function you<br>could use g_autofree (and use g_stea=
l_pointer on the one case when it is<br>returned if you need it)<br></block=
quote><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I wo=
uld also split this patch, one for each function you convert.<br></blockquo=
te><div></div><div>=C2=A0</div><div>Thank you for the valuable suggestions,=
 these are obviously the better=C2=A0</div><div>way to go. I will hopefully=
 employ them.</div><div>I&#39;m now busy with my final exams. In a week or =
so, I will make the=C2=A0</div><div>changes again and properly,=C2=A0split =
the patch, and then=C2=A0send it as a=C2=A0</div><div>series regarding this=
 file.</div><div><br></div><div>Thanks</div><div>Mahmoud Mandour</div></div=
></div></div></div>

--00000000000059036e05bd95a8ec--

