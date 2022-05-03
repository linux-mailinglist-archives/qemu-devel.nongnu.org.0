Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651D351810F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:32:08 +0200 (CEST)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlot5-0003nU-3F
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlop6-0002aR-F2
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:28:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlop4-0002QM-Ud
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651570076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2SUCCzhlUWTRRoWyISzIk/fP4iCExsBpnTVaVlhSnrk=;
 b=Sb1mmkSPVAdRvMHpCywM3lHZZ40M/YmHpvrdcSYtwL4rLpVGIjHTUPfW56UnOlLHzav/HJ
 BoZ4tUsfOfbUYncZ2QIwXl+qP3gxOGh2wEaSoOukfuobD4AMpHTcOWIcuc0M7gGQcLtLpf
 7QRSo3ppvi435rN6lknoNwreEevDtjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-21GQvzOYPqye-um-3OYiZA-1; Tue, 03 May 2022 05:27:55 -0400
X-MC-Unique: 21GQvzOYPqye-um-3OYiZA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4434685A5BC;
 Tue,  3 May 2022 09:27:55 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAEA4401E77;
 Tue,  3 May 2022 09:27:53 +0000 (UTC)
Date: Tue, 3 May 2022 11:27:52 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 hreitz@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 vsementsov@openvz.org, nikita.lapshin@virtuozzo.com
Subject: Re: [PATCH v3 1/3] block: block_dirty_bitmap_merge(): fix error path
Message-ID: <YnD1mH5zbTsWt6NZ@redhat.com>
References: <20220401100804.315728-1-vsementsov@openvz.org>
 <20220401100804.315728-2-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401100804.315728-2-vsementsov@openvz.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.04.2022 um 12:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
> At the end we ignore failure of bdrv_merge_dirty_bitmap() and report
> success. And still set errp. That's wrong.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


