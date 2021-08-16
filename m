Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B133EDEF2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:04:28 +0200 (CEST)
Received: from localhost ([::1]:47222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjmV-0001cf-Aj
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFjc4-0004FZ-9u
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFjbz-0004De-RI
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629147214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7ggAkVyK8OzfatSstwFFubqJUsJUIBOezVZsDS6ZwU=;
 b=TACZmIYeCsb9xLPsBzjNy4Cgp4XI9NT0YyIqpWl9MhBS6L/IEYj7yT2lKsFBZDwBaiMTms
 BztK0kPM/wRdflET+R1jLKD75RP6EvkxvZ8XFglphykqn2HEyWLwbaoK53fSzJVvpAw3dp
 Om5ozTAkzngsfgSyLsWY0nsH8Hho1AU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-jabUQccVNmmrJoWZvhQZ4Q-1; Mon, 16 Aug 2021 16:53:33 -0400
X-MC-Unique: jabUQccVNmmrJoWZvhQZ4Q-1
Received: by mail-pj1-f69.google.com with SMTP id
 s9-20020a17090aa10900b001797c5272b4so321757pjp.7
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S7ggAkVyK8OzfatSstwFFubqJUsJUIBOezVZsDS6ZwU=;
 b=NDd9IpS6KaXC1LE1L8pZpDi/ZuoSoFemVcW6s4OkUdWDqrkRrKw7umz+XHLZEf2Acu
 COb4beIc73RhJHZXQovbEcEubzgNW4ZfvbVPDg/XO4vdja1+GqobXQs4/idovoBlId0m
 PltZFJ8okSNdEm2f78eY2qnHyt6lP5eNnqjj2GXDYKvIzJvGf0ZUxoP8AtaHA3+SeWgr
 5lcvmTAHR063Rar9FygyeyuYLB3XTC3uQQX1SDnRcMBw7maKdA/d04yEiarUCBHNT3WV
 30NmMevs/xej4YzLDeWiS6FCrLtz057wRjrS1EsYNJtkcx8Op9ZgY4FPWeVPt4q+HacV
 SVAw==
X-Gm-Message-State: AOAM531ep9wuc/fnuGWmfImvO1MaVqsFeOvA9WUVqvaos+0xA2Ny5oKi
 rw5vaSWz6b36EWWPTIAzNVsOKDDQagH5r7Pq4gkHZcrb6GTzcTRQb5zsAMMrxDbQBhjOv/G3q89
 iRSvyzqpaFvnIyqeVWUfY9UXwjsbqqWs=
X-Received: by 2002:a62:5f07:0:b0:3e2:7556:95a0 with SMTP id
 t7-20020a625f07000000b003e2755695a0mr36329pfb.55.1629147211856; 
 Mon, 16 Aug 2021 13:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/g1LUHkBuhdRpPxgc2CMZ+eOKCmhRL5kM4ssgHsyC97/1055z98s4as7fBScGxzZ6TUOyphGwaHv6K124YBU=
X-Received: by 2002:a62:5f07:0:b0:3e2:7556:95a0 with SMTP id
 t7-20020a625f07000000b003e2755695a0mr36307pfb.55.1629147211545; Mon, 16 Aug
 2021 13:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <YRqfI0YlNZ6Xowwt@work-vm>
In-Reply-To: <YRqfI0YlNZ6Xowwt@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Aug 2021 22:53:19 +0200
Message-ID: <CABgObfb6JAfs1zeJmPnZAXEO_7_QpaJHqh-xQbvKjgqnOev=Zw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000d4dab105c9b364f6"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <Ashish.Kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 "Habkost, Eduardo" <ehabkost@redhat.com>, kvm <kvm@vger.kernel.org>,
 "S. Tsirkin, Michael" <mst@redhat.com>, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hubertus Franke <frankeh@us.ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d4dab105c9b364f6
Content-Type: text/plain; charset="UTF-8"

Il lun 16 ago 2021, 19:23 Dr. David Alan Gilbert <dgilbert@redhat.com> ha
scritto:

> > However, I am not sure if the in-guest migration helper vCPUs should use
> the
> > existing KVM support code.  For example, they probably can just always
> work
> > with host CPUID (copied directly from KVM_GET_SUPPORTED_CPUID),
>
> Doesn't at least one form of SEV have some masking of CPUID that's
> visible to the guest; so perhaps we have to match the main vCPUs idea of
> CPUIDs?
>

I don't think we do. Whatever startup code the on the migration helper can
look at CPUID for purposes such as enabling AES instructions. It's a
separate VM and one that will never be migrated (it's started separately on
the source and destination).

> The migration helper can then also use its own address space, for example
> > operating directly on ram_addr_t values with the helper running at very
> high
> > virtual addresses.  Migration code can use a RAMBlockNotifier to invoke
> > KVM_SET_USER_MEMORY_REGION on the mirror VM (and never enable dirty
> memory
> > logging on the mirror VM, too, which has better performance).
>
> How does the use of a very high virtual address help ?
>

Sorry, read that as physical addresses, i.e. the code and any dedicated
migration helper RAM (including communication structures) would be out of
the range used by ram_addr_ts. (The virtual addresses instead can be chosen
by the helper, since QEMU knows nothing about them).

Paolo


> > With this implementation, the number of mirror vCPUs does not even have
> to
> > be indicated on the command line.  The VM and its vCPUs can simply be
> > created when migration starts.  In the SEV-ES case, the guest can even
> > provide the VMSA that starts the migration helper.
> >
> > The disadvantage is that, as you point out, in the future some of the
> > infrastructure you introduce might be useful for VMPL0 operation on
> SEV-SNP.
> > My proposal above might require some code duplication. However, it might
> > even be that VMPL0 operation works best with a model more similar to my
> > sketch of the migration helper; it's really too early to say.
> >
>
> Dave
>
> > Paolo
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
>

--000000000000d4dab105c9b364f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 16 ago 2021, 19:23 Dr. David Alan Gilbert &lt;<=
a href=3D"mailto:dgilbert@redhat.com">dgilbert@redhat.com</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">&gt; However, I am not sure if t=
he in-guest migration helper vCPUs should use the<br>
&gt; existing KVM support code.=C2=A0 For example, they probably can just a=
lways work<br>
&gt; with host CPUID (copied directly from KVM_GET_SUPPORTED_CPUID),<br>
<br>
Doesn&#39;t at least one form of SEV have some masking of CPUID that&#39;s<=
br>
visible to the guest; so perhaps we have to match the main vCPUs idea of<br=
>
CPUIDs?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">I don&#39;t think we do. Whatever startup code the on the migration =
helper can look at CPUID for purposes such as enabling AES instructions. It=
&#39;s a separate VM and one that will never be migrated (it&#39;s started =
separately on the source and destination).</div><div dir=3D"auto"><br></div=
><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">&gt; The migration helper can then also use its own address space, for ex=
ample<br>
&gt; operating directly on ram_addr_t values with the helper running at ver=
y high<br>
&gt; virtual addresses.=C2=A0 Migration code can use a RAMBlockNotifier to =
invoke<br>
&gt; KVM_SET_USER_MEMORY_REGION on the mirror VM (and never enable dirty me=
mory<br>
&gt; logging on the mirror VM, too, which has better performance).<br>
<br>
How does the use of a very high virtual address help ?<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry, read that as p=
hysical addresses, i.e. the code and any dedicated migration helper RAM (in=
cluding communication structures) would be out of the range used by ram_add=
r_ts. (The virtual addresses instead can be chosen by the helper, since QEM=
U knows nothing about them).</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; With this implementation, the number of mirror vCPUs does not even hav=
e to<br>
&gt; be indicated on the command line.=C2=A0 The VM and its vCPUs can simpl=
y be<br>
&gt; created when migration starts.=C2=A0 In the SEV-ES case, the guest can=
 even<br>
&gt; provide the VMSA that starts the migration helper.<br>
&gt; <br>
&gt; The disadvantage is that, as you point out, in the future some of the<=
br>
&gt; infrastructure you introduce might be useful for VMPL0 operation on SE=
V-SNP.<br>
&gt; My proposal above might require some code duplication. However, it mig=
ht<br>
&gt; even be that VMPL0 operation works best with a model more similar to m=
y<br>
&gt; sketch of the migration helper; it&#39;s really too early to say.<br>
&gt; <br>
<br>
Dave<br>
<br>
&gt; Paolo<br>
&gt; <br>
-- <br>
Dr. David Alan Gilbert / <a href=3D"mailto:dgilbert@redhat.com" target=3D"_=
blank" rel=3D"noreferrer">dgilbert@redhat.com</a> / Manchester, UK<br>
<br>
</blockquote></div></div></div>

--000000000000d4dab105c9b364f6--


