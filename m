Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB125E5D0D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 10:08:35 +0200 (CEST)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obHG6-0005B5-0W
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 04:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1obH6q-0002EP-KF
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 03:59:00 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:33379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1obH6g-0006AJ-0c
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 03:59:00 -0400
Received: by mail-lf1-x131.google.com with SMTP id x27so13428184lfu.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 00:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xhcvUZ1fDrqapZxLQdQBtI1FxreNGpAjo/E4zxr5d2s=;
 b=JOUYBRYcm2SF0JrGAdRY8sGqUaPk+WhEZ3Y7b3Ht6x+M7bEwRqq5QilS7Ax0SxU3NY
 IHFqdWBTnzQVDqbKyIKQJiXhPr7jIYsvGONP9pAEaPOzLIQDkWzlTFCrKzXKAneYf5yO
 5ELBwImRWIKrWsDThhZbwv4rEZ/u79hJMQkoL0DCoKgOqvJEe+sqVJ9LgszMt49v+JvR
 81+G7ChcNYSm65SWqz5W/SIBMbc1PHXSt3eJF4aOYKHJEqFlBAqSRBJjrRoOzTehik6x
 GcQCNATwFYKRu8+SMr5dVhEsNph0I+aCgqoYNPqV2Mg1pI90koH65BiW5bweUHw4C7/f
 BgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xhcvUZ1fDrqapZxLQdQBtI1FxreNGpAjo/E4zxr5d2s=;
 b=RHCtZn3Ki7ZD7hHl5AFUqP1flk3ov0kFdzIICY9esFOhOO6fWteHDCWs72BgrX23kw
 4d0+pMrmaedyRiw/M/ajdmjk4m/kp/pbuUYISJJmpVnr7dyWfKQTrV33XrcEc/UgU3wa
 cQUTgeedjNyJ5unG0NGzLr8ZhxeulQUuMwiWNmwQ1B0ikS2IAYerab4hXI4n7C7mED5Q
 IknEheK/4m108wax/lURC2wU9YNqruayetjB1EJnmXpBjqmmzD0YPAG7E2+9o1WuO8pE
 QTWtK2c6E3MTgWg3TG1ZiDmWc4Z5S9cEKAJ5F9WmJ2Qbs5WSby8W+WlDwE3qvg1dRwaY
 j6Ag==
X-Gm-Message-State: ACrzQf2qPx4R5Q47k24qu47YpA397v8Y1DxjAhtZbRBSL/2YZ6z0Mln8
 8yteQBJpsQux+VbjUgduJi92+Oc98FlozpjoH+dMm5K7bPLrJ7ikHPTAKy+gYf9iBFlQlBNuskq
 yJOAzDPffOtSyQxbvfDstcNuJ70s7yOpTrXA50MQ2rPLaQwh2jb2tTsjUXIXS519c4z3b+Jdr
X-Google-Smtp-Source: AMsMyM7mdocMCfeaLcCFszLGoWF6vFBae0aer5sj3eoZGrg/BPGL6rmG5EUjjm+IPLKSNwdChNeAgA==
X-Received: by 2002:ac2:5623:0:b0:49a:d7b9:c06d with SMTP id
 b3-20020ac25623000000b0049ad7b9c06dmr812655lff.511.1663833524955; 
 Thu, 22 Sep 2022 00:58:44 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 r16-20020ac25a50000000b004984ab5956dsm809649lfn.202.2022.09.22.00.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:58:44 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id q17so9946493lji.11;
 Thu, 22 Sep 2022 00:58:44 -0700 (PDT)
X-Received: by 2002:a05:651c:508:b0:26c:7297:5aa7 with SMTP id
 o8-20020a05651c050800b0026c72975aa7mr252463ljp.93.1663833523834; Thu, 22 Sep
 2022 00:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220922075232.33653-1-shentey@gmail.com>
