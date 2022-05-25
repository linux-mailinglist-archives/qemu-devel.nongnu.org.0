Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC43533CBF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:36:29 +0200 (CEST)
Received: from localhost ([::1]:59210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqFE-0001d7-Ed
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ntq92-0007rK-2r
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:29:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ntq8z-0006RE-DD
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653481779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BC26o3/g3AK4q3yrliU3ZV637nLf+jzquCHKxw1xNOY=;
 b=aA1prNk4UqUrChxRRjlSMOzuy+/uZ+zW0Yj5bGUr7R/3k0Am7kXTN9Y1D/15+6X8VEuS18
 +jnAT2i9PJaLDcFFYVR8kxWXB/TJ5tuAVNfkqi2dlE/6in8APXwR4AAqAvWLGpBaxVCiWt
 X/HCg8fwo+0LUClYSllahu8mB35iU/E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-OTH7HmMEN5OIK-_uy1RCGA-1; Wed, 25 May 2022 08:29:36 -0400
X-MC-Unique: OTH7HmMEN5OIK-_uy1RCGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D699B18A6522;
 Wed, 25 May 2022 12:29:35 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D40112166B29;
 Wed, 25 May 2022 12:29:34 +0000 (UTC)
Date: Wed, 25 May 2022 07:29:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 03/20] migration: remove unreachble RDMA code in
 save_hook impl
Message-ID: <20220525122933.azbd7fc4bah53lk5@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-4-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220524110235.145079-4-berrange@redhat.com>
User-Agent: NeoMutt/20220429-77-e284d5
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 24, 2022 at 12:02:18PM +0100, Daniel P. Berrangé wrote:
> The QEMUFile 'save_hook' callback has a 'size_t size' parameter.
> 
> The RDMA impl of this has logic that takes different actions
> depending on whether the value is zero or non-zero. It has
> commented out logic that would have taken further actions
> if the value was negative.
> 
> The only place where the 'save_hook' callback is invoked is
> the ram_control_save_page() method, which passes 'size'
> through from its caller. The only caller of this method is
> in turn control_save_page(). This method unconditionally
> passes the 'TARGET_PAGE_SIZE' constant for the 'size' parameter.
> 
> IOW, the only scenario for 'size' that can execute in the
> qemu_rdma_save_page method is 'size > 0'. The remaining code
> has been unreachable since RDMA support was first introduced
> 9 years ago.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  migration/rdma.c | 120 +++++++++--------------------------------------
>  1 file changed, 21 insertions(+), 99 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


