Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD074B204E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 09:41:34 +0100 (CET)
Received: from localhost ([::1]:38726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIRUh-0003xs-Bi
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 03:41:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1nIR46-0007Wj-ES; Fri, 11 Feb 2022 03:14:02 -0500
Received: from rn-mailsvcp-ppex-lapp35.rno.apple.com ([17.179.253.44]:50956
 helo=rn-mailsvcp-ppex-lapp35.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>)
 id 1nIR43-00066z-M8; Fri, 11 Feb 2022 03:14:02 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp35.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp35.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 21B85olK018265; Fri, 11 Feb 2022 00:13:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=20180706; bh=iZyi4xXuF3PPPzSZuRL8OFv9T9UNlpEcXPpOevnd0js=;
 b=P7rev9NlfolzM5mELDcSe4wWxH0AKxYo5eKLc+uczyjk4HIzSf9HdOtaz9qCTqvnds7w
 b7pGIq/OskHiQVO3u/dUIQAs4JTuMP8ZE35Yj0zpD9WcHuqYmOmymuv83Y4NBtZ6zkQk
 a1FIhWGGKv5hWhZrbMaL/mW40cW7ZgxImMjsddiiy58F86pQCF7Md9P3lxAD1ZIuyScF
 hy1AqyyAa2DI6A6ePJjfX/2337PmxksXC1Pa6iG+U6dFhEaJ6rUUwAW0ypqI3BT2vCok
 5jywKC50c6BB3g0ACl88HrONMDexk7VxR2aiHMItsxnTOEDXMqzsYiru+aCv82tPWr+c yg== 
Received: from rn-mailsvcp-mta-lapp04.rno.apple.com
 (rn-mailsvcp-mta-lapp04.rno.apple.com [10.225.203.152])
 by rn-mailsvcp-ppex-lapp35.rno.apple.com with ESMTP id 3e1nnancb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Fri, 11 Feb 2022 00:13:47 -0800
Received: from rn-mailsvcp-mmp-lapp04.rno.apple.com
 (rn-mailsvcp-mmp-lapp04.rno.apple.com [17.179.253.17])
 by rn-mailsvcp-mta-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R7400TB2S6Y3500@rn-mailsvcp-mta-lapp04.rno.apple.com>; 
 Fri, 11 Feb 2022 00:13:46 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp04.rno.apple.com by
 rn-mailsvcp-mmp-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R7400C00RKB3500@rn-mailsvcp-mmp-lapp04.rno.apple.com>; Fri,
 11 Feb 2022 00:13:46 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 36ada07b7a139d1d8d110642d73fd830
X-Va-E-CD: 1e5226b2a545567d0e6b6d4dd8f881bb
X-Va-R-CD: f485095505b245ac501be825f1a226b6
X-Va-CD: 0
X-Va-ID: 978f8608-730a-4f91-b925-a86647a4847c
X-V-A: 
X-V-T-CD: 36ada07b7a139d1d8d110642d73fd830
X-V-E-CD: 1e5226b2a545567d0e6b6d4dd8f881bb
X-V-R-CD: f485095505b245ac501be825f1a226b6
X-V-CD: 0
X-V-ID: 4c4158fc-6748-4fc1-ae9a-705a94974a36
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-11_02:2022-02-09,
 2022-02-11 signatures=0
Received: from smtpclient.apple ([17.149.237.74])
 by rn-mailsvcp-mmp-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R740050TS6WV700@rn-mailsvcp-mmp-lapp04.rno.apple.com>; Fri,
 11 Feb 2022 00:13:45 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
Message-id: <5E67FE9D-C7A3-463D-B1EF-9D80E076C839@apple.com>
Content-type: multipart/alternative;
 boundary="Apple-Mail=_F3A54FC7-D6CF-41D0-951A-83052767C38C"
MIME-version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v3 1/2] hvf: arm: Use macros for sysreg shift/masking
Date: Fri, 11 Feb 2022 00:13:44 -0800
In-reply-to: <20220209124135.69183-1-agraf@csgraf.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Ivan Babrou <ivan@cloudflare.com>
To: Alexander Graf <agraf@csgraf.de>
References: <20220209124135.69183-1-agraf@csgraf.de>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-11_02:2022-02-09,
 2022-02-11 signatures=0
