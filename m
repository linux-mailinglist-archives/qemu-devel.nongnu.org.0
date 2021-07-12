Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7BF3C5F52
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:33:07 +0200 (CEST)
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xve-0003jZ-Ey
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m2xr7-0005wS-Pb
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:28:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m2xr6-0000PI-6a
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626103703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AuDskkbV/iPkT3aneJ1x1sGPTri+fV6viNzCF8rPATE=;
 b=OndWoUKIP/SN61d5oHKHahQ1zToNIqRgYoki+c5hU7ZUqQVr2aSeSPuIZBfqYaCxTO7VPC
 rUWPbXqKk84tuMRbi+yJ6iw3zBhQ82yKHCVnPAoeUpozgqMOcYvldyEVxCPRq/l0DrcXkl
 ukm+4nBAlyMWEOBMjuEfh7UcC3s9t8Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-mTPi6rkJPkuXDSXNb_ok7g-1; Mon, 12 Jul 2021 11:28:19 -0400
X-MC-Unique: mTPi6rkJPkuXDSXNb_ok7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D0A19057A0;
 Mon, 12 Jul 2021 15:28:18 +0000 (UTC)
Received: from redhat.com (ovpn-113-49.phx2.redhat.com [10.3.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 391F55C1D1;
 Mon, 12 Jul 2021 15:28:18 +0000 (UTC)
Date: Mon, 12 Jul 2021 10:28:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] block: Add option to use driver whitelist even in tools
Message-ID: <20210712152816.vs676tz76joqz3hm@redhat.com>
References: <20210709164141.254097-1-kwolf@redhat.com>
 <20210709174517.bauuzc42l5zjawph@redhat.com>
 <YOv61o84+UTgq7PX@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YOv61o84+UTgq7PX@redhat.com>
User-Agent: NeoMutt/20210205-569-37ed14
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 10:18:30AM +0200, Kevin Wolf wrote:
> > Is it feasible that someone would want two separate lists: one for
> > qemu (which runs run efficiently) and another for tools (which ones do
> > we support at all)?  As written, your patch offers no chance to
> > distinguish between the two.
> 
> Possibly. However, supporting a second list would require a much larger
> code change than this patch, so I'd say this is a problem we should only
> solve when someone actually has it.

Indeed.

> 
> > Also, is now a good time to join the bandwagon on picking a more
> > descriptive name (such as 'allow-list') for this terminology?
> 
> I don't have an opinion on the time, but I do have an opinion on using a
> separate email thread for it. :-)

Agreed with that sentiment.

> 
> Initially I tried to find a way not to use "whitelist" in the new option
> name, but that only made things inconsistent and confusing, and renaming
> the existing options is definitely out of scope for this patch.

Also agreed.  Therefore, reviewing this patch in isolation (even if we
eventually do followups for the issues I pointed out) is fine, and you
now have:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


