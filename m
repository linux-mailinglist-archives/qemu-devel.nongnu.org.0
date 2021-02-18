Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FDB31E999
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 13:19:24 +0100 (CET)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCiHA-0003Bn-Rx
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 07:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lCiGK-0002jF-PP
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 07:18:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lCiGI-000837-58
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 07:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613650704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=krwC59fzgnp48MghpeXACx/s2E5zv/fX83CMUpS7UiU=;
 b=Aoh/j2p6tS1vVzCNYrBs6kp0yMPlxBuWS7JJM1B9YLoILQ6qNfatiY9Hia+thkoH3jwUqr
 NYXA6nq664ADXc786SP6x85mnKYEkxXBstzCw08IjtIWsa28ZA+Ck2LmO01HHGNhcl8Xup
 Ek/m35ijNpvrMavnPS/dZ9hrCXXLXvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Si5YXi_kNYGXshAEGsHQfA-1; Thu, 18 Feb 2021 07:18:22 -0500
X-MC-Unique: Si5YXi_kNYGXshAEGsHQfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBDD3C7400
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 12:18:21 +0000 (UTC)
Received: from work-vm (ovpn-115-17.ams2.redhat.com [10.36.115.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4026D18F0A;
 Thu, 18 Feb 2021 12:18:08 +0000 (UTC)
Date: Thu, 18 Feb 2021 12:18:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 01/24] DAX: vhost-user: Rework slave return values
Message-ID: <YC5a/Zrv0lryd3V+@work-vm>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-2-dgilbert@redhat.com>
 <20210211095936.GB247031@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210211095936.GB247031@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Tue, Feb 09, 2021 at 07:02:01PM +0000, Dr. David Alan Gilbert (git) wrote:
> > +static uint64_t vhost_user_slave_handle_vring_host_notifier(
> > +                struct vhost_dev *dev,
> > +               VhostUserVringArea *area,
> > +               int fd)
> 
> Indentation looks off. Only worth changing if you respin.

Done.

> > @@ -1398,7 +1399,8 @@ static void slave_read(void *opaque)
> >      struct vhost_user *u = dev->opaque;
> >      VhostUserHeader hdr = { 0, };
> >      VhostUserPayload payload = { 0, };
> > -    int size, ret = 0;
> > +    int size;
> > +    uint64_t ret = 0;
> >      struct iovec iov;
> >      struct msghdr msgh;
> >      int fd[VHOST_USER_SLAVE_MAX_FDS];
> > @@ -1472,7 +1474,7 @@ static void slave_read(void *opaque)
> >          break;
> >      default:
> >          error_report("Received unexpected msg type: %d.", hdr.request);
> > -        ret = -EINVAL;
> > +        ret = (uint64_t)-EINVAL;
> 
> The !!ret was removed below so it would have previously been true (1).
> Now it has changed value.
> 
> If there is no specific reason to change the value, please keep it true
> (1) just in case a vhost-user device backend depends on that value.

Done; although moving to errnos there feels a bit better to me; but yes
the callers aren't audited.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


