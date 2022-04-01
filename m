Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4DC4EFB17
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 22:19:01 +0200 (CEST)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naNjY-0003yl-3x
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 16:19:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1naNiV-0002lG-Oo
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 16:17:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1naNiT-0002bZ-0F
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 16:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648844271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=enunEhsxLdHWBP/OxMDBsQgqoM2vuxC0u2AXnHNX3PQ=;
 b=WpydQhOpzrFVC5dfRj69kglR6t19UJlL+tmzTgp3RAR9qudD2mz0Wepwv9zQhpjFlFd8Up
 ZeYlsX6cd+cJqBqaC65miAGoHKMMp00lVGdcMGv2XLbmSLjjIk6PD+d0zzuJWdFkMfucf0
 WRXH8r/Hx2GxQJsAutmN9oXzp8rhVsY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-zi5R-qHONUa8OWPzieZCkg-1; Fri, 01 Apr 2022 16:17:48 -0400
X-MC-Unique: zi5R-qHONUa8OWPzieZCkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C574F833959;
 Fri,  1 Apr 2022 20:17:47 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6773640E4D4C;
 Fri,  1 Apr 2022 20:17:46 +0000 (UTC)
Date: Fri, 1 Apr 2022 15:17:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Subject: Re: [PATCH v3 0/3] block/dirty-bitmaps: fix and improve bitmap merge
Message-ID: <20220401201744.4353izghujwvt7mo@redhat.com>
References: <20220401100804.315728-1-vsementsov@openvz.org>
MIME-Version: 1.0
In-Reply-To: <20220401100804.315728-1-vsementsov@openvz.org>
User-Agent: NeoMutt/20211029-532-cd6609
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-block@nongnu.org,
 nikita.lapshin@virtuozzo.com, qemu-devel@nongnu.org, hreitz@redhat.com,
 vsementsov@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 01, 2022 at 01:08:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> v3: rebase on master, one patch is already merged.
> 
> Vladimir Sementsov-Ogievskiy (3):
>   block: block_dirty_bitmap_merge(): fix error path
>   block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
>   block: simplify handling of try to merge different sized bitmaps

Is any of this series worth getting into 7.0, or are we safe letting
it slide to 7.1?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


