Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56549647EA3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 08:34:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3XsP-0006q1-HD; Fri, 09 Dec 2022 02:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p3Xru-0006lh-Vk
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:32:32 -0500
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p3Xrq-000737-Lk
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:32:26 -0500
Received: by mail-qk1-x729.google.com with SMTP id x18so1918413qki.4
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 23:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:user-agent:mime-version
 :from:references:from:to:cc:subject:date:message-id:reply-to;
 bh=S+uOyNcC0bsh04EfKe0tz91C2+ktLaJY89G2Qdu1EUc=;
 b=2TmC8i61EOmUrY9q3oTVMC3nnC537D1YnecvNOkDwVo58u0RvKjtVBnysXTxQa41MK
 gVsm0ecPwZWLCqubHzND4zVsbx0msAhbUstnfmRrBVzW24cvyKJEGbOe7hIRvoKQKOPt
 AZD7EKV5pO3I/3RzMDy4Q+6WsOx/eqE0N96O0SgMtFQtvkL3CR4PZSIAIb+mY3vnbyB7
 jXROkPHbWC8PqR5CVrin+uw16x3fpX3fEog+F0fN36wlgAQ9XatGbDdRDUgvKJjcDwQt
 XXFe40AJK9kVqtT2/GAPZyUYQHe5k/kVAYx1TKyELXYKyr9b1PGqm+Vhiwf7Um17DHYG
 wfhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:user-agent:mime-version
 :from:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+uOyNcC0bsh04EfKe0tz91C2+ktLaJY89G2Qdu1EUc=;
 b=j1icJ2zoifk72mnzdRQ/IZSDXXFFRsR8DonsD9HRydymMkLb5+QF+szmDnq4tewV8G
 0rSrswPPfZeqTqwGZKeu9mqqn21/lMfXlchQcAEprpVZncLH8V8jAdFQ1Ylbscm/5zAs
 etTMyme5E4JIkfhsKCfUa4bEEjZAeAc32TN5yy2XG70bnBP1x4Cy/hxa05/ZH8tH6mSm
 ZzLoelwt+1XF1lf2WqGK2ucnc+Dwnv+J2djHsQADeziMIaeVlwjeqjCoe8Zt1+Ok/dRg
 maYLq44l+hxEr6oujEMawVvM8+Y1aFyOuravKXCQR4UjlWKmGP/fyCTRbih/wGuzaZjg
 w0/Q==
X-Gm-Message-State: ANoB5plxYG1Mh+4s63+P3L6o8N8+UubQHF6WT9uubChNEpPiAt+zAMJQ
 IjQdrUJ2QOOgIks0/SjcOwKFAKY5W6Y4YayIzVvSww==
X-Google-Smtp-Source: AA0mqf60jFEooKvUP+clNTwG3D2cvrp2Zk7PHhty/lq4FBMJ4VUrJFEv2zLfaObOzJUr1TV0BLBZlACnWplYGucEyPg=
X-Received: by 2002:a05:620a:c04:b0:6fe:f6eb:b296 with SMTP id
 l4-20020a05620a0c0400b006fef6ebb296mr3731472qki.303.1670571140112; Thu, 08
 Dec 2022 23:32:20 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Thu, 8 Dec 2022 23:32:19 -0800
References: <20221118083648.2399615-1-xuchuangxclwt@bytedance.com>
 <Y3+egjXTvLEHDjuT@x1n> <7e5c5d6c-8f23-c0c5-5f5c-5daad854c2e7@bytedance.com>
 <Y4Ty07M/HN9UnsGb@x1n> <1adf426d-a9c8-9015-383b-3e82eb6b7c54@bytedance.com>
 <Y44cNenFueVE4RFW@x1n> <faae03bb-7705-fb16-46a5-e4c2ea55a254@bytedance.com>
 <Y5EO8HqNVj/Rq7M5@x1n> <704c1986-e878-8837-a2bb-12f76eeb1ba4@bytedance.com>
 <Y5IKOIUYHWbpVABV@x1n>