In-Reply-To: <20220922075232.33653-1-shentey@gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 22 Sep 2022 15:58:32 +0800
X-Gmail-Original-Message-ID: <CANzO1D1Moxf-tOqS3gc=BhHsCkOC3SO2rJNJCyRYvA2Bj5SYjw@mail.gmail.com>
Message-ID: <CANzO1D1Moxf-tOqS3gc=BhHsCkOC3SO2rJNJCyRYvA2Bj5SYjw@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv/sifive_e: Fix inheritance of SiFiveEState
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000027574605e93f6ec3"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--00000000000027574605e93f6ec3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bernhard,

I think there's already a similar patch for this bug fix:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg905424.html

Regards,
Frank Chang

On Thu, Sep 22, 2022 at 3:53 PM Bernhard Beschow <shentey@gmail.com> wrote:

> SiFiveEState inherits from SysBusDevice while it's TypeInfo claims it to
> inherit from TYPE_MACHINE. This is an inconsistency which can cause
> undefined behavior such as memory corruption.
>
> Change SiFiveEState to inherit from MachineState since it is registered
> as a machine.
>
> Fixes: 0869490b1c ("riscv: sifive_e: Manually define the machine")
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/riscv/sifive_e.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
> index 83604da805..d738745925 100644
> --- a/include/hw/riscv/sifive_e.h
> +++ b/include/hw/riscv/sifive_e.h
> @@ -22,6 +22,7 @@
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/sifive_cpu.h"
>  #include "hw/gpio/sifive_gpio.h"
> +#include "hw/boards.h"
>
>  #define TYPE_RISCV_E_SOC "riscv.sifive.e.soc"
>  #define RISCV_E_SOC(obj) \
> @@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {
>
>  typedef struct SiFiveEState {
>      /*< private >*/
> -    SysBusDevice parent_obj;
> +    MachineState parent_obj;
>
>      /*< public >*/
>      SiFiveESoCState soc;
> --
> 2.37.3
>
>
>

--00000000000027574605e93f6ec3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bernhard,<div><br></div><div>I think there&#39;s alread=
y a similar patch for this bug fix:<br><a href=3D"https://www.mail-archive.=
com/qemu-devel@nongnu.org/msg905424.html">https://www.mail-archive.com/qemu=
-devel@nongnu.org/msg905424.html</a><br></div><div><br></div><div>Regards,<=
/div><div>Frank Chang</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, Sep 22, 2022 at 3:53 PM Bernhard Beschow=
 &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">SiFiveEState inh=
erits from SysBusDevice while it&#39;s TypeInfo claims it to<br>
inherit from TYPE_MACHINE. This is an inconsistency which can cause<br>
undefined behavior such as memory corruption.<br>
<br>
Change SiFiveEState to inherit from MachineState since it is registered<br>
as a machine.<br>
<br>
Fixes: 0869490b1c (&quot;riscv: sifive_e: Manually define the machine&quot;=
)<br>
<br>
Signed-off-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com" ta=
rget=3D"_blank">shentey@gmail.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0include/hw/riscv/sifive_e.h | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h<br>
index 83604da805..d738745925 100644<br>
--- a/include/hw/riscv/sifive_e.h<br>
+++ b/include/hw/riscv/sifive_e.h<br>
@@ -22,6 +22,7 @@<br>
=C2=A0#include &quot;hw/riscv/riscv_hart.h&quot;<br>
=C2=A0#include &quot;hw/riscv/sifive_cpu.h&quot;<br>
=C2=A0#include &quot;hw/gpio/sifive_gpio.h&quot;<br>
+#include &quot;hw/boards.h&quot;<br>
<br>
=C2=A0#define TYPE_RISCV_E_SOC &quot;riscv.sifive.e.soc&quot;<br>
=C2=A0#define RISCV_E_SOC(obj) \<br>
@@ -41,7 +42,7 @@ typedef struct SiFiveESoCState {<br>
<br>
=C2=A0typedef struct SiFiveEState {<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; private &gt;*/<br>
-=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 MachineState parent_obj;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*&lt; public &gt;*/<br>
=C2=A0 =C2=A0 =C2=A0SiFiveESoCState soc;<br>
-- <br>
2.37.3<br>
<br>
<br>
</blockquote></div>

--00000000000027574605e93f6ec3--

