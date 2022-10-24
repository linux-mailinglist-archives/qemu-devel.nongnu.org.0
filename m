Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8058609D38
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 10:58:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omsrr-0000Q1-Uu; Mon, 24 Oct 2022 04:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omsrn-0000Pk-5g
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1omsrh-00026z-1X
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666600277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ssjlo7Hv9qY+rirSyE1bh3tnUe9WNGvrf2FQbd4xqNg=;
 b=idUwOkdTKOmh3Y4u34MZn3dFiLZBv+KKbr5CXwdHHbBxV7pXSO2JlS2HkjqzhXCYc92eqq
 MVrplcun6nShyvyYRnAUW1jM35x9rgMw8AGUql0vnp9ulObzCMFx2S3NvdhKFo71KGVqsl
 6HSUTD2GniHCJZhMVxmkXus8yECkA8g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-v8Y9huOUPg-VfVWdnNqtIQ-1; Mon, 24 Oct 2022 04:31:15 -0400
X-MC-Unique: v8Y9huOUPg-VfVWdnNqtIQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i5-20020a1c3b05000000b003c47c8569easo7181204wma.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 01:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ssjlo7Hv9qY+rirSyE1bh3tnUe9WNGvrf2FQbd4xqNg=;
 b=Do1ZtrQskXjIU4Jc/z+RI6gZZAPmAZhaNvjNdUekZpouikTLnpMB1m0K1w7YUAJhnl
 qkkK7u60Zqllzqho1UxbL51hUmpP8Bg4Km7lam/W8wrJYKDPspJfe96LLrpnPFXEWsNz
 PDj3peXrXA3J7ZS+S/ENOMIOe30PND2DotgD+bXipxjIhVjlaw8kzxcfF5ZYZb2/e8/u
 JBJUWHQ1pR1g+sfD/OnPTxEzaopt+Qnh635lkPGZeetYgNpKMHcjFxSXZSX6KQ9Cdtk8
 73IkTU4scMUyMmtFCFV5cGFFW6YYWK2KHJ5gyhPvlb16urPjp/TXbHlfahb3NGCMun43
 wNzg==
X-Gm-Message-State: ACrzQf30va2VijLjSbfKi5fuzBBdOfe3gtZ8tZF/6PLebFOhIkxZBY+v
 imScSuLiu66QtMueLQTB2ISrD5KhnGyDzVVIhQEM6c+VYM/abStMBGXABq2jd3ZiV97eZXv+9Ao
 3hp9Oj2oCszXlzqU=
X-Received: by 2002:a5d:5a9d:0:b0:225:2783:d6f1 with SMTP id
 bp29-20020a5d5a9d000000b002252783d6f1mr21269564wrb.385.1666600274621; 
 Mon, 24 Oct 2022 01:31:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4S301PLJM/qiU32Yr1owJEpJWbJyDPX/SIiSFxQmR6i3HsppKDYWKvQtOZ1ouF2ixQvjyi/g==
X-Received: by 2002:a5d:5a9d:0:b0:225:2783:d6f1 with SMTP id
 bp29-20020a5d5a9d000000b002252783d6f1mr21269520wrb.385.1666600274204; 
 Mon, 24 Oct 2022 01:31:14 -0700 (PDT)
Received: from redhat.com ([2.54.160.13]) by smtp.gmail.com with ESMTPSA id
 y6-20020adff146000000b00228d67db06esm9208578wro.21.2022.10.24.01.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 01:31:13 -0700 (PDT)
Date: Mon, 24 Oct 2022 04:31:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bin Meng <bmeng@tinylab.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: Re: [PATCH] treewide: Remove the unnecessary space before semicolon
Message-ID: <20221024043057-mutt-send-email-mst@kernel.org>
References: <20221024072802.457832-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024072802.457832-1-bmeng@tinylab.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 03:28:02PM +0800, Bin Meng wrote:
> %s/return ;/return;
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

ack for virtio

trivial tree pls

