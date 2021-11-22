Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FC458EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:56:34 +0100 (CET)
Received: from localhost ([::1]:35190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8s5-0005Ya-Pb
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:56:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chengjiayao@bytedance.com>)
 id 1mp8p3-0001tB-Gq
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:53:25 -0500
Received: from [2607:f8b0:4864:20::22d] (port=40740
 helo=mail-oi1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chengjiayao@bytedance.com>)
 id 1mp8ox-00028w-KM
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:53:23 -0500
Received: by mail-oi1-x22d.google.com with SMTP id bk14so37597563oib.7
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:mime-version:references:in-reply-to:date:message-id:subject:to
 :cc; bh=iEKeutyuRojImPfX3tpuE5/a3xK/y9+VUi0u2zFT01k=;
 b=QRH6rZ0wlExU2kCY+CZRDHmQtEYwcF8aNPJ4D7ZwaXz9A4bEfEXCiZg2RTE/VFS/bM
 bd/whSMIAoofWV3WXQTrU/yQ+QabAgmEC4sDWHQ52YNnk/GVHcpmqPfN72kydrukCp2z
 r/VLoWabnSXiKKDH5r3eTH1KM82rho6v0WIPWp/VbPMM27YxpqFhvDpletdxKPdW01N7
 yZZ/X/WmoKtNC2O1eUoBWMfZxM1XKdvdPNhEXl7lo6vKeubXNhWyI7UrByCrnGAs103e
 HUdI9NSTBPmvq21Q5DBJnl19+7MrbGdw94DMEoTPILquCJTpFoTFXfE3BO5eYQkc+7Ap
 GTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:mime-version:references:in-reply-to:date
 :message-id:subject:to:cc;
 bh=iEKeutyuRojImPfX3tpuE5/a3xK/y9+VUi0u2zFT01k=;
 b=sOJbte4QIUG1J6ekKO2CyuNFezDRf78U3ZJ5oFVCWTl7PHljD2Jrqn2U1vDFnjTP0m
 lXz3kB5bm9q9hDtOu+2r8OAbjX4lSeW0yNbNU/650lANYqbQR1AUvtHrqdBEBD1CMtkp
 YOhEi/sWrbVpxBsB7iXWJSmw0vULpBsSyMw2JDTSqtRfgPWg6ydP8RBOtAVDvB2ZVn0k
 FoEjsBHDDNwU8YTBG2dmXHpNgbzdo1/5HDRuZ9bcoeB0Afi1TYrjDw0rs7EvewVMW9kH
 4ltVpJ/CmOjQGEFKGiLyCDWGArzD0AWgSrtUoAqhIrcbWofTTdTMziCdOQ58e+r9k8d0
 QLIg==
X-Gm-Message-State: AOAM533dS/UfafbooQh6mQM0XAjyY8lfhrlu9SFMGbvoGvaq73CZPqYK
 VRUR0Qqk0Q8DwsqULVK4GioiK5tBUVQLxEY1DDS8XWxdUA==
X-Google-Smtp-Source: ABdhPJywkoLb1D5CZDw13376FMHm6Rqmfm4IKDy+i3xU934fGGTR+WljjorW8SoaKmiuxlmGygt+m56GxIDiXfanLy4=
X-Received: by 2002:a17:90b:8d6:: with SMTP id
 ds22mr31343533pjb.194.1637585246292; 
 Mon, 22 Nov 2021 04:47:26 -0800 (PST)
Received: from 349319672217 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Nov 2021 06:47:25 -0600
From: Jade Cheng <chengjiayao@bytedance.com>
Mime-Version: 1.0
References: <20210630082551.12956-1-chengjiayao@bytedance.com>
 <20210726210018.bfpd7rpnatw5377z@habkost.net>
In-Reply-To: <20210726210018.bfpd7rpnatw5377z@habkost.net>
Date: Mon, 22 Nov 2021 06:47:25 -0600
Message-ID: <CAACWsD_21mjmu2uJB=ZLjE6sN7c-31q6OrrMbrrN7bO0Q4AyCw@mail.gmail.com>
Subject: Re: [PATCH] Fix CPUID_Fn8000001E_EBX for AMD
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e56dc105d16006e6"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=chengjiayao@bytedance.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 pizhenwei@bytedance.com, Babu Moger <babu.moger@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e56dc105d16006e6
Content-Type: text/plain; charset="UTF-8"

