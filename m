Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ABC1C3E04
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 17:04:39 +0200 (CEST)
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVce6-0007bO-Ap
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 11:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVcc6-0005Zm-Kc; Mon, 04 May 2020 11:02:34 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jVcc5-0007aU-5b; Mon, 04 May 2020 11:02:34 -0400
Received: by mail-lf1-x144.google.com with SMTP id h26so7061582lfg.6;
 Mon, 04 May 2020 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2btHZC5hE4h3+Cz9SRiw4pmBrok/u7kGKHTwNQ70g8M=;
 b=uoCPJnlv2laEJ0dugMq1IWQoj0NQF9vxs1UFDeH/9n8w6UaaYwhKMlLCYYhNJE3HbN
 RKpGKZcMR/TZHhCu0b8lS5+uNeanDloFuFF+CdHeonlV4y0J2+xocsZhWi8rwxQnR8uf
 fwss27pVZt/fjQ9ja9r76rwo9FwoW6bOCXFFtDkbutur7+f4CouOLY8mnUeHJFT1v3Rp
 bsBm+d151HRl7GS3VCsjCxRh1nV9SoMeO1NPHmG1UlkatHSO3S9nnbKntlWqA3ak1X2P
 UIDrFoP1EJKg+81xG1Ixr0sr+1CN9+KfVHvjjK2lQFIDwbkq5DfA9N3sIWLMkgybLhK1
 XB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2btHZC5hE4h3+Cz9SRiw4pmBrok/u7kGKHTwNQ70g8M=;
 b=PHCMGwpwSYVOZwsWpu/MsNnlrcVKJncvCnuwdcYEtoLrcOvaFXUG+QvV+oNM1x+qHL
 +qiKrDW3KoXpVX82Wmytwv1AoLF2JUJHUO615NDvnzRN0xK+hhWXDdUKPZsVnLB+KRjz
 t+g/28w9C7I6AEk3cFZP88nIVNp8nlB3fd0IcH6QKsToJR4+WZ/82bkOZI8qiqEbAh3q
 BkrfWyA06St7OVXeIOl5pZpq6zpOL/OMd7jAqwKHZOk8TsTW2vAgjQ0EtEonNBiHix9I
 WZlQIi/9cr7Ny8qB9H4HFpkJZWCUpSexYkchEhtIGdNhUpHrVMALtA4gCShz9XLrf/ZI
 T81g==
X-Gm-Message-State: AGi0PuZR/E4bqp8ZhVMq5104dsge0LRGkH07PA2WWvStFnbQ7mI4/Z0h
 y8mGx8s3s8XSKG6WhtV9vv4=
X-Google-Smtp-Source: APiQypL1ODT7wMBS+trqXv8w9t1O/9iFJeG/wrCV82kUZFlR/VWcr+GN9GHMLBpwUD31rIFYZ2xxPw==
X-Received: by 2002:ac2:4187:: with SMTP id z7mr12003883lfh.113.1588604550791; 
 Mon, 04 May 2020 08:02:30 -0700 (PDT)
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id n7sm10752980ljj.72.2020.05.04.08.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 08:02:30 -0700 (PDT)
Date: Mon, 4 May 2020 17:02:29 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH v2 05/10] net: cadence_gem: Set ISR according to queue in
 use
Message-ID: <20200504150229.GE5519@toto>
References: <1588601168-27576-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1588601168-27576-6-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588601168-27576-6-git-send-email-sai.pavan.boddu@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Tong Ho <tong.ho@xilinx.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Ramon Fried <rfried.dev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 04, 2020 at 07:36:03PM +0530, Sai Pavan Boddu wrote:
> Set ISR according to queue in use, added interrupt support for
> all queues.

Would it help to add a gem_set_isr(CadenceGEMState *s, int q, uint32_t flag) ?
Instead of open coding these if (q == 0) else... all over the place...

Anyway, the logic looks good to me:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> ---
>  hw/net/cadence_gem.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index c532a14..beb38ec 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -896,7 +896,13 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
>      if (rx_desc_get_ownership(s->rx_desc[q]) == 1) {
>          DB_PRINT("descriptor 0x%" HWADDR_PRIx " owned by sw.\n", desc_addr);
>          s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
> -        s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
> +        if (q == 0) {
> +            s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
> +        } else {
> +            s->regs[GEM_INT_Q1_STATUS + q - 1] |= GEM_INT_RXUSED &
> +                                          ~(s->regs[GEM_INT_Q1_MASK + q - 1]);
> +        }
> +
>          /* Handle interrupt consequences */
>          gem_update_int_status(s);
>      }
> @@ -1071,8 +1077,12 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>      gem_receive_updatestats(s, buf, size);
>  
>      s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_FRMRCVD;
> -    s->regs[GEM_ISR] |= GEM_INT_RXCMPL & ~(s->regs[GEM_IMR]);
> -
> +    if (q == 0) {
> +        s->regs[GEM_ISR] |= GEM_INT_RXCMPL & ~(s->regs[GEM_IMR]);
> +    } else {
> +        s->regs[GEM_INT_Q1_STATUS + q - 1] |= GEM_INT_RXCMPL &
> +                                      ~(s->regs[GEM_INT_Q1_MASK + q - 1]);
> +    }
>      /* Handle interrupt consequences */
>      gem_update_int_status(s);
>  
> @@ -1223,12 +1233,12 @@ static void gem_transmit(CadenceGEMState *s)
>                  DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
>  
>                  s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
> -                s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
> -
> +                if (q == 0) {
> +                    s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
> +                } else {
>                  /* Update queue interrupt status */
> -                if (s->num_priority_queues > 1) {
> -                    s->regs[GEM_INT_Q1_STATUS + q] |=
> -                            GEM_INT_TXCMPL & ~(s->regs[GEM_INT_Q1_MASK + q]);
> +                    s->regs[GEM_INT_Q1_STATUS + q - 1] |=
> +                            GEM_INT_TXCMPL & ~s->regs[GEM_INT_Q1_MASK + q - 1];
>                  }
>  
>                  /* Handle interrupt consequences */
> @@ -1280,7 +1290,10 @@ static void gem_transmit(CadenceGEMState *s)
>  
>          if (tx_desc_get_used(desc)) {
>              s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_USED;
> -            s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
> +            /* IRQ TXUSED is defined only for queue 0 */
> +            if (q == 0) {
> +                s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
> +            }
>              gem_update_int_status(s);
>          }
>      }
> -- 
> 2.7.4
> 

