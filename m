Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4E3A6898
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:58:50 +0200 (CEST)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsn73-0003oO-8P
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lsn4z-0002Jt-KT
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:56:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lsn4y-0006Mq-0l
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623678999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m4EcUulpfwA9V0tD9RBtVvcl0RcMENrpdSiShHxFMfM=;
 b=QH6jKIXbW4PY5sOQIFK6Rp1HE2itU49NUbYCB8fpUaueXPHs9N/lqbcITAwcuCfOUtzsYj
 vvR27YHkNR6iFQ90kHkKlfMpw4fRq2UeQLNubvw5pbst6GgK5Z4ubUqgcBLWDaw7dHlLXF
 xhY5MFmUVjOhcHAW2FZIYjIFFvm309A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-fOUm1DtfOCir_QYyx6HkMA-1; Mon, 14 Jun 2021 09:56:32 -0400
X-MC-Unique: fOUm1DtfOCir_QYyx6HkMA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BEA419057A6;
 Mon, 14 Jun 2021 13:56:31 +0000 (UTC)
Received: from redhat.com (ovpn-113-14.phx2.redhat.com [10.3.113.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B4096091B;
 Mon, 14 Jun 2021 13:56:24 +0000 (UTC)
Date: Mon, 14 Jun 2021 08:56:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH 2/2] nbd: Add new qemu:joint-allocation metadata context
Message-ID: <20210614135622.inrlsivqccgcwawi@redhat.com>
References: <20210609180118.1003774-1-eblake@redhat.com>
 <20210609180118.1003774-3-eblake@redhat.com>
 <CAMRbyyuyFf4F9S6+rW2j+YPQyV3PECifq1_4S6mQ+8V2hREsKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyuyFf4F9S6+rW2j+YPQyV3PECifq1_4S6mQ+8V2hREsKA@mail.gmail.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jun 12, 2021 at 02:39:44AM +0300, Nir Soffer wrote:
> Since this change is not simple, and the chance that we also get the dirty
> bitmap included in the result seems to be very low, I decided to check the
> direction of merging multiple extents.
> 
> I started with merging "base:allocation" and "qemu:dirty-bitmap:xxx" since
> we already have both. It was not hard to do, although it is not completely
> tested yet.
> 
> Here is the merging code:
> https://gerrit.ovirt.org/c/ovirt-imageio/+/115216/1/daemon/ovirt_imageio/_internal/nbdutil.py
> 
> To make merging easy and safe, we map the NBD_STATE_DIRTY bit to a private bit
> so it cannot clash with the NBD_STATE_HOLE bit:
> https://gerrit.ovirt.org/c/ovirt-imageio/+/115215/1/daemon/ovirt_imageio/_internal/nbd.py
> 
> Here is a functional test using qemu-nbd showing that it works:
> https://gerrit.ovirt.org/c/ovirt-imageio/+/115216/1/daemon/test/client_test.py
> 
> I'll try to use "qemu:allocation-depth" in a similar way next week, probably
> mapping depth > 0 to EXTENT_EXISTS, to use when reporting holes in
> single qcow2 images.
> 
> If this is successful, we can start using this in the next ovirt release, and we
> don't need "qemu:joint-allocation".

That's nice to know.  So at this point, we'll drop the patch on
qemu:joint-allocation, and instead focus on teh patch that improves
qemu-img map output to make it easier to use in the same way that
qemu:allocation-depth is.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