From: Chuang Xu <xuchuangxclwt@bytedance.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
In-Reply-To: <Y5IKOIUYHWbpVABV@x1n>
Date: Thu, 8 Dec 2022 23:32:19 -0800
Message-ID: <CALophutzbp5Ps2hUp2-1K7AZiQe590fcvrkmerKk+yoUQNMAuw@mail.gmail.com>
Subject: Re: [RFC PATCH] migration: reduce time of loading non-iterable vmstate
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 zhouyibo@bytedance.com, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000061069805ef602788"
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: 26
X-Spam_score: 2.6
X-Spam_bar: ++
X-Spam_report: (2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=1,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.266,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000061069805ef602788
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/9 =E4=B8=8A=E5=8D=8812:00, Peter Xu wrote:

On Thu, Dec 08, 2022 at 10:39:11PM +0800, Chuang Xu wrote:

On 2022/12/8 =E4=B8=8A=E5=8D=886:08, Peter Xu wrote:

On Thu, Dec 08, 2022 at 12:07:03AM +0800, Chuang Xu wrote:

On 2022/12/6 =E4=B8=8A=E5=8D=8812:28, Peter Xu wrote:

Chuang,

No worry on the delay; you're faster than when I read yours. :)

On Mon, Dec 05, 2022 at 02:56:15PM +0800, Chuang Xu wrote:

As a start, maybe you can try with poison address_space_to_flatview() (by
e.g. checking the start_pack_mr_change flag and assert it is not set)
during this process to see whether any call stack can even try to
dereference a flatview.

It's just that I didn't figure a good way to "prove" its validity, even if
I think this is an interesting idea worth thinking to shrink the downtime.

Thanks for your sugguestions!
I used a thread local variable to identify whether the current thread is a
migration thread(main thread of target qemu) and I modified the code of
qemu_coroutine_switch to make sure the thread local variable true only in
process_incoming_migration_co call stack. If the target qemu detects that
start_pack_mr_change is set and address_space_to_flatview() is called in
non-migrating threads or non-migrating coroutine, it will crash.

Are you using the thread var just to avoid the assert triggering in the
migration thread when commiting memory changes?

I think _maybe_ another cleaner way to sanity check this is directly upon
the depth:

static inline FlatView *address_space_to_flatview(AddressSpace *as)
{
      /*
       * Before using any flatview, sanity check we're not during a memory
       * region transaction or the map can be invalid.  Note that this can
       * also be called during commit phase of memory transaction, but that
       * should also only happen when the depth decreases to 0 first.
       */
      assert(memory_region_transaction_depth =3D=3D 0);
      return qatomic_rcu_read(&as->current_map);
}

That should also cover the safe cases of memory transaction commits during
migration.


Peter, I tried this way and found that the target qemu will crash.

Here is the gdb backtrace:

#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
51
#1  0x00007ff2929d851a in __GI_abort () at abort.c:118
#2  0x00007ff2929cfe67 in __assert_fail_base (fmt=3D<optimized out>,
assertion=3Dassertion@entry=3D0x55a32578cdc0
"memory_region_transaction_depth =3D=3D 0", file=3Dfile@entry=3D0x55a32575d=
9b0
"/data00/migration/qemu-5.2.0/include/exec/memory.h",
     line=3Dline@entry=3D766, function=3Dfunction@entry=3D0x55a32578d6e0
<__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at
assert.c:92
#3  0x00007ff2929cff12 in __GI___assert_fail
(assertion=3Dassertion@entry=3D0x55a32578cdc0
"memory_region_transaction_depth =3D=3D 0", file=3Dfile@entry=3D0x55a32575d=
9b0
"/data00/migration/qemu-5.2.0/include/exec/memory.h",
line=3Dline@entry=3D766,
     function=3Dfunction@entry=3D0x55a32578d6e0
<__PRETTY_FUNCTION__.20463> "address_space_to_flatview") at
assert.c:101
#4  0x000055a324b2ed5e in address_space_to_flatview (as=3D0x55a326132580
<address_space_memory>) at
/data00/migration/qemu-5.2.0/include/exec/memory.h:766
#5  0x000055a324e79559 in address_space_to_flatview (as=3D0x55a326132580
<address_space_memory>) at ../softmmu/memory.c:811
#6  address_space_get_flatview (as=3D0x55a326132580
<address_space_memory>) at ../softmmu/memory.c:805
#7  0x000055a324e96474 in address_space_cache_init
(cache=3Dcache@entry=3D0x55a32a4fb000, as=3D<optimized out>,
addr=3Daddr@entry=3D68404985856, len=3Dlen@entry=3D4096, is_write=3Dfalse) =
at
../softmmu/physmem.c:3307
#8  0x000055a324ea9cba in virtio_init_region_cache
(vdev=3D0x55a32985d9a0, n=3D0) at ../hw/virtio/virtio.c:185
#9  0x000055a324eaa615 in virtio_load (vdev=3D0x55a32985d9a0,
f=3D<optimized out>, version_id=3D<optimized out>) at
../hw/virtio/virtio.c:3203
#10 0x000055a324c6ab96 in vmstate_load_state
(f=3Df@entry=3D0x55a329dc0c00, vmsd=3D0x55a325fc1a60 <vmstate_virtio_scsi>,
opaque=3D0x55a32985d9a0, version_id=3D1) at ../migration/vmstate.c:143
#11 0x000055a324cda138 in vmstate_load (f=3D0x55a329dc0c00,
se=3D0x55a329941c90) at ../migration/savevm.c:913
#12 0x000055a324cdda34 in qemu_loadvm_section_start_full
(mis=3D0x55a3284ef9e0, f=3D0x55a329dc0c00) at ../migration/savevm.c:2741
#13 qemu_loadvm_state_main (f=3Df@entry=3D0x55a329dc0c00,
mis=3Dmis@entry=3D0x55a3284ef9e0) at ../migration/savevm.c:2939
#14 0x000055a324cdf66a in qemu_loadvm_state (f=3D0x55a329dc0c00) at
../migration/savevm.c:3021
#15 0x000055a324d14b4e in process_incoming_migration_co
(opaque=3D<optimized out>) at ../migration/migration.c:574
#16 0x000055a32501ae3b in coroutine_trampoline (i0=3D<optimized out>,
i1=3D<optimized out>) at ../util/coroutine-ucontext.c:173
#17 0x00007ff2929e8000 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
#18 0x00007ffed80dc2a0 in ?? ()
#19 0x0000000000000000 in ?? ()

