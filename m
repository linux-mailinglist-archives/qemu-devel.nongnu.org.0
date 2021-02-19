Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8586C31F41C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 04:08:50 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCw9x-0006Pn-12
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 22:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCw7l-00059F-V9
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 22:06:35 -0500
Received: from relay68.bu.edu ([128.197.228.73]:58304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lCw7k-0008Gn-0r
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 22:06:33 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 11J35PAY003223
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 18 Feb 2021 22:05:29 -0500
Date: Thu, 18 Feb 2021 22:05:25 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: P J P <ppandit@redhat.com>
Subject: Re: [PATCH] net: e1000: check transmit descriptor field values
Message-ID: <20210219030449.x25yxp4x6myblm2y@mozz.bu.edu>
References: <20210210145258.143131-1-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210145258.143131-1-ppandit@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <pjp@fedoraproject.org>, Cheolwoo Myung <cwmyung@snu.ac.kr>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Ruhr-University Bochum <bugs-syssec@rub.de>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210210 2022, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> While processing transmit (tx) descriptors in process_tx_desc()
> various descriptor fields are not checked properly. This may lead
> to infinite loop like issue. Add checks to avoid them.
> 

+CC Peter Maydell

Is this a DMA re-entracy/stack-overflow issue? IIRC the plan was to have
some sort of wider fix for these issues. There are bunch of these
reports floating around at this point, I believe.

> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Reported-by: Cheolwoo Myung <cwmyung@snu.ac.kr>
> Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/net/e1000.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index d8da2f6528..15949a3d64 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -667,9 +667,11 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
>  
>      addr = le64_to_cpu(dp->buffer_addr);
>      if (tp->cptse) {
> +        assert(tp->tso_props.hdr_len);
>          msh = tp->tso_props.hdr_len + tp->tso_props.mss;
>          do {
>              bytes = split_size;
> +            assert(msh > tp->size);
>              if (tp->size + bytes > msh)
>                  bytes = msh - tp->size;
>  
> @@ -681,22 +683,26 @@ process_tx_desc(E1000State *s, struct e1000_tx_desc *dp)
>                  memmove(tp->header, tp->data, tp->tso_props.hdr_len);
>              }
>              tp->size = sz;
> +            assert(tp->size);   /* sz may get truncated */
>              addr += bytes;
>              if (sz == msh) {
>                  xmit_seg(s);
>                  memmove(tp->data, tp->header, tp->tso_props.hdr_len);
>                  tp->size = tp->tso_props.hdr_len;
>              }
> +            assert(split_size >= bytes);
>              split_size -= bytes;
>          } while (bytes && split_size);
>      } else {
>          split_size = MIN(sizeof(tp->data) - tp->size, split_size);
> +        assert(tp->size && split_size);
>          pci_dma_read(d, addr, tp->data + tp->size, split_size);
>          tp->size += split_size;
>      }
>  
>      if (!(txd_lower & E1000_TXD_CMD_EOP))
>          return;
> +    assert(tp->size && tp->tso_props.hdr_len);
>      if (!(tp->cptse && tp->size < tp->tso_props.hdr_len)) {
>          xmit_seg(s);
>      }
> -- 
> 2.29.2
> 

