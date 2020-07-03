Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10DC21387A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 12:14:50 +0200 (CEST)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrIiX-00008U-PS
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 06:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrIfP-0003s3-G9; Fri, 03 Jul 2020 06:11:35 -0400
Received: from charlie.dont.surf ([128.199.63.193]:53548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jrIfN-0006tc-OS; Fri, 03 Jul 2020 06:11:35 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 08949BF465;
 Fri,  3 Jul 2020 10:11:31 +0000 (UTC)
Date: Fri, 3 Jul 2020 12:11:28 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 10/18] hw/block/nvme: fix missing endian conversion
Message-ID: <20200703101128.czmz4ay6qozlzu5u@apples.localdomain>
References: <20200703063420.2241014-1-its@irrelevant.dk>
 <20200703063420.2241014-11-its@irrelevant.dk>
 <86d5bd10-cfbd-4455-d7fe-af8d24d1b536@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86d5bd10-cfbd-4455-d7fe-af8d24d1b536@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 01:42:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul  3 10:34, Philippe Mathieu-Daudé wrote:
> On 7/3/20 8:34 AM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > Fix a missing cpu_to conversion.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> > ---
> >  hw/block/nvme.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index f3a5b857bc92..ba523f6768bf 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1080,7 +1080,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
> >  
> >          break;
> >      case NVME_VOLATILE_WRITE_CACHE:
> > -        result = blk_enable_write_cache(n->conf.blk);
> > +        result = cpu_to_le32(blk_enable_write_cache(n->conf.blk));
> >          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
> >          break;
> >      case NVME_NUMBER_OF_QUEUES:
> > 
> 
> This doesn't look correct. What you probably want:
> 
> -- >8 --
> 
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -815,8 +815,8 @@ static uint16_t nvme_get_feature(NvmeCtrl *n,
> NvmeCmd *cmd, NvmeRequest *req)
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          break;
>      case NVME_NUMBER_OF_QUEUES:
> -        result = cpu_to_le32((n->params.max_ioqpairs - 1) |
> -                             ((n->params.max_ioqpairs - 1) << 16));
> +        result = (n->params.max_ioqpairs - 1)
> +                  | ((n->params.max_ioqpairs - 1) << 16);
>          trace_pci_nvme_getfeat_numq(result);
>          break;
>      case NVME_TIMESTAMP:
> @@ -825,8 +825,8 @@ static uint16_t nvme_get_feature(NvmeCtrl *n,
> NvmeCmd *cmd, NvmeRequest *req)
>          trace_pci_nvme_err_invalid_getfeat(dw10);
>          return NVME_INVALID_FIELD | NVME_DNR;
>      }
> +    req->cqe.result = cpu_to_le32(result);
> 
> -    req->cqe.result = result;
>      return NVME_SUCCESS;
>  }
> ---
> 

I replaced this patch with a new one earlier in the series that does
what you suggest and then let the change trickle down to other patches
that add feature cases.

