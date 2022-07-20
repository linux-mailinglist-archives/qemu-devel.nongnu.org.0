Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B157B46B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:23:29 +0200 (CEST)
Received: from localhost ([::1]:40770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE6rY-0006PH-9d
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oE6qD-0004fY-9x
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:22:05 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:43732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oE6qB-0006Mw-7C
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:22:05 -0400
Received: by mail-yb1-xb34.google.com with SMTP id f73so31091631yba.10
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eOQQ9/gYrbf2i+W5p4ZZXNpfhfXV6IM6UEgBTZ3/AlI=;
 b=Lwrgopq1xgbo0m7+n1dNv3+z2GUKUDoVfF3R1XrX1ko5YzKKGtNv2S0z1khYRwhEcx
 9uGJDIOPyxOOL2WM367J2Iwg/wY1g22r8wJ/BS4ndPhMZcJ371mpgmdGLSOzS6uB5yQQ
 L2qM37gnTuWhcY7hA9yiV7Aqlo7Ba/e7sgNfMXUzd7f8xpYv02zBsiWHx7Aakg+J54r9
 hLyqyvKEv5jbEfewI3XT8ap+DdYQIPnea+CdBiIcv1hlp0qn558BnSwiq9Rpb0v7UmbO
 D3tL/rKQu2QWeq1PaCvI/nIyTZCYQukLn/4BpILAZ4UcBAp1AEOJMvz1EsI/C0UWCs7G
 2dFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOQQ9/gYrbf2i+W5p4ZZXNpfhfXV6IM6UEgBTZ3/AlI=;
 b=d0xplvKY/Q734S9/iHdJtC3yfbdD6WwH6fbFXoX4neXs25nAMPfcXYJWA+d12+a+M3
 rPaZyYQu3Pw7VfDkUJv3Wv/7lFtsqRwzrMgOu+QnHQW2ICjxAdBV5vICgwDd753E2ztR
 8/EbNAWc5EHDvefmalKrExkwxwcT6oYgMjk28OpfnAxK4YRd8odRtXW3+RVHbRRdKjC1
 vXt3Gy4gxGJ0QM74FrqHDSO8NOcGJj+rtU5ccx96TPCO3OnUBJcvuxjsAwdhcgOn/Zxv
 wyziFwegfah0KCrt+xluwesuRQRPN/BASaOwamH+k4Bpxf/5si6zlDCw8BPoKpw0Gaue
 k/VA==
X-Gm-Message-State: AJIora8NRve4od02kqhjQxi1QFvTO8oEQ6GS2dNBK1+APqu/ysmqtNOR
 LX+/2DiyK+InDlSZXUw6O5DoqeBqrj/1l3k1Nc8=
X-Google-Smtp-Source: AGRyM1tNT4UjeBHfdvDFR5ILb49479iMVaT+KogARiRZOF7oZLVCQyTPjlaVi1SqpzOtKYei3y0d7pYs6j52VnbXmZE=
X-Received: by 2002:a5b:c87:0:b0:66f:2298:4ed7 with SMTP id
 i7-20020a5b0c87000000b0066f22984ed7mr35647684ybq.207.1658312521892; Wed, 20
 Jul 2022 03:22:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 20 Jul 2022 06:21:49 -0400
Message-ID: <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Klaus Birkelund Jensen <its@irrelevant.dk>, 
 Keith Busch <kbusch@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000cb499105e439f806"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000cb499105e439f806
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 9, 2022, 00:36 Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:

> Use irqfd to directly notify KVM to inject interrupts. This is done by
> registering a virtual IRQ(virq) in KVM and associate the virq with an
> irqfd, so that KVM can directly inject the interrupt when it receives
> notification from the irqfd. This approach is supposed to improve
> performance because it bypasses QEMU's MSI interrupt emulation logic.
>
> However, I did not see an obvious improvement of the emulation KIOPS:
>
> QD      1   4  16  64
> QEMU   38 123 210 329
> irqfd  40 129 219 328
>
> I found this problem quite hard to diagnose since irqfd's workflow
> involves both QEMU and the in-kernel KVM.
>
> Could you help me figure out the following questions:
>
> 1. How much performance improvement can I expect from using irqfd?
>

Hi Jinhao,
Thanks for working on this!

irqfd is not necessarily faster than KVM ioctl interrupt injection.

There are at least two non performance reasons for irqfd:
1. It avoids QEMU emulation code, which historically was not thread safe
and needed the Big QEMU Lock. IOThreads don't hold the BQL and therefore
cannot safely call the regular interrupt emulation code in QEMU. I think
this is still true today although parts of the code may now be less reliant
on the BQL.
2. The eventfd interface decouples interrupt injection from the KVM ioctl
interface. Vhost kernel and vhost-user device emulation code has no
dependency on KVM thanks to irqfd. They work with any eventfd, including
irqfd.

2. How can I debug this kind of cross QEMU-KVM problems?
>

perf(1) is good at observing both kernel and userspace activity together.
What is it that you want to debug.


> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/nvme.h |  3 +++
>  2 files changed, 68 insertions(+), 1 deletions(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 4b75c5f549..59768c4586 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -159,6 +159,7 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/block-backend.h"
>  #include "sysemu/hostmem.h"
> +#include "sysemu/kvm.h"
>  #include "hw/pci/msix.h"
>  #include "migration/vmstate.h"
>
> @@ -484,12 +485,70 @@ static void nvme_irq_check(NvmeCtrl *n)
>      }
>  }
>
> +static int nvme_kvm_msix_vector_use(NvmeCtrl *n,
> +                                    NvmeCQueue *cq,
> +                                    int vector)
> +{
> +    int ret;
> +
> +    KVMRouteChange c = kvm_irqchip_begin_route_changes(kvm_state);
> +    ret = kvm_irqchip_add_msi_route(&c, vector, &n->parent_obj);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +    kvm_irqchip_commit_route_changes(&c);
> +    cq->virq = ret;
> +    return 0;
> +}
> +
> +static int nvme_init_cq_irqfd(NvmeCQueue *cq)
> +{
> +    int ret;
> +
> +    ret = nvme_kvm_msix_vector_use(cq->ctrl, cq, (int)cq->vector);
> +    if (ret < 0) {
> +        goto fail;
> +    }
> +
> +    ret = event_notifier_init(&cq->irq_notifier, 0);
> +    if (ret < 0) {
> +        goto fail_notifier;
> +    }
> +
> +    ret = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &cq->irq_notifier,
> +                                              NULL, cq->virq);
> +    if (ret < 0) {
> +        goto fail_kvm;
> +    }
> +
> +    return 0;
> +
> +fail_kvm:
> +    event_notifier_cleanup(&cq->irq_notifier);
> +fail_notifier:
> +    kvm_irqchip_release_virq(kvm_state, cq->virq);
> +fail:
> +    return ret;
> +}
> +
>  static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)
>  {
>      if (cq->irq_enabled) {
>          if (msix_enabled(&(n->parent_obj))) {
> +            /* Initialize CQ irqfd */
> +            if (!cq->irqfd_enabled && n->params.ioeventfd && cq->cqid !=
> 0) {
> +                int ret = nvme_init_cq_irqfd(cq);
> +                if (ret == 0) {
> +                    cq->irqfd_enabled = true;
> +                }
> +            }
> +
>              trace_pci_nvme_irq_msix(cq->vector);
> -            msix_notify(&(n->parent_obj), cq->vector);
> +            if (cq->irqfd_enabled) {
> +                event_notifier_set(&cq->irq_notifier);
>

What happens when the MSI-X vector is masked?

I remember the VIRTIO code having masking support. I'm on my phone and
can't check now, but I think it registers a temporary eventfd and buffers
irqs while the vector is masked.

This makes me wonder if the VIRTIO and NVMe IOThread irqfd code can be
unified. Maybe IOThread support can be built into the core device emulation
code (e.g. irq APIs) so that it's not necessary to duplicate it.

+            } else {
> +                msix_notify(&(n->parent_obj), cq->vector);
> +            }
>          } else {
>              trace_pci_nvme_irq_pin();
>              assert(cq->vector < 32);
> @@ -4670,6 +4729,12 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl
> *n)
>          event_notifier_cleanup(&cq->notifier);
>      }
>      if (msix_enabled(&n->parent_obj)) {
> +        if (cq->irqfd_enabled) {
> +            kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> &cq->irq_notifier,
> +                                                  cq->virq);
> +            kvm_irqchip_release_virq(kvm_state, cq->virq);
> +            event_notifier_cleanup(&cq->irq_notifier);
> +        }
>          msix_vector_unuse(&n->parent_obj, cq->vector);
>      }
>      if (cq->cqid) {
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 2a9beea0c8..84e5b00fe3 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -391,7 +391,10 @@ typedef struct NvmeCQueue {
>      uint64_t    ei_addr;
>      QEMUTimer   *timer;
>      EventNotifier notifier;
> +    EventNotifier irq_notifier;
> +    int         virq;
>      bool        ioeventfd_enabled;
> +    bool        irqfd_enabled;
>      QTAILQ_HEAD(, NvmeSQueue) sq_list;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
>  } NvmeCQueue;
> --
> 2.25.1
>
>
>

--000000000000cb499105e439f806
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Jul 9, 2022, 00:36 Jinhao Fan &lt;<a href=3D"m=
ailto:fanjinhao21s@ict.ac.cn">fanjinhao21s@ict.ac.cn</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Use irqfd to directly notify KVM to inject=
 interrupts. This is done by<br>
registering a virtual IRQ(virq) in KVM and associate the virq with an<br>
irqfd, so that KVM can directly inject the interrupt when it receives<br>
notification from the irqfd. This approach is supposed to improve <br>
performance because it bypasses QEMU&#39;s MSI interrupt emulation logic.<b=
r>
<br>
However, I did not see an obvious improvement of the emulation KIOPS:<br>
<br>
QD=C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A04=C2=A0 16=C2=A0 64 <br>
QEMU=C2=A0 =C2=A038 123 210 329<br>
irqfd=C2=A0 40 129 219 328<br>
<br>
I found this problem quite hard to diagnose since irqfd&#39;s workflow<br>
involves both QEMU and the in-kernel KVM. <br>
<br>
Could you help me figure out the following questions:<br>
<br>
1. How much performance improvement can I expect from using irqfd?<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Hi Jinhao=
,</div><div dir=3D"auto">Thanks for working on this!</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">irqfd is not necessarily faster than KVM ioctl=
 interrupt injection.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
ere are at least two non performance reasons for irqfd:</div><div dir=3D"au=
to">1. It avoids QEMU emulation code, which historically was not thread saf=
e and needed the Big QEMU Lock. IOThreads don&#39;t hold the BQL and theref=
ore cannot safely call the regular interrupt emulation code in QEMU. I thin=
k this is still true today although parts of the code may now be less relia=
nt on the BQL.</div><div dir=3D"auto">2. The eventfd interface decouples in=
terrupt injection from the KVM ioctl interface. Vhost kernel and vhost-user=
 device emulation code has no dependency on KVM thanks to irqfd. They work =
with any eventfd, including irqfd.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
2. How can I debug this kind of cross QEMU-KVM problems?<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">perf(1) is good at =
observing both kernel and userspace activity together. What is it that you =
want to debug.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Jinhao Fan &lt;<a href=3D"mailto:fanjinhao21s@ict.ac.cn" tar=
get=3D"_blank" rel=3D"noreferrer">fanjinhao21s@ict.ac.cn</a>&gt;<br>
---<br>
=C2=A0hw/nvme/ctrl.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++-=
<br>
=C2=A0hw/nvme/nvme.h |=C2=A0 3 +++<br>
=C2=A02 files changed, 68 insertions(+), 1 deletions(-)<br>
<br>
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c<br>
index 4b75c5f549..59768c4586 100644<br>
--- a/hw/nvme/ctrl.c<br>
+++ b/hw/nvme/ctrl.c<br>
@@ -159,6 +159,7 @@<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
=C2=A0#include &quot;sysemu/hostmem.h&quot;<br>
+#include &quot;sysemu/kvm.h&quot;<br>
=C2=A0#include &quot;hw/pci/msix.h&quot;<br>
=C2=A0#include &quot;migration/vmstate.h&quot;<br>
<br>
@@ -484,12 +485,70 @@ static void nvme_irq_check(NvmeCtrl *n)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static int nvme_kvm_msix_vector_use(NvmeCtrl *n,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NvmeCQueue *cq,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int vector)<br>
+{<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 KVMRouteChange c =3D kvm_irqchip_begin_route_changes(kvm_sta=
te);<br>
+=C2=A0 =C2=A0 ret =3D kvm_irqchip_add_msi_route(&amp;c, vector, &amp;n-&gt=
;parent_obj);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 kvm_irqchip_commit_route_changes(&amp;c);<br>
+=C2=A0 =C2=A0 cq-&gt;virq =3D ret;<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
+static int nvme_init_cq_irqfd(NvmeCQueue *cq)<br>
+{<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 ret =3D nvme_kvm_msix_vector_use(cq-&gt;ctrl, cq, (int)cq-&g=
t;vector);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D event_notifier_init(&amp;cq-&gt;irq_notifier, 0);<br=
>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_notifier;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret =3D kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, &amp;c=
q-&gt;irq_notifier,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 NULL, cq-&gt;virq);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_kvm;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <br>
+fail_kvm:<br>
+=C2=A0 =C2=A0 event_notifier_cleanup(&amp;cq-&gt;irq_notifier);<br>
+fail_notifier:<br>
+=C2=A0 =C2=A0 kvm_irqchip_release_virq(kvm_state, cq-&gt;virq);<br>
+fail:<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
=C2=A0static void nvme_irq_assert(NvmeCtrl *n, NvmeCQueue *cq)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (cq-&gt;irq_enabled) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (msix_enabled(&amp;(n-&gt;parent_obj))=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Initialize CQ irqfd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cq-&gt;irqfd_enabled &amp;&=
amp; n-&gt;params.ioeventfd &amp;&amp; cq-&gt;cqid !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D nvme_i=
nit_cq_irqfd(cq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cq-&=
gt;irqfd_enabled =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_pci_nvme_irq_msix(cq-=
&gt;vector);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msix_notify(&amp;(n-&gt;parent_o=
bj), cq-&gt;vector);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cq-&gt;irqfd_enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_set=
(&amp;cq-&gt;irq_notifier);<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">What happens when the MSI-X vector is masked?</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">I remember the VIRTIO code=
 having masking support. I&#39;m on my phone and can&#39;t check now, but I=
 think it registers a temporary eventfd and buffers irqs while the vector i=
s masked.</div><div dir=3D"auto"><br></div><div dir=3D"auto">This makes me =
wonder if the VIRTIO and NVMe IOThread irqfd code can be unified. Maybe IOT=
hread support can be built into the core device emulation code (e.g. irq AP=
Is) so that it&#39;s not necessary to duplicate it.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msix_notify(&amp;(=
n-&gt;parent_obj), cq-&gt;vector);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_pci_nvme_irq_pin();<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(cq-&gt;vector &lt; 3=
2);<br>
@@ -4670,6 +4729,12 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_notifier_cleanup(&amp;cq-&gt;notifi=
er);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (msix_enabled(&amp;n-&gt;parent_obj)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cq-&gt;irqfd_enabled) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_irqchip_remove_irqfd_notifie=
r_gsi(kvm_state, &amp;cq-&gt;irq_notifier,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cq-&gt;virq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_irqchip_release_virq(kvm_sta=
te, cq-&gt;virq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_cleanup(&amp;cq-&=
gt;irq_notifier);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msix_vector_unuse(&amp;n-&gt;parent_obj, =
cq-&gt;vector);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (cq-&gt;cqid) {<br>
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h<br>
index 2a9beea0c8..84e5b00fe3 100644<br>
--- a/hw/nvme/nvme.h<br>
+++ b/hw/nvme/nvme.h<br>
@@ -391,7 +391,10 @@ typedef struct NvmeCQueue {<br>
=C2=A0 =C2=A0 =C2=A0uint64_t=C2=A0 =C2=A0 ei_addr;<br>
=C2=A0 =C2=A0 =C2=A0QEMUTimer=C2=A0 =C2=A0*timer;<br>
=C2=A0 =C2=A0 =C2=A0EventNotifier notifier;<br>
+=C2=A0 =C2=A0 EventNotifier irq_notifier;<br>
+=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virq;<br>
=C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 ioeventfd_enabled;<br>
+=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 =C2=A0 =C2=A0 irqfd_enabled;<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_HEAD(, NvmeSQueue) sq_list;<br>
=C2=A0 =C2=A0 =C2=A0QTAILQ_HEAD(, NvmeRequest) req_list;<br>
=C2=A0} NvmeCQueue;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000cb499105e439f806--

