Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE9581348
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 14:42:28 +0200 (CEST)
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGJtJ-0000G7-3g
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 08:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGJmt-0002Vb-1B
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:35:47 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:43933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGJmr-00022C-2H
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:35:46 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id f73so25026742yba.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 05:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELfbUeY9EQ0gGIaJrFxito6goB7utiAQEdpnCr22dC0=;
 b=pwR1xTNBeXel0h17RqfvRc1jI2tgtX9pze6vJwnLNXECBtMkOtcmY0Yin4M25j/KsD
 jwIWzQoJKTi8fiiVw3jyQ2E6Bj9mBZvSwg+tK0eXDbujJ4D/3+TgV1b6tZCD7y7JzzBY
 Od/3kJKWue6rrADwNTeluWLxy87trX5zdavAVPd1BcLMG4Ih9jSvLv/aWDgSjI6pOzeu
 fEU0DF7VdSFiMVlu7wrd9MkMQLhuwGfvZ2TbzlnBnG1BwmTs//vvA6hJNsATNw0RrXke
 c3lFM8XvjIVipzZ1EzuFDnJafR1rhVxhMkk4LKULNEQyVeOiT2fgDn4LwYJRcET8LSIx
 GKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELfbUeY9EQ0gGIaJrFxito6goB7utiAQEdpnCr22dC0=;
 b=RI5tRP1Nfr639X96+hNWRxKBjV2TSUZ/62LrAN3CDwEaXmtqGI9PUU54i491ZPcWRx
 zkJJRt4s3+WH5C+V2sDVkxB77gEKI653JGTli25nUXnStfczuQ7Bj5HIUbydvIXlJFwF
 jw4/LxBx+ualsKx2E1EbJurksz/vkoXKz9y12LvoWiGMSyRhoYSCfQm6e4gaeyXh9qmB
 d1bzOgE0Qaa9NFFm3fkEdvHfsLdeb0whfkaILUmpluE3YQTS8dnnoJahlf0Q6Q1/34BH
 XeMFOhh/aPVVA7I66rZEbmK/dY6KeiRVr12aFoHvB6TAXbIYR3Og/qpps0KWEFhGQ2pO
 jrtA==
X-Gm-Message-State: AJIora+BTuTzyQGA/u+PHYFdn5Hz0nbYHQDJRz0AJsFwXGMGAH7aIx0c
 hI48xIEbRagEKYMsyUupXy8Lf73uEeq85H4CSw0=
X-Google-Smtp-Source: AGRyM1tEx7aKncynfAd8q86NitEQkZ5D5uKZxPQuNIaEHLJN1hyhBo68hmQJIxBU5uwYd9ZmjZhkBraPhcNCgJXMHhM=
X-Received: by 2002:a25:30c4:0:b0:670:9351:324f with SMTP id
 w187-20020a2530c4000000b006709351324fmr13566107ybw.537.1658838941865; Tue, 26
 Jul 2022 05:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
In-Reply-To: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 26 Jul 2022 08:35:29 -0400
Message-ID: <CAJSP0QWAK-x4inYNPWBrd+KJDKPszjkCsadH+Ov5=DcDF6=eFA@mail.gmail.com>
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Klaus Birkelund Jensen <its@irrelevant.dk>, 
 Keith Busch <kbusch@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 5 Jul 2022 at 10:25, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
>
> Add property "ioeventfd" which is enabled by default. When this is
> enabled, updates on the doorbell registers will cause KVM to signal
> an event to the QEMU main loop to handle the doorbell updates.
> Therefore, instead of letting the vcpu thread run both guest VM and
> IO emulation, we now use the main loop thread to do IO emulation and
> thus the vcpu thread has more cycles for the guest VM.
>
> Since ioeventfd does not tell us the exact value that is written, it is
> only useful when shadow doorbell buffer is enabled, where we check
> for the value in the shadow doorbell buffer when we get the doorbell
> update event.
>
> IOPS comparison on Linux 5.19-rc2: (Unit: KIOPS)
>
> qd           1   4  16  64
> qemu        35 121 176 153
> ioeventfd   41 133 258 313

