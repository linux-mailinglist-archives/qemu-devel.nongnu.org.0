Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59051999C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:21:08 +0200 (CEST)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmAFt-0006Mo-B6
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmADW-0004gV-Bk
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:18:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmADT-0006yt-JH
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651652315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UGuBlXllLI7iBolzbVZIg9J8ujt4JXHbfpehFexN1vg=;
 b=Yn1ExBmZucvoA5FbDpe7xIPlKz7npPIDobFYJKkooyhU2skcOVVXEikJIexZHzJM81hk1u
 V7Jx95j8U5Ovpx7UspCjMrpESfSNcj2alQUdSmJP1sjXPDiHClkzMLpX5Fe51NWEl2CKhT
 QbBKLtR6oG9R6dVyF94ev9fdiXLz5vg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-h5lOfKsoNUW7UOUqlkfIGw-1; Wed, 04 May 2022 04:18:31 -0400
X-MC-Unique: h5lOfKsoNUW7UOUqlkfIGw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90E0D3C138A1;
 Wed,  4 May 2022 08:18:31 +0000 (UTC)
Received: from redhat.com (dhcp-192-180.str.redhat.com [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3981111D78A;
 Wed,  4 May 2022 08:18:30 +0000 (UTC)
Date: Wed, 4 May 2022 10:18:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/4] block: Improve empty format-specific info dump
Message-ID: <YnI21c4HvUr//+5v@redhat.com>
References: <20220503145529.37070-1-hreitz@redhat.com>
 <20220503145529.37070-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503145529.37070-2-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 03.05.2022 um 16:55 hat Hanna Reitz geschrieben:
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

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