Received-SPF: pass client-ip=17.179.253.44; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp35.apple.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--Apple-Mail=_F3A54FC7-D6CF-41D0-951A-83052767C38C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

LGTM

Reviewed-by: Cameron Esfahani <dirty@apple.com <mailto:dirty@apple.com>>

Cameron

> On Feb 9, 2022, at 4:41 AM, Alexander Graf <agraf@csgraf.de> wrote:
>=20
> We are parsing the syndrome field for sysregs in multiple places =
across
> the hvf code, but repeat shift/mask operations with hard coded =
constants
> every time. This is an error prone approach and makes it harder to =
reason
> about the correctness of these operations.
>=20
> Let's introduce macros that allow us to unify the constants used as =
well
> as create new helpers to extract fields from the sysreg value.
>=20
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
> target/arm/hvf/hvf.c | 69 ++++++++++++++++++++++++++++++--------------
> 1 file changed, 47 insertions(+), 22 deletions(-)
>=20
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 92ad0d29c4..8d0447ab01 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -35,9 +35,34 @@
>         ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, =
op2)
> #define PL1_WRITE_MASK 0x4
>=20
> +#define SYSREG_OP0_SHIFT      20
> +#define SYSREG_OP0_MASK       0x3
> +#define SYSREG_OP0(sysreg)    ((sysreg >> SYSREG_OP0_SHIFT) & =
SYSREG_OP0_MASK)
> +#define SYSREG_OP1_SHIFT      14
> +#define SYSREG_OP1_MASK       0x7
> +#define SYSREG_OP1(sysreg)    ((sysreg >> SYSREG_OP1_SHIFT) & =
SYSREG_OP1_MASK)
> +#define SYSREG_CRN_SHIFT      10
> +#define SYSREG_CRN_MASK       0xf
> +#define SYSREG_CRN(sysreg)    ((sysreg >> SYSREG_CRN_SHIFT) & =
SYSREG_CRN_MASK)
> +#define SYSREG_CRM_SHIFT      1
> +#define SYSREG_CRM_MASK       0xf
> +#define SYSREG_CRM(sysreg)    ((sysreg >> SYSREG_CRM_SHIFT) & =
SYSREG_CRM_MASK)
> +#define SYSREG_OP2_SHIFT      17
> +#define SYSREG_OP2_MASK       0x7
> +#define SYSREG_OP2(sysreg)    ((sysreg >> SYSREG_OP2_SHIFT) & =
SYSREG_OP2_MASK)
> +
> #define SYSREG(op0, op1, crn, crm, op2) \
> -    ((op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (crm << =
1))
> -#define SYSREG_MASK           SYSREG(0x3, 0x7, 0xf, 0xf, 0x7)
> +    ((op0 << SYSREG_OP0_SHIFT) | \
> +     (op1 << SYSREG_OP1_SHIFT) | \
> +     (crn << SYSREG_CRN_SHIFT) | \
> +     (crm << SYSREG_CRM_SHIFT) | \
> +     (op2 << SYSREG_OP2_SHIFT))
> +#define SYSREG_MASK \
> +    SYSREG(SYSREG_OP0_MASK, \
> +           SYSREG_OP1_MASK, \
> +           SYSREG_CRN_MASK, \
> +           SYSREG_CRM_MASK, \
> +           SYSREG_OP2_MASK)
> #define SYSREG_OSLAR_EL1      SYSREG(2, 0, 1, 0, 4)
> #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
> #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
> @@ -783,21 +808,21 @@ static int hvf_sysreg_read(CPUState *cpu, =
uint32_t reg, uint32_t rt)
>     default:
>         cpu_synchronize_state(cpu);
>         trace_hvf_unhandled_sysreg_read(env->pc, reg,
> -                                        (reg >> 20) & 0x3,
> -                                        (reg >> 14) & 0x7,
> -                                        (reg >> 10) & 0xf,
> -                                        (reg >> 1) & 0xf,
> -                                        (reg >> 17) & 0x7);
> +                                        SYSREG_OP0(reg),
> +                                        SYSREG_OP1(reg),
> +                                        SYSREG_CRN(reg),
> +                                        SYSREG_CRM(reg),
> +                                        SYSREG_OP2(reg));
>         hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
>         return 1;
>     }
>=20
>     trace_hvf_sysreg_read(reg,
> -                          (reg >> 20) & 0x3,
> -                          (reg >> 14) & 0x7,
> -                          (reg >> 10) & 0xf,
> -                          (reg >> 1) & 0xf,
> -                          (reg >> 17) & 0x7,
> +                          SYSREG_OP0(reg),
> +                          SYSREG_OP1(reg),
> +                          SYSREG_CRN(reg),
> +                          SYSREG_CRM(reg),
> +                          SYSREG_OP2(reg),
>                           val);
>     hvf_set_reg(cpu, rt, val);
>=20
> @@ -886,11 +911,11 @@ static int hvf_sysreg_write(CPUState *cpu, =
uint32_t reg, uint64_t val)
>     CPUARMState *env =3D &arm_cpu->env;
>=20
>     trace_hvf_sysreg_write(reg,
> -                           (reg >> 20) & 0x3,
> -                           (reg >> 14) & 0x7,
> -                           (reg >> 10) & 0xf,
> -                           (reg >> 1) & 0xf,
> -                           (reg >> 17) & 0x7,
> +                           SYSREG_OP0(reg),
> +                           SYSREG_OP1(reg),
> +                           SYSREG_CRN(reg),
> +                           SYSREG_CRM(reg),
> +                           SYSREG_OP2(reg),
>                            val);
>=20
>     switch (reg) {
> @@ -960,11 +985,11 @@ static int hvf_sysreg_write(CPUState *cpu, =
uint32_t reg, uint64_t val)
>     default:
>         cpu_synchronize_state(cpu);
>         trace_hvf_unhandled_sysreg_write(env->pc, reg,
> -                                         (reg >> 20) & 0x3,
> -                                         (reg >> 14) & 0x7,
> -                                         (reg >> 10) & 0xf,
> -                                         (reg >> 1) & 0xf,
> -                                         (reg >> 17) & 0x7);
> +                                         SYSREG_OP0(reg),
> +                                         SYSREG_OP1(reg),
> +                                         SYSREG_CRN(reg),
> +                                         SYSREG_CRM(reg),
> +                                         SYSREG_OP2(reg));
>         hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
>         return 1;
>     }
> --=20
> 2.32.0 (Apple Git-132)
>=20