Nice

>
> Changes since v3:
>  - Do not deregister ioeventfd when it was not enabled on a SQ/CQ
>
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/nvme.h |   5 +++
>  2 files changed, 118 insertions(+), 1 deletion(-)
>
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index c952c34f94..4b75c5f549 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1374,7 +1374,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req)
>
>      QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
>      QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
> -    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
> +
> +    if (req->sq->ioeventfd_enabled) {
> +        /* Post CQE directly since we are in main loop thread */
> +        nvme_post_cqes(cq);
> +    } else {
> +        /* Schedule the timer to post CQE later since we are in vcpu thread */
> +        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
> +    }

This change is somewhat independent of ioeventfd. I wonder how much of
the performance improvement is due to the sq ioeventfd and how much is
due to bypassing the completion timer.

In the qd=1 case I expect the completion timer to increase latency and
hurt performance. In the qd=64 case the timer increases batching,
reduces CPU consumption, and probably improves performance.

It would be nice to measure this in isolation, independently of
ioeventfd/IOThreads.

>  }
>
>  static void nvme_process_aers(void *opaque)
> @@ -4195,10 +4202,82 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
>      return NVME_INVALID_OPCODE | NVME_DNR;
>  }
>
> +static void nvme_cq_notifier(EventNotifier *e)
> +{
> +    NvmeCQueue *cq = container_of(e, NvmeCQueue, notifier);
> +    NvmeCtrl *n = cq->ctrl;
> +
> +    event_notifier_test_and_clear(&cq->notifier);
> +
> +    nvme_update_cq_head(cq);
> +
> +    if (cq->tail == cq->head) {
> +        if (cq->irq_enabled) {
> +            n->cq_pending--;
> +        }
> +
> +        nvme_irq_deassert(n, cq);
> +    }
> +
> +    nvme_post_cqes(cq);
> +}
> +
> +static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
> +{
> +    NvmeCtrl *n = cq->ctrl;
> +    uint16_t offset = (cq->cqid << 3) + (1 << 2);

Too many...

> +    int ret;
> +
> +    ret = event_notifier_init(&cq->notifier, 0);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
> +    memory_region_add_eventfd(&n->iomem,
> +                              0x1000 + offset, 4, false, 0, &cq->notifier);

...magic numbers. Please use constants so it's clear what << 3, (1 <<
2), 0x1000, etc mean.

