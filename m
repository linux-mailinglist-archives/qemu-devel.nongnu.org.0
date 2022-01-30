Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA044A3ABE
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 23:38:21 +0100 (CET)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEIpw-0006Uo-Il
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 17:38:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nEInl-0003pv-No; Sun, 30 Jan 2022 17:36:05 -0500
Received: from [2607:f8b0:4864:20::102e] (port=43697
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nEIni-0002wJ-Rc; Sun, 30 Jan 2022 17:36:05 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 qe6-20020a17090b4f8600b001b7aaad65b9so5852622pjb.2; 
 Sun, 30 Jan 2022 14:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ioKHWG79iSdG7l5bCC5sSgAqTj/1Hte+cKrGSDliLX4=;
 b=EikQVmwwEG/XEnY1O1D0x4+4Lu945Iw4w8MBRndZ9FRCvnfIW4t8JUs4Ft7M2KRwim
 Zd2h5ohAgrG1BayEnQsgXPMV+4lm9Y9lZUMGfTS24qnKmzeorbfFcSCAynX7Z9EJyLSk
 5zyZk2/BHtbGfsvfJ5zjl434hKo3IVrXbAxMxDEvqElRuHAnxXJ1Etk0SKCK2VNMt56C
 m/Iuq00ounFxJRoeEFfvoNQ9j+NqWliVReKW5fiB77Urz3lfKHp28mrMGH5qjdPHJxYe
 SXpsV2iAjUycfcrm1GLUJDo8bnLa2iTCTtQ6m4A7AR1p9QiMC0jxKLIFQJRgv/ZVDBWm
 hJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ioKHWG79iSdG7l5bCC5sSgAqTj/1Hte+cKrGSDliLX4=;
 b=cR8+P4ubIH3KrSD9na512KJa5bQfT8UeVIgeP8kK14YJBHvo6MCeDUw1MB5mordMVc
 9jCKu1JcVOBLJP9D2QTEz2YoUKpF5yjV8ZKa/HepvaRnQrJtNsZI4bqVJwWpuQSyxRE9
 YoHhXOZR3R45j0SCjkJzg6Lgroqp39/0x4sCk0kKQ1xjd0EKch9v/sxMKQCteW6aNmvQ
 ZpuMBxZukEG0z5Y19tZ++FNKGAnsPAxh0521WB1RQHq8VXIOjn3xdT+ahW3Mb5yzdKRG
 DBiUXPzwxyfPkxkcpXY7UPbGmGBBKu6FAZQPOQIZ0k1fymf0ZzGYgk63Bu59XE9gJkrz
 v8GA==
X-Gm-Message-State: AOAM530SSWmUQQgWMMAjkgO190u6k7lxT2TwZ30OPFPZk9nQqYUlbU4W
 fEGd7CyrjLTCOXKSUCaBOQ5olbIZSN9tIuI37I8=
X-Google-Smtp-Source: ABdhPJzcxt2UVgwTq1LiLwhxahBPcuL1z8tq3VgAZ2lRKoPgZ/sohSr8rjG2B1sAoGrTZh7KA8qTw7ix71AB4puXqzs=
X-Received: by 2002:a17:902:f54b:: with SMTP id
 h11mr18299290plf.91.1643582148862; 
 Sun, 30 Jan 2022 14:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-6-peter.maydell@linaro.org>
In-Reply-To: <20220127154639.2090164-6-peter.maydell@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 30 Jan 2022 23:35:37 +0100
Message-ID: <CAPan3WrPgyTqzgcP5Bc6zdvmqrQ7mN3xjowzo+Qo-UHH5miH0g@mail.gmail.com>
Subject: Re: [PATCH 05/16] hw/arm: allwinner: Don't enable PSCI conduit when
 booting guest in EL3
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000024666105d6d44a5b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Graf <agraf@csgraf.de>,
 Rob Herring <robh@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Andre Przywara <andre.przywara@arm.com>, Tyrone Ting <kfting@nuvoton.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024666105d6d44a5b
Content-Type: text/plain; charset="UTF-8"

Hi Peter,



On Thu, Jan 27, 2022 at 4:46 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Change the allwinner-h3 based board to use the new boot.c
> functionality to allow us to enable psci-conduit only if the guest is
> being booted in EL1 or EL2, so that if the user runs guest EL3
> firmware code our PSCI emulation doesn't get in its way.
>
> To do this we stop setting the psci-conduit property on the CPU
> objects in the SoC code, and instead set the psci_conduit field in
> the arm_boot_info struct to tell the common boot loader code that
> we'd like PSCI if the guest is starting at an EL that it makes sense
> with.
>
> This affects the orangepi-pc board.
>
> This commit leaves the secondary CPUs in the powered-down state if
> the guest is booting at EL3, which is the same behaviour as before
> this commit.  The secondaries can no longer be started by that EL3
> code making a PSCI call but can still be started via the CPU
> Configuration Module registers (which we model in
> hw/misc/allwinner-cpucfg.c).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>

While testing your patches on the orangepi-pc machine, I've found that two
acceptance tests BootLinuxConsole.test_arm_orangepi_bionic_20_08 and
BootLinuxConsole.test_arm_orangepi_uboot_netbsd9 of the orangepi-pc board
are no longer passing on current master:

  ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado
--show=app,console run -t machine:orangepi-pc
tests/avocado/boot_linux_console.py
  ...
 (4/5)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
-console: U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)
\console: DRAM:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
reached\nOriginal status: ERROR\n{'name':
'4-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08',
'logdi>
 (5/5)
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
/console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)
console: DRAM:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout
reached\nOriginal status: ERROR\n{'name':
'5-tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9',
'logd>
RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 2 |
CANCEL 0
JOB TIME   : 221.25 s

Bisecting the error I was able to trace it back to commit 5ead62185d
("memory: Make memory_region_is_mapped() succeed when mapped via an alias").
I'll try to find the original thread and respond to that with this
information.

However, with commit 5ead62185d reverted, all tested passed fine:

ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes avocado
--show=app,console run -t machine:orangepi-pc
tests/avocado/boot_linux_console.py
...
PASS (16.48 s)
RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 116.63 s

So for the orangepi-pc and allwinner-h3:

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>


> ---
> If anybody knows for definite that the secondaries should be
> powered-down at startup for guest firmware, we can delete the TODO.
>

Looking at the Allwinner H3 datasheet in 4.4.3.7 page 146, it says that
for the CPU1 Status Register the default value indicates at least that its
not in a
wait for interrupt standby mode. And if I look in U-Boot's
arm/arm/cpu/armv7/sunxi/psci.c code
in the psci_cpu_on implementation, there is an explicit 'power on' part
there, suggesting the secondary CPUs
are by default off. So while I don't have any hard proof, these findings
suggest we are modeling the correct behavior
with secondary CPUs by default off.



> The allwinner-cpucfg.c code makes the reset value for the
> REG_CPU*_RST_CTRL registers "CPUX_RESET_RELEASED", which might
> suggest otherwise, but that could easily just be a QEMU error.
> ---
>  hw/arm/allwinner-h3.c | 9 ++++-----
>  hw/arm/orangepi.c     | 1 +
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index f9b7ed18711..f54aff6d2d2 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -235,11 +235,10 @@ static void allwinner_h3_realize(DeviceState *dev,
> Error **errp)
>      /* CPUs */
>      for (i = 0; i < AW_H3_NUM_CPUS; i++) {
>
> -        /* Provide Power State Coordination Interface */
> -        qdev_prop_set_int32(DEVICE(&s->cpus[i]), "psci-conduit",
> -                            QEMU_PSCI_CONDUIT_SMC);
> -
> -        /* Disable secondary CPUs */
> +        /*
> +         * Disable secondary CPUs. TODO: check whether this is what
> +         * guest EL3 firmware would really expect.
> +         */
>          qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
>                            i > 0);
>
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index e7963822367..68fe9182414 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -105,6 +105,7 @@ static void orangepi_init(MachineState *machine)
>      }
>      orangepi_binfo.loader_start = h3->memmap[AW_H3_DEV_SDRAM];
>      orangepi_binfo.ram_size = machine->ram_size;
> +    orangepi_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
>      arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
>  }
>
> --
> 2.25.1
>
>