address_space_cache_init() is the only caller of address_space_to_flatview
I can find in vmstate_load call stack so far. Although I think the mr used
by address_space_cache_init() won't be affected by the delay of
memory_region_transaction_commit(), we really need a mechanism to prevent
the modified mr from being used.

Maybe we can build a stale list:
If a subregion is added, add its parent to the stale list(considering that
new subregion's priority has uncertain effects on flatviews).
If a subregion is deleted, add itself to the stale list.
When memory_region_transaction_commit() regenerates flatviews, clear the
stale list.
when address_space_translate_internal() is called, check whether the mr
looked up matches one of mrs=EF=BC=88or its child=EF=BC=89in the stale list=
. If yes, a
crash will be triggered.

I'm not sure that'll work, though.  Consider this graph:

                             A
                            / \
                           B   C
                        (p=3D1) (p=3D0)

A,B,C are MRs, B&C are subregions to A.  When B's priority is higher (p=3D1=
),
any access to A will go upon B, so far so good.

Then, let's assume D comes under C with even higher priority:

                             A
                            / \
                           B   C
                        (p=3D1) (p=3D0)
                               |
                               D
                              (p=3D2)


Adding C into stale list won't work because when with the old flatview
it'll point to B instead, while B is not in the stale list. The AS
operation will carry out without noticing it's already wrong.

Peter, I think our understanding of priority is different.

In the qemu docs
(https://qemu.readthedocs.io/en/stable-6.1/devel/memory.html#overlapping-re=
gions-and-priority),
it says 'Priority values are local to a container, because the priorities o=
f
two regions are only compared when they are both children of the same
container.'
And as I read in code, when doing render_memory_region() operation on A, qe=
mu
will firstly insert B's FlatRanges and its children's FlatRanges recursivel=
y
because B's priority is higher than C. After B's FlatRanges and its childre=
n's
FlatRanges are all inserted into flatviews, C's FlatRanges and its children=
's
FlatRanges will be inserted into gaps left by B if B and C overlaps.