> +
> +    return 0;
> +}
> +
> +static void nvme_sq_notifier(EventNotifier *e)
> +{
> +    NvmeSQueue *sq = container_of(e, NvmeSQueue, notifier);
> +
> +    event_notifier_test_and_clear(&sq->notifier);
> +
> +    nvme_process_sq(sq);
> +}
> +
> +static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
> +{
> +    NvmeCtrl *n = sq->ctrl;
> +    uint16_t offset = sq->sqid << 3;
> +    int ret;
> +
> +    ret = event_notifier_init(&sq->notifier, 0);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
> +    memory_region_add_eventfd(&n->iomem,
> +                              0x1000 + offset, 4, false, 0, &sq->notifier);
> +
> +    return 0;
> +}
> +
>  static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl *n)
>  {
> +    uint16_t offset = sq->sqid << 3;
> +
>      n->sq[sq->sqid] = NULL;
>      timer_free(sq->timer);
> +    if (sq->ioeventfd_enabled) {
> +        memory_region_del_eventfd(&n->iomem,
> +                                  0x1000 + offset, 4, false, 0, &sq->notifier);
> +        event_notifier_cleanup(&sq->notifier);
> +    }
>      g_free(sq->io_req);
>      if (sq->sqid) {
>          g_free(sq);
> @@ -4271,6 +4350,12 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n, uint64_t dma_addr,
>      if (n->dbbuf_enabled) {
>          sq->db_addr = n->dbbuf_dbs + (sqid << 3);
>          sq->ei_addr = n->dbbuf_eis + (sqid << 3);
> +
> +        if (n->params.ioeventfd && sq->sqid != 0) {
> +            if (!nvme_init_sq_ioeventfd(sq)) {
> +                sq->ioeventfd_enabled = true;
> +            }
> +        }
>      }
>
>      assert(n->cq[cqid]);
> @@ -4575,8 +4660,15 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
>
>  static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *n)
>  {
> +    uint16_t offset = (cq->cqid << 3) + (1 << 2);
> +
>      n->cq[cq->cqid] = NULL;
>      timer_free(cq->timer);
> +    if (cq->ioeventfd_enabled) {
> +        memory_region_del_eventfd(&n->iomem,
> +                                  0x1000 + offset, 4, false, 0, &cq->notifier);
> +        event_notifier_cleanup(&cq->notifier);
> +    }
>      if (msix_enabled(&n->parent_obj)) {
>          msix_vector_unuse(&n->parent_obj, cq->vector);
>      }
> @@ -4635,6 +4727,12 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
>      if (n->dbbuf_enabled) {
>          cq->db_addr = n->dbbuf_dbs + (cqid << 3) + (1 << 2);
>          cq->ei_addr = n->dbbuf_eis + (cqid << 3) + (1 << 2);
> +
> +        if (n->params.ioeventfd && cqid != 0) {
> +            if (!nvme_init_cq_ioeventfd(cq)) {
> +                cq->ioeventfd_enabled = true;
> +            }
> +        }
>      }
>      n->cq[cqid] = cq;
>      cq->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, nvme_post_cqes, cq);
> @@ -5793,6 +5891,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
>      uint64_t dbs_addr = le64_to_cpu(req->cmd.dptr.prp1);
>      uint64_t eis_addr = le64_to_cpu(req->cmd.dptr.prp2);
>      int i;
> +    int ret;
>
>      /* Address should be page aligned */
>      if (dbs_addr & (n->page_size - 1) || eis_addr & (n->page_size - 1)) {
> @@ -5818,6 +5917,12 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
>              sq->ei_addr = eis_addr + (i << 3);
>              pci_dma_write(&n->parent_obj, sq->db_addr, &sq->tail,
>                      sizeof(sq->tail));
> +
> +            if (n->params.ioeventfd && sq->sqid != 0) {
> +                if (!nvme_init_sq_ioeventfd(sq)) {
> +                    sq->ioeventfd_enabled = true;
> +                }
> +            }
>          }
>
>          if (cq) {
> @@ -5826,6 +5931,12 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, const NvmeRequest *req)
>              cq->ei_addr = eis_addr + (i << 3) + (1 << 2);
>              pci_dma_write(&n->parent_obj, cq->db_addr, &cq->head,
>                      sizeof(cq->head));
> +
> +            if (n->params.ioeventfd && cq->cqid != 0) {
> +                if (!nvme_init_cq_ioeventfd(cq)) {
> +                    cq->ioeventfd_enabled = true;
> +                }
> +            }
>          }
>      }
>
> @@ -7040,6 +7151,7 @@ static Property nvme_props[] = {
>      DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
>      DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>                       params.auto_transition_zones, true),
> +    DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 4452e4b1bf..2a9beea0c8 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -369,6 +369,8 @@ typedef struct NvmeSQueue {
>      uint64_t    db_addr;
>      uint64_t    ei_addr;
>      QEMUTimer   *timer;
> +    EventNotifier notifier;
> +    bool        ioeventfd_enabled;
>      NvmeRequest *io_req;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
>      QTAILQ_HEAD(, NvmeRequest) out_req_list;
> @@ -388,6 +390,8 @@ typedef struct NvmeCQueue {
>      uint64_t    db_addr;
>      uint64_t    ei_addr;
>      QEMUTimer   *timer;
> +    EventNotifier notifier;
> +    bool        ioeventfd_enabled;
>      QTAILQ_HEAD(, NvmeSQueue) sq_list;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
>  } NvmeCQueue;
> @@ -410,6 +414,7 @@ typedef struct NvmeParams {
>      uint8_t  zasl;
>      bool     auto_transition_zones;
>      bool     legacy_cmb;
> +    bool     ioeventfd;
>  } NvmeParams;
>
>  typedef struct NvmeCtrl {
> --
> 2.25.1
>
>

