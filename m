Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48B2B09E1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 17:27:26 +0100 (CET)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdFRU-0003Eh-VC
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 11:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdFQG-0002ga-Av
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 11:26:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdFQA-000154-QJ
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 11:26:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605198360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GU/fszsT5DbVAGyumWOWwYYvwCZei6sg0pVrPVrBB34=;
 b=BaIV0SnsaEmpf9a88OZI51tGBEnXh1LtfCPm02gAgivZVUAjoMy3A6qXNK10kBQzcfIyMb
 dFbps0gppbc8zkFwtEAzIXJJhjmERGeSlOFmxvKJY7CzkUS02FX0cdZZokblcbWr2uXnXr
 t5RBzKdN7Kx+/r2HLsVXqN2ZBNOKvrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-ayo-RSVvORuKIBQ7o-y2gg-1; Thu, 12 Nov 2020 11:25:58 -0500
X-MC-Unique: ayo-RSVvORuKIBQ7o-y2gg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84BB18C32FC;
 Thu, 12 Nov 2020 16:25:57 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EDD4360C0F;
 Thu, 12 Nov 2020 16:25:52 +0000 (UTC)
Date: Thu, 12 Nov 2020 16:25:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Haotian Li <lihaotian9@huawei.com>
Subject: Re: [PATCH v3 0/3] virtiofsd: fix some accessing NULL pointer problem
Message-ID: <20201112162550.GH13424@work-vm>
References: <3477d902-ace9-1aa1-531a-9d20d6e93a05@huawei.com>
MIME-Version: 1.0
In-Reply-To: <3477d902-ace9-1aa1-531a-9d20d6e93a05@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, linfeilong@huawei.com, qemu-devel@nongnu.org,
 liuzhiqiang26@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Haotian Li (lihaotian9@huawei.com) wrote:
> Hi,
>   We find some potential NULL pointer bugs on tools/virtiofsd.
> Three patches are made to fix them

Queued

> Haotian Li (3):
>   tools/virtiofsd/buffer.c: check whether buf is NULL in
>     fuse_bufvec_advance func
>   virtiofsd: check whether lo_map_reserve returns NULL in main func
>   virtiofsd: check whether strdup lo.source return NULL in main func.
> 
>  tools/virtiofsd/buffer.c         |  4 ++++
>  tools/virtiofsd/passthrough_ll.c | 16 +++++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> -- 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


