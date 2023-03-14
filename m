Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE16B9F1D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 19:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc9k0-00005O-4G; Tue, 14 Mar 2023 14:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pc9jt-00004z-Ce; Tue, 14 Mar 2023 14:51:13 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1pc9jr-0006nt-GL; Tue, 14 Mar 2023 14:51:13 -0400
Received: by mail-ed1-x532.google.com with SMTP id o12so66037475edb.9;
 Tue, 14 Mar 2023 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678819869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wwlk8hb0CvwNxeIlyOIz7JGNOmqHFKUxUgrFzovJ034=;
 b=EC1yNjWc8SZoAyT32ZzF4odW1xQNsERgb0256VBurS2iY+nIYMjHN9MPVzSiAJ1XgB
 xwMZVCbk1MGeOAppu4KZdjEk3u/FFa3DvKiXxB96Ib9PR6xC5g1g4N6UFr3EZv2USoyW
 7/OZ2i0lwpWzaocxCjC7czhh9UyGy/ujqHnw2PA63Zcet90yZDU7XY4MKHGtUp949PoC
 NUIWVm5HznHpbcrYpyh9EQV2cqKfFUe/lLrB7ovS/QHZVNTn+f3eoRmlDityP/ZD2+iI
 ELTVyfHEw1hh2Q/L5dli6oIhUqgOwYOqiI1scGWVvovdlB20SRSjftDkZkaQwTIjNA8R
 k9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678819869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wwlk8hb0CvwNxeIlyOIz7JGNOmqHFKUxUgrFzovJ034=;
 b=L8vbTu6tBTf1HQmz9Q8aNV3nP7mWQOE191JY09m7KcHljBS8HwD5PXo6exr7+CHkKL
 vxwqFkToVaEcMiaEvDqhOhlE6il03483wEDcvlFSi0olEZz9DvJdDp41dLi9BWKiU8LN
 aSqKUzLLsH1xkIBal8l5WJs7OYynF9NFaiEcZbAPpNj5alwNCtItTBRH00c+zBE/cWSf
 qsxQx7tF5HRkRXE7yuikh2xC+pIYg253HiY+irHaprat9LE3jHMO6/UWxyU57UZdmWCz
 J+mOclqRVQObn92QdiM+IIVPCuwkT2Lrx6GcOTCk78gG6Q127MpVgqYt7iYcdiJydjkC
 NvqQ==
X-Gm-Message-State: AO0yUKUgedr9MG7tpaqzmkT7wPk+1eSZaNS7q1Ceq2Hrv4/JIuH/8lLB
 8EP6wdKqQ1sXhRT9HuHrK727nnow+fxAgxKuhXU=
X-Google-Smtp-Source: AK7set/Gp+s/DCBHlZCeu1Ia+5NnwVN2QRIZT9VIX0YThsSa+YyvrAEg3Fv3vMIDdEEr8pMvji1mSarzRu7Ravba9XE=
X-Received: by 2002:a17:907:36e:b0:87b:db55:4887 with SMTP id
 rs14-20020a170907036e00b0087bdb554887mr1630806ejb.4.1678819868672; Tue, 14
 Mar 2023 11:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230314170804.1196232-1-peter.maydell@linaro.org>
In-Reply-To: <20230314170804.1196232-1-peter.maydell@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Tue, 14 Mar 2023 19:50:57 +0100
Message-ID: <CAJy5ezom5DELwTM9JAeUkL7yrftnLwm2XuWVCizKwppk_XjKiw@mail.gmail.com>
Subject: Re: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: multipart/alternative; boundary="000000000000ea063105f6e0b565"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000ea063105f6e0b565
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 6:08=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> The cadence UART attempts to avoid allowing the guset to set invalid
> baud rate register values in the uart_write() function.  However it
> does the "mask to the size of the register field" and "check for
> invalid values" in the wrong order, which means that a malicious
> guest can get a bogus value into the register by setting also some
> high bits in the value, and cause QEMU to crash by division-by-zero.
>
> Do the mask before the bounds check instead of afterwards.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Edgar E. Iglesias <edgar@zeroasic.com>



> ---
>  hw/char/cadence_uart.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c069a30842e..807e3985419 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -450,13 +450,15 @@ static MemTxResult uart_write(void *opaque, hwaddr
> offset,
>          }
>          break;
>      case R_BRGR: /* Baud rate generator */
> +        value &=3D 0xffff;
>          if (value >=3D 0x01) {
> -            s->r[offset] =3D value & 0xFFFF;
> +            s->r[offset] =3D value;
>          }
>          break;
>      case R_BDIV:    /* Baud rate divider */
> +        value &=3D 0xff;
>          if (value >=3D 0x04) {
> -            s->r[offset] =3D value & 0xFF;
> +            s->r[offset] =3D value;
>          }
>          break;
>      default:
> --
> 2.34.1
>
>

--000000000000ea063105f6e0b565
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Mar 14, 2023 at 6:08=E2=80=AFPM P=
eter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@=
linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">The cadence UART attempts to avoid all=
owing the guset to set invalid<br>
baud rate register values in the uart_write() function.=C2=A0 However it<br=
>
does the &quot;mask to the size of the register field&quot; and &quot;check=
 for<br>
invalid values&quot; in the wrong order, which means that a malicious<br>
guest can get a bogus value into the register by setting also some<br>
high bits in the value, and cause QEMU to crash by division-by-zero.<br>
<br>
Do the mask before the bounds check instead of afterwards.<br>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1493" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/i=
ssues/1493</a><br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar@ze=
roasic.com">edgar@zeroasic.com</a>&gt;<br></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/char/cadence_uart.c | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c<br>
index c069a30842e..807e3985419 100644<br>
--- a/hw/char/cadence_uart.c<br>
+++ b/hw/char/cadence_uart.c<br>
@@ -450,13 +450,15 @@ static MemTxResult uart_write(void *opaque, hwaddr of=
fset,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case R_BRGR: /* Baud rate generator */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D 0xffff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &gt;=3D 0x01) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;r[offset] =3D value &amp; =
0xFFFF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;r[offset] =3D value;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case R_BDIV:=C2=A0 =C2=A0 /* Baud rate divider */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 value &amp;=3D 0xff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &gt;=3D 0x04) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;r[offset] =3D value &amp; =
0xFF;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;r[offset] =3D value;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000ea063105f6e0b565--

