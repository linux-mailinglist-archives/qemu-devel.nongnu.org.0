Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C4566D11B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 22:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHXNu-0003co-HU; Mon, 16 Jan 2023 16:51:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pHXNp-0003cZ-6M
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:51:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pHXNn-0002eX-Ir
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 16:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673905870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S7onnjcC4ecaQ1Y0GinFMXvAAc1NY7pQFbBFMGg731k=;
 b=Dtd4uJNm/XndGXZNKRhY8kcIZ7iU2bTHUbTtviFKtU+9FsAKdRMB4CXVVT0IQTVzYITiFt
 C3vF/Npuy9oqR8bEjuBgLAnzOmbSUGtjY/hDDpjY2lH7aeuJ+qucbYQuscfMAoijB6q/Wh
 d7Q0Khb2YxLtSVM47iSPnWMil9fPp7A=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-_9NnB0M5PgCmAP0G3Sdy7g-1; Mon, 16 Jan 2023 16:51:09 -0500
X-MC-Unique: _9NnB0M5PgCmAP0G3Sdy7g-1
Received: by mail-ua1-f69.google.com with SMTP id
 y10-20020ab0560a000000b003af33bfa8c4so12499969uaa.21
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 13:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S7onnjcC4ecaQ1Y0GinFMXvAAc1NY7pQFbBFMGg731k=;
 b=dexlADk4YCtb+K3XCAdItHdPRZ62tayvwLznLNiUy+X0A6rjvly7n8whz/eiJiKU0u
 wj62OUlcl9HvbWjxvAI6/Ax81lohcQ/TjC8ExKe9uRvYho8Wo3tBrXAGLZYhyqlELr4/
 U3eSv0Noy69cjy7QaPtGZGSnrotqo5SdBk9Q9GqwVFF62V07Cc2fM+wVwY14sV6zziO0
 2Ok9Y+Kobjam7yps5RlgD6IG+c6yjHB1dvt1spbq+gr5fn3TOD1LmrrWEa0etdTPoMEm
 /KK05fM1NoFn8p9foILRwwYf285y1OAczXPQg5QSjRnvyd8xeZ768F2Ca/WhgqYZtPqj
 jNEA==
X-Gm-Message-State: AFqh2kqoU7TdIdB+WglRrJONw1TGMAH6pTAzwTxadcFzXrqYqyfDtFhX
 ltP7h+LD8qJlPNHkkG2/fqzMwr9RyWBGViVR+NAoULYiqjHsuvJxnXupf2m6hN40zRP/u/TM+iy
 9gFJlnca4f5o/85xEZQw9MnMTDWZHkY8=
X-Received: by 2002:a67:de98:0:b0:3d3:e071:e00d with SMTP id
 r24-20020a67de98000000b003d3e071e00dmr69936vsk.39.1673905868587; 
 Mon, 16 Jan 2023 13:51:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvsyNyVZgYkBh22M9jWbGx8rVmM/rn+r91wYx/nXg93pRlpcMOFU54U99+0R8YCTy7YcajmWWhdKBwSowjxxNQ=
X-Received: by 2002:a67:de98:0:b0:3d3:e071:e00d with SMTP id
 r24-20020a67de98000000b003d3e071e00dmr69929vsk.39.1673905868384; Mon, 16 Jan
 2023 13:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20230116204232.1142442-1-mcascell@redhat.com>
