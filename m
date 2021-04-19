Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9655E364CFE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 23:24:30 +0200 (CEST)
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYbNd-0007HJ-MR
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 17:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYbBZ-0007Wo-Ob
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 17:12:01 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:34584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYbBX-0006Tk-L6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 17:12:01 -0400
Received: by mail-ot1-f41.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so33949631otn.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 14:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kDsJKbfL827linO16y9rPMNM61oDBjde5y3ctg5wNl4=;
 b=evnuB1PHM/WPUYLD7s/XTCc8sRD8zt4LRpWwA8vFdLp0wZTsXZIAsPRPo7CU2R+Jh/
 SA9hS1l/by1QLQJA83PNBJG5AbZ9xNzrwkja6prpKLAFm2ds/06dYBPJjVSuEA2MdSvv
 QYLmck5hfHAgUdHVJwNW8PNh5ETMxZehrAIEZLJSTuAL9ekEs7G0BfIoIqQ0/U9KPSJ/
 O6I3Ao72QkRhcS2Swgiex5dpIDmgN0OEwgSmJ20vtIAz25dubMQfdgBK2438Qh5S6SaA
 OMj4LH9D6B/4WL8W5u6ctDr8xE32z5OFdemzpk9DuK6s6VT3IoqiHc75iocSPZrmEAvz
 mung==
X-Gm-Message-State: AOAM5311wywDOPaZJrpf+q4+ztO2FYms7IqH6T/lgStlDpFKywePSljy
 h1NJqYy1D80/T6Ae95laPNvWqF5mJJYmtVNZQ0g=
X-Google-Smtp-Source: ABdhPJzUbjshu/1pgFf5ytlZpSURs7rgpdRaX2GfYnCNLTcxAd6CkC1Vi+OqakujsCE4UB7qy4sFEvtlXHHvvfvrNAc=
X-Received: by 2002:a05:6830:2241:: with SMTP id
 t1mr16360373otd.126.1618866718504; 
 Mon, 19 Apr 2021 14:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210417140206.673885-1-f4bug@amsat.org>
 <8f59bd60-3588-3be0-c44c-1ebfbefd78bd@ilande.co.uk>
 <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