So I think adding D as C's subregion has no effect on B in your second case=
.
The old FlatRange pointing to B is still effective. C and C'children with l=
ower
priority than D will be affected, but we have flagged them as stale.

I hope I have no misunderstanding of the flatview's construction code. If I
understand wrong, please forgive my ignorance..=F0=9F=98=AD

No I think you're right.. thanks, I should read the code/doc first rather
than trusting myself. :)

But still, the whole point is that the parent may not even be visible to
the flatview, so I still don't know how it could work.

My 2nd attempt:

                                  A
                                  |
                                  B
                                (p=3D1)

Adding C with p=3D2:

                                  A
                                 / \
                                B   C
                             (p=3D1) (p=3D2)

IIUC the flatview to access the offset A resides should point to B, then
after C plugged we'll still lookup and find B.  Even if A is in the stale
list, B is not?

Sorry I forgot to describe my latest ideas about this mechanism in detail.

we can add A, B and B's children to the stale list=EF=BC=88If there is D, E=
 and
other mrs have lower priority than C, we can also add them and their childr=
en
to the stale list recursively). Or we can add a stale flag to mr structure
to avoid cost of searching mr in the stale list..

The other thing I didn't mention is that I don't think the address space
translation is the solo consumer of the flat view.  Some examples:

common_semi_find_bases() walks the flatview without translations.

memory_region_update_coalesced_range() (calls address_space_get_flatview()
first) notifies kvm coalesced mmio regions without translations.

So at least hooking up address_space_translate_internal() itself may not be
enough too.

This is really a problem. Maybe we should check whether the mr is stale on
all critical paths, or find other more genneral ways..

There may be many details to consider in this mechanism. Hope you can give
some suggestions on its feasibility.

For this specific case, I'm wildly thinking whether we can just postpone
the init of the vring cache until migration completes.

One thing to mention from what I read it: we'll need to update all the
caches in virtio_memory_listener_commit() anyway, when the batched commit()
happens when migration completes with your approach, so we'll rebuild the
vring cache once and for all which looks also nice if possible.

There's some details to consider. E.g. the commit() happens only when
memory_region_update_pending=3D=3Dtrue.  We may want to make sure the cache=
 is
initialized unconditionally, at least.  Not sure whether that's doable,
though.

Thanks,


Good idea! We can try it in the new patches! And with the delay of
virtio_init_region_cache(), we can still use assert in
address_space_to_flatview().
However, I think the stale list can be used as a retention scheme for furth=
er
discussion in the future, because the stale list may adapt to more
complex scenarios.

If the assert will work that'll be even better.  I'm actually worried this
can trigger like what you mentioned in the virtio path, I didn't expect it
comes that soon.  So if there's a minimum cases and we can fixup easily
that'll be great.  Hopefully there aren't so much or we'll need to revisit
the whole idea.

Thanks,

+1.. Hope this is the only case that will trigger crash.

I'll upload the second version as soon as possible.

Thanks.

--00000000000061069805ef602788
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-006526259afe7=
50e0e0dcf820791f59f">On 2022/12/9 =E4=B8=8A=E5=8D=8812:00, Peter Xu wrote:<=
br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:Y5IKOIUYHWbpVABV@x1n">
      <pre class=3D"moz-quote-pre">On Thu, Dec 08, 2022 at 10:39:11PM +0800=
, Chuang Xu wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">On 2022/12/8 =E4=B8=8A=E5=8D=886:08, P=
eter Xu wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre">On Thu, Dec 08, 2022 at 12:07:03AM +=
0800, Chuang Xu wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre">On 2022/12/6 =E4=B8=8A=E5=8D=8812:=
28, Peter Xu wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre">Chuang,

No worry on the delay; you&#39;re faster than when I read yours. :)

On Mon, Dec 05, 2022 at 02:56:15PM +0800, Chuang Xu wrote:
</pre>
              <blockquote type=3D"cite">
                <blockquote type=3D"cite">
                  <pre class=3D"moz-quote-pre">As a start, maybe you can tr=
