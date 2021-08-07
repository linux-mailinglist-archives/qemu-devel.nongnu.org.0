Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1A3E3707
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 22:27:20 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCSud-0002AC-Bp
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 16:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mCStl-0001Rc-SS
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 16:26:25 -0400
Received: from relay68.bu.edu ([128.197.228.73]:59240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mCStj-0002Bv-V0
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 16:26:25 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 177KPJjS008523
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 7 Aug 2021 16:25:22 -0400
Date: Sat, 7 Aug 2021 16:25:18 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] vmxnet3: add stub for encapsulation offload
Message-ID: <20210807202518.jrqobxx3nygszbus@mozz.bu.edu>
References: <20210806222300.417126-1-alxndr@bu.edu>
 <5a2ac0a5-7b1a-c75d-3d61-4ec849c9eb2d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a2ac0a5-7b1a-c75d-3d61-4ec849c9eb2d@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210807 1019, Philippe Mathieu-Daudé wrote:
> On 8/7/21 12:23 AM, Alexander Bulekov wrote:
> > Encapsulation offload (offload mode 1) is a valid mode present in the
> > kernel that isn't implemented in QEMU, yet.
> > 
> > https://lore.kernel.org/lkml/20200528015426.8285-4-doshir@vmware.com/
> > 
> > Add a stub for this mode, to avoid the guest-triggerable assertion.
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/517
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  hw/net/vmxnet3.c | 5 +++++
> >  hw/net/vmxnet3.h | 1 +
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> > index 41f796a247..62e11d0e3e 100644
> > --- a/hw/net/vmxnet3.c
> > +++ b/hw/net/vmxnet3.c
> > @@ -443,6 +443,11 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
> >          net_tx_pkt_build_vheader(s->tx_pkt, false, false, 0);
> >          break;
> >  
> > +    case VMXNET3_OM_ENCAP:
> > +        VMW_PKPRN("Encapsulation offload requested, but not available\n");
> > +        return false;
> > +        break;
> 
> No need to break if you returned (unreachable).

I included it in case the feature ends up being added, so there is one
less thing to worry about, but I can remove it. There are a couple of
places in QEMU where this occurs, so I wasn't sure about the best
practice.

-Alex

> 
> > +
> >      case VMXNET3_OM_CSUM:
> >          net_tx_pkt_build_vheader(s->tx_pkt, false, true, 0);
> >          VMW_PKPRN("L4 CSO requested\n");
> > diff --git a/hw/net/vmxnet3.h b/hw/net/vmxnet3.h
> > index 5b3b76ba7a..36a17b82aa 100644
> > --- a/hw/net/vmxnet3.h
> > +++ b/hw/net/vmxnet3.h
> > @@ -273,6 +273,7 @@ struct Vmxnet3_TxDesc {
> >  
> >  /* TxDesc.OM values */
> >  #define VMXNET3_OM_NONE        0
> > +#define VMXNET3_OM_ENCAP       1
> >  #define VMXNET3_OM_CSUM        2
> >  #define VMXNET3_OM_TSO        3
> >  
> > 
> 