--Apple-Mail=_F3A54FC7-D6CF-41D0-951A-83052767C38C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><div =
class=3D"">LGTM</div><div class=3D""><br class=3D""></div>Reviewed-by: =
Cameron Esfahani &lt;<a href=3D"mailto:dirty@apple.com" =
class=3D"">dirty@apple.com</a>&gt;<div class=3D""><br =
class=3D""></div><div class=3D"">Cameron<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Feb =
9, 2022, at 4:41 AM, Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de"=
 class=3D"">agraf@csgraf.de</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">We =
are parsing the syndrome field for sysregs in multiple places across<br =
class=3D"">the hvf code, but repeat shift/mask operations with hard =
coded constants<br class=3D"">every time. This is an error prone =
approach and makes it harder to reason<br class=3D"">about the =
correctness of these operations.<br class=3D""><br class=3D"">Let's =
introduce macros that allow us to unify the constants used as well<br =
class=3D"">as create new helpers to extract fields from the sysreg =
value.<br class=3D""><br class=3D"">Suggested-by: Peter Maydell &lt;<a =
href=3D"mailto:peter.maydell@linaro.org" =
class=3D"">peter.maydell@linaro.org</a>&gt;<br class=3D"">Signed-off-by: =
Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de" =
class=3D"">agraf@csgraf.de</a>&gt;<br class=3D"">---<br class=3D""> =
target/arm/hvf/hvf.c | 69 =
++++++++++++++++++++++++++++++--------------<br class=3D""> 1 file =
changed, 47 insertions(+), 22 deletions(-)<br class=3D""><br =
class=3D"">diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c<br =
class=3D"">index 92ad0d29c4..8d0447ab01 100644<br class=3D"">--- =
a/target/arm/hvf/hvf.c<br class=3D"">+++ b/target/arm/hvf/hvf.c<br =
class=3D"">@@ -35,9 +35,34 @@<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ENCODE_AA64_CP_REG(CP_REG_=
ARM64_SYSREG_CP, crn, crm, op0, op1, op2)<br class=3D""> #define =
PL1_WRITE_MASK 0x4<br class=3D""><br class=3D"">+#define =
SYSREG_OP0_SHIFT &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;20<br class=3D"">+#define =
SYSREG_OP0_MASK &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x3<br =
class=3D"">+#define SYSREG_OP0(sysreg) &nbsp;&nbsp;&nbsp;((sysreg =
&gt;&gt; SYSREG_OP0_SHIFT) &amp; SYSREG_OP0_MASK)<br class=3D"">+#define =
SYSREG_OP1_SHIFT &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14<br class=3D"">+#define =
SYSREG_OP1_MASK &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x7<br =
class=3D"">+#define SYSREG_OP1(sysreg) &nbsp;&nbsp;&nbsp;((sysreg =
&gt;&gt; SYSREG_OP1_SHIFT) &amp; SYSREG_OP1_MASK)<br class=3D"">+#define =
SYSREG_CRN_SHIFT &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10<br class=3D"">+#define =
SYSREG_CRN_MASK &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0xf<br =
class=3D"">+#define SYSREG_CRN(sysreg) &nbsp;&nbsp;&nbsp;((sysreg =
&gt;&gt; SYSREG_CRN_SHIFT) &amp; SYSREG_CRN_MASK)<br class=3D"">+#define =
SYSREG_CRM_SHIFT &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1<br class=3D"">+#define =
SYSREG_CRM_MASK &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0xf<br =
class=3D"">+#define SYSREG_CRM(sysreg) &nbsp;&nbsp;&nbsp;((sysreg =
&gt;&gt; SYSREG_CRM_SHIFT) &amp; SYSREG_CRM_MASK)<br class=3D"">+#define =
SYSREG_OP2_SHIFT &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;17<br class=3D"">+#define =
SYSREG_OP2_MASK &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x7<br =
class=3D"">+#define SYSREG_OP2(sysreg) &nbsp;&nbsp;&nbsp;((sysreg =
&gt;&gt; SYSREG_OP2_SHIFT) &amp; SYSREG_OP2_MASK)<br class=3D"">+<br =
class=3D""> #define SYSREG(op0, op1, crn, crm, op2) \<br class=3D"">- =
&nbsp;&nbsp;&nbsp;((op0 &lt;&lt; 20) | (op2 &lt;&lt; 17) | (op1 &lt;&lt; =
14) | (crn &lt;&lt; 10) | (crm &lt;&lt; 1))<br class=3D"">-#define =
SYSREG_MASK =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYSREG(0x3, =
0x7, 0xf, 0xf, 0x7)<br class=3D"">+ &nbsp;&nbsp;&nbsp;((op0 &lt;&lt; =
SYSREG_OP0_SHIFT) | \<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;(op1 =
&lt;&lt; SYSREG_OP1_SHIFT) | \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;(crn &lt;&lt; SYSREG_CRN_SHIFT) | \<br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;(crm &lt;&lt; SYSREG_CRM_SHIFT) | =
\<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;(op2 &lt;&lt; =
SYSREG_OP2_SHIFT))<br class=3D"">+#define SYSREG_MASK \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;SYSREG(SYSREG_OP0_MASK, \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYSREG_OP1_MAS=
K, \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYSREG_CRN_MAS=
K, \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYSREG_CRM_MAS=
K, \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYSREG_OP2_MAS=
K)<br class=3D""> #define SYSREG_OSLAR_EL1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYSREG(2, 0, 1, 0, 4)<br class=3D""> =
#define SYSREG_OSLSR_EL1 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYSREG(2, 0, 1, =
1, 4)<br class=3D""> #define SYSREG_OSDLR_EL1 =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SYSREG(2, 0, 1, 3, 4)<br class=3D"">@@ =
-783,21 +808,21 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t =
reg, uint32_t rt)<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;default:<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpu_synchronize_state(cpu)=
;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_hvf_unhandled_sysreg=
_read(env-&gt;pc, reg,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;(reg &gt;&gt; 20) &amp; 0x3,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;(reg &gt;&gt; 14) &amp; 0x7,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;(reg &gt;&gt; 10) &amp; 0xf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;(reg &gt;&gt; 1) &amp; 0xf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;(reg &gt;&gt; 17) &amp; 0x7);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;SYSREG_OP0(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;SYSREG_OP1(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;SYSREG_CRN(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;SYSREG_CRM(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;SYSREG_OP2(reg));<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hvf_raise_exception(cpu, =
EXCP_UDEF, syn_uncategorized());<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 1;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;trace_hvf_sysreg_read(reg,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;(reg &gt;&gt; 20) &amp; 0x3,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;(reg &gt;&gt; 14) &amp; 0x7,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;(reg &gt;&gt; 10) &amp; 0xf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;(reg &gt;&gt; 1) &amp; 0xf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;(reg &gt;&gt; 17) &amp; 0x7,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;SYSREG_OP0(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;SYSREG_OP1(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;SYSREG_CRN(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;SYSREG_CRM(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;SYSREG_OP2(reg),<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;val);<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;hvf_set_reg(cpu, =
rt, val);<br class=3D""><br class=3D"">@@ -886,11 +911,11 @@ static int =
hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)<br class=3D"">=
 &nbsp;&nbsp;&nbsp;&nbsp;CPUARMState *env =3D &amp;arm_cpu-&gt;env;<br =
class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;trace_hvf_sysreg_write(reg,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;(reg &gt;&gt; 20) &amp; 0x3,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;(reg &gt;&gt; 14) &amp; 0x7,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;(reg &gt;&gt; 10) &amp; 0xf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;(reg &gt;&gt; 1) &amp; 0xf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;(reg &gt;&gt; 17) &amp; 0x7,<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;SYSREG_OP0(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;SYSREG_OP1(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;SYSREG_CRN(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;SYSREG_CRM(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;SYSREG_OP2(reg),<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;val);<br class=3D""><br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;switch (reg) {<br class=3D"">@@ -960,11 +985,11 =
@@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t =
val)<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;default:<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;cpu_synchronize_state(cpu)=
;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace_hvf_unhandled_sysreg=
_write(env-&gt;pc, reg,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;(reg &gt;&gt; 20) &amp; 0x3,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;(reg &gt;&gt; 14) &amp; 0x7,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;(reg &gt;&gt; 10) &amp; 0xf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;(reg &gt;&gt; 1) &amp; 0xf,<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;(reg &gt;&gt; 17) &amp; 0x7);<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;SYSREG_OP0(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;SYSREG_OP1(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;SYSREG_CRN(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;SYSREG_CRM(reg),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;SYSREG_OP2(reg));<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hvf_raise_exception(cpu, =
EXCP_UDEF, syn_uncategorized());<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return 1;<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;}<br class=3D"">-- <br class=3D"">2.32.0 (Apple =
Git-132)<br class=3D""><br class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_F3A54FC7-D6CF-41D0-951A-83052767C38C--

