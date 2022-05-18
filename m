Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7952BB3C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:51:06 +0200 (CEST)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJ8q-0002AC-Re
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrJ4b-0007R2-Ij
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:46:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrJ4Z-0002l1-5G
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652877998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g3CoeFjVAjlWIUJtZEzs21XQUAOXEUN09qOpaMrGMeY=;
 b=GVSEfWt8Ky3lf8UJRaQs2AsPKYd1VC2KvpldESXN4AczrxtoCCfWoXktYbVfx/My5AXoEN
 cp/ozbl8ay7d6UxF5uNy+Dt0Nce0OMMNdPRylAQiCBpHIQYhmhOU1T7XjbWAUlMHVNKFOr
 aGpThr3kQAjYDexcfFl0Hkb3h0W6S3I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-GxMgCI7ROFSvXYw66VLX1w-1; Wed, 18 May 2022 08:46:35 -0400
X-MC-Unique: GxMgCI7ROFSvXYw66VLX1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95668382ECC9;
 Wed, 18 May 2022 12:46:34 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC79440C1438;
 Wed, 18 May 2022 12:46:33 +0000 (UTC)
Date: Wed, 18 May 2022 07:46:32 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Cc: qemu-block@nongnu.org, kwolf@redhat.com, v.sementsov-og@mail.ru,
 bleal@redhat.com, qemu-devel@nongnu.org, hreitz@redhat.com,
 vsementsov@openvz.org, crosa@redhat.com
Subject: Re: [PATCH 2/2] iotests: use vm.cmd() instead of vm.qmp() where
 appropriate
Message-ID: <20220518124632.3ov3kduelokiymuo@redhat.com>
References: <20220408170214.45585-1-vsementsov@openvz.org>
 <20220408170214.45585-3-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408170214.45585-3-vsementsov@openvz.org>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Fri, Apr 08, 2022 at 08:02:14PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Checking success by hand every time is tedious. Let's use cmd() method
> instead which does this check for us.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>  31 files changed, 773 insertions(+), 1205 deletions(-)

Big, but mechanical.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


