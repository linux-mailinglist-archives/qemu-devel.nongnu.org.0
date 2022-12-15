Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77BC64E4A4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 00:24:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5xZf-0005AH-ST; Thu, 15 Dec 2022 18:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5xZV-00059U-60
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 18:23:28 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5xZT-0004uZ-7y
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 18:23:24 -0500
Received: by mail-ed1-x530.google.com with SMTP id s5so1348618edc.12
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 15:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LSm1qwDQRIDVlOyoZ0QGfnIaN2SB/+lwzFgzJuq6zg4=;
 b=nM5INzZ4tE5lqn0OIAHRiJDEZVk5j5oPvusSxghMlvZSClsafS/l2c0GQyrpnmTB8V
 z5njCKu26EGOGDaJWzCkV6rUlF1Aaajmg9ytUzwkqV5Bi8piIeqiN4IaSlRFDRyE6Fll
 eGSFjmWbrBn/8srnrIrJpoPGQcog8g9zoahEvKXstwWmXc0lBHsftp+M6hPhdEplAjF6
 somMKhLtzDCw47YA7JIoRaYX8Qhvm7L0IybC+yNxXCuI9vWtTJBZvs3DTCQ1SOK823Mm
 hESPS1DO1xNe9e81bphq3GKrHlsY9JOlbkXlp0yq/791K+FkKX91z3/6W0HQ77aOAIb4
 XMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LSm1qwDQRIDVlOyoZ0QGfnIaN2SB/+lwzFgzJuq6zg4=;
 b=a+QJ1S+5BWECATH9zScvME/advXbqw/yse9cJyumx55W9zUac1QbpHopontittCri+
 mL6/5muw0jnZdTKOOA6PTkQjMdm0+LEk/LHyrtJfYTP1QvVw5cgDB0QnZxCKFKos+KRD
 BI88XFrbGY6pS1bZ10DmBXap/iICBWlD0641V+hB7fDgj/q/C8fT0vRb4RQ3yvKesLDC
 eJAPVDVwCzEoswUikVgjwyf5t4OhnZ9fwqXT0WEKOYdoBWmB8q6zJh5wDV/0eQw9riYJ
 FJIHhi8+sT4FRxrJyyU1FYfEfo7pKFKbmX9a0FsxkUqQah4oth5g0yyvltdebQaNY2ZX
 5dkA==
X-Gm-Message-State: ANoB5pmH3NbGC7poRf6x+QXFu4Jf6sMfEbX3NYqtMdMqi9sr+6uLW1Iv
 hTQvdArR1/FeoS+wOnPqfE+eOKs99NafdKa7fY9tsQ==
X-Google-Smtp-Source: AA0mqf4SM6qxQFNeWFGa7/NP/Sd3FMFjByVVw053U9TXsTFh8lFTfiGh4zPj0T24pSNRnpKtgKY9rTRW2NLzo5POBgU=
X-Received: by 2002:aa7:d14f:0:b0:46c:69a:39b0 with SMTP id
 r15-20020aa7d14f000000b0046c069a39b0mr27940268edo.294.1671146601497; Thu, 15
 Dec 2022 15:23:21 -0800 (PST)
MIME-Version: 1.0
References: <Y5rMcts4qe15RaVN@p100>
 <165fbdfe-8e72-0ab7-727e-0f54df9957b3@linaro.org>
 <b2432b6a-ceef-647d-3e0f-ff7a7bdc0beb@linaro.org>
 <2d3abe70-d1f8-736b-81fc-8b3c6aa60ea0@linaro.org>
In-Reply-To: <2d3abe70-d1f8-736b-81fc-8b3c6aa60ea0@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Thu, 15 Dec 2022 15:23:10 -0800
Message-ID: <CAFXwXr=jBr4xefoM7eeTFaRpWaYxqz1KjoDNZYaBD5V1wxheXA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Add translation for argument of msync()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000008ce04705efe623f5"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--0000000000008ce04705efe623f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Host!

r~

