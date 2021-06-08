Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E16EA39FFDC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 20:38:31 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqgcP-0007Fm-V3
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 14:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqgbP-0006LB-0x
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lqgbM-0005C6-St
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 14:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623177444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bRYH0FbHv4YgYFHZoW/d/0hqlE3cNUxpDQrp9aEWXJk=;
 b=Ega5XoDENtRAvAmMP4W22LsGFAkvCiFFDwOi/A2tYB+1tUNqalJ+mX42GPtgi5CG0UiADp
 iFb/rRjcuwoI42W9hBQoYBy1F2VbOtv7MTLVgKhxv4iedzxj1VXZlHe07lXQ3f1pDsbXPj
 ZczuaZmeM7pQ620V1TX55o+hUMBi8Ac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-5TW2kQX2MJ-6OMacWqX65A-1; Tue, 08 Jun 2021 14:37:20 -0400
X-MC-Unique: 5TW2kQX2MJ-6OMacWqX65A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3C691926DA2
 for <qemu-devel@nongnu.org>; Tue,  8 Jun 2021 18:37:19 +0000 (UTC)
Received: from work-vm (ovpn-115-50.ams2.redhat.com [10.36.115.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F5D5C1BB;
 Tue,  8 Jun 2021 18:37:08 +0000 (UTC)
Date: Tue, 8 Jun 2021 19:37:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: Re: [PATCH v2 0/5] mptcp support
Message-ID: <YL+40seTN8bONFSm@work-vm>
References: <20210421112834.107651-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210421112834.107651-1-dgilbert@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Hi,
>   This set adds support for multipath TCP (mptcp), and has
> been tested for migration and (lightly) for NBD.
> 
>   Multipath-tcp is a bit like bonding, but at L3; you can use
> it to handle failure, but can also use it to split traffic across
> multiple interfaces.
> 
>   Using a pair of 10Gb interfaces, I've managed to get 19Gbps
> (with the only tuning being using huge pages and turning the MTU up).
> 
>   It needs a bleeding-edge Linux kernel (in some older ones you get
> false accept messages for the subflows), and a C lib that has the
> constants defined (as current glibc does).
> 
>   To use it you just need to append ,mptcp to an address; for migration:
> 
>   -incoming tcp:0:4444,mptcp
>   migrate -d tcp:192.168.11.20:4444,mptcp
> 
> For nbd:
> 
>   (qemu) nbd_server_start 0.0.0.0:3333,mptcp=on
> 
>   -blockdev driver=nbd,server.type=inet,server.host=192.168.11.20,server.port=3333,server.mptcp=on,node-name=nbddisk,export=mydisk \
>   -device virtio-blk,drive=nbddisk,id=disk0
> 
> (Many of the other NBD address parsers/forms would need extra work)
> 
>   All comments welcome.
> 
> Dave

Queued

> 
> v2
>   Use of if defined(...) in the json file based on feedback
>   A few missing ifdef's (from a bsd build test)
>   Added nbd example.
> 
> 
> Dr. David Alan Gilbert (5):
>   channel-socket: Only set CLOEXEC if we have space for fds
>   io/net-listener: Call the notifier during finalize
>   migration: Add cleanup hook for inwards migration
>   migration/socket: Close the listener at the end
>   sockets: Support multipath TCP
> 
>  io/channel-socket.c   |  8 ++++----
>  io/dns-resolver.c     |  4 ++++
>  io/net-listener.c     |  3 +++
>  migration/migration.c |  3 +++
>  migration/migration.h |  4 ++++
>  migration/multifd.c   |  5 +++++
>  migration/socket.c    | 24 ++++++++++++++++++------
>  qapi/sockets.json     |  5 ++++-
>  util/qemu-sockets.c   | 23 +++++++++++++++++++++++
>  9 files changed, 68 insertions(+), 11 deletions(-)
> 
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