Sorry for this really late response due to some personal stuff.
Thanks to Eduardo for clarifying, and yes, this fix is to make the bits 7:0
in Fn8000_001E_EBX be physical core_id per package/socket, instead for what
used to be physical core_id per die.
When topo for vm is like: sockets=1, dies=8, cores=8
Before this fix, the bits 7:0 in Fn8000_001E_EBX are:
Socket_0 { die_0 {0-7}, die_1 {0-7}, ..., die_7 {0-7}}
With this patch, the last 8 bits becomes:
Socket_0 {die_0 {0-7}, die_1 {8-15}, ..., die_7 {56-63}}
Now, the new CPUID is in the same logical state as what it be in a physical
machine, which makes me believe this fix is necessary.
On Tue, Jul 27, 2021, 05:00 <ehabkost@redhat.com> wrote:
CCing the original author of that code (Babu Moger). On Wed, Jun 30, 2021
at 04:25:51PM +0800, Jade Cheng wrote: > According to AMD64 Arch
Programmer's Manual Appendix D, > bits 7:0 in Fn8000_001E_EBX should be
physical core(s) per logical processor, not per die. Do you mean physical
cores per package/socket? > > Signed-off-by: Jade Cheng Do you have a
pointer to the specific paragraph of the documentation that states that?
https://www.amd.com/system/files/TechDocs/24594.pdf page 634 says: CPUID
Fn8000_001E_EBX Compute Unit Identifiers [...] 7:0 ComputeUnitId Compute
unit ID. Identifies a Compute Unit, which may be one or more physical cores
that each implement one or more logical processors I don't see any content
referencing physical cores per logical processor, or physical cores per
package/socket. Which problem are you trying to fix here? > --- >
target/i386/cpu.c | 8 +++++++- > 1 file changed, 7 insertions(+), 1
deletion(-) > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c > index
a9fe1662d3..417f5ba81f 100644 > --- a/target/i386/cpu.c > +++
b/target/i386/cpu.c > @@ -381,7 +381,13 @@ static void
encode_topo_cpuid8000001e(X86CPU *cpu, X86CPUTopoInfo *topo_info, > * NOTE:
CoreId is already part of apic_id. Just use it. We can > * use all the 8
bits to represent the core_id here. > */ > - *ebx =
((topo_info->threads_per_core - 1) << 8) | (topo_ids.core_id & 0xFF); > +
uint32_t core_id = topo_ids.core_id; > + > + if (IS_AMD_CPU(&cpu->env)) { >
+ core_id = topo_ids.core_id + topo_ids.die_id * topo_info->cores_per_die;
> + } > + > + *ebx = ((topo_info->threads_per_core - 1) << 8) | (core_id &
0xFF); > > /* > * CPUID_Fn8000001E_ECX [Node Identifiers] (NodeId) > -- >
2.24.3 (Apple Git-128) > -- Eduardo

--000000000000e56dc105d16006e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta></head><body><div style=3D"white-space:pre-wrap">Sorry fo=
r this really late response due to some personal stuff.
</div><div style=3D"white-space:pre-wrap">
</div><div style=3D"white-space:pre-wrap">Thanks to Eduardo for clarifying,=
 and yes, this fix is to make the <span style=3D"font-weight:400"><span sty=
le=3D"font-size:14px"><span style=3D"font-family:LarkEmojiFont,LarkChineseQ=
uote,-apple-system,system-ui,Tahoma,Arial,sans-serif"><span style=3D"color:=
rgb(31,35,41)"><span style=3D"background-color:rgb(255,255,255)">bits 7:0 i=
n Fn8000_001E_EBX be physical core_id per package/socket, instead for what =
used to be physical core_id per die.</span></span></span></span></span>
</div><div style=3D"white-space:pre-wrap">
</div><div style=3D"white-space:pre-wrap"><span style=3D"font-weight:400"><=
span style=3D"font-size:14px"><span style=3D"font-family:LarkEmojiFont,Lark=
ChineseQuote,-apple-system,system-ui,Tahoma,Arial,sans-serif"><span style=
=3D"color:rgb(31,35,41)"><span style=3D"background-color:rgb(255,255,255)">=
When topo for vm is like: </span></span></span></span></span> sockets=3D1, =
dies=3D8, cores=3D8
</div><div style=3D"white-space:pre-wrap">Before this fix, the <span style=
=3D"font-weight:400"><span style=3D"font-size:14px"><span style=3D"font-fam=
ily:LarkEmojiFont,LarkChineseQuote,-apple-system,system-ui,Tahoma,Arial,san=
s-serif"><span style=3D"color:rgb(31,35,41)"><span style=3D"background-colo=
r:rgb(255,255,255)">bits 7:0 in Fn8000_001E_EBX are:</span></span></span></=
span></span>
</div><div style=3D"white-space:pre-wrap">Socket_0 { die_0 {0-7},  die_1 {0=
-7}, ..., die_7 {0-7}}
</div><div style=3D"white-space:pre-wrap">With this patch, the last 8 bits =
becomes:
</div><div style=3D"white-space:pre-wrap">Socket_0 {die_0 {0-7}, die_1 {8-1=
5}, ..., die_7 {56-63}}
</div><div style=3D"white-space:pre-wrap">Now, the new CPUID is in the same=
 logical state as what it be in a physical machine, which makes me believe =
this fix is necessary.
</div><div style=3D"list-style-position:inside" id=3D"lark-mail-quote-16375=
8524"><div style=3D"margin:12px 0px 0px;padding-left:12px;border-left:0.5px=
 solid rgb(187,191,196)" class=3D"adit-html-block ignore-collect adit-html-=
block--collapsed"><div><div id=3D"lark-mail-quote-246302b48c3ab837295509606=
4d5f212"><div style=3D"color:rgb(187,191,196)" class=3D"adit-html-block__at=
tr">On Tue, Jul 27, 2021, 05:00 &lt;<a rel=3D"nofollow noopener noreferrer"=
 style=3D"white-space:pre-wrap;word-break:break-word;text-decoration:none;c=
olor:rgb(51,112,255)" href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.c=
om</a>&gt; wrote:</div><div style=3D"margin-top:8px"><div style=3D"white-sp=
ace:pre-wrap"><span>CCing the original author of that code (Babu Moger).

On Wed, Jun 30, 2021 at 04:25:51PM +0800, Jade Cheng wrote:
&gt; According to AMD64 Arch Programmer&#39;s Manual Appendix D,
&gt; bits 7:0 in Fn8000_001E_EBX should be physical core(s) per logical pro=
cessor, not per die.

Do you mean physical cores per package/socket?

&gt;=20
&gt; Signed-off-by: Jade Cheng=20

Do you have a pointer to the specific paragraph of the
documentation that states that?

<a href=3D"https://www.amd.com/system/files/TechDocs/24594.pdf" target=3D"_=
blank">https://www.amd.com/system/files/TechDocs/24594.pdf</a>
page 634 says:

  CPUID Fn8000_001E_EBX Compute Unit Identifiers
  [...]
  7:0 ComputeUnitId Compute unit ID. Identifies a Compute Unit,
                    which may be one or more physical cores that each imple=
ment
                    one or more logical processors

I don&#39;t see any content referencing physical cores per logical
processor, or physical cores per package/socket.

Which problem are you trying to fix here?


&gt; ---
&gt;  target/i386/cpu.c | 8 +++++++-
&gt;  1 file changed, 7 insertions(+), 1 deletion(-)
&gt;=20
&gt; diff --git a/target/i386/cpu.c b/target/i386/cpu.c
&gt; index a9fe1662d3..417f5ba81f 100644
&gt; --- a/target/i386/cpu.c
&gt; +++ b/target/i386/cpu.c
&gt; @@ -381,7 +381,13 @@ static void encode_topo_cpuid8000001e(X86CPU *cpu=
, X86CPUTopoInfo *topo_info,
&gt;       *  NOTE: CoreId is already part of apic_id. Just use it. We can
&gt;       *  use all the 8 bits to represent the core_id here.
&gt;       */
&gt; -    *ebx =3D ((topo_info-&gt;threads_per_core - 1) &lt;&lt; 8) | (top=
o_ids.core_id &amp; 0xFF);
&gt; +    uint32_t core_id =3D topo_ids.core_id;
&gt; +
&gt; +    if (IS_AMD_CPU(&amp;cpu-&gt;env)) {
&gt; +        core_id =3D topo_ids.core_id + topo_ids.die_id * topo_info-&g=
t;cores_per_die;
&gt; +    }
&gt; +
&gt; +    *ebx =3D ((topo_info-&gt;threads_per_core - 1) &lt;&lt; 8) | (cor=
e_id &amp; 0xFF);
&gt; =20
&gt;      /*
&gt;       * CPUID_Fn8000001E_ECX [Node Identifiers] (NodeId)
&gt; --=20
&gt; 2.24.3 (Apple Git-128)
&gt;=20

--=20
Eduardo</span></div></div></div></div></div></div></body></html>

--000000000000e56dc105d16006e6--

