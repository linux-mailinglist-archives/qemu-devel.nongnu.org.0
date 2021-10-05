Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9454227ED
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:32:59 +0200 (CEST)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkZ0-0000XA-RD
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXkMI-0004b0-Qf
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXkMF-0000M5-La
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633439987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IGIXU4He5g8To0N9KJruynOJtmddk0v8BPZGBQX+Lcw=;
 b=eI7sr1Hz7DCscSM9wILnlsw0VTTVWE7Lm5tnKn2QcYCbHUTM9/1OgnyUqCEkfenqS8gv9u
 6AodkSnWtyWhOdU129yANmlXLq60KvFVrgBY8tLKW3diKI26wkCeBwB3gy4+M/zIrckZo1
 vIVjGClIAioEeSLms0Kmcpmwr8N33VQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-SL2MTmJjM9yCDANcmbhk_w-1; Tue, 05 Oct 2021 09:19:43 -0400
X-MC-Unique: SL2MTmJjM9yCDANcmbhk_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28476802C8A;
 Tue,  5 Oct 2021 13:19:42 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23C171F465;
 Tue,  5 Oct 2021 13:19:19 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id B16FA220BDB; Tue,  5 Oct 2021 09:19:18 -0400 (EDT)
Date: Tue, 5 Oct 2021 09:19:18 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 11/13] virtiofsd: Shutdown notification queue in the end
Message-ID: <YVxQ1qIERJVSC+yV@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-12-vgoyal@redhat.com>
 <YVsXLhZOUOI0Ubha@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVsXLhZOUOI0Ubha@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 04:01:02PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 11:30:35AM -0400, Vivek Goyal wrote:
> > So far we did not have the notion of cross queue traffic. That is, we
> > get request on a queue and send back response on same queue. So if a
> > request be being processed and at the same time a stop queue request
> > comes in, we wait for all pending requests to finish and then queue
> > is stopped and associated data structure cleaned.
> > 
> > But with notification queue, now it is possible that we get a locking
> > request on request queue and send the notification back on a different
> > queue (notificaiton queue). This means, we need to make sure that
> 
> s/notificaiton/notification/
> 
> > notifiation queue has not already been shutdown or is not being
> 
> s/notifiation/notification/

Will fix both.

[..]
> >  /* Callback from libvhost-user on start or stop of a queue */
> > @@ -934,7 +950,16 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
> >           * the queue thread doesn't block in virtio_send_msg().
> >           */
> >          vu_dispatch_unlock(vud);
> > -        fv_queue_cleanup_thread(vud, qidx);
> > +
> > +        /*
> > +         * If queue 0 is being shutdown, treat it as if device is being
> > +         * shutdown and stop all queues.
> > +         */
> 
> Please expand this comment so it's clear why we do this.

Ok, will do. I put the justification in commit message but it is a good
idea to put it here as well.

Vivek


