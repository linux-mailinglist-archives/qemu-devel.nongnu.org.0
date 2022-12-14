Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF8C64CDA5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5UES-0004jJ-Lh; Wed, 14 Dec 2022 11:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p5UEQ-0004hx-PT
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:03:42 -0500
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p5UEO-0001gz-Je
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:03:42 -0500
Received: by mail-qk1-x734.google.com with SMTP id m5so1466641qkg.0
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:references:user-agent:mime-version
 :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=75EAjYxQpMxvkQ3aiAc82NY0xagCM4LRzKbthyi0jtY=;
 b=uf81QYSjCxgac1NpCq//umPbPsN87nrpd4Ub5gFJ/k2EiEub7+Yp2G1wz66N1DJ7pV
 n12FrYWgvYFlKYYJx69tapCElnFW0sSz44qYs4PTKBYOTgC+59+5n1Zh3/al0MiIybDc
 4TXn+cgV8BUbwSVK9rELRcuqAzXnNzyIVUfh7sQPlSM95WzXqqzLYQUnndeBPU/ZUmVZ
 NzA+crP9PbKTp8JUOo22Q3J4h0Fwndkqw8IxLkuTPZyd7MQgbdwQxI2l4xuGWydsDTVo
 iVW6+pYFPAqBuOZKF/5Xs0QVo20xMqLGSVFPClskqeHhqGPK9p0Td/LzMbQmaPiKy+Es
 IBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:references:user-agent:mime-version
 :in-reply-to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75EAjYxQpMxvkQ3aiAc82NY0xagCM4LRzKbthyi0jtY=;
 b=CTlc9MtoK/Y4A9py9P67lsvmWr3SMFaZdjCSCI1muErDK4cIVMjUZW+p84E07WnL07
 giLrNKw+9eK6EWCT7HkwE/V1PeuH1sNnCaEVPcOVd5AgCF9hwqcLDlFmKyguxraRY3Bf
 Xv6yLeBWCDrv/Zq0lnePRKXypuobhmiInH+8pSPYbcYjvC6OHNcdqZrvaCpLsZdWp9/e
 5yccWMVCIl7syLziNSCSho3iDYbHM96XATTfS6ixMHxLN/eDwEgjyco4mlQQRhTq47fO
 aBckmw9MONIvsbS4yYBUBxOE/br1Maoy/VsHPKruiPyfU9/56wwN52tzN+KpoO+tjwf3
 Hvig==
X-Gm-Message-State: ANoB5pkNeN5K0mM1EjfOoqllDj3DWLFCo6S0Agkw1vO+tx84q9+3XpMk
 SCBhYCtyFqhKgOrrwz36eP0WIK/4sc85NYp9SdWRyERqa3CLuA==
X-Google-Smtp-Source: AA0mqf4JCIGo1zIdWLD9QqrRgLOTnPqudCCBHSfKiGoqfjtXajuuP+CNjUtGkMPUnTlH5uPUDkmgntnqZtfbRNbUx0U=
X-Received: by 2002:a37:a94e:0:b0:6fe:c166:d030 with SMTP id
 s75-20020a37a94e000000b006fec166d030mr14535215qke.712.1671033819306; Wed, 14
 Dec 2022 08:03:39 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Wed, 14 Dec 2022 08:03:38 -0800
From: Chuang Xu <xuchuangxclwt@bytedance.com>
In-Reply-To: <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
 <20221213133510.1279488-2-xuchuangxclwt@bytedance.com>
Date: Wed, 14 Dec 2022 08:03:38 -0800
Message-ID: <CALophuvwZHsqfTo=vshQawO+hPs6rkfHVDFZuukmaf_s+TGqJA@mail.gmail.com>
Subject: Re: [RFC v3 1/3] memory: add depth assert in address_space_to_flatview
To: qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, mst@redhat.com, 
 zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="0000000000003549ae05efcbe139"
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=xuchuangxclwt@bytedance.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_MUA_MOZILLA=2.309, FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999,
 HK_RANDOM_FROM=0.999, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001,
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

--0000000000003549ae05efcbe139
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/13 =E4=B8=8B=E5=8D=889:35, Chuang Xu wrote:

Before using any flatview, sanity check we're not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
<xuchuangxclwt@bytedance.com>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..b43cd46084 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };

+static unsigned memory_region_transaction_depth;
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    /*
+     * Before using any flatview, sanity check we're not during a memory
+     * region transaction or the map can be invalid.  Note that this can
+     * also be called during commit phase of memory transaction, but that
+     * should also only happen when the depth decreases to 0 first.
+     */
+    assert(memory_region_transaction_depth =3D=3D 0);
     return qatomic_rcu_read(&as->current_map);
 }

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..f177c40cd8 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -37,7 +37,6 @@

 //#define DEBUG_UNASSIGNED

-static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
 unsigned int global_dirty_tracking;

Here are some new situations to be synchronized.

I found that there is a probability to trigger assert in the QEMU startup p=
hase.

Here is the coredump backtrace:

#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
50
#1  0x00007f7825e33535 in __GI_abort () at abort.c:79
#2  0x00007f7825e3340f in __assert_fail_base (fmt=3D0x7f7825f94ef0
"%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=3D0x5653c643add8
"memory_region_transaction_depth =3D=3D 0",
    file=3D0x5653c63dad78
"/data00/migration/qemu-open/include/exec/memory.h", line=3D1082,
function=3D<optimized out>) at assert.c:92
#3  0x00007f7825e411a2 in __GI___assert_fail
(assertion=3Dassertion@entry=3D0x5653c643add8
"memory_region_transaction_depth =3D=3D 0",
    file=3Dfile@entry=3D0x5653c63dad78
"/data00/migration/qemu-open/include/exec/memory.h",
line=3Dline@entry=3D1082,
    function=3Dfunction@entry=3D0x5653c643bd00 <__PRETTY_FUNCTION__.18101>
"address_space_to_flatview") at assert.c:101
#4  0x00005653c60f0383 in address_space_to_flatview (as=3D0x5653c6af2340
<address_space_memory>) at
/data00/migration/qemu-open/include/exec/memory.h:1082
#5  address_space_to_flatview (as=3D0x5653c6af2340
<address_space_memory>) at
/data00/migration/qemu-open/include/exec/memory.h:1074
#6  address_space_get_flatview (as=3D0x5653c6af2340
<address_space_memory>) at ../softmmu/memory.c:809
#7  0x00005653c60fef04 in address_space_cache_init
(cache=3Dcache@entry=3D0x7f781fff8420, as=3D<optimized out>,
addr=3D63310635776, len=3D48, is_write=3Dis_write@entry=3Dfalse)
    at ../softmmu/physmem.c:3352
#8  0x00005653c60c08c5 in virtqueue_split_pop (vq=3D0x7f781c576270,
sz=3D264) at ../hw/virtio/virtio.c:1959
#9  0x00005653c60c0b7d in virtqueue_pop (vq=3Dvq@entry=3D0x7f781c576270,
sz=3D<optimized out>) at ../hw/virtio/virtio.c:2177
#10 0x00005653c609f14f in virtio_scsi_pop_req
(s=3Ds@entry=3D0x5653c9034300, vq=3Dvq@entry=3D0x7f781c576270) at
../hw/scsi/virtio-scsi.c:219
#11 0x00005653c60a04a3 in virtio_scsi_handle_cmd_vq
(vq=3D0x7f781c576270, s=3D0x5653c9034300) at ../hw/scsi/virtio-scsi.c:735
#12 virtio_scsi_handle_cmd (vdev=3D0x5653c9034300, vq=3D0x7f781c576270) at
../hw/scsi/virtio-scsi.c:776
#13 0x00005653c60ba72f in virtio_queue_notify_vq (vq=3D0x7f781c576270)
at ../hw/virtio/virtio.c:2847
#14 0x00005653c62d9706 in aio_dispatch_handler
(ctx=3Dctx@entry=3D0x5653c84909e0, node=3D0x7f68e4007840) at
../util/aio-posix.c:369
#15 0x00005653c62da254 in aio_dispatch_ready_handlers
(ready_list=3D0x7f781fffe6a8, ctx=3D0x5653c84909e0) at
../util/aio-posix.c:399
#16 aio_poll (ctx=3D0x5653c84909e0, blocking=3Dblocking@entry=3Dtrue) at
../util/aio-posix.c:713
#17 0x00005653c61b2296 in iothread_run
(opaque=3Dopaque@entry=3D0x5653c822c390) at ../iothread.c:67
#18 0x00005653c62dcd8a in qemu_thread_start (args=3D<optimized out>) at
../util/qemu-thread-posix.c:505
#19 0x00007f7825fd8fa3 in start_thread (arg=3D<optimized out>) at
pthread_create.c:486
#20 0x00007f7825f0a06f in clone () at
../sysdeps/unix/sysv/linux/x86_64/clone.S:95