-- 
Niek Linnenbank

--00000000000024666105d6d44a5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div><=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Jan 27, 2022 at 4:46 PM Peter Maydell &lt;<a href=3D"mailt=
o:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Change the allwinner-h3=
 based board to use the new boot.c<br>
functionality to allow us to enable psci-conduit only if the guest is<br>
being booted in EL1 or EL2, so that if the user runs guest EL3<br>
firmware code our PSCI emulation doesn&#39;t get in its way.<br>
<br>
To do this we stop setting the psci-conduit property on the CPU<br>
objects in the SoC code, and instead set the psci_conduit field in<br>
the arm_boot_info struct to tell the common boot loader code that<br>
we&#39;d like PSCI if the guest is starting at an EL that it makes sense<br=
>
with.<br>
<br>
This affects the orangepi-pc board.<br>
<br>
This commit leaves the secondary CPUs in the powered-down state if<br>
the guest is booting at EL3, which is the same behaviour as before<br>
this commit.=C2=A0 The secondaries can no longer be started by that EL3<br>
code making a PSCI call but can still be started via the CPU<br>
Configuration Module registers (which we model in<br>
hw/misc/allwinner-cpucfg.c).<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><=
br></div><div>While testing your patches on the orangepi-pc machine, I&#39;=
ve found that two acceptance tests BootLinuxConsole.test_arm_orangepi_bioni=
c_20_08 and</div><div>BootLinuxConsole.test_arm_orangepi_uboot_netbsd9 of t=
he orangepi-pc board are no longer passing on current master:</div><div><br=
></div><div>=C2=A0 ARMBIAN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORA=
GE=3Dyes avocado --show=3Dapp,console run -t machine:orangepi-pc tests/avoc=
ado/boot_linux_console.py<br>=C2=A0 ...</div><div>=C2=A0(4/5) tests/avocado=
/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08: -co=
nsole: U-Boot SPL 2020.04-armbian (Sep 02 2020 - 10:16:13 +0200)<br>\consol=
e: DRAM:<br>INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred=
: Timeout reached\nOriginal status: ERROR\n{&#39;name&#39;: &#39;4-tests/av=
ocado/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08=
&#39;, &#39;logdi&gt;<br>=C2=A0(5/5) tests/avocado/boot_linux_console.py:Bo=
otLinuxConsole.test_arm_orangepi_uboot_netbsd9: /console: U-Boot SPL 2020.0=
1+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)<br>console: DRAM:<br>INTERRUPTED: T=
est interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOrigina=
l status: ERROR\n{&#39;name&#39;: &#39;5-tests/avocado/boot_linux_console.p=
y:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9&#39;, &#39;logd&gt;<br>R=
ESULTS =C2=A0 =C2=A0: PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRU=
PT 2 | CANCEL 0<br>JOB TIME =C2=A0 : 221.25 s<br></div><div><br></div><div>=
Bisecting the error I was able to trace it back to commit 5ead62185d (&quot=
;memory: Make memory_region_is_mapped() succeed when mapped via an alias&qu=
ot;).</div><div>I&#39;ll try to find the original thread and respond to tha=
t with this information.<br></div><div><br></div><div>However, with commit =
5ead62185d reverted, all tested passed fine:</div><div><br></div><div>ARMBI=
AN_ARTIFACTS_CACHED=3Dyes AVOCADO_ALLOW_LARGE_STORAGE=3Dyes avocado --show=
=3Dapp,console run -t machine:orangepi-pc tests/avocado/boot_linux_console.=
py<br>...<br>PASS (16.48 s)<br>RESULTS =C2=A0 =C2=A0: PASS 5 | ERROR 0 | FA=
IL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0<br>JOB TIME =C2=A0 : 116.63=
 s<br></div><div><br></div><div>So for the orangepi-pc and allwinner-h3:</d=
iv><div><br></div><div>Reviewed-by: Niek Linnenbank &lt;<a href=3D"mailto:n=
ieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt;</div><div>Tested-=
by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklin=
nenbank@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
---<br>
If anybody knows for definite that the secondaries should be<br>
powered-down at startup for guest firmware, we can delete the TODO. <br></b=
lockquote><div><br></div><div>Looking at the Allwinner H3 datasheet in 4.4.=
3.7 page 146, it says that</div><div>for the CPU1 Status Register the defau=
lt value indicates at least that its not in a</div><div>wait for interrupt =
standby mode. And if I look in U-Boot&#39;s arm/arm/cpu/armv7/sunxi/psci.c =
code</div><div>in the psci_cpu_on implementation, there is an explicit &#39=
;power on&#39; part there, suggesting the secondary CPUs</div><div>are by d=
efault off. So while I don&#39;t have any hard proof, these findings sugges=
t we are modeling the correct behavior</div><div>with secondary CPUs by def=
ault off.<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
The allwinner-cpucfg.c code makes the reset value for the<br>
REG_CPU*_RST_CTRL registers &quot;CPUX_RESET_RELEASED&quot;, which might<br=
>
suggest otherwise, but that could easily just be a QEMU error.<br>
---<br>
=C2=A0hw/arm/allwinner-h3.c | 9 ++++-----<br>
=C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
index f9b7ed18711..f54aff6d2d2 100644<br>
--- a/hw/arm/allwinner-h3.c<br>
+++ b/hw/arm/allwinner-h3.c<br>
@@ -235,11 +235,10 @@ static void allwinner_h3_realize(DeviceState *dev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0/* CPUs */<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; AW_H3_NUM_CPUS; i++) {<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Provide Power State Coordination Interface =
*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_int32(DEVICE(&amp;s-&gt;cpus[i])=
, &quot;psci-conduit&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_PSCI_CONDUIT_SMC);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable secondary CPUs */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Disable secondary CPUs. TODO: check wh=
ether this is what<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* guest EL3 firmware would really expect=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_prop_set_bit(DEVICE(&amp;s-&gt;cpus[=
i]), &quot;start-powered-off&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0i &gt; 0);<br>
<br>
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c<br>
index e7963822367..68fe9182414 100644<br>
--- a/hw/arm/orangepi.c<br>
+++ b/hw/arm/orangepi.c<br>
@@ -105,6 +105,7 @@ static void orangepi_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0orangepi_binfo.loader_start =3D h3-&gt;memmap[AW_H3_DEV=
_SDRAM];<br>
=C2=A0 =C2=A0 =C2=A0orangepi_binfo.ram_size =3D machine-&gt;ram_size;<br>
+=C2=A0 =C2=A0 orangepi_binfo.psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;<br>
=C2=A0 =C2=A0 =C2=A0arm_load_kernel(ARM_CPU(first_cpu), machine, &amp;orang=
epi_binfo);<br>
=C2=A0}<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--00000000000024666105d6d44a5b--

