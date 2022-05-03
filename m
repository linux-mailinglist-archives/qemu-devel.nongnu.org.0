Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED606518C8D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 20:47:57 +0200 (CEST)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlxYy-0005rW-Ff
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 14:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlxWZ-0003oX-OG
 for qemu-devel@nongnu.org; Tue, 03 May 2022 14:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nlxWY-0001Gk-6T
 for qemu-devel@nongnu.org; Tue, 03 May 2022 14:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651603525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=suGN42F1nN/nnchYy1WaueGpb1uLoY6BtJC545RPo70=;
 b=UafmDOuimDBgibSvgjo+eFsAj8qSwDDeZgVimuwPAdC1P2+qNIPir1TGz0prTu/1qRbDqr
 +Mc8JQJ+S2CkLPmsI0xKYQ/hIzVPg58nZXwCAak41MkU/WO+EgpdVdmwkd4LxpQiQR2i6q
 9WJE3vtxGwBnWQ7G6r+s+Khmz+OYw/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-g-FnA2WAPvmEtnixBzzWpg-1; Tue, 03 May 2022 14:45:14 -0400
X-MC-Unique: g-FnA2WAPvmEtnixBzzWpg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1C3D811E7A;
 Tue,  3 May 2022 18:45:13 +0000 (UTC)
Received: from redhat.com (unknown [10.22.10.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF7EB2024CC6;
 Tue,  3 May 2022 18:44:57 +0000 (UTC)
Date: Tue, 3 May 2022 13:44:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/4] block: Improve empty format-specific info dump
Message-ID: <20220503184455.z4fbx5a4xmwuispf@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503145529.37070-2-hreitz@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Tue, May 03, 2022 at 04:55:26PM +0200, Hanna Reitz wrote:
> When a block driver supports obtaining format-specific information, but
> that object only contains optional fields, it is possible that none of
> them are present, so that dump_qobject() (called by
> bdrv_image_info_specific_dump()) will not print anything.
> 
> The callers of bdrv_image_info_specific_dump() put a header above this
> information ("Format specific information:\n"), which will look strange
> when there is nothing below.  Modify bdrv_image_info_specific_dump() to
> print this header instead of its callers, and only if there is indeed
> something to be printed.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  include/block/qapi.h |  3 ++-
>  block/qapi.c         | 41 +++++++++++++++++++++++++++++++++++++----
>  qemu-io-cmds.c       |  4 ++--
>  3 files changed, 41 insertions(+), 7 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


