Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 050CC3309CE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 09:57:23 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJBhZ-0000a4-Qd
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 03:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1lJBgY-000082-8n
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 03:56:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mapfelba@redhat.com>)
 id 1lJBgV-0005RC-4R
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 03:56:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615193773;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dw8ROYUXMORQ3yLjhYXC931vdOq3NWvcYNCoaTrdC30=;
 b=gHp3XTK69u1gsmhQc6+JkMN9svAggjNigMQktphwLzK/GNTou0OzCkxVH9QlElmDR21eXE
 v7dDDZb1g4VUKLLgKp/iDqVJdJpo29BFvN7nVGWv0QuVYKaDnIlO/XHWr4z20T/+9BpwRn
 BRv57TKlGYFCIfiBvGdW2CwcC1A0J2E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-QN2DcQ8FOSSH56s_AEiE-A-1; Mon, 08 Mar 2021 03:54:40 -0500
X-MC-Unique: QN2DcQ8FOSSH56s_AEiE-A-1
Received: by mail-ej1-f72.google.com with SMTP id fy8so3772174ejb.19
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 00:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=dw8ROYUXMORQ3yLjhYXC931vdOq3NWvcYNCoaTrdC30=;
 b=OIs+VJ3g+tRd4khWPaYEBomGxYIz/Dk1uKGqlkzoad+jIWcQ20FnXIUSIqq7dFrziw
 OgGUkPcTLhvL0akjaClghrU2DNcXi7bC5sEyJBjWMN8eVrJHEnejYzptpam9QSNEDM5N
 zSqWqBlvxq/DxIk/VSJ8+Lsc1wrYfPeruZ+OnNjJIUnZ6PFfsZiqYs0A0cOA/OYALOCL
 +8n1fQ99AtLpWHwPIouQQPEAd+HWUskSEt2VCJHmHvv4FvYPIjG+ESa1fYg67/53rKrz
 YsFOpu2frgSgTgmPVgAWWrG3aJi7TAQ/HAH7Dzh9bteGXwBs1KwT5jO7w76jwBleJ9Su
 NvKA==
X-Gm-Message-State: AOAM5323FhSV9I8iUI2UjyYKeLLQSgp+qMO6JXIZKGJfehWlpRvuaXFb
 cZGlEYZrhqTISiwOEZoQ9J0g3jredmNwmxTHM/OQrR0gdcFm2Ci/+IuzcoGvX6kC5lLzbOciYji
 zPBXjmIiT/7uS+ZyLuSvTYn1SvemKw6Q=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr20362629edv.131.1615193679261; 
 Mon, 08 Mar 2021 00:54:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf/jwYeNYnVvn/oQzXOwjLmmTm/vz+0IzmmyVvIEbhLte2o+tMhot23mf8a9hdIuBZGWwgAkaCUGtD6wMdARE=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr20362602edv.131.1615193679093; 
 Mon, 08 Mar 2021 00:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20210305101634.10745-1-david@redhat.com>
 <20210305101634.10745-9-david@redhat.com>
 <20210305154206.GH397383@xz-x1>
 <f577f691-9bdc-a435-9f20-1de62be2241e@redhat.com>
 <20210305155141.GI397383@xz-x1>
 <26dc6c36-5137-5d5e-36f0-2650e42e40ad@redhat.com>
 <CA+aaKfAc95Y2Eg2AkHELTzOa8DUt=-8feOufuUHF1jbFg5Z8SQ@mail.gmail.com>
 <047792f8-e5a3-ab75-7fa2-e61f09655d06@redhat.com>
In-Reply-To: <047792f8-e5a3-ab75-7fa2-e61f09655d06@redhat.com>
From: Marcel Apfelbaum <mapfelba@redhat.com>
Date: Mon, 8 Mar 2021 10:54:27 +0200
Message-ID: <CA+aaKfDDBsJEFtKrjzLF52XcU9Vz5DMa6jvjCgSByYnJ4uR7cA@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE
To: David Hildenbrand <david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mapfelba@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007c705d05bd02958d"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mapfelba@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: marcel@redhat.com
Cc: Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007c705d05bd02958d
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Mon, Mar 8, 2021 at 10:45 AM David Hildenbrand <david@redhat.com> wrote:

