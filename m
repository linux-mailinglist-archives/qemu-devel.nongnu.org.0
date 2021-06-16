Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EBB3AA342
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:37:28 +0200 (CEST)
Received: from localhost ([::1]:45992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaPn-0005CN-7q
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ltaOH-0003lw-It
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ltaOE-00088D-Qi
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623868549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoNyLmrdCvPG+i0ScXdVn3sSf6fN+3mF6O8CHFmjLkY=;
 b=F2Dgy0Cu45q0xTn4FT0FdvgOYZ3exv1E9P/Kl+NjIhky947z/SuKA6kD0U5SWWED+xrqnX
 WsdqYxkeyZkDdraDsltPiqmHsPq/zAOrbuD6uGKtCiYVpCzwlnQ5Hi0oTyn0OS2LGnD4bb
 jm7MqImFufkbSuTorTaqIu6vyZnADxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-2B66SC0RO7SR30x4haXhIA-1; Wed, 16 Jun 2021 14:35:39 -0400
X-MC-Unique: 2B66SC0RO7SR30x4haXhIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE58100C67D;
 Wed, 16 Jun 2021 18:35:38 +0000 (UTC)
Received: from work-vm (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15FE460622;
 Wed, 16 Jun 2021 18:35:29 +0000 (UTC)
Date: Wed, 16 Jun 2021 19:35:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 26/26] virtiofsd: Ask qemu to drop CAP_FSETID if
 client asked for it
Message-ID: <YMpEbqEhCz9kMM8G@work-vm>
References: <YJQNIPaFCJlG7ZKc@stefanha-x1.localdomain>
 <20210506160223.GA277745@redhat.com>
 <YJj3RSxXKZHxmiKu@stefanha-x1.localdomain>
 <20210510152324.GB150402@horse>
 <YJlSHZ0vzNtCAjkJ@stefanha-x1.localdomain>
 <YK/uUUZI3zy9k8Vk@work-vm> <YMIv5odJWdkbJzWL@work-vm>
 <YMI8fS6m8CjtUtmE@stefanha-x1.localdomain>
 <YMnwOs9bxKLB8wSL@work-vm>
 <YMoY27s0zoFzE5wg@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YMoY27s0zoFzE5wg@stefanha-x1.localdomain>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Jun 16, 2021 at 01:36:10PM +0100, Dr. David Alan Gilbert wrote:
> > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > On Thu, Jun 10, 2021 at 04:29:42PM +0100, Dr. David Alan Gilbert wrote:
> > > > * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> > > > > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > > +    uint64_t addr; /* In the bus address of the device */
> > > 
> > > Please check the spec for preferred terminology. "bus address" isn't
> > > used in the spec, so there's probably another term for it.
> > 
> > I'm not seeing anything useful in the virtio spec; it mostly talks about
> > guest physical addresses; it does say 'bus addresses' in the definition
> > of 'VIRTIO_F_ACCESS_PLATFORM' .
> 
> I meant the docs/interop/vhost-user.rst spec.

I think they use the phrase 'guest address' so I've changed that to:

    uint64_t guest_addr; 

   Elsewhere in the vhost-user.rst it says:
   
   When the ``VIRTIO_F_IOMMU_PLATFORM`` feature has not been negotiated:
    
   * Guest addresses map to the vhost memory region containing that guest
     address.
    
   When the ``VIRTIO_F_IOMMU_PLATFORM`` feature has been negotiated:
    
   * Guest addresses are also called I/O virtual addresses (IOVAs).  They are
     translated to user addresses via the IOTLB.
   
> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