y with poison address_space_to_flatview() (by
e.g. checking the start_pack_mr_change flag and assert it is not set)
during this process to see whether any call stack can even try to
dereference a flatview.

It&#39;s just that I didn&#39;t figure a good way to &quot;prove&quot; its =
validity, even if
I think this is an interesting idea worth thinking to shrink the downtime.
</pre>
                </blockquote>
                <pre class=3D"moz-quote-pre">Thanks for your sugguestions!
I used a thread local variable to identify whether the current thread is a
migration thread(main thread of target qemu) and I modified the code of
qemu_coroutine_switch to make sure the thread local variable true only in
process_incoming_migration_co call stack. If the target qemu detects that
start_pack_mr_change is set and address_space_to_flatview() is called in
non-migrating threads or non-migrating coroutine, it will crash.
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre">Are you using the thread var jus=
t to avoid the assert triggering in the
migration thread when commiting memory changes?

I think _maybe_ another cleaner way to sanity check this is directly upon
the depth:

static inline FlatView *address_space_to_flatview(AddressSpace *as)
{
      /*
       * Before using any flatview, sanity check we&#39;re not during a mem=
ory
       * region transaction or the map can be invalid.  Note that this can
       * also be called during commit phase of memory transaction, but that
       * should also only happen when the depth decreases to 0 first.
       */
      assert(memory_region_transaction_depth =3D=3D 0);
      return qatomic_rcu_read(&amp;as-&gt;current_map);
}

That should also cover the safe cases of memory transaction commits during
migration.

</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre"><span>Peter, I tried this way and =
found that the target qemu will crash.

Here is the gdb backtrace:

#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
51
#1  0x00007ff2929d851a in __GI_abort () at abort.c:118
#2  0x00007ff2929cfe67 in __assert_fail_base (fmt=3D&lt;optimized out&gt;, =
assertion=3Dassertion@entry=3D0x55a32578cdc0 &quot;memory_region_transactio=
n_depth =3D=3D 0&quot;, file=3Dfile@entry=3D0x55a32575d9b0 &quot;/data00/mi=
gration/qemu-5.2.0/include/exec/memory.h&quot;,
     line=3Dline@entry=3D766, function=3Dfunction@entry=3D0x55a32578d6e0 &l=
t;__PRETTY_FUNCTION__.20463&gt; &quot;address_space_to_flatview&quot;) at a=
ssert.c:92
#3  0x00007ff2929cff12 in __GI___assert_fail (assertion=3Dassertion@entry=
=3D0x55a32578cdc0 &quot;memory_region_transaction_depth =3D=3D 0&quot;, fil=
e=3Dfile@entry=3D0x55a32575d9b0 &quot;/data00/migration/qemu-5.2.0/include/=
exec/memory.h&quot;, line=3Dline@entry=3D766,
     function=3Dfunction@entry=3D0x55a32578d6e0 &lt;__PRETTY_FUNCTION__.204=
63&gt; &quot;address_space_to_flatview&quot;) at assert.c:101
#4  0x000055a324b2ed5e in address_space_to_flatview (as=3D0x55a326132580 &l=
t;address_space_memory&gt;) at /data00/migration/qemu-5.2.0/include/exec/me=
mory.h:766
#5  0x000055a324e79559 in address_space_to_flatview (as=3D0x55a326132580 &l=
t;address_space_memory&gt;) at ../softmmu/memory.c:811
#6  address_space_get_flatview (as=3D0x55a326132580 &lt;address_space_memor=
y&gt;) at ../softmmu/memory.c:805
#7  0x000055a324e96474 in address_space_cache_init (cache=3Dcache@entry=3D0=
x55a32a4fb000, as=3D&lt;optimized out&gt;, addr=3Daddr@entry=3D68404985856,=
 len=3Dlen@entry=3D4096, is_write=3Dfalse) at ../softmmu/physmem.c:3307