> On 07.03.21 15:11, Marcel Apfelbaum wrote:
> > Hi David,
> >
> > On Sun, Mar 7, 2021 at 3:18 PM David Hildenbrand <david@redhat.com
> > <mailto:david@redhat.com>> wrote:
> >
> >     On 05.03.21 16:51, Peter Xu wrote:
> >      > On Fri, Mar 05, 2021 at 04:44:36PM +0100, David Hildenbrand wrote:
> >      >> On 05.03.21 16:42, Peter Xu wrote:
> >      >>> On Fri, Mar 05, 2021 at 11:16:33AM +0100, David Hildenbrand
> wrote:
> >      >>>> +#define OVERCOMMIT_MEMORY_PATH
> "/proc/sys/vm/overcommit_memory"
> >      >>>> +static bool map_noreserve_effective(int fd, bool readonly,
> >     bool shared)
> >      >>>> +{
> >      >>>
> >      >>> [...]
> >      >>>
> >      >>>> @@ -184,8 +251,7 @@ void *qemu_ram_mmap(int fd,
> >      >>>>        size_t offset, total;
> >      >>>>        void *ptr, *guardptr;
> >      >>>> -    if (noreserve) {
> >      >>>> -        error_report("Skipping reservation of swap space is
> >     not supported");
> >      >>>> +    if (noreserve && !map_noreserve_effective(fd, shared,
> >     readonly)) {
> >      >>>
> >      >>> Need to switch "shared" & "readonly"?
> >      >>
> >      >> Indeed, interestingly it has the same effect (as we don't have
> >     anonymous
> >      >> read-only memory in QEMU :) )
> >      >
> >      > But note there is still a "g_assert(!shared || fd >= 0);"
> inside.. :)
> >
> >     Aaaaaand, I just figured that we actually can create shared anonymous
> >     memory in QEMU, simply via
> >
> >     -object memory-backend-ram,share=on
> >
> >     Introduced in 06329ccecfa0 ("mem: add share parameter to
> >     memory-backend-ram"). That's also where we introduced the "shared"
> flag
> >     for qemu_anon_ram_alloc().
> >
> >     That commit mentions a use case for "RDMA devices in order to remap
> >     non-contiguous QEMU virtual addresses to a contiguous virtual address
> >     range.". I fail to understand why that requires sharing RAM with
> child
> >     processes.
> >
> >     Especially:
> >
> >     a) qemu_ram_is_shared() returned false before patch #1. RAM_SHARED is
> >     never set.
> >
> >     b) qemu_ram_remap() does not work as expected?
> >
> >     c) ram_discard_range() is broken with shared anonymous memory.
> Instead
> >     of MADV_DONTNEED we need MADV_REMOVE.
> >
> >     This looks like a partially broken feature and I wonder if there is
> an
> >     actual user.
> >
> >     @Marcel, can you clarify if there is an actual use case for shared
> >     anonymous memory in QEMU? I.e., if the original use case that
> required
> >     that change is valid? (and why it wasn't able to just use proper
> shmem)
> >
> >
> > As you correctly stated, the PVRDMA device requires remapping of
> > non-contiguous QEMU
> > virtual addresses to a contiguous virtual address range.
> >
> > In order to do so it calls
> >       mremap (... , MREMAP_MAYMOVE | MREMAP_FIXED, ...)
>
> Thanks - I was missing who remaps and how (for a second I thought in
> another forked process).
>
> docs/pvrdma.txt seems to describe the situation. Having to use anonymous
> shared memory is a bit unfortunate.
>
> I yet haven't figured out how it is valid to remap parts of RAMBlocks to
> other locations via MREMAP_MAYMOVE. This sounds to me like we are
> punching holes into RAMBlocks - that can't be right.


> Or maybe we are just shuffling around pages within a RAMBlock such that
> we don't actually punch holes?
>

Indeed, we are adding a new mapping , but we leave the previous one in
place.
The VM will continue to work with the "original" RAM while the host RDMA
subsystem
will work with the re-mapped one.

Thanks,
Marcel


>
> Or does that happen when the source VM is stopped and won't ever run again?
>
> --
> Thanks,
>
> David / dhildenb
>
>

--0000000000007c705d05bd02958d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi David,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 8, 2021 at 10:45 AM =
David Hildenbrand &lt;<a href=3D"mailto:david@redhat.com">david@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n 07.03.21 15:11, Marcel Apfelbaum wrote:<br>
&gt; Hi David,<br>
&gt; <br>
&gt; On Sun, Mar 7, 2021 at 3:18 PM David Hildenbrand &lt;<a href=3D"mailto=
:david@redhat.com" target=3D"_blank">david@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:david@redhat.com" target=3D"_blank">david=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 05.03.21 16:51, Peter Xu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Fri, Mar 05, 2021 at 04:44:36PM +0100, Dav=
id Hildenbrand wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; On 05.03.21 16:42, Peter Xu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; On Fri, Mar 05, 2021 at 11:16:33AM +0=
100, David Hildenbrand wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; +#define OVERCOMMIT_MEMORY_PATH &=
quot;/proc/sys/vm/overcommit_memory&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; +static bool map_noreserve_effect=
ive(int fd, bool readonly,<br>
&gt;=C2=A0 =C2=A0 =C2=A0bool shared)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; [...]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; @@ -184,8 +251,7 @@ void *qemu_ra=
m_mmap(int fd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t=
 offset, total;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 void *=
ptr, *guardptr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 if (noreserve) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 erro=
r_report(&quot;Skipping reservation of swap space is<br>
&gt;=C2=A0 =C2=A0 =C2=A0not supported&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if (noreserve &amp=
;&amp; !map_noreserve_effective(fd, shared,<br>
&gt;=C2=A0 =C2=A0 =C2=A0readonly)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;&gt; Need to switch &quot;shared&quot; &am=
p; &quot;readonly&quot;?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Indeed, interestingly it has the same eff=
ect (as we don&#39;t have<br>
&gt;=C2=A0 =C2=A0 =C2=A0anonymous<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; read-only memory in QEMU :) )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; But note there is still a &quot;g_assert(!sha=
red || fd &gt;=3D 0);&quot; inside.. :)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Aaaaaand, I just figured that we actually can creat=
e shared anonymous<br>
&gt;=C2=A0 =C2=A0 =C2=A0memory in QEMU, simply via<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-object memory-backend-ram,share=3Don<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Introduced in 06329ccecfa0 (&quot;mem: add share pa=
rameter to<br>
&gt;=C2=A0 =C2=A0 =C2=A0memory-backend-ram&quot;). That&#39;s also where we=
 introduced the &quot;shared&quot; flag<br>
&gt;=C2=A0 =C2=A0 =C2=A0for qemu_anon_ram_alloc().<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0That commit mentions a use case for &quot;RDMA devi=
ces in order to remap<br>
&gt;=C2=A0 =C2=A0 =C2=A0non-contiguous QEMU virtual addresses to a contiguo=
us virtual address<br>
&gt;=C2=A0 =C2=A0 =C2=A0range.&quot;. I fail to understand why that require=
s sharing RAM with child<br>
&gt;=C2=A0 =C2=A0 =C2=A0processes.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Especially:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0a) qemu_ram_is_shared() returned false before patch=
 #1. RAM_SHARED is<br>
&gt;=C2=A0 =C2=A0 =C2=A0never set.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0b) qemu_ram_remap() does not work as expected?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0c) ram_discard_range() is broken with shared anonym=
ous memory. Instead<br>
&gt;=C2=A0 =C2=A0 =C2=A0of MADV_DONTNEED we need MADV_REMOVE.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This looks like a partially broken feature and I wo=
nder if there is an<br>
&gt;=C2=A0 =C2=A0 =C2=A0actual user.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@Marcel, can you clarify if there is an actual use =
case for shared<br>
&gt;=C2=A0 =C2=A0 =C2=A0anonymous memory in QEMU? I.e., if the original use=
 case that required<br>
