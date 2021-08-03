Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DAD3DF10A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:04:54 +0200 (CEST)
Received: from localhost ([::1]:39742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvyO-0006go-SJ
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mAvx5-0005sc-P3
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:03:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mAvx4-0002UL-Cx
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628003009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mxjxKRpNMC6AuQ+8yrfMQ+2QHboOhpGlmI6R5XBq1Yg=;
 b=VzidJM8XeHSAe4GkPAGStzJOWmzLHjWH9A2m22kJYJoHN5ude1NPODfFVLYSSJQzgKPUkx
 WDBAH3NFTZsBEdhuaJoPKULA3g8SAeFdAyZ2rBaHYCM0tB0P/KkVpMH6NJFkWgk3sRAePG
 cgCp/Aqnd4tOsCGckvIwirbs3Rj507k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-vUW9c1Z5PiGEXs4w4Shp_Q-1; Tue, 03 Aug 2021 11:03:20 -0400
X-MC-Unique: vUW9c1Z5PiGEXs4w4Shp_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73296192CC43;
 Tue,  3 Aug 2021 15:03:19 +0000 (UTC)
Received: from redhat.com (ovpn-114-4.phx2.redhat.com [10.3.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E72C779D0;
 Tue,  3 Aug 2021 15:03:18 +0000 (UTC)
Date: Tue, 3 Aug 2021 10:03:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Zhenyu Ye <yezhenyu2@huawei.com>
Subject: Re: [Question] qemu-img convert block alignment
Message-ID: <20210803150316.eo5gm3xqxuetqahq@redhat.com>
References: <ed4ae175-1c67-b7fb-669d-c8c08ca1a7f7@huawei.com>
MIME-Version: 1.0
In-Reply-To: <ed4ae175-1c67-b7fb-669d-c8c08ca1a7f7@huawei.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pl@kamp.de, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 02, 2021 at 11:52:25AM +0800, Zhenyu Ye wrote:
> Hi all,
> 
> commit 8dcd3c9b91 ("qemu-img: align result of is_allocated_sectors")
> introduces block alignment when doing qemu-img convert. However, the
> alignment is:
> 
> 	s.alignment = MAX(pow2floor(s.min_sparse),
>                       DIV_ROUND_UP(out_bs->bl.request_alignment,
>                                    BDRV_SECTOR_SIZE));
> 
> (where the default s.min_sparse is 8)
> When the target device's bl.request_alignment is smaller than 4K, this
> will cause additional write-zero overhead and makes the size of target
> file larger.
> 
> Is this as expected?  Should we change the MAX() to MIN()?

Yes it is expected, and no we shouldn't change it.  Even when a target
advertises a bl.request_alignment of 512, our goal is to avoid needing
read-modify-write cycles when that target is really on top of a 4k
sector disk.  Writing extra 0s out to the 4k boundaries does not
change the fact that allocation is in 4k chunks anyways, regardless of
whether the disk supports smaller 512-byte reads.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


