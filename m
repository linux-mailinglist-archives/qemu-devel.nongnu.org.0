Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D52DB0D4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 17:04:51 +0100 (CET)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCok-0006bt-W4
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 11:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCnl-0005vj-IY
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:03:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kpCni-0008Iq-Nd
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 11:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608048225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lx2O6eeji+NwO3NlxWMX0tPULSY6BQsV2B+NEXqjWPA=;
 b=SjrR/8Kgef9bwTljEB+R/oSI4j+7k0qNLGoWI2PIWpoB4o+a0rJ8//xDihHpA7WwBYakBB
 218PY+WSie9UFLYw9E0kIy52pF+rAuSRqri3/S0IfZcAl3LvpaCPQzit/TOQ4/3+FuEa2o
 a1/bMKcKu7/nSAqsoXRkcxxB3KOY664=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-TfN_MVb3O_uG9lVHTfTkPw-1; Tue, 15 Dec 2020 11:03:43 -0500
X-MC-Unique: TfN_MVb3O_uG9lVHTfTkPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA235107ACE3;
 Tue, 15 Dec 2020 16:03:41 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-117-65.ams2.redhat.com [10.36.117.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 36EA65D9D7;
 Tue, 15 Dec 2020 16:03:38 +0000 (UTC)
Date: Tue, 15 Dec 2020 17:03:36 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] block/nfs: fix int overflow in nfs_client_open_qdict
Message-ID: <20201215160336.GI8185@merkur.fritz.box>
References: <20201209121735.16437-1-pl@kamp.de>
 <20201210090016.c5fa57c6q266xvbv@steredhat>
MIME-Version: 1.0
In-Reply-To: <20201210090016.c5fa57c6q266xvbv@steredhat>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mreitz@redhat.com, Peter Lieven <pl@kamp.de>, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.12.2020 um 10:00 hat Stefano Garzarella geschrieben:
> On Wed, Dec 09, 2020 at 01:17:35PM +0100, Peter Lieven wrote:
> > nfs_client_open returns the file size in sectors. This effectively
> > makes it impossible to open files larger than 1TB.
> > 
> > Fixes: a1a42af422d46812f1f0cebe6b230c20409a3731
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Lieven <pl@kamp.de>
> > ---
> > block/nfs.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> The issue seems to be pre-existing to the commit
> a1a42af422d46812f1f0cebe6b230c20409a3731, but of course that commit touched
> this code and this patch would not apply before, so it seems okay to me:

I think it's commit c22a0345, which is the one right before a1a42af4.
I'll update the commit message accordingly.

> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks, applied to the block branch.

Kevin