In-Reply-To: <20230116204232.1142442-1-mcascell@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Mon, 16 Jan 2023 22:50:57 +0100
Message-ID: <CAA8xKjVKxP9861By-u2-OMbanEQ6b4eZBJp3naE1B5W0dB6z2w@mail.gmail.com>
Subject: Re: [PATCH] scsi/lsi53c895a: restrict DMA engine to memory regions
 (CVE-2023-0330)
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, fam@euphon.net, philmd@linaro.org, alxndr@bu.edu, 
 zheyuma97@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Jan 16, 2023 at 9:42 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> This prevents the well known DMA-MMIO reentrancy problem (upstream issue #556)
> leading to memory corruption bugs like stack overflow or use-after-free.
>
> Fixes: CVE-2023-0330
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> Reported-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  hw/scsi/lsi53c895a.c               | 14 +++++++++----
>  tests/qtest/fuzz-lsi53c895a-test.c | 32 ++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> index af93557a9a..89c52594eb 100644
> --- a/hw/scsi/lsi53c895a.c
> +++ b/hw/scsi/lsi53c895a.c
> @@ -446,22 +446,28 @@ static void lsi_reselect(LSIState *s, lsi_request *p);
>  static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
>                                 void *buf, dma_addr_t len)
>  {
> +    const MemTxAttrs attrs = { .memory = true };
> +
>      if (s->dmode & LSI_DMODE_SIOM) {
> -        address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
> +        address_space_read(&s->pci_io_as, addr, attrs,
>                             buf, len);
>      } else {
> -        pci_dma_read(PCI_DEVICE(s), addr, buf, len);
> +        pci_dma_rw(PCI_DEVICE(s), addr, buf, len,
> +                      DMA_DIRECTION_TO_DEVICE, attrs);
>      }
>  }
>
>  static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
>                                  const void *buf, dma_addr_t len)
>  {
> +    const MemTxAttrs attrs = { .memory = true };
> +
>      if (s->dmode & LSI_DMODE_DIOM) {
> -        address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIED,
> +        address_space_write(&s->pci_io_as, addr, attrs,
>                              buf, len);
>      } else {
> -        pci_dma_write(PCI_DEVICE(s), addr, buf, len);
> +        pci_dma_rw(PCI_DEVICE(s), addr, (void *) buf, len,
> +                      DMA_DIRECTION_FROM_DEVICE, attrs);
>      }
>  }
>
> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi53c895a-test.c
> index 392a7ae7ed..35c02e89f3 100644
> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> @@ -8,6 +8,35 @@
>  #include "qemu/osdep.h"
>  #include "libqtest.h"
>
> +/*
> + * This used to trigger a DMA reentrancy issue
> + * leading to memory corruption bugs like stack
> + * overflow or use-after-free
> + */
> +static void test_lsi_dma_reentrancy(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-M q35 -m 512M -nodefaults "
> +                   "-blockdev driver=null-co,node-name=null0 "
> +                   "-device lsi53c810 -device scsi-cd,drive=null0");
> +
> +    qtest_outl(s, 0xcf8, 0x80000804); /* PCI Command Register */
> +    qtest_outw(s, 0xcfc, 0x7);        /* Enables accesses */
> +    qtest_outl(s, 0xcf8, 0x80000814); /* Memory Bar 1 */
> +    qtest_outl(s, 0xcfc, 0xff100000); /* Set MMIO Address*/
> +    qtest_outl(s, 0xcf8, 0x80000818); /* Memory Bar 2 */
> +    qtest_outl(s, 0xcfc, 0xff000000); /* Set RAM Address*/
> +    qtest_writel(s, 0xff000000, 0xc0000024);
> +    qtest_writel(s, 0xff000114, 0x00000080);
> +    qtest_writel(s, 0xff00012c, 0xff000000);
> +    qtest_writel(s, 0xff000004, 0xff000114);
> +    qtest_writel(s, 0xff000008, 0xff100014);
> +    qtest_writel(s, 0xff10002f, 0x000000ff);
> +
> +    qtest_quit(s);
> +}
> +
>  /*
>   * This used to trigger a UAF in lsi_do_msgout()
>   * https://gitlab.com/qemu-project/qemu/-/issues/972
> @@ -120,5 +149,8 @@ int main(int argc, char **argv)
>      qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
>                     test_lsi_do_msgout_cancel_req);
>
> +    qtest_add_func("fuzz/lsi53c895a/lsi_dma_reentrancy",
> +                   test_lsi_dma_reentrancy);
> +
>      return g_test_run();
>  }
> --
> 2.39.0
>

Reproducer:

cat << EOF | ./x86_64-softmmu/qemu-system-x86_64 -machine accel=qtest \
-m 512M -machine q35 -nodefaults -device lsi53c810 -device scsi-cd,drive=null0 \
-display none -blockdev driver=null-co,node-name=null0 -qtest stdio
outl 0xcf8 0x80000804   /* PCI Command Register */
outl 0xcfc 0x7                 /* Enable accesses */
outl 0xcf8 0x80000814   /* Memory Bar 1 */
outl 0xcfc 0xff100000     /* Set MMIO Address*/
outl 0xcf8 0x80000818   /* Memory Bar 2 */
outl 0xcfc 0xff000000     /* Set RAM Address*/
writel 0xff000000 0xc0000024
writel 0xff000114 0x00000080
writel 0xff00012c 0xff000000
writel 0xff000004 0xff000114
writel 0xff000008 0xff100014
writel 0xff10002f 0x000000ff
EOF

-- 
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


