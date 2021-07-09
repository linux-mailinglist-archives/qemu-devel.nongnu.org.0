Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7AF3C24B3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:22:48 +0200 (CEST)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qSt-0007kU-Ud
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1qRX-0005bH-EG
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1qRW-0006T0-11
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 09:21:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625836881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fOEcJCYat3JnRIHd65FWU1+pSqkFeCmTiZwEafUpyKE=;
 b=KYzWJsunGP0UarDX8009KDl+5WKgP04vqQpDe/EbBQqdhL2CnJ2/vFRR/AprmIiUeZspGr
 9KkBECn4TRmLuzMNLPDCkX0XL1yhFIl0kzZNL6v+qd50OGqV9xTBHe2z5CNC6f6ObbkBMK
 9Zhf+907rn95Bzyq6M55NYdjNfqm9es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-G5pzVmWfMDil4PVBCrjQyg-1; Fri, 09 Jul 2021 09:21:20 -0400
X-MC-Unique: G5pzVmWfMDil4PVBCrjQyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FD34100C618;
 Fri,  9 Jul 2021 13:21:19 +0000 (UTC)
Received: from redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E2D919811;
 Fri,  9 Jul 2021 13:21:15 +0000 (UTC)
Date: Fri, 9 Jul 2021 08:21:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 3/2] qemu-img: Improve error for rebase without backing
 format
Message-ID: <20210709132113.45quuu6b7waghcnq@redhat.com>
References: <20210503213600.569128-1-eblake@redhat.com>
 <20210708155228.2666172-1-eblake@redhat.com>
 <YOcurW+wq8XwwR9x@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YOcurW+wq8XwwR9x@redhat.com>
User-Agent: NeoMutt/20210205-556-f84451-dirty
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 08, 2021 at 06:58:21PM +0200, Kevin Wolf wrote:
> Am 08.07.2021 um 17:52 hat Eric Blake geschrieben:
> > When removeing support for qemu-img being able to create backing

removing

(is it bad that I don't catch my own typos until seeing them through
the mailing list?)

> > chains without embedded backing formats, we caused a poor error
> > message as caught by iotest 114.  Improve the situation to inform the
> > user what went wrong.
> > 
> > Suggested-by: Kevin Wolf <kwolf@redhat.com>
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> Thanks, applied to the block branch.

And thanks for catching my obvious lack of filtering out local file names.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