> ---
> 
>  include/hw/elf_ops.h         | 2 +-
>  hw/9pfs/9p.c                 | 2 +-
>  hw/dma/pl330.c               | 2 +-
>  hw/net/can/can_sja1000.c     | 2 +-
>  hw/timer/renesas_cmt.c       | 2 +-
>  hw/timer/renesas_tmr.c       | 8 ++++----
>  hw/virtio/virtio-pci.c       | 2 +-
>  target/riscv/vector_helper.c | 2 +-
>  target/rx/op_helper.c        | 4 ++--
>  ui/vnc-jobs.c                | 2 +-
>  ui/vnc.c                     | 2 +-
>  11 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 7c3b1d0f6c..fbe0b1e956 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -117,7 +117,7 @@ static void glue(load_symbols, SZ)(struct elfhdr *ehdr, int fd, int must_swab,
>      shdr_table = load_at(fd, ehdr->e_shoff,
>                           sizeof(struct elf_shdr) * ehdr->e_shnum);
>      if (!shdr_table) {
> -        return ;
> +        return;
>      }
>  
>      if (must_swab) {
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index aebadeaa03..76c591a01b 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1786,7 +1786,7 @@ static void coroutine_fn v9fs_walk(void *opaque)
>      err = pdu_unmarshal(pdu, offset, "ddw", &fid, &newfid, &nwnames);
>      if (err < 0) {
>          pdu_complete(pdu, err);
> -        return ;
> +        return;
>      }
>      offset += err;
>  
> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
> index 08e5938ec7..e5d521c329 100644
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -1328,7 +1328,7 @@ static void pl330_debug_exec(PL330State *s)
>      }
>      if (!insn) {
>          pl330_fault(ch, PL330_FAULT_UNDEF_INSTR | PL330_FAULT_DBG_INSTR);
> -        return ;
> +        return;
>      }
>      ch->stall = 0;
>      insn->exec(ch, opcode, args, insn->size - 1);
> diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
> index e0f76d3eb3..73201f9139 100644
> --- a/hw/net/can/can_sja1000.c
> +++ b/hw/net/can/can_sja1000.c
> @@ -431,7 +431,7 @@ void can_sja_mem_write(CanSJA1000State *s, hwaddr addr, uint64_t val,
>              (unsigned long long)val, (unsigned int)addr);
>  
>      if (addr > CAN_SJA_MEM_SIZE) {
> -        return ;
> +        return;
>      }
>  
>      if (s->clock & 0x80) { /* PeliCAN Mode */
> diff --git a/hw/timer/renesas_cmt.c b/hw/timer/renesas_cmt.c
> index 2e0fd21a36..69eabc678a 100644
> --- a/hw/timer/renesas_cmt.c
> +++ b/hw/timer/renesas_cmt.c
> @@ -57,7 +57,7 @@ static void update_events(RCMTState *cmt, int ch)
>  
>      if ((cmt->cmstr & (1 << ch)) == 0) {
>          /* count disable, so not happened next event. */
> -        return ;
> +        return;
>      }
>      next_time = cmt->cmcor[ch] - cmt->cmcnt[ch];
>      next_time *= NANOSECONDS_PER_SECOND;
> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
> index d96002e1ee..c15f654738 100644
> --- a/hw/timer/renesas_tmr.c
> +++ b/hw/timer/renesas_tmr.c
> @@ -67,18 +67,18 @@ static void update_events(RTMRState *tmr, int ch)
>      int i, event;
>  
>      if (tmr->tccr[ch] == 0) {
> -        return ;
> +        return;
>      }
>      if (FIELD_EX8(tmr->tccr[ch], TCCR, CSS) == 0) {
>          /* external clock mode */
>          /* event not happened */
> -        return ;
> +        return;
>      }
>      if (FIELD_EX8(tmr->tccr[0], TCCR, CSS) == CSS_CASCADING) {
>          /* cascading mode */
>          if (ch == 1) {
>              tmr->next[ch] = none;
> -            return ;
> +            return;
>          }
>          diff[cmia] = concat_reg(tmr->tcora) - concat_reg(tmr->tcnt);
>          diff[cmib] = concat_reg(tmr->tcorb) - concat_reg(tmr->tcnt);
> @@ -384,7 +384,7 @@ static void timer_events(RTMRState *tmr, int ch)
>                                      tmr->tcorb[ch]) & 0xff;
>      } else {
>          if (ch == 1) {
> -            return ;
> +            return;
>          }
>          tcnt = issue_event(tmr, ch, 16,
>                             concat_reg(tmr->tcnt),
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index e7d80242b7..34db51e241 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1675,7 +1675,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
>          if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>              error_setg(errp, "VIRTIO_F_IOMMU_PLATFORM was supported by"
>                         " neither legacy nor transitional device");
> -            return ;
> +            return;
>          }
>          /*
>           * Legacy and transitional devices use specific subsystem IDs.
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index b94f809eb3..0020b9a95d 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -211,7 +211,7 @@ static void vext_set_elems_1s(void *base, uint32_t is_agnostic, uint32_t cnt,
>          return;
>      }
>      if (tot - cnt == 0) {
> -        return ;
> +        return;
>      }
>      memset(base + cnt, -1, tot - cnt);
>  }
> diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
> index 9ca32dcc82..acce650185 100644
> --- a/target/rx/op_helper.c
> +++ b/target/rx/op_helper.c
> @@ -286,7 +286,7 @@ void helper_suntil(CPURXState *env, uint32_t sz)
>      uint32_t tmp;
>      tcg_debug_assert(sz < 3);
>      if (env->regs[3] == 0) {
> -        return ;
> +        return;
>      }
>      do {
>          tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
> @@ -305,7 +305,7 @@ void helper_swhile(CPURXState *env, uint32_t sz)
>      uint32_t tmp;
>      tcg_debug_assert(sz < 3);
>      if (env->regs[3] == 0) {
> -        return ;
> +        return;
>      }
>      do {
>          tmp = cpu_ldufn[sz](env, env->regs[1], GETPC());
> diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
> index 4562bf8928..886f9bf611 100644
> --- a/ui/vnc-jobs.c
> +++ b/ui/vnc-jobs.c
> @@ -373,7 +373,7 @@ void vnc_start_worker_thread(void)
>      VncJobQueue *q;
>  
>      if (vnc_worker_thread_running())
> -        return ;
> +        return;
>  
>      q = vnc_queue_init();
>      qemu_thread_create(&q->thread, "vnc_worker", vnc_worker_thread, q,
> diff --git a/ui/vnc.c b/ui/vnc.c
> index acb3629cd8..88f55cbf3c 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -3085,7 +3085,7 @@ static void vnc_rect_updated(VncDisplay *vd, int x, int y, struct timeval * tv)
>  
>      rect = vnc_stat_rect(vd, x, y);
>      if (rect->updated) {
> -        return ;
> +        return;
>      }
>      rect->times[rect->idx] = *tv;
>      rect->idx = (rect->idx + 1) % ARRAY_SIZE(rect->times);
> -- 
> 2.25.1


