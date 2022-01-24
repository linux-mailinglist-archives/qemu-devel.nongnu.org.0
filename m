Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4A8498F59
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:53:01 +0100 (CET)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5Oe-00062X-HG
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:53:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nC5IN-0003ZH-FT
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:46:31 -0500
Received: from [2607:f8b0:4864:20::92c] (port=43587
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nC5IM-000773-2y
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 14:46:31 -0500
Received: by mail-ua1-x92c.google.com with SMTP id 2so33137591uax.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 11:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ggCOWhT6rDGSJCLauZLHgqf+xe8Ipa5cZrq158bSHlU=;
 b=oNb619lHPE2+ipas8reqozgULgWLAGQlfTsAIJSkRIlWZ5Shg2oa2h2Ix86NMAO2yV
 VRwQPFHjsfOYAEAxKWtRkKYyps6xgTgLjmj2ZfKgQNovW+5p+hJ4x02dBMIQCQi93djd
 tGlAgxut9DH5VZcRzopIZdnaj/clXd0R6iu5Dx1LVqP7lXTAUswqfcvVI9GJA/MkBcZH
 AEC2kFJnpCq+PcKE6Ynoq6BQJqnL5I4Udai9lYT8lqk9Rif8xO3BZZa9/o0WkLZAqVmI
 BYQ5FKTAcszerQ4fj1cVmtMhjUGrAl5SvAW3IpUCHpk8kr5q0+t36EY+K8v5W6B9FWkD
 92MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ggCOWhT6rDGSJCLauZLHgqf+xe8Ipa5cZrq158bSHlU=;
 b=kYsc7JPQdmjcNR2rfZRT7/37jJMQ18O4/EAtVSiuUz603TbbGuMfIVL6DONNd9LzCI
 CtGRECqmGF3WtR1J+fsmfhUVlGBWaFEMNNCCPSJdRshgMCymaYEWnh/hfXnQ6QJ7zdk+
 6iKeUg9enE0X6d6De3ACM9PNc0Mz657N10Pnoe3/RbI2RUbCHF/bsbhQNs13rkslGMK9
 KEa8KdxYGdGrigNOYRA+LwP6e6sKTHgfQXTGFzGou5rQcKx3sp6lOysnn6hFFfKQf/rN
 eFewtH24VzEXZZ3AEeM6gYaAo11NO/IHbBJN3hhdcVEV/uOnUyWNHASBDm+9Ny5355DF
 MOQA==
X-Gm-Message-State: AOAM530TRT6JFkxopp4MgkZPY9wId1nOVC7LXQ+HHldnAn28XPhlpA1k
 6Vd0ENG4RUxlPIT0k0SjJnPw0pPAghLhbZjZI8B4Sw==
X-Google-Smtp-Source: ABdhPJwPWHaXSZR/Z4lXYKkuZyefRUPnJAuJaBN8eBP0LpfDYDBC47awEO2dfmcklUUz2ECjqXVb5saANjhAGATuSs4=
X-Received: by 2002:a05:6102:11f4:: with SMTP id
 e20mr1354808vsg.21.1643053587906; 
 Mon, 24 Jan 2022 11:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20220119214329.2557049-1-venture@google.com>
In-Reply-To: <20220119214329.2557049-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 24 Jan 2022 11:46:17 -0800
Message-ID: <CAO=notw52WF9YGaOAWHtwSf_bDJOKhh9QwK7t8KGjbAQAy6_aQ@mail.gmail.com>
Subject: Re: [PATCH] hw/nvram: use at24 macro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Corey Minyard <cminyard@mvista.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000749b3f05d6593992"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=venture@google.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000749b3f05d6593992
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 19, 2022 at 1:43 PM Patrick Venture <venture@google.com> wrote:

> Use the macro for going from I2CSlave to EEPROMState.
>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  hw/nvram/eeprom_at24c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index af6f5dbb99..da435500ba 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -54,7 +54,7 @@ struct EEPROMState {
>  static
>  int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>  {
> -    EEPROMState *ee = container_of(s, EEPROMState, parent_obj);
> +    EEPROMState *ee = AT24C_EE(s);
>
>      switch (event) {
>      case I2C_START_SEND:
> --
> 2.34.1.703.g22d0c6ccf7-goog
>

+Corey - thanks!

--000000000000749b3f05d6593992
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 19, 2022 at 1:43 PM Patri=
ck Venture &lt;<a href=3D"mailto:venture@google.com">venture@google.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Use =
the macro for going from I2CSlave to EEPROMState.<br>
<br>
Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" ta=
rget=3D"_blank">venture@google.com</a>&gt;<br>
---<br>
=C2=A0hw/nvram/eeprom_at24c.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c<br>
index af6f5dbb99..da435500ba 100644<br>
--- a/hw/nvram/eeprom_at24c.c<br>
+++ b/hw/nvram/eeprom_at24c.c<br>
@@ -54,7 +54,7 @@ struct EEPROMState {<br>
=C2=A0static<br>
=C2=A0int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 EEPROMState *ee =3D container_of(s, EEPROMState, parent_obj)=
;<br>
+=C2=A0 =C2=A0 EEPROMState *ee =3D AT24C_EE(s);<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (event) {<br>
=C2=A0 =C2=A0 =C2=A0case I2C_START_SEND:<br>
-- <br>
2.34.1.703.g22d0c6ccf7-goog<br></blockquote><div><br></div><div><a class=3D=
"gmail_plusreply" id=3D"plusReplyChip-1">+Corey - thanks!</a>=C2=A0</div></=
div></div>

--000000000000749b3f05d6593992--

