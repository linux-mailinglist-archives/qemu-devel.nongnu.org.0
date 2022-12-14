Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50E964CDA4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 17:04:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5UDM-0003Gi-Un; Wed, 14 Dec 2022 11:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p5UDG-0003FO-CW
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:02:31 -0500
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xuchuangxclwt@bytedance.com>)
 id 1p5UDC-0000fd-T6
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 11:02:30 -0500
Received: by mail-qk1-x734.google.com with SMTP id x18so1442442qki.4
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 08:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:user-agent:from
 :mime-version:references:from:to:cc:subject:date:message-id:reply-to;
 bh=VuLtiC5jUndHmGGi4kSyQtaUSvpHqQoCJNsqLGTQ0rY=;
 b=U+a9UEnig0x3XUWniv2Ktkeys+hHy7NCh1hWnP8XGKLovLN2mQNdIm02qEd6yEIdZM
 YFZbTwOQlbBFOzmVWyCmSqRGBQjLaRAdqgdKpEUuWoyNzxChYX1uavTa9x3Ot679RgSn
 bgUor4VKN/7nHsd05zhXrdA1dcdmM8YpB0//1297nL5uq2k9HoNPEPN4opXJlI1oS2Hw
 dDCR0uG7dWJeFcIO0DI/nj/2HqIGYIS9zU405r7E29BK8m66OeeCr53kLPBzgviZbxrg
 N+Tnygva69Pu9lJTzG5X6y/O1/+mzhooWW3vdLgrXDhX2uDDrm65PgH4wk5IYhRPptnH
 HzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:user-agent:from
 :mime-version:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VuLtiC5jUndHmGGi4kSyQtaUSvpHqQoCJNsqLGTQ0rY=;
 b=hUJN5GlDIwzkT8Ml7lVnRekN/xazG7THSevRqtkQ0fjRLv1XQcoh0bT8piE93L2h7V
 OIzLZJjjzQZpgJxA+FMkwH4PaG2HGFpLA4DCno+DajERGADGX6ajEsRjsN1Pya6buxRX
 xNfP+71uzyQBqSc/ojC38Oh/GMdmoE3SZ8bruUEBME/HTgSiyWXnAgOcr0e2ptKZtqFp
 /e5U/fkyyguN4N4ZZhL6e5/OCJbGqsowYaIsFDPRLF9P0Pw6kjKAgwVx5u0s9tyLGwNw
 5qqo8Fo0SiLM0A0AEHRJ1qdR4wqsWzBve4ykNyM3RbIFoiZKmb/ouAhfQEv9SlpgzwAC
 omIw==
X-Gm-Message-State: ANoB5pkCzwHCAyKMGfdaA4IgyTk//uRDpL2QnzSD2Sy6yflkFkh5dWj3
 MVe5n7S93mE/t9nWk7QLZS0Nn+6/NfzOfYvbX8n0QQ==
X-Google-Smtp-Source: AA0mqf6cQpGnYwASoATJMjjfnVajFvyj6r2euom9VpBC71/WFVwovyfHdWCapxqcdjbr2Yl7UcCjcVTBqgpsBM0Vb6w=
X-Received: by 2002:ae9:c202:0:b0:6fc:9712:2121 with SMTP id
 j2-20020ae9c202000000b006fc97122121mr33469775qkg.762.1671033745036; Wed, 14
 Dec 2022 08:02:25 -0800 (PST)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST; 
 Wed, 14 Dec 2022 08:02:24 -0800
References: <20221213133510.1279488-1-xuchuangxclwt@bytedance.com>
 <20221213133510.1279488-3-xuchuangxclwt@bytedance.com> <Y5io5AfRWCluAk3P@x1n>
Mime-Version: 1.0
From: Chuang Xu <xuchuangxclwt@bytedance.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
In-Reply-To: <Y5io5AfRWCluAk3P@x1n>
Date: Wed, 14 Dec 2022 08:02:24 -0800
Message-ID: <CALophutew8JGn6WqBOX=eTSULECvAHg7CQqN=LuvvR6Yc+cPZg@mail.gmail.com>
Subject: Re: [RFC v3 2/3] virtio: support delay of checks in virtio_load()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com, 
 pbonzini@redhat.com, david@redhat.com, f4bug@amsat.org, mst@redhat.com, 
 zhouyibo@bytedance.com
Content-Type: multipart/alternative; boundary="000000000000c7fb0305efcbdc09"
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

--000000000000c7fb0305efcbdc09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2022/12/14 =E4=B8=8A=E5=8D=8812:31, Peter Xu wrote:

On Tue, Dec 13, 2022 at 09:35:09PM +0800, Chuang Xu wrote:

Delay checks in virtio_load() to avoid possible address_space_to_flatview()=
 call
during memory region's begin/commit.

I didn't notice virtio has the vm change handler already, looks good to
reuse it. :) A few more comments though (before some real virtio developers
chim im).


Signed-off-by: Chuang Xu <xuchuangxclwt@bytedance.com>
<xuchuangxclwt@bytedance.com>
---
 hw/virtio/virtio.c         | 37 +++++++++++++++++++++++++++----------
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..f556e565c6 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3642,8 +3642,26 @@ int virtio_load(VirtIODevice *vdev, QEMUFile
*f, int version_id)
         vdev->start_on_kick =3D true;
     }

+    vdev->delay_check =3D true;
+
+    if (vdc->post_load) {
+        ret =3D vdc->post_load(vdev);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+static void virtio_load_check_delay(VirtIODevice *vdev)
+{
     RCU_READ_LOCK_GUARD();
-    for (i =3D 0; i < num; i++) {
+    for (int i =3D 0; i < VIRTIO_QUEUE_MAX; i++) {
+        if (vdev->vq[i].vring.num =3D=3D 0) {
+            break;
+        }
+
         if (vdev->vq[i].vring.desc) {
             uint16_t nheads;

@@ -3696,19 +3714,12 @@ int virtio_load(VirtIODevice *vdev, QEMUFile
*f, int version_id)
                              i, vdev->vq[i].vring.num,
                              vdev->vq[i].last_avail_idx,
                              vdev->vq[i].used_idx);
-                return -1;
+                abort();

This is when the switchover finished.  I'm not sure how severe this is and
whether there can be something to remedy - abort() is probably the least we
want to do here, since the admin may not want to crash the whole VM due to
one vring failure on one device.

At this time, the vcpus are still stopped. If these checks fail in
virtio_load(), - 1 will be returned, and the migration will be rolled
back. But virtio_vmstate_change() returns nothing, if we want to
rollback the migration after the checks fail, I think we need abort().

             }
         }
     }

-    if (vdc->post_load) {
-        ret =3D vdc->post_load(vdev);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    return 0;
+    return;
 }

 void virtio_cleanup(VirtIODevice *vdev)
@@ -3722,6 +3733,11 @@ static void virtio_vmstate_change(void *opaque,
bool running, RunState state)
     BusState *qbus =3D qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
     bool backend_run =3D running && virtio_device_started(vdev, vdev->stat=
us);
+
+    if (vdev->delay_check) {
+        virtio_load_check_delay(vdev);
+        vdev->delay_check =3D false;
+    }
     vdev->vm_running =3D running;

     if (backend_run) {
@@ -3789,6 +3805,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t
device_id, size_t config_size)
             virtio_vmstate_change, vdev);
     vdev->device_endian =3D virtio_default_endian();
     vdev->use_guest_notifier_mask =3D true;
+    vdev->delay_check =3D false;
 }

 /*
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index acfd4df125..269e80d04a 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -135,6 +135,8 @@ struct VirtIODevice
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
+    /* @delay_check: delay checks in virtio_load */
+    bool delay_check;

I think it covers more than the check?  It also initializes variables like
used_idx and shadow_avail_idx.  I'm not sure how vital they are, but I'd
just avoid using the word "check" if not sure (e.g. "load_delay", or
"load_finalize"?).

OK. I prefer to use "load_finalize".

Thanks!

 };

 struct VirtioDeviceClass {
--=20
2.20.1

--000000000000c7fb0305efcbdc09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix"><div id=3D"lark-mail-quote-77c982360d079=
9a795392344cfb8803e">On 2022/12/14 =E4=B8=8A=E5=8D=8812:31, Peter Xu wrote:=
<br>
    </div></div>
    <blockquote type=3D"cite" cite=3D"mid:Y5io5AfRWCluAk3P@x1n">
      <pre class=3D"moz-quote-pre">On Tue, Dec 13, 2022 at 09:35:09PM +0800=
, Chuang Xu wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">Delay checks in virtio_load() to avoid=
 possible address_space_to_flatview() call
during memory region&#39;s begin/commit.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">I didn&#39;t notice virtio has the vm ch=
ange handler already, looks good to
reuse it. :) A few more comments though (before some real virtio developers
chim im).

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">Signed-off-by: Chuang Xu <a class=3D"m=
oz-txt-link-rfc2396E" href=3D"mailto:xuchuangxclwt@bytedance.com">&lt;xuchu=
angxclwt@bytedance.com&gt;</a>
---
 hw/virtio/virtio.c         | 37 +++++++++++++++++++++++++++----------
 include/hw/virtio/virtio.h |  2 ++
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index eb6347ab5d..f556e565c6 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3642,8 +3642,26 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int=
 version_id)
         vdev-&gt;start_on_kick =3D true;
     }
