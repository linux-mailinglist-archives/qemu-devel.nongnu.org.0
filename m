Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C92532AB4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:53:02 +0200 (CEST)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntU21-0006i4-Kg
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntTwm-0000U3-SW
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntTwl-00062t-Da
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:47:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653396454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UNFxEJxT64tutfQmLlJagJqt60A5JFBRYfe2SyFXrhs=;
 b=ao7IBlQnMnWuvPhT9/YcpsxOf4gg1J9uuPWp+ydtpcjHZEGkQzMW+4YhI891xW4kkwqVuo
 jqdli/qDjmTeSYjEwy3CSv/KXbvfzT5hPDUsQKSr3N+vbDweQBn0u8Rd0E3W3Bp22bumE6
 lPvzmFuVjSaOoq51G5QkQjL5U+X8cUU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-iIOdhRODOSuT1E2PqHZp5A-1; Tue, 24 May 2022 08:47:30 -0400
X-MC-Unique: iIOdhRODOSuT1E2PqHZp5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C1A91C05152;
 Tue, 24 May 2022 12:47:30 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 294CB7AD8;
 Tue, 24 May 2022 12:47:27 +0000 (UTC)
Date: Tue, 24 May 2022 14:47:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 hreitz@redhat.com, jsnow@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: Re: [PATCH v4 0/3] block/dirty-bitmaps: fix and improve bitmap merge
Message-ID: <YozT2QIbeYvr/2lu@redhat.com>
References: <20220517111206.23585-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517111206.23585-1-v.sementsov-og@mail.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.05.2022 um 13:12 hat Vladimir Sementsov-Ogievskiy geschrieben:
> From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> 
> v4:
> 01,03: add Kevin's r-b
> 02: add hbitmap_free() on success patch if local_backup is not needed
> 
> Vladimir Sementsov-Ogievskiy (3):
>   block: block_dirty_bitmap_merge(): fix error path
>   block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
>   block: simplify handling of try to merge different sized bitmaps

Thanks, applied to the block branch.

Kevin


