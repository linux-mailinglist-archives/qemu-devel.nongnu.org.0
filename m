Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397A62111F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:42:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNul-00013c-89; Tue, 08 Nov 2022 07:41:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1osNtr-0000wG-AY; Tue, 08 Nov 2022 07:40:19 -0500
Received: from ssh.movementarian.org ([139.162.205.133] helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <movement@movementarian.org>)
 id 1osNtn-00033A-OA; Tue, 08 Nov 2022 07:40:19 -0500
Received: from movement by movementarian.org with local (Exim 4.95)
 (envelope-from <movement@movementarian.org>) id 1osNtT-005hGC-To;
 Tue, 08 Nov 2022 12:39:55 +0000
Date: Tue, 8 Nov 2022 12:39:55 +0000
From: John Levon <levon@movementarian.org>
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel <qemu-devel@nongnu.org>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v3 4/4] hw/nvme: add polling support
Message-ID: <Y2pOG89mnH3vGG/E@movementarian.org>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
 <Y1EswYz077swwhuc@cormorant.local>
 <D1741E76-294E-41F6-B87B-70C2A4CF778C@ict.ac.cn>
 <Y2OvzcfeawKWvvJ0@cormorant.local>
 <3ffebed8-997d-e276-bf4a-c75508b0be11@ict.ac.cn>
 <Y2Sx7O4MFHKrvXQA@cormorant.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2Sx7O4MFHKrvXQA@cormorant.local>
X-Url: http://www.movementarian.org/
Received-SPF: pass client-ip=139.162.205.133;
 envelope-from=movement@movementarian.org; helo=movementarian.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

On Fri, Nov 04, 2022 at 07:32:12AM +0100, Klaus Jensen wrote:

> On Nov  3 21:19, Jinhao Fan wrote:
> > On 11/3/2022 8:10 PM, Klaus Jensen wrote:
> > > I agree that the spec is a little unclear on this point. In any case, in
> > > Linux, when the driver has decided that the sq tail must be updated,
> > > it will use this check:
> > > 
> > >    (new_idx - event_idx - 1) < (new_idx - old)
> > 
> > When eventidx is already behind, it's like:
> > 
> >  0
> >  1 <- event_idx
> >  2 <- old
> >  3 <- new_idx
> >  4
> >  .
> >  .
> >  .
> > 
> > In this case, (new_idx - event_idx - 1) = 3-1-1 = 1 >= (new_idx - old) =
> > 3-2=1, so the host won't update sq tail. Where am I wrong in this example?
> 
> That becomes 1 >= 1, i.e. "true". So this will result in the driver
> doing an mmio doorbell write.

The code is:

static inline int nvme_dbbuf_need_event(u16 event_idx, u16 new_idx, u16 old)         
{                                                                                
        return (u16)(new_idx - event_idx - 1) < (u16)(new_idx - old);            
}                                                                                

which per the above is "return 1 < 1;", or false. So the above case does *not*
do an mmio write. No?

regards
john

