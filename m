Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6839A9E4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 20:17:52 +0200 (CEST)
Received: from localhost ([::1]:36406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loruh-0005w6-46
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 14:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lortS-0004Lq-Tg
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lortR-0007dh-80
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 14:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622744192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=05Z7gyZ/De2ikKX/YzhJO9bmhleNXnL7LBJuAR1YCv8=;
 b=UXTC74hz92FvCjpSZxS1b7CcNgzML5Tf5OVMl+GjHAIw5sDJom0QLPd3nABUaCDozGvff/
 UJT+Xv/JRkqTDVGcAxPt4oQI0E/PiX6eFNbBtQ2r8lM0gmfVBFd5oMdwTyoa+yH7MFUaAD
 4oQthdVVzBpU6oNrTfY3p0+w9SKGfnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-5o_cJraqObi_yZUOjBZuRg-1; Thu, 03 Jun 2021 14:16:28 -0400
X-MC-Unique: 5o_cJraqObi_yZUOjBZuRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D82E800D55;
 Thu,  3 Jun 2021 18:16:27 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A105A614FD;
 Thu,  3 Jun 2021 18:16:26 +0000 (UTC)
Date: Thu, 3 Jun 2021 13:16:24 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 22/33] block/nbd: pass monitor directly to connection
 thread
Message-ID: <20210603181624.zpfzmrruvvs2nwgx@redhat.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
 <20210416080911.83197-23-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-23-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 16, 2021 at 11:09:00AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> monitor_cur() is used by socket_get_fd, but it doesn't work in
> connection thread. Let's monitor directly to cover this thing. We are
> going to unify connection establishing path in nbd_open and reconnect,
> so we should support fd-passing.

Grammar suggestion:

Let's pass in the monitor directly to work around this.  This gets us
closer to unifing the path for establishing a connection in nbd_open
and reconnect, by supporting fd-passing.


But given Dan's review on 21/33, I suspect you won't be using this
patch in this form after all (instead, the caller of
nbd_client_connection_new will use the new monitor_resolve_fd or
whatever we call that, so that nbd_client_connection_new remains
oblivious to the monitor).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


