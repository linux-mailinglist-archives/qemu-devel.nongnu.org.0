Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28952318E85
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:31:06 +0100 (CET)
Received: from localhost ([::1]:46754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lADvt-0001U8-5g
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lADsJ-0007Ae-MK
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:27:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lADsG-0005yb-Od
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:27:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613057238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5crRB6zQ62VORCnSn24N82IJwWjsT7vnm07XAlVkhnY=;
 b=Jfksmvk85uqF3nfoQKj+UGd2Be9vT5Lhyv8PtKSFh9jGgMA+2GMaazjl6WwVWLsLoWG1h4
 BoeTW0wzSx5IgfIVvUW70oFxIadkk4P4OWHV3oUw9P/GhSJll4atglcQDl6ikJykp1S9gw
 scqG9nC8no9XM9C4she/Hg3sySq/8FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-aN50EUrpNP2-uAS5VddePQ-1; Thu, 11 Feb 2021 10:27:17 -0500
X-MC-Unique: aN50EUrpNP2-uAS5VddePQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BEB3874980
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 15:27:16 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-229.rdu2.redhat.com [10.10.115.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA73E1B47E;
 Thu, 11 Feb 2021 15:27:01 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 81036220BCF; Thu, 11 Feb 2021 10:27:01 -0500 (EST)
Date: Thu, 11 Feb 2021 10:27:01 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 01/24] DAX: vhost-user: Rework slave return values
Message-ID: <20210211152701.GC5014@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-2-dgilbert@redhat.com>
 <20210211095936.GB247031@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210211095936.GB247031@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 09:59:36AM +0000, Stefan Hajnoczi wrote:
> On Tue, Feb 09, 2021 at 07:02:01PM +0000, Dr. David Alan Gilbert (git) wrote:
> > +static uint64_t vhost_user_slave_handle_vring_host_notifier(
> > +                struct vhost_dev *dev,
> > +               VhostUserVringArea *area,
> > +               int fd)
> 
> Indentation looks off. Only worth changing if you respin.
> 
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

Good catch. I guess it will be nice to send -EINVAL back but we probably
can't change it now due to backward compatibility issue. Just in case,
someone is relying on reading back true (instead of -EINVAL).

Vivek