=20
+    vdev-&gt;delay_check =3D true;
+
+    if (vdc-&gt;post_load) {
+        ret =3D vdc-&gt;post_load(vdev);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+static void virtio_load_check_delay(VirtIODevice *vdev)
+{
     RCU_READ_LOCK_GUARD();
-    for (i =3D 0; i &lt; num; i++) {
+    for (int i =3D 0; i &lt; VIRTIO_QUEUE_MAX; i++) {
+        if (vdev-&gt;vq[i].vring.num =3D=3D 0) {
+            break;
+        }
+
         if (vdev-&gt;vq[i].vring.desc) {
             uint16_t nheads;
=20
@@ -3696,19 +3714,12 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, in=
t version_id)
                              i, vdev-&gt;vq[i].vring.num,
                              vdev-&gt;vq[i].last_avail_idx,
                              vdev-&gt;vq[i].used_idx);
-                return -1;
+                abort();
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">This is when the switchover finished.  I=
&#39;m not sure how severe this is and
whether there can be something to remedy - abort() is probably the least we
want to do here, since the admin may not want to crash the whole VM due to
one vring failure on one device.
</pre>
    </blockquote>
    <pre>At this time, the vcpus are still stopped. If these checks fail in=
=20
virtio_load(), - 1 will be returned, and the migration will be rolled=20
back. But virtio_vmstate_change() returns nothing, if we want to=20
rollback the migration after the checks fail, I think we need abort().
</pre>
    <blockquote type=3D"cite" cite=3D"mid:Y5io5AfRWCluAk3P@x1n">
      <pre class=3D"moz-quote-pre"></pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre">             }
         }
     }
=20
-    if (vdc-&gt;post_load) {
-        ret =3D vdc-&gt;post_load(vdev);
-        if (ret) {
-            return ret;
-        }
-    }
-
-    return 0;
+    return;
 }
=20
 void virtio_cleanup(VirtIODevice *vdev)
@@ -3722,6 +3733,11 @@ static void virtio_vmstate_change(void *opaque, bool=
 running, RunState state)
     BusState *qbus =3D qdev_get_parent_bus(DEVICE(vdev));
     VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
     bool backend_run =3D running &amp;&amp; virtio_device_started(vdev, vd=
ev-&gt;status);
+
+    if (vdev-&gt;delay_check) {
+        virtio_load_check_delay(vdev);
+        vdev-&gt;delay_check =3D false;
+    }
     vdev-&gt;vm_running =3D running;
=20
     if (backend_run) {
@@ -3789,6 +3805,7 @@ void virtio_init(VirtIODevice *vdev, uint16_t device_=
id, size_t config_size)
             virtio_vmstate_change, vdev);
     vdev-&gt;device_endian =3D virtio_default_endian();
     vdev-&gt;use_guest_notifier_mask =3D true;
+    vdev-&gt;delay_check =3D false;
 }
=20
 /*
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index acfd4df125..269e80d04a 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -135,6 +135,8 @@ struct VirtIODevice
     AddressSpace *dma_as;
     QLIST_HEAD(, VirtQueue) *vector_queues;
     QTAILQ_ENTRY(VirtIODevice) next;
+    /* @delay_check: delay checks in virtio_load */
+    bool delay_check;
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre">I think it covers more than the check?  =
It also initializes variables like
used_idx and shadow_avail_idx.  I&#39;m not sure how vital they are, but I&=
#39;d
just avoid using the word &quot;check&quot; if not sure (e.g. &quot;load_de=
lay&quot;, or
&quot;load_finalize&quot;?).
</pre>
    </blockquote>
    <pre>OK. I prefer to use &quot;load_finalize&quot;.

Thanks!
</pre>
    <blockquote type=3D"cite" cite=3D"mid:Y5io5AfRWCluAk3P@x1n">
      <pre class=3D"moz-quote-pre"></pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre"> };
=20
 struct VirtioDeviceClass {
--=20
2.20.1

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre"></pre>
    </blockquote>
 =20
</body></html>

--000000000000c7fb0305efcbdc09--