&gt;=C2=A0 =C2=A0 =C2=A0that change is valid? (and why it wasn&#39;t able t=
o just use proper shmem)<br>
&gt; <br>
&gt; <br>
&gt; As you correctly stated, the PVRDMA device requires remapping of <br>
&gt; non-contiguous QEMU<br>
&gt; virtual addresses to a contiguous virtual address range.<br>
&gt; <br>
&gt; In order to do so it calls<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mremap=C2=A0(... , MREMAP_MAYMOVE | MREMAP_F=
IXED, ...)<br>
<br>
Thanks - I was missing who remaps and how (for a second I thought in <br>
another forked process).<br>
<br>
docs/pvrdma.txt seems to describe the situation. Having to use anonymous <b=
r>
shared memory is a bit unfortunate.<br>
<br>
I yet haven&#39;t figured out how it is valid to remap parts of RAMBlocks t=
o <br>
other locations via MREMAP_MAYMOVE. This sounds to me like we are <br>
punching holes into RAMBlocks - that can&#39;t be right.=C2=A0</blockquote>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Or maybe we are just shuffling around pages within a RAMBlock such that <br=
>
we don&#39;t actually punch holes?<br></blockquote><div><br></div><div>Inde=
ed, we are adding=C2=A0a new mapping , but we leave the previous one in pla=
ce.</div><div>The VM will continue to work with the &quot;original&quot; RA=
M while the host RDMA subsystem</div><div>will work with the re-mapped one.=
</div><div><br></div><div>Thanks,</div><div>Marcel</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Or does that happen when the source VM is stopped and won&#39;t ever run ag=
ain?<br>
<br>
-- <br>
Thanks,<br>
<br>
David / dhildenb<br>
<br>
</blockquote></div></div>

--0000000000007c705d05bd02958d--


