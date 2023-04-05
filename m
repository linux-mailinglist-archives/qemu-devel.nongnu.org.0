Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E216D7D02
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 14:55:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk2fK-0006lQ-A0; Wed, 05 Apr 2023 08:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pk2fG-0006kW-H3
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:55:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pk2f9-000720-N9
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680699294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S6wXYwIonHGPBUjY9tHOqoqVWrP4r3JjRktFwvMiIj0=;
 b=h1CK7Bu8qPsCZWm8syHZiXZnxK59JqZIIPrJtT6x0gAo4Zokhn83DlSJpZKH4wMFf09XwF
 HgUAutSpXqH6mw/vpJwubdx+dIK5NGk7V2vsDw2DUqWhlJCIXknvEP/MWEHCLu0P4NWPRf
 +7l6Ew08fklbymMKwwtlg5aE0hGWXCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-94jEvfmcO8GiiBVeGwZ8wg-1; Wed, 05 Apr 2023 08:54:53 -0400
X-MC-Unique: 94jEvfmcO8GiiBVeGwZ8wg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A05CF8996E4;
 Wed,  5 Apr 2023 12:54:52 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49DA2140EBF4;
 Wed,  5 Apr 2023 12:54:52 +0000 (UTC)
Date: Wed, 5 Apr 2023 07:54:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH] nbd: a BlockExport always has a BlockBackend
Message-ID: <kw3mfjwhrp67nyofmigyryc7uj5tpfpaxbc3zzpqkksm46rt6k@vtchtohggi73>
References: <20230405101634.10537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405101634.10537-1-pbonzini@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Apr 05, 2023 at 12:16:34PM +0200, Paolo Bonzini wrote:
> exp->common.blk cannot be NULL, nbd_export_delete() is only called from
> blk_exp_unref() and in turn that can only happen after blk_exp_add()
> has asserted exp->blk != NULL.

Commit message is a bit imprecise (maybe due to refactoring in the
meantime?): drv->delete is only called from blk_exp_delete_bh(), but
that in turn is indeed only called from blk_exp_unref(), so the logic
is sound.

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  nbd/server.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

As this is only removal of a useless conditional, it can wait for 8.1.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


