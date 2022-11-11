Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBF7625796
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:05:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQt8-0003N0-OL; Fri, 11 Nov 2022 05:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otQt6-0003MM-Ll
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:03:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otQt4-0007LK-It
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:03:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668161029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vb1MfwwzyPZuzAcDL3n4u0+ueUZRdMSNUq/rnWWnbTU=;
 b=UTJJPWeA8hkq7PE6MYjtJ1BnGtZdY5dlrwILHzGb3T0gN+yIFjSOwJw8Wp2zCkI/C1E3+Y
 jlpliiEtNI1bqqFfy66rbFEB6vR0OAz6pjvPj91wq6vEQv4xyQXPAslukH9fyczZjr6b/D
 M7y2mY52hf2w/hWShdS/BczZgZmw+B4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-k2lBlxFCNMilDEhx9eiM9Q-1; Fri, 11 Nov 2022 05:03:47 -0500
X-MC-Unique: k2lBlxFCNMilDEhx9eiM9Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B03441C006A3;
 Fri, 11 Nov 2022 10:03:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A88212166B26;
 Fri, 11 Nov 2022 10:03:45 +0000 (UTC)
Date: Fri, 11 Nov 2022 11:03:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH for-7.2] block/blkio: Set
 BlockDriver::has_variable_length to false
Message-ID: <Y24eALBuectJVNbF@redhat.com>
References: <20221108144433.1334074-1-afaria@redhat.com>
 <CAJSP0QXrPfjJn+KcSTLoED6DGnZZpzDM-F6ZhwHs_08m-zAqBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QXrPfjJn+KcSTLoED6DGnZZpzDM-F6ZhwHs_08m-zAqBw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 10.11.2022 um 22:01 hat Stefan Hajnoczi geschrieben:
> On Tue, 8 Nov 2022 at 09:45, Alberto Faria <afaria@redhat.com> wrote:
> >
> > Setting it to true can cause the device size to be queried from libblkio
> > in otherwise fast paths, degrading performance. Set it to false and
> > require users to refresh the device size explicitly instead.
> >
> > Fixes: 4c8f4fda0504 ("block/blkio: Tolerate device size changes")
> > Suggested-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Alberto Faria <afaria@redhat.com>
> 
> If it's okay to set it to false then that makes me wonder why this
> undocumented field exists at all. Can you or Kevin explain and
> possibly follow up with a patch that documents the field?

It is for removable media backends (only host_cdrom has survived until
today; there used to be host_floppy, too) where the disk size can change
without an explicit block_resize when you change the medium.

I'm not sure how well this works in practice, but so far we've not
intentionally broken anything related to it that wasn't always broken.

Kevin


