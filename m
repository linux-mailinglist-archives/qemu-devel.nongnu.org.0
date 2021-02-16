Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E43C31D0E6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:23:43 +0100 (CET)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5wk-0003oa-C9
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lC5so-0001oI-20
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:19:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lC5sk-0005eF-AD
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613503173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wELDa2W+XNlvnu3ZbRKNf6h2u5sDRuJaTor6m0Hodd8=;
 b=QwsdhyYm2xrVHzYm9P1Bgt9T2eBOch4AsEoISH6RO9UU8yi59DoA7aw2UsyUT+wPpvqu0t
 10mx7wNW2YciAs4gFYviQB7D9uxGngM11yAEGXwhai5UX216Ye/bua7khEl0XbU5X18HDq
 kQNABQDhyfYAdPpLxKHvqjoMFPeoczI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-46mDzQQtPxmZdqFf2Ly6oA-1; Tue, 16 Feb 2021 14:19:30 -0500
X-MC-Unique: 46mDzQQtPxmZdqFf2Ly6oA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFB0780196C;
 Tue, 16 Feb 2021 19:19:28 +0000 (UTC)
Received: from [10.10.117.151] (ovpn-117-151.rdu2.redhat.com [10.10.117.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6AD019D6C;
 Tue, 16 Feb 2021 19:19:24 +0000 (UTC)
Subject: Re: [PATCH 1/5] qcow2-bitmap: make bytes_covered_by_bitmap_cluster()
 public
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
 <20210216164527.37745-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <6979d4a5-f369-1084-deb6-faca26fe7406@redhat.com>
Date: Tue, 16 Feb 2021 13:19:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216164527.37745-2-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 10:45 AM, Vladimir Sementsov-Ogievskiy wrote:
> Rename bytes_covered_by_bitmap_cluster() to
> bdrv_dirty_bitmap_serialization_coverage() and make it public. It is
> needed as we are going to make load_bitmap_data() public in the next
> commit.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/dirty-bitmap.h |  2 ++
>  block/dirty-bitmap.c         | 13 +++++++++++++
>  block/qcow2-bitmap.c         | 16 ++--------------
>  3 files changed, 17 insertions(+), 14 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


