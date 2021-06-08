Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C2539FE45
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:57:27 +0200 (CEST)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfyg-0004XR-IL
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqfxQ-0003AQ-Ot
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqfxM-00068y-DI
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623174963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5F2fq7wDNXN2eJacZdT52BRCLo8Z5CIWZVM5LGOgm5Y=;
 b=aNrDCsYGqYlw4p7KERKaqqhcWqvxizMeDE4Y4fLgnHKBUbqhHfUtGAUumLQlDlk38AJ4gQ
 i97EVIrqGRctb7ecE8kfDHkFIIy/hOtM71Vde4Zq841U+GMwwwbBzoE1etlQjaPD2clqkC
 j72svFD0NED42PEPrC7XdrKd7CWjizY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-wPEMP5M4Npax_mgQZXwGtw-1; Tue, 08 Jun 2021 13:56:01 -0400
X-MC-Unique: wPEMP5M4Npax_mgQZXwGtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFE4A100748D;
 Tue,  8 Jun 2021 17:56:00 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 078056060F;
 Tue,  8 Jun 2021 17:55:59 +0000 (UTC)
Date: Tue, 8 Jun 2021 18:55:57 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhijian <lizhijian@cn.fujitsu.com>
Subject: Re: [PATCH] migration/rdma: Fix cm event use after free
Message-ID: <YL+vLS/Ykn9tCAQ+@work-vm>
References: <20210602023506.3821293-1-lizhijian@cn.fujitsu.com>
 <YLepKZ1X2wr7PwPC@work-vm>
MIME-Version: 1.0
In-Reply-To: <YLepKZ1X2wr7PwPC@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Li Zhijian (lizhijian@cn.fujitsu.com) wrote:
> > Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> 
> Thanks! I don't think I understood that 'ack' actually meant 'free'!
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> 
> > ---
> >  migration/rdma.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/migration/rdma.c b/migration/rdma.c
> > index 1cdb4561f32..d90b29a4b51 100644
> > --- a/migration/rdma.c
> > +++ b/migration/rdma.c
> > @@ -1539,16 +1539,20 @@ static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
> >  
> >                  if (pfds[1].revents) {
> >                      ret = rdma_get_cm_event(rdma->channel, &cm_event);
> > -                    if (!ret) {
> > -                        rdma_ack_cm_event(cm_event);
> > +                    if (ret) {
> > +                        error_report("failed to get cm event while wait "
> > +                                     "completion channel");
> > +                        return -EPIPE;
> >                      }
> >  
> >                      error_report("receive cm event while wait comp channel,"
> >                                   "cm event is %d", cm_event->event);
> >                      if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
> >                          cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
> > +                        rdma_ack_cm_event(cm_event);
> >                          return -EPIPE;
> >                      }
> > +                    rdma_ack_cm_event(cm_event);
> >                  }
> >                  break;
> >  
> > @@ -3285,7 +3289,6 @@ static void rdma_cm_poll_handler(void *opaque)
> >          error_report("get_cm_event failed %d", errno);
> >          return;
> >      }
> > -    rdma_ack_cm_event(cm_event);
> >  
> >      if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
> >          cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
> > @@ -3298,12 +3301,14 @@ static void rdma_cm_poll_handler(void *opaque)
> >                  rdma->return_path->error_state = -EPIPE;
> >              }
> >          }
> > +        rdma_ack_cm_event(cm_event);
> >  
> >          if (mis->migration_incoming_co) {
> >              qemu_coroutine_enter(mis->migration_incoming_co);
> >          }
> >          return;
> >      }
> > +    rdma_ack_cm_event(cm_event);
> >  }
> >  
> >  static int qemu_rdma_accept(RDMAContext *rdma)
> > -- 
> > 2.30.2
> > 
> > 
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


