Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4B400779
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:37:09 +0200 (CEST)
Received: from localhost ([::1]:57072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGs0-0004b1-F6
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMGqD-00031T-GL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMGqB-0004Vz-VE
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 17:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630704915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SAvz3/+rLNdCGjO9/UGeVdzz5xRQ3sNfuZMjZ/LcsSo=;
 b=bk7kdFsYl7R31GvvPcbEG9r4LLzOGsyPTPboB5GHeG0GcPbV4Juvx9uvdGCPaDNA2b9nBJ
 /+cc3r0sBD6Ljaa6k0vgtzd0IQEyimjQNM3L2Yf/Etacc/npRbTIPUI22ku0N8maihnveO
 NWI8rbVftFdgYY5h7yYSUYQYz/1QjtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-SruovtVYM9q4Ht96Vxi_Dg-1; Fri, 03 Sep 2021 17:35:13 -0400
X-MC-Unique: SruovtVYM9q4Ht96Vxi_Dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15ED08145E5;
 Fri,  3 Sep 2021 21:35:12 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C00C1B5C2;
 Fri,  3 Sep 2021 21:35:00 +0000 (UTC)
Date: Fri, 3 Sep 2021 16:34:58 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 04/11] block: use int64_t instead of uint64_t in
 driver write handlers
Message-ID: <20210903213458.r3ut7hhprqa5a24w@redhat.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
 <20210903102807.27127-5-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210903102807.27127-5-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, qemu-block@nongnu.org, pavel.dovgaluk@ispras.ru,
 sw@weilnetz.de, pl@kamp.de, qemu-devel@nongnu.org, jsnow@redhat.com,
 hreitz@redhat.com, kraxel@redhat.com, ronniesahlberg@gmail.com,
 pbonzini@redhat.com, idryomov@gmail.com, philmd@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 01:28:00PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
...

> Still, the functions may be called directly, not only by drv->...
> Let's check:
> 
> git grep '\.bdrv_\(aio\|co\)_pwritev\(_part\)\?\s*=' | \
> awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
> while read func; do git grep "$func(" | \
> grep -v "$func(BlockDriverState"; done
> 
> shows several callers:
> 
> qcow2:
>   qcow2_co_truncate() write at most up to @offset, which is checked in
>     generic qcow2_co_truncate() by bdrv_check_request().
>   qcow2_co_pwritev_compressed_task() pass the request (or part of the
>     request) that already went through normal write path, so it should
>     be OK
> 
> qcow:
>   qcow_co_pwritev_compressed() pass int64_t, it's updated by this patch
> 
> quorum:
>   quorum_co_pwrite_zeroes() pass int64_t and int - OK
> 
> throttle:
>   throttle_co_pwritev_compressed() pass int64_t, it's updated by this
>   patch
> 
> vmdk:
>   vmdk_co_pwritev_compressed() pass int64_t, it's updated by this
>   patch
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