I find that some functions doesn't take bql before calling
address_space_to_flatview(), as shown in the backtrace. I
also find other similar situations in the code. I find that
prepare_mmio_access() will take bql to provide some protection,
but I don't think it's sufficient.I think that if we want to
ensure that the reading and writing of mr and the modification
of mr don't occur at the same time, maybe we need to take bql
in address_space_to_flatview() like this:


static FlatView *address_space_to_flatview(AddressSpace *as)
{
    bool release_lock =3D false;
    FlatView *ret;

    if (!qemu_mutex_iothread_locked()) {
        qemu_mutex_lock_iothread();
        release_lock =3D true;
    }

    /*
     * Before using any flatview, sanity check we're not during a memory
     * region transaction or the map can be invalid.  Note that this can
     * also be called during commit phase of memory transaction, but that
     * should also only happen when the depth decreases to 0 first.
     */
    assert(memory_region_transaction_depth =3D=3D 0);
    ret =3D qatomic_rcu_read(&as->current_map);

    if (release_lock) {
        qemu_mutex_unlock_iothread();
    }

    return ret;
}

--0000000000003549ae05efcbe139
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-b203077136cec=
0d993d29a517c88895b">On 2022/12/13 =E4=B8=8B=E5=8D=889:35, Chuang Xu wrote:=
<br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:20221213133510.1279488-2-xuchuang=
xclwt@bytedance.com">
      <pre class=3D"moz-quote-pre">Before using any flatview, sanity check =
we&#39;re not during a memory
region transaction or the map can be invalid.

Signed-off-by: Chuang Xu <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
xuchuangxclwt@bytedance.com">&lt;xuchuangxclwt@bytedance.com&gt;</a>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 1 -
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..b43cd46084 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };
=20
+static unsigned memory_region_transaction_depth;
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    /*
+     * Before using any flatview, sanity check we&#39;re not during a memo=
ry
+     * region transaction or the map can be invalid.  Note that this can
+     * also be called during commit phase of memory transaction, but that
+     * should also only happen when the depth decreases to 0 first.
+     */
+    assert(memory_region_transaction_depth =3D=3D 0);
     return qatomic_rcu_read(&amp;as-&gt;current_map);
 }
=20
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..f177c40cd8 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -37,7 +37,6 @@
=20
 //#define DEBUG_UNASSIGNED
=20
-static unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
 unsigned int global_dirty_tracking;
</pre>
    </blockquote>
    <pre>Here are some new situations to be synchronized.

I found that there is a probability to trigger assert in the QEMU startup p=
hase.

Here is the coredump backtrace:

