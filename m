Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C078C25B097
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 18:03:17 +0200 (CEST)
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDVEC-0003V8-Mv
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 12:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kDV9B-0003pY-6N
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:58:05 -0400
Received: from relay68.bu.edu ([128.197.228.73]:52770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kDV99-0006l5-1C
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:58:04 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 082FuJbd012163
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 2 Sep 2020 11:56:23 -0400
Date: Wed, 2 Sep 2020 11:56:19 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] net: forbid the reentrant RX
Message-ID: <20200902155614.aubuw5ygll35p3vp@mozz.bu.edu>
References: <20200722085747.6514-1-jasowang@redhat.com>
 <0fd8eb52-6410-1bbd-2462-598c6fcebeb9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fd8eb52-6410-1bbd-2462-598c6fcebeb9@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 10:34:22
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: dmitry.fleytman@gmail.com, mst@redhat.com, liq3ea@gmail.com, liq3ea@163.com,
 qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 200728 1200, Jason Wang wrote:
> 
> On 2020/7/22 下午4:57, Jason Wang wrote:
> > The memory API allows DMA into NIC's MMIO area. This means the NIC's
> > RX routine must be reentrant. Instead of auditing all the NIC, we can
> > simply detect the reentrancy and return early. The queue->delivering
> > is set and cleared by qemu_net_queue_deliver() for other queue helpers
> > to know whether the delivering in on going (NIC's receive is being
> > called). We can check it and return early in qemu_net_queue_flush() to
> > forbid reentrant RX.
> > 
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >   net/queue.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/net/queue.c b/net/queue.c
> > index 0164727e39..19e32c80fd 100644
> > --- a/net/queue.c
> > +++ b/net/queue.c
> > @@ -250,6 +250,9 @@ void qemu_net_queue_purge(NetQueue *queue, NetClientState *from)
> >   bool qemu_net_queue_flush(NetQueue *queue)
> >   {
> > +    if (queue->delivering)
> > +        return false;
> > +
> >       while (!QTAILQ_EMPTY(&queue->packets)) {
> >           NetPacket *packet;
> >           int ret;
> 
> 
> Queued for rc2.
> 
> Thanks
> 

Hi Jason,
I don't think this ever made it in. Are there any remaining problems?
Thanks
-Alex