On Thu, 15 Dec 2022, 12:58 Philippe Mathieu-Daud=C3=A9, <philmd@linaro.org>
wrote:

> On 15/12/22 16:58, Richard Henderson wrote:
> > On 12/14/22 23:58, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> --- a/linux-user/alpha/target_mman.h
> >>> +++ b/linux-user/alpha/target_mman.h
> >>> @@ -3,6 +3,10 @@
> >>>
> >>>   #define TARGET_MADV_DONTNEED 6
> >>>
> >>> +#define TARGET_MS_ASYNC 1
> >>> +#define TARGET_MS_SYNC 2
> >>> +#define TARGET_MS_INVALIDATE 4
> >>> +
> >>>   #include "../generic/target_mman.h"
> >>>
> >>>   #endif
> >>> diff --git a/linux-user/generic/target_mman.h
> >>> b/linux-user/generic/target_mman.h
> >>> index 1436a3c543..32bf1a52d0 100644
> >>> --- a/linux-user/generic/target_mman.h
> >>> +++ b/linux-user/generic/target_mman.h
> >>> @@ -89,4 +89,17 @@
> >>>   #define TARGET_MADV_DONTNEED_LOCKED 24
> >>>   #endif
> >>>
> >>> +
> >>> +#ifndef TARGET_MS_ASYNC
> >>> +#define TARGET_MS_ASYNC 1
> >>
> >> Hmm don't we want to keep the host flag instead?
> >>
> >>     #define TARGET_MS_ASYNC MS_ASYNC
> >
> > No.  What if the host has an odd value, like Alpha.
>
> But TARGET_MS_ASYNC  would be defined in linux-user/alpha/target_mman.h
> so this path won't apply... What am I missing?
>

--0000000000008ce04705efe623f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Host!<br><br><div data-smartmail=3D"gmail_signature">r~</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, 15 Dec 2022, 12:58 Philippe Mathieu-Daud=C3=A9, &lt;<a href=3D"=
mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On 15/12/22 16:58, Richard Henderson wrote:<br>
&gt; On 12/14/22 23:58, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt;&gt; --- a/linux-user/alpha/target_mman.h<br>
&gt;&gt;&gt; +++ b/linux-user/alpha/target_mman.h<br>
&gt;&gt;&gt; @@ -3,6 +3,10 @@<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0 #define TARGET_MADV_DONTNEED 6<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +#define TARGET_MS_ASYNC 1<br>
&gt;&gt;&gt; +#define TARGET_MS_SYNC 2<br>
&gt;&gt;&gt; +#define TARGET_MS_INVALIDATE 4<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; =C2=A0 #include &quot;../generic/target_mman.h&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0 #endif<br>
&gt;&gt;&gt; diff --git a/linux-user/generic/target_mman.h <br>
&gt;&gt;&gt; b/linux-user/generic/target_mman.h<br>
&gt;&gt;&gt; index 1436a3c543..32bf1a52d0 100644<br>
&gt;&gt;&gt; --- a/linux-user/generic/target_mman.h<br>
&gt;&gt;&gt; +++ b/linux-user/generic/target_mman.h<br>
&gt;&gt;&gt; @@ -89,4 +89,17 @@<br>
&gt;&gt;&gt; =C2=A0 #define TARGET_MADV_DONTNEED_LOCKED 24<br>
&gt;&gt;&gt; =C2=A0 #endif<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +#ifndef TARGET_MS_ASYNC<br>
&gt;&gt;&gt; +#define TARGET_MS_ASYNC 1<br>
&gt;&gt;<br>
&gt;&gt; Hmm don&#39;t we want to keep the host flag instead?<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 #define TARGET_MS_ASYNC MS_ASYNC<br>
&gt; <br>
&gt; No.=C2=A0 What if the host has an odd value, like Alpha.<br>
<br>
But TARGET_MS_ASYNC=C2=A0 would be defined in linux-user/alpha/target_mman.=
h<br>
so this path won&#39;t apply... What am I missing?<br>
</blockquote></div>

--0000000000008ce04705efe623f5--