#0  __GI_raise (sig=3Dsig@entry=3D6) at ../sysdeps/unix/sysv/linux/raise.c:=
50
#1  0x00007f7825e33535 in __GI_abort () at abort.c:79
#2  0x00007f7825e3340f in __assert_fail_base (fmt=3D0x7f7825f94ef0 &quot;%s=
%s%s:%u: %s%sAssertion `%s&#39; failed.\n%n&quot;, assertion=3D0x5653c643ad=
d8 &quot;memory_region_transaction_depth =3D=3D 0&quot;,
    file=3D0x5653c63dad78 &quot;/data00/migration/qemu-open/include/exec/me=
mory.h&quot;, line=3D1082, function=3D&lt;optimized out&gt;) at assert.c:92
#3  0x00007f7825e411a2 in __GI___assert_fail (assertion=3Dassertion@entry=
=3D0x5653c643add8 &quot;memory_region_transaction_depth =3D=3D 0&quot;,
    file=3Dfile@entry=3D0x5653c63dad78 &quot;/data00/migration/qemu-open/in=
clude/exec/memory.h&quot;, line=3Dline@entry=3D1082,
    function=3Dfunction@entry=3D0x5653c643bd00 &lt;__PRETTY_FUNCTION__.1810=
1&gt; &quot;address_space_to_flatview&quot;) at assert.c:101
#4  0x00005653c60f0383 in address_space_to_flatview (as=3D0x5653c6af2340 &l=
t;address_space_memory&gt;) at /data00/migration/qemu-open/include/exec/mem=
ory.h:1082
#5  address_space_to_flatview (as=3D0x5653c6af2340 &lt;address_space_memory=
&gt;) at /data00/migration/qemu-open/include/exec/memory.h:1074
#6  address_space_get_flatview (as=3D0x5653c6af2340 &lt;address_space_memor=
y&gt;) at ../softmmu/memory.c:809
#7  0x00005653c60fef04 in address_space_cache_init (cache=3Dcache@entry=3D0=
x7f781fff8420, as=3D&lt;optimized out&gt;, addr=3D63310635776, len=3D48, is=
_write=3Dis_write@entry=3Dfalse)
    at ../softmmu/physmem.c:3352
#8  0x00005653c60c08c5 in virtqueue_split_pop (vq=3D0x7f781c576270, sz=3D26=
4) at ../hw/virtio/virtio.c:1959
#9  0x00005653c60c0b7d in virtqueue_pop (vq=3Dvq@entry=3D0x7f781c576270, sz=
=3D&lt;optimized out&gt;) at ../hw/virtio/virtio.c:2177
#10 0x00005653c609f14f in virtio_scsi_pop_req (s=3Ds@entry=3D0x5653c9034300=
, vq=3Dvq@entry=3D0x7f781c576270) at ../hw/scsi/virtio-scsi.c:219
#11 0x00005653c60a04a3 in virtio_scsi_handle_cmd_vq (vq=3D0x7f781c576270, s=
=3D0x5653c9034300) at ../hw/scsi/virtio-scsi.c:735
#12 virtio_scsi_handle_cmd (vdev=3D0x5653c9034300, vq=3D0x7f781c576270) at =
../hw/scsi/virtio-scsi.c:776
#13 0x00005653c60ba72f in virtio_queue_notify_vq (vq=3D0x7f781c576270) at .=
./hw/virtio/virtio.c:2847
#14 0x00005653c62d9706 in aio_dispatch_handler (ctx=3Dctx@entry=3D0x5653c84=
909e0, node=3D0x7f68e4007840) at ../util/aio-posix.c:369
#15 0x00005653c62da254 in aio_dispatch_ready_handlers (ready_list=3D0x7f781=
fffe6a8, ctx=3D0x5653c84909e0) at ../util/aio-posix.c:399
#16 aio_poll (ctx=3D0x5653c84909e0, blocking=3Dblocking@entry=3Dtrue) at ..=
/util/aio-posix.c:713
#17 0x00005653c61b2296 in iothread_run (opaque=3Dopaque@entry=3D0x5653c822c=
390) at ../iothread.c:67
#18 0x00005653c62dcd8a in qemu_thread_start (args=3D&lt;optimized out&gt;) =
at ../util/qemu-thread-posix.c:505
#19 0x00007f7825fd8fa3 in start_thread (arg=3D&lt;optimized out&gt;) at pth=
read_create.c:486
#20 0x00007f7825f0a06f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clo=
ne.S:95

I find that some functions doesn&#39;t take bql before calling
address_space_to_flatview(), as shown in the backtrace. I=20
also find other similar situations in the code. I find that
prepare_mmio_access() will take bql to provide some protection,=20
but I don&#39;t think it&#39;s sufficient.I think that if we want to=20
ensure that the reading and writing of mr and the modification=20
of mr don&#39;t occur at the same time, maybe we need to take bql=20
in address_space_to_flatview() like this:

</pre>
    <div>
      <pre style=3D"white-space:pre" class=3D"ace-line ace-line old-record-=
id-VoW8dKm2oo8W4mxCJyAcavo0nwt"><code class=3D"language-Shell"><div>static =
FlatView *address_space_to_flatview(AddressSpace *as)
{
    bool release_lock =3D false;
    FlatView *ret;

    if (!qemu_mutex_iothread_locked()) {
        qemu_mutex_lock_iothread();
        release_lock =3D true;
    }</div><div>
    /*
     * Before using any flatview, sanity check we&#39;re not during a memor=
y
     * region transaction or the map can be invalid.  Note that this can
     * also be called during commit phase of memory transaction, but that
     * should also only happen when the depth decreases to 0 first.
     */
    assert(memory_region_transaction_depth =3D=3D 0);
    ret =3D qatomic_rcu_read(&amp;as-&gt;current_map);</div><div>
    if (release_lock) {
        qemu_mutex_unlock_iothread();
    }
   =20
    return ret;
}</div><div>
</div><div>
</div></code></pre>
    </div>
    <span class=3D"lark-record-clipboard"></span>
    <pre>

</pre>
 =20
</body></html>

--0000000000003549ae05efcbe139--

