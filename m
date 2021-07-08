Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9B3C1429
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 15:21:42 +0200 (CEST)
Received: from localhost ([::1]:33152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TyH-0000EW-VF
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 09:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1m1TmH-0006QI-Lf
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:09:22 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:33725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1m1Tm9-0000AL-VV
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 09:09:15 -0400
Received: by mail-il1-x12b.google.com with SMTP id z1so6596112ils.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:references:in-reply-to:date:message-id:subject:to
 :cc; bh=ShKka9bxuNj7WrezuupI2ojAcS8C4cMjQjLq4e7n4tA=;
 b=Gy4bcEvtM+fJ3VTaeU7MOTahhdQ06fNqrKs/30vFPCMPN7lEkDu6ZsS0+jABSmQS6K
 59FJSc82EMCVbRwYau+P/P2WK4ZfYvl5WF/BaUXrAQwR6+gGvk4UV5I/zA7MCKf52W5M
 XvWLSitAnvKaK5WaV/KsSU60U9gfMRhV07uYdZo8/bwQodYGolh1g8Z6xNuqxDurcmbN
 igHHeEa7IjI5s1uHpJGRS6pmEeO30YvWyUebjbE449n8gZIaG/d1UYTxVJfsWWOXpUbJ
 3AzCEQeVIJm85WhoVzF/0hhVKd/aB0fh46zKY9gjjQvPJjhX/QRqWmRs3F7LtRJsWJ38
 nPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:references:in-reply-to:date
 :message-id:subject:to:cc;
 bh=ShKka9bxuNj7WrezuupI2ojAcS8C4cMjQjLq4e7n4tA=;
 b=gpUALHw1TPRLdLZF0n+ut42hNKMkvA0K/VMibfN+ijHv232o6R0rGAgjCt6w9HbUbn
 c4Bl5Wl7Ebm9frOSvWwSOqY15Cjhmf6Qm/u//+/du6L1sbWJXGxGl3yTyug00LEgbg6V
 0Wu6y3HpHWdwoe4pYbZI9GTSZtydxi1ATEbpijbpBZXG2mEZYDJTsvPbTXtlPjwbPbR7
 zAnx/kBk3ldWTHbf/3IJFZBDOb7sbMu6aITZ0BLnNrvsvi0Qie0DNzWCaBYCK4OX4Exa
 TqCoi4wsWz0OibfxWZNw4v1stKAWtZA61r8k7IFKrdtACLCb14X+LGvfFvH5X+shKfdm
 LSOw==
X-Gm-Message-State: AOAM533Be8ZxsYRVjAuq0P+BMes3TxJTd/8s0YSMVz0GkLXWkx1DFv09
 Vkjvc5Jirg8tLfyX4VPLfqilftP7X+RUxcAq4ot2+Q==
X-Google-Smtp-Source: ABdhPJzO4qjSVro8Ky+N9W36c7t4WrKZem3GuG0RNVlXS5YO2+O7LdPNCfXKBBmwPIWAcpX+xDk6uQvvDBwpoLJ07Qg=
X-Received: by 2002:a92:cec5:: with SMTP id z5mr1184800ilq.226.1625749747033; 
 Thu, 08 Jul 2021 06:09:07 -0700 (PDT)
Received: from 349319672217 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 13:09:06 +0000
From: =?UTF-8?B?55qu5oyv5Lyf?= <pizhenwei@bytedance.com>
Mime-Version: 1.0
References: <20210628132018.394994-1-pizhenwei@bytedance.com>
 <YNsoyqFvzXL0FXC8@work-vm> <162508068941.526217.2563710865841096339@amd.com>
 <20210701104313.5b64a9b4@redhat.com>
 <162517174973.564224.1039189315728194554@amd.com>
 <2952f218-f391-36d5-6331-006d9312cc66@bytedance.com>
 <20210702154322.x2rwhcx7vwg226bx@amd.com>
 <20210702173534.qy7yd4uievvhwave@habkost.net>
 <162572111635.19908.4278294895739120232@amd.com>
In-Reply-To: <162572111635.19908.4278294895739120232@amd.com>
Date: Thu, 8 Jul 2021 13:09:06 +0000
Message-ID: <CABoGonL1-C-puDa-yKfwnviFHAN9CB6cx9bjf4iOZYFyByc1dQ@mail.gmail.com>
Subject: Re: Re: [PATCH] target/i386: Fix cpuid level for AMD
To: Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="0000000000002a8f2405c69c5c8a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=pizhenwei@bytedance.com; helo=mail-il1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, like.xu@linux.intel.com,
 wei.huang2@amd.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 armbru@redhat.com, babu.moger@amd.com, Igor Mammedov <imammedo@redhat.com>,
 pbonzini@redhat.com, philmd@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002a8f2405c69c5c8a
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021, 13:12 <michael.roth@amd.com> wrote:
Quoting Eduardo Habkost (2021-07-02 12:35:34) > On Fri, Jul 02, 2021 at
10:43:22AM -0500, Michael Roth wrote: > > On Fri, Jul 02, 2021 at
01:14:56PM +0800, zhenwei pi wrote: > > > On 7/2/21 4:35 AM, Michael Roth
wrote: > > > > Quoting Igor Mammedov (2021-07-01 03:43:13) > > > > > On
Wed, 30 Jun 2021 14:18:09 -0500 > > > > > Michael Roth <michael.roth@amd.com>
wrote: > > > > > > > > > > > Quoting Dr. David Alan Gilbert (2021-06-29
09:06:02) > > > > > > > * zhenwei pi (pizhenwei@bytedance.com) wrote: > > >
> > > > > A AMD server typically has cpuid level 0x10(test on Rome/Milan),
it > > > > > > > > should not be changed to 0x1f in multi-dies case. > > >
> > > > > > > > > > > > > Fixes: a94e1428991 (target/i386: Add CPUID.1F
generation support > > > > > > > > for multi-dies PCMachine) > > > > > > >
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com> > > > > > > > > > > >
> > > (Copying in Babu) > > > > > > > > > > > > > > Hmm I think you're
right. I've cc'd in Babu and Wei. > > > > > > > > > > > > > > Eduardo: What
do we need to do about compatibility, do we need to wire > > > > > > > this
to machine type or CPU version? > > > > > > > > > > > > FWIW, there are
some other CPUID entries like leaves 2 and 4 that are > > > > > > also
Intel-specific. With SEV-SNP CPUID enforcement, advertising them to > > > >
> > guests will result in failures when host SNP firmware checks the > > >
> > > hypervisor-provided CPUID values against the host-supported ones. > >
> > > > > > > > > > To address this we've been planning to add an
'amd-cpuid-only' property > > > > > > to suppress them: > > > > > > > > > >
> >
https://github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b
> > > > > > > > > > > > My thinking is this property should be off by
default, and only defined > > > > > > either via explicit command-line
option, or via new CPU types. We're also > > > > > > planning to add new
CPU versions for EPYC* CPU types that set this > > > > > > 'amd-cpuid-only'
property by default: > > > > > > > > > > > >
https://github.com/mdroth/qemu/commits/new-cpu-types-upstream > > > > > It
look like having new cpu versions is enough to change behavior, > > > > >
maybe keep 'amd-cpuid-only' as internal field and not expose it to users >
> > > > as a property. > > > > > > > > Hmm, I defined it as a property
mainly to make use of > > > > X86CPUVersionDefinition.props to create new
versions of the CPU types > > > > with those properties set. > > > > > > >
> There's a patch there that adds X86CPUVersionDefinition.cache_info so > >
> > that new cache definitions can be provided for new CPU versions. So > >
> > would you suggest a similar approach here, e.g. adding an > > > >
X86CPUVersionDefinition.amd_cpuid_only field that could be used directly >
> > > rather than going through X86CPUVersionDefinition.props? > > > > > >
> > There's also another new "amd-xsave" prop in that series that does
something > > > > similar to "amd-cpuid-only", so a little worried about
tacking to much extra > > > > into X86CPUVersionDefinition. But maybe that
one could just be rolled into > > > > "amd-cpuid-only" since it is
basically fixing up xsave-related cpuid > > > > entries for AMD... > > > >
> > > Hi, this patch wants to fix the issue: > > > AMD CPU (Rome/Milan)
should get the cpuid level 0x10, not 0x1F in the guest. > > > If QEMU
reports a 0x1F to guest, guest(Linux) would use leaf 0x1F instead of > > >
leaf 0xB to get extended topology: > > > > > >
https://github.com/torvalds/linux/blob/master/arch/x86/kernel/cpu/topology.c#L49
> > > > > > static int detect_extended_topology_leaf(struct cpuinfo_x86 *c)
> > > { > > > if (c->cpuid_level >= 0x1f) { > > > if
(check_extended_topology_leaf(0x1f) == 0) > > > return 0x1f; > > > } > > >
> > > if (c->cpuid_level >= 0xb) { > > > if
(check_extended_topology_leaf(0xb) == 0) > > > return 0xb; > > > } > > > >
> > return -1; > > > } > > > > > > Because of the wrong cpuid level, the
guest gets unexpected topology from > > > leaf 0x1F. > > > > > > I tested
https://github.com/mdroth/qemu/commits/new-cpu-types-upstream, and > > > it
seems that these patches could not fix this issue. > > > > Yes, I think
your patch would still be needed. The question is whether it's > > okay to
change it for existing CPU types, e.g. EPYC-Milan, or only for new ones > >
when they set a certain flag/property, like the proposed "amd-cpuid-only"
(which > > the proposed EPYC-Milan-v2 would set). > > I tried to answer
this in a separate reply in this thread, but > answering here for
visibility: > > You can safely do it on existing CPU types, because the new
> behavior doesn't introduce host software or hardware requirements > when
enabled. You just need to disable the new behavior in >
MachineClass.compat_props for older machine types. Hi Eduardo, Thanks for
the suggestions. Since the CPUID changes no longer rely on adding new CPU
models, I've broken that out as a separate patch here based on your input:
https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg01679.html
Zhenwei, with the above patch I think you can change your patch to use: if
(!cpu->vendor_cpuid_only || IS_INTEL_CPU(env)) //add intel-specific range
Let me know if you want me to update and add to my series.
Sure, thanks a lot. > > -- > Eduardo > >

--0000000000002a8f2405c69c5c8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div id=3D"appVersion:=E9=A3=9E=E4=B9=A6-unknown-e=
ditorVersion:0.5.3"></div><div style=3D"margin:0px;padding:0px;min-height:a=
uto"><div style=3D"margin:0px;padding:0px;line-height:1.68"><div style=3D"m=
argin:0px;padding:0px;font-family:arial,helvetica,sans-serif;color:rgb(31,3=
5,41);line-height:1.68"><div class=3D"" dir=3D"auto" style=3D"padding:0px;m=
argin:4px 0px"><br style=3D"margin:0px;padding:0px"></div></div></div></div=
><div style=3D"list-style-position:inside" id=3D"lark-mail-quote-162574974"=
><div style=3D"margin:12px 0px 0px;padding-left:12px;border-left:0.5px soli=
d rgb(187,191,196)" class=3D"adit-html-block ignore-collect adit-html-block=
--collapsed"><div><div id=3D"lark-mail-quote-3896a0753cc902c34bced79ab57467=
1e"><div style=3D"color:rgb(187,191,196)" class=3D"adit-html-block__attr">O=
n Thu, Jul 8, 2021, 13:12 &lt;<a style=3D"white-space:pre-wrap;word-break:b=
reak-word;text-decoration:none;color:rgb(51,112,255)" href=3D"mailto:michae=
l.roth@amd.com">michael.roth@amd.com</a>&gt; wrote:</div><div style=3D"marg=
in-top:8px"><div style=3D"white-space:pre-wrap"><span>Quoting Eduardo Habko=
st (2021-07-02 12:35:34)
&gt; On Fri, Jul 02, 2021 at 10:43:22AM -0500, Michael Roth wrote:
&gt; &gt; On Fri, Jul 02, 2021 at 01:14:56PM +0800, zhenwei pi wrote:
&gt; &gt; &gt; On 7/2/21 4:35 AM, Michael Roth wrote:
&gt; &gt; &gt; &gt; Quoting Igor Mammedov (2021-07-01 03:43:13)
&gt; &gt; &gt; &gt; &gt; On Wed, 30 Jun 2021 14:18:09 -0500
&gt; &gt; &gt; &gt; &gt; Michael Roth &lt;<a href=3D"mailto:michael.roth@am=
d.com" target=3D"_blank">michael.roth@amd.com</a>&gt; wrote:
&gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; Quoting Dr. David Alan Gilbert (2021-06-29 09=
:06:02)
&gt; &gt; &gt; &gt; &gt; &gt; &gt; * zhenwei pi (<a href=3D"pizhenwei@byted=
ance.com)" target=3D"_blank">pizhenwei@bytedance.com)</a> wrote:
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; A AMD server typically has cpuid le=
vel 0x10(test on Rome/Milan), it
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; should not be changed to 0x1f in mu=
lti-dies case.
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Fixes: a94e1428991 (target/i386: Ad=
d CPUID.1F generation support
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; for multi-dies PCMachine)
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: zhenwei pi &lt;<a hr=
ef=3D"mailto:pizhenwei@bytedance.com" target=3D"_blank">pizhenwei@bytedance=
.com</a>&gt;
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; &gt; (Copying in Babu)
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Hmm I think you&#39;re right.  I&#39;ve =
cc&#39;d in Babu and Wei.
&gt; &gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; &gt; Eduardo: What do we need to do about com=
patibility, do we need to wire
&gt; &gt; &gt; &gt; &gt; &gt; &gt; this to machine type or CPU version?
&gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; FWIW, there are some other CPUID entries like=
 leaves 2 and 4 that are
&gt; &gt; &gt; &gt; &gt; &gt; also Intel-specific. With SEV-SNP CPUID enfor=
cement, advertising them to
&gt; &gt; &gt; &gt; &gt; &gt; guests will result in failures when host SNP =
firmware checks the
&gt; &gt; &gt; &gt; &gt; &gt; hypervisor-provided CPUID values against the =
host-supported ones.
&gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; To address this we&#39;ve been planning to ad=
d an &#39;amd-cpuid-only&#39; property
&gt; &gt; &gt; &gt; &gt; &gt; to suppress them:
&gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt;    <a href=3D"https://github.com/mdroth/qemu/=
commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b" target=3D"_blank">https://=
github.com/mdroth/qemu/commit/28d0553fe748d30a8af09e5e58a7da3eff03e21b</a>
&gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt; My thinking is this property should be off by=
 default, and only defined
&gt; &gt; &gt; &gt; &gt; &gt; either via explicit command-line option, or v=
ia new CPU types. We&#39;re also
&gt; &gt; &gt; &gt; &gt; &gt; planning to add new CPU versions for EPYC* CP=
U types that set this
&gt; &gt; &gt; &gt; &gt; &gt; &#39;amd-cpuid-only&#39; property by default:
&gt; &gt; &gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; &gt; &gt;    <a href=3D"https://github.com/mdroth/qemu/=
commits/new-cpu-types-upstream" target=3D"_blank">https://github.com/mdroth=
/qemu/commits/new-cpu-types-upstream</a>
&gt; &gt; &gt; &gt; &gt; It look like having new cpu versions is enough to =
change behavior,
&gt; &gt; &gt; &gt; &gt; maybe keep &#39;amd-cpuid-only&#39; as internal fi=
eld and not expose it to users
&gt; &gt; &gt; &gt; &gt; as a property.
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; Hmm, I defined it as a property mainly to make use of
&gt; &gt; &gt; &gt; X86CPUVersionDefinition.props to create new versions of=
 the CPU types
&gt; &gt; &gt; &gt; with those properties set.
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; There&#39;s a patch there that adds X86CPUVersionDefini=
tion.cache_info so
&gt; &gt; &gt; &gt; that new cache definitions can be provided for new CPU =
versions. So
&gt; &gt; &gt; &gt; would you suggest a similar approach here, e.g. adding =
an
&gt; &gt; &gt; &gt; X86CPUVersionDefinition.amd_cpuid_only field that could=
 be used directly
&gt; &gt; &gt; &gt; rather than going through X86CPUVersionDefinition.props=
?
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; There&#39;s also another new &quot;amd-xsave&quot; prop=
 in that series that does something
&gt; &gt; &gt; &gt; similar to &quot;amd-cpuid-only&quot;, so a little worr=
ied about tacking to much extra
&gt; &gt; &gt; &gt; into X86CPUVersionDefinition. But maybe that one could =
just be rolled into
&gt; &gt; &gt; &gt; &quot;amd-cpuid-only&quot; since it is basically fixing=
 up xsave-related cpuid
&gt; &gt; &gt; &gt; entries for AMD...
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; Hi, this patch wants to fix the issue:
&gt; &gt; &gt; AMD CPU (Rome/Milan) should get the cpuid level 0x10, not 0x=
1F in the guest.
&gt; &gt; &gt; If QEMU reports a 0x1F to guest, guest(Linux) would use leaf=
 0x1F instead of
&gt; &gt; &gt; leaf 0xB to get extended topology:
&gt; &gt; &gt;=20
&gt; &gt; &gt; <a href=3D"https://github.com/torvalds/linux/blob/master/arc=
h/x86/kernel/cpu/topology.c#L49" target=3D"_blank">https://github.com/torva=
lds/linux/blob/master/arch/x86/kernel/cpu/topology.c#L49</a>
&gt; &gt; &gt;=20
&gt; &gt; &gt; static int detect_extended_topology_leaf(struct cpuinfo_x86 =
*c)
&gt; &gt; &gt; {
&gt; &gt; &gt;     if (c-&gt;cpuid_level &gt;=3D 0x1f) {
&gt; &gt; &gt;             if (check_extended_topology_leaf(0x1f) =3D=3D 0)
&gt; &gt; &gt;                     return 0x1f;
&gt; &gt; &gt;     }
&gt; &gt; &gt;=20
&gt; &gt; &gt;     if (c-&gt;cpuid_level &gt;=3D 0xb) {
&gt; &gt; &gt;             if (check_extended_topology_leaf(0xb) =3D=3D 0)
&gt; &gt; &gt;                     return 0xb;
&gt; &gt; &gt;     }
&gt; &gt; &gt;=20
&gt; &gt; &gt;     return -1;
&gt; &gt; &gt; }
&gt; &gt; &gt;=20
&gt; &gt; &gt; Because of the wrong cpuid level, the guest gets unexpected =
topology from
&gt; &gt; &gt; leaf 0x1F.
&gt; &gt; &gt;=20
&gt; &gt; &gt; I tested <a href=3D"https://github.com/mdroth/qemu/commits/n=
ew-cpu-types-upstream" target=3D"_blank">https://github.com/mdroth/qemu/com=
mits/new-cpu-types-upstream</a>, and
&gt; &gt; &gt; it seems that these patches could not fix this issue.
&gt; &gt;=20
&gt; &gt; Yes, I think your patch would still be needed. The question is wh=
ether it&#39;s
&gt; &gt; okay to change it for existing CPU types, e.g. EPYC-Milan, or onl=
y for new ones
&gt; &gt; when they set a certain flag/property, like the proposed &quot;am=
d-cpuid-only&quot; (which
&gt; &gt; the proposed EPYC-Milan-v2 would set).
&gt;=20
&gt; I tried to answer this in a separate reply in this thread, but
&gt; answering here for visibility:
&gt;=20
&gt; You can safely do it on existing CPU types, because the new
&gt; behavior doesn&#39;t introduce host software or hardware requirements
&gt; when enabled.  You just need to disable the new behavior in
&gt; MachineClass.compat_props for older machine types.

Hi Eduardo,

Thanks for the suggestions. Since the CPUID changes no longer rely on
adding new CPU models, I&#39;ve broken that out as a separate patch here
based on your input:

  <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2021-07/msg01=
679.html" target=3D"_blank">https://lists.nongnu.org/archive/html/qemu-deve=
l/2021-07/msg01679.html</a>

Zhenwei, with the above patch I think you can change your patch to use:

  if (!cpu-&gt;vendor_cpuid_only || IS_INTEL_CPU(env))
    //add intel-specific range

Let me know if you want me to update and add to my series.
</span><br></div><div style=3D"white-space:pre-wrap">Sure, thanks a lot.
&gt;=20
&gt; --=20
&gt; Eduardo
&gt;=20
&gt;</div></div></div></div></div></div></body></html>

--0000000000002a8f2405c69c5c8a--

