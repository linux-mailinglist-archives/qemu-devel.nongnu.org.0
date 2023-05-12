Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045ED700F0C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 20:48:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxXmm-0004fr-Pp; Fri, 12 May 2023 14:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxXmj-0004fV-Ff
 for qemu-devel@nongnu.org; Fri, 12 May 2023 14:46:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxXmX-0006Km-HK
 for qemu-devel@nongnu.org; Fri, 12 May 2023 14:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683917178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JWNwpmRRBTgSW9Q3UCE8GFhlbCNGJFDn5XgId0AaELo=;
 b=M/we2pQGSi/9E/C1t9DAkrTdOeX69LqXfiw1y7zauosXUqcVVui2GA1pTGzdnB4/JMpNJV
 aJUUBtETrxfaXcP/XFKKa3HcfHtID6w/uHRFyJsHD4sdDDVHBDb9UJayZ4623LB+H2qtn+
 il+X6iuz57a9mGIMRPykt9HwdTi40XM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-7oluS4SGPHmPLn4vP-u3Dg-1; Fri, 12 May 2023 14:46:16 -0400
X-MC-Unique: 7oluS4SGPHmPLn4vP-u3Dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25EE23801EC6;
 Fri, 12 May 2023 18:46:16 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E4582026D25;
 Fri, 12 May 2023 18:46:15 +0000 (UTC)
Date: Fri, 12 May 2023 13:46:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, stefanha@redhat.com, 
 f.ebner@proxmox.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 2/8] block/export: Fix null pointer dereference in error
 path
Message-ID: <mca6eearkzlyk52inj4r3vtl37qyrytx4j3mdzeohmpc46bgad@qazbcmfszebr>
References: <20230510203601.418015-1-kwolf@redhat.com>
 <20230510203601.418015-3-kwolf@redhat.com>
 <o7omdrdgit2m5pktwdzblyp255lk4qegqizmhlnx5gm7v6tz32@xjfyu7h6za2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o7omdrdgit2m5pktwdzblyp255lk4qegqizmhlnx5gm7v6tz32@xjfyu7h6za2a>
User-Agent: NeoMutt/20230512
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


On Fri, May 12, 2023 at 11:16:03AM -0500, Eric Blake wrote:
> 
> 
> On Wed, May 10, 2023 at 10:35:55PM +0200, Kevin Wolf wrote:
> > 
> > There are some error paths in blk_exp_add() that jump to 'fail:' before
> > 'exp' is even created. So we can't just unconditionally access exp->blk.
> > 
> > Add a NULL check, and switch from exp->blk to blk, which is available
> > earlier, just to be extra sure that we really cover all cases where
> > BlockDevOps could have been set for it (in practice, this only happens
> > in drv->create() today, so this part of the change isn't strictly
> > necessary).
> > 
> > Fixes: de79b52604e43fdeba6cee4f5af600b62169f2d2
> 
> Sorry for missing that on my first review, and this does look better.
> 
> I'm assuming you plan to take this in with the rest of the series
> through your tree, but let me know if I should push it faster through
> the NBD tree.

Because iotest:
./check 307 -nbd

fails without this patch but passes with it,

Tested-by: Eric Blake <eblake@redhat.com>

[and I should really remember to run more iotests than just the subset
run by 'make check' when preparing a pull request...]

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