In-Reply-To: <67955dd0-dfc7-271f-009f-cf7247f3b6c2@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 19 Apr 2021 23:11:47 +0200
Message-ID: <CAAdtpL5EtysZp17DotHXRzthHVkKft6OmVCVUKdaVKrkTxnCtA@mail.gmail.com>
Subject: Re: [PATCH v3] memory: Directly dispatch alias accesses on origin
 memory region
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.41;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f41.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 19, 2021 at 10:58 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 4/19/21 10:13 PM, Mark Cave-Ayland wrote:
> > On 17/04/2021 15:02, Philippe Mathieu-Daud=C3=A9 wrote:
> >
> >> Since commit 2cdfcf272d ("memory: assign MemoryRegionOps to all
> >> regions"), all newly created regions are assigned with
> >> unassigned_mem_ops (which might be then overwritten).
> >>
> >> When using aliased container regions, and there is no region mapped
> >> at address 0 in the container, the memory_region_dispatch_read()
> >> and memory_region_dispatch_write() calls incorrectly return the
> >> container unassigned_mem_ops, because the alias offset is not used.
> >>
> >> The memory_region_init_alias() flow is:
> >>
> >>    memory_region_init_alias()
> >>    -> memory_region_init()
> >>       -> object_initialize(TYPE_MEMORY_REGION)
> >>          -> memory_region_initfn()
> >>             -> mr->ops =3D &unassigned_mem_ops;
> >>
> >> Later when accessing the alias, the memory_region_dispatch_read()
> >> flow is:
> >>
> >>    memory_region_dispatch_read(offset)
> >>    -> memory_region_access_valid(mr)   <- offset is ignored
> >>       -> mr->ops->valid.accepts()
> >>          -> unassigned_mem_accepts()
> >>          <- false
> >>       <- false
> >>     <- MEMTX_DECODE_ERROR
> >>
> >> The caller gets a MEMTX_DECODE_ERROR while the access is OK.
> >>
> >> Fix by dispatching aliases recusirvely, accessing its origin region
> >> after adding the alias offset.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >> v3:
> >> - reworded, mentioning the "alias to container" case
> >> - use recursive call instead of while(), because easier when debugging
> >>    therefore reset Richard R-b tag.
> >> v2:
> >> - use while()
> >> ---
> >>   softmmu/memory.c | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/softmmu/memory.c b/softmmu/memory.c
> >> index d4493ef9e43..23bdbfac079 100644
> >> --- a/softmmu/memory.c
> >> +++ b/softmmu/memory.c
> >> @@ -1442,6 +1442,11 @@ MemTxResult
> >> memory_region_dispatch_read(MemoryRegion *mr,
> >>       unsigned size =3D memop_size(op);
> >>       MemTxResult r;
> >>   +    if (mr->alias) {
> >> +        return memory_region_dispatch_read(mr->alias,
> >> +                                           addr + mr->alias_offset,
> >> +                                           pval, op, attrs);
> >> +    }
> >>       if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
> >>           *pval =3D unassigned_mem_read(mr, addr, size);
> >>           return MEMTX_DECODE_ERROR;
> >> @@ -1486,6 +1491,11 @@ MemTxResult
> >> memory_region_dispatch_write(MemoryRegion *mr,
> >>   {
> >>       unsigned size =3D memop_size(op);
> >>   +    if (mr->alias) {
> >> +        return memory_region_dispatch_write(mr->alias,
> >> +                                            addr + mr->alias_offset,
> >> +                                            data, op, attrs);
> >> +    }
> >>       if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
> >>           unassigned_mem_write(mr, addr, data, size);
> >>           return MEMTX_DECODE_ERROR;
> >
> > Whilst working on my q800 patches I realised that this was a similar
> > problem to the one I had with my macio.alias implementation at [1]:
> > except that in my case the unassigned_mem_ops mr->ops->valid.accepts()
> > function was being invoked on a ROM memory region instead of an alias. =
I
> > think this is exactly the same issue that you are attempting to fix wit=
h
> > your related patch at
> > https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg03190.html
> > ("memory: Initialize MemoryRegionOps for RAM memory regions").
>
> So if 2 contributors hit similar issues, there is something wrong with
> the API. I don't see your use case or mine as forbidded by the
> documentation in "exec/memory.h".
>
> My patch might not be the proper fix, but we need to figure out how
> to avoid others to hit the same problem, as it is very hard to debug.
>
> At least an assertion and a comment.

Something like:

-- >8 --
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef9e43..e031ac6e074 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1442,6 +1442,7 @@ MemTxResult memory_region_dispatch_read(MemoryRegion =
*mr,
    unsigned size =3D memop_size(op);
    MemTxResult r;

+    assert(!(mr->alias && !mr>alias_offset)); /* Use AddressSpace API
instead */
    if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
        *pval =3D unassigned_mem_read(mr, addr, size);
        return MEMTX_DECODE_ERROR;

---

> > I eventually realised that I needed functions that could dispatch
> > reads/writes to both IO memory regions and ROM memory regions, and that
> > functionality is covered by the address_space_*() access functions.
> > Using the address_space_*() functions I was then able to come up with
> > the working implementation at [2] that handles accesses to both IO
> > memory regions and ROM memory regions correctly.
> >
> > The reason I initially used the
> > memory_region_dispatch_read()/memory_region_dispatch_write() functions
> > was because I could see that was how the virtio devices dispatched
> > accesses through the proxy. However I'm wondering now if this API can
> > only be used for terminating IO memory regions, and so the alias_offset
> > that you're applying above should actually be applied elsewhere instead=
.
>
> I figured out the AddressSpace API make these cases simpler, but IIRC
> there is some overhead, some function tries to resolve / update
> something and iterate over a list. While from the MemoryRegion API we
> already know which region we want to access.
>
> I Cc'ed Peter considering him expert in this area, but don't know else
> who to ask for help on this topic...
>
> > ATB,
> >
> > Mark.
> >
> > [1]
> > https://github.com/mcayland/qemu/commit/56f8639fbecb8a8e323ce486e20cbe3=
09e807419
> >
> >
> > [2]
> > https://github.com/mcayland/qemu/commit/c1fa32da188bb2ce23faf1728228c17=
14672270d
> >
> >