#8  0x000055a324ea9cba in virtio_init_region_cache (vdev=3D0x55a32985d9a0, =
n=3D0) at ../hw/virtio/virtio.c:185
#9  0x000055a324eaa615 in virtio_load (vdev=3D0x55a32985d9a0, f=3D&lt;optim=
ized out&gt;, version_id=3D&lt;optimized out&gt;) at ../hw/virtio/virtio.c:=
3203
#10 0x000055a324c6ab96 in vmstate_load_state (f=3Df@entry=3D0x55a329dc0c00,=
 vmsd=3D0x55a325fc1a60 &lt;vmstate_virtio_scsi&gt;, opaque=3D0x55a32985d9a0=
, version_id=3D1) at ../migration/vmstate.c:143
#11 0x000055a324cda138 in vmstate_load (f=3D0x55a329dc0c00, se=3D0x55a32994=
1c90) at ../migration/savevm.c:913
#12 0x000055a324cdda34 in qemu_loadvm_section_start_full (mis=3D0x55a3284ef=
9e0, f=3D0x55a329dc0c00) at ../migration/savevm.c:2741
#13 qemu_loadvm_state_main (f=3Df@entry=3D0x55a329dc0c00, mis=3Dmis@entry=
=3D0x55a3284ef9e0) at ../migration/savevm.c:2939
#14 0x000055a324cdf66a in qemu_loadvm_state (f=3D0x55a329dc0c00) at ../migr=
ation/savevm.c:3021
#15 0x000055a324d14b4e in process_incoming_migration_co (opaque=3D&lt;optim=
ized out&gt;) at ../migration/migration.c:574
#16 0x000055a32501ae3b in coroutine_trampoline (i0=3D&lt;optimized out&gt;,=
 i1=3D&lt;optimized out&gt;) at ../util/coroutine-ucontext.c:173
#17 0x00007ff2929e8000 in ?? () from /lib/x86_64-linux-gnu/<a href=3D"libc.=
so.6" target=3D"_blank">libc.so.6</a>
#18 0x00007ffed80dc2a0 in ?? ()
#19 0x0000000000000000 in ?? ()

address_space_cache_init() is the only caller of address_space_to_flatview
I can find in vmstate_load call stack so far. Although I think the mr used
by address_space_cache_init() won&#39;t be affected by the delay of
memory_region_transaction_commit(), we really need a mechanism to prevent
the modified mr from being used.

Maybe we can build a stale list:
If a subregion is added, add its parent to the stale list(considering that
new subregion&#39;s priority has uncertain effects on flatviews).
If a subregion is deleted, add itself to the stale list.
When memory_region_transaction_commit() regenerates flatviews, clear the
stale list.
when address_space_translate_internal() is called, check whether the mr
looked up matches one of mrs=EF=BC=88or its child=EF=BC=89in the stale list=
. If yes, a
crash will be triggered.
</span></pre>
          </blockquote>
          <pre class=3D"moz-quote-pre">I&#39;m not sure that&#39;ll work, t=
hough.  Consider this graph:

                             A
                            / \
                           B   C
                        (p=3D1) (p=3D0)

A,B,C are MRs, B&amp;C are subregions to A.  When B&#39;s priority is highe=
r (p=3D1),
any access to A will go upon B, so far so good.

Then, let&#39;s assume D comes under C with even higher priority:

                             A
                            / \
                           B   C
                        (p=3D1) (p=3D0)
                               |
                               D
                              (p=3D2)


Adding C into stale list won&#39;t work because when with the old flatview
it&#39;ll point to B instead, while B is not in the stale list. The AS
operation will carry out without noticing it&#39;s already wrong.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre">Peter, I think our understanding of pr=
iority is different.

In the qemu docs
(<a class=3D"moz-txt-link-freetext" href=3D"https://qemu.readthedocs.io/en/=
stable-6.1/devel/memory.html#overlapping-regions-and-priority">https://qemu=
.readthedocs.io/en/stable-6.1/devel/memory.html#overlapping-regions-and-pri=
ority</a>),
it says &#39;Priority values are local to a container, because the prioriti=
es of
two regions are only compared when they are both children of the same conta=
iner.&#39;
And as I read in code, when doing render_memory_region() operation on A, qe=
mu
will firstly insert B&#39;s FlatRanges and its children&#39;s FlatRanges re=
cursively
because B&#39;s priority is higher than C. After B&#39;s FlatRanges and its=
 children&#39;s
FlatRanges are all inserted into flatviews, C&#39;s FlatRanges and its chil=
dren&#39;s
FlatRanges will be inserted into gaps left by B if B and C overlaps.

So I think adding D as C&#39;s subregion has no effect on B in your second =
case.
The old FlatRange pointing to B is still effective. C and C&#39;children wi=
th lower
priority than D will be affected, but we have flagged them as stale.

I hope I have no misunderstanding of the flatview&#39;s construction code. =
If I
understand wrong, please forgive my ignorance..=F0=9F=98=AD
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">No I think you&#39;re right.. thanks, I =
should read the code/doc first rather
than trusting myself. :)

