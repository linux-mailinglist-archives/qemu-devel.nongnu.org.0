Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC96E3934E2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:33:39 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJt4-0006hR-D1
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmJrm-00060M-1l
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmJri-0004A0-FG
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622136733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5wlmS6XvrP40RvZt8koQvc4xsNIDYh1ffjqCDsYOItY=;
 b=Dx2mcaA467gNEFeMisZ9cBLzD+CunVmNHVA5PZ/ChWGIwZxCldFXIiYgAkyP/bEl/3TgYg
 RHnoD8uPpnojEo5b1l9nXNgNqLGyQqo8Ae+bHzX40s6P7kP+TLwy/w0JgfPZQ9I+rbsgWd
 AVxZhhyZwU9aPyKTROlhGtsZOO7ytTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-9on1lRB9O8GjEeeEbr053A-1; Thu, 27 May 2021 13:32:11 -0400
X-MC-Unique: 9on1lRB9O8GjEeeEbr053A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 702F81922990;
 Thu, 27 May 2021 17:32:01 +0000 (UTC)
Received: from work-vm (ovpn-114-249.ams2.redhat.com [10.36.114.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CA7A18B13;
 Thu, 27 May 2021 17:31:53 +0000 (UTC)
Date: Thu, 27 May 2021 18:31:51 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 18/26] DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
Message-ID: <YK/Xh3rIL9gPEGjn@work-vm>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-19-dgilbert@redhat.com>
 <YJQIMfU00U3ZR3BL@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJQIMfU00U3ZR3BL@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Apr 28, 2021 at 12:00:52PM +0100, Dr. David Alan Gilbert (git) wrote:
> > +    close(fd);
> 
> I looked back at the hw/virtio/vhost-user.c slave channel code and it
> closes fds for us. Looks like this close(2) call should be removed, but
> please double-check in case I missed something.

Nice, I think you're right; I've deleted that close(fd)


> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