But still, the whole point is that the parent may not even be visible to
the flatview, so I still don&#39;t know how it could work.

My 2nd attempt:

                                  A
                                  |
                                  B
                                (p=3D1)

Adding C with p=3D2:

                                  A
                                 / \
                                B   C
                             (p=3D1) (p=3D2)

IIUC the flatview to access the offset A resides should point to B, then
after C plugged we&#39;ll still lookup and find B.  Even if A is in the sta=
le
list, B is not?
</pre>
    </blockquote>
    <pre>Sorry I forgot to describe my latest ideas about this mechanism in=
 detail.

we can add A, B and B&#39;s children to the stale list=EF=BC=88If there is =
D, E and=20
other mrs have lower priority than C, we can also add them and their childr=
en=20
to the stale list recursively). Or we can add a stale flag to mr structure=
=20
to avoid cost of searching mr in the stale list..
</pre>
    <blockquote type=3D"cite" cite=3D"mid:Y5IKOIUYHWbpVABV@x1n">
      <pre class=3D"moz-quote-pre">The other thing I didn&#39;t mention is =
that I don&#39;t think the address space
translation is the solo consumer of the flat view.  Some examples:

common_semi_find_bases() walks the flatview without translations.

memory_region_update_coalesced_range() (calls address_space_get_flatview()
first) notifies kvm coalesced mmio regions without translations.

So at least hooking up address_space_translate_internal() itself may not be
enough too.
</pre>
    </blockquote>
    <pre>This is really a problem. Maybe we should check whether the mr is =
stale on=20
all critical paths, or find other more genneral ways..=20
</pre>
    <blockquote type=3D"cite" cite=3D"mid:Y5IKOIUYHWbpVABV@x1n">
      <pre class=3D"moz-quote-pre"></pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre"></pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre"></pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre">There may be many details to consi=
der in this mechanism. Hope you can give
some suggestions on its feasibility.
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre">For this specific case, I&#39;m wild=
ly thinking whether we can just postpone
the init of the vring cache until migration completes.

One thing to mention from what I read it: we&#39;ll need to update all the
caches in virtio_memory_listener_commit() anyway, when the batched commit()
happens when migration completes with your approach, so we&#39;ll rebuild t=
he
vring cache once and for all which looks also nice if possible.

There&#39;s some details to consider. E.g. the commit() happens only when
memory_region_update_pending=3D=3Dtrue.  We may want to make sure the cache=
 is
initialized unconditionally, at least.  Not sure whether that&#39;s doable,
though.

Thanks,

</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre">Good idea! We can try it in the new pa=
tches! And with the delay of
virtio_init_region_cache(), we can still use assert in address_space_to_fla=
tview().
However, I think the stale list can be used as a retention scheme for furth=
er
discussion in the future, because the stale list may adapt to more complex =
scenarios.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">If the assert will work that&#39;ll be e=
ven better.  I&#39;m actually worried this
can trigger like what you mentioned in the virtio path, I didn&#39;t expect=
 it
comes that soon.  So if there&#39;s a minimum cases and we can fixup easily
that&#39;ll be great.  Hopefully there aren&#39;t so much or we&#39;ll need=
 to revisit
the whole idea.

Thanks,
</pre>
    </blockquote>
    <pre>+1.. Hope this is the only case that will trigger crash.

I&#39;ll upload the second version as soon as possible.

Thanks.
</pre>
 =20
</body></html>

--00000000000061069805ef602788--

