Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3296F04D1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:16:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przas-00016p-BZ; Thu, 27 Apr 2023 07:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1przaq-000141-7Q
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:15:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1przan-0000P5-L2
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:15:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682594114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ogfV9V65ftd/gpIsdMinYGFEJubwJ+Zjt5JMrhhTvGY=;
 b=YwVCCRbwXyH5rAMaCaVwcmHkYMmpFExo3gunk8xdBZ0wcZ4mWB87/omsQ6HAo2aUE3W2mn
 0VGMDNP50RU0rGJMQzc3zgn7CTvQOAinxZEQrInIwERxl0Pb18d0lLA40nH2RqPWCJNlm+
 4lWU/clfYsXfiyR3kYFfsUjT3KOzIzI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-2tLb9-bjPWWzhVibPpTQyA-1; Thu, 27 Apr 2023 07:15:11 -0400
X-MC-Unique: 2tLb9-bjPWWzhVibPpTQyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAA71185A7A4;
 Thu, 27 Apr 2023 11:15:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B563D51E3;
 Thu, 27 Apr 2023 11:15:09 +0000 (UTC)
Date: Thu, 27 Apr 2023 13:15:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [PATCH 04/20] block: Don't call no_coroutine_fns in
 qmp_block_resize()
Message-ID: <ZEpZPAGgIKT7jNmR@redhat.com>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-5-kwolf@redhat.com>
 <xudwiuo2m5jpry5f5rferub76tarvvv5ea3ry6ye4j3dgprum5@sypt7dy3gspy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xudwiuo2m5jpry5f5rferub76tarvvv5ea3ry6ye4j3dgprum5@sypt7dy3gspy>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 25.04.2023 um 22:08 hat Eric Blake geschrieben:
> On Tue, Apr 25, 2023 at 07:31:42PM +0200, Kevin Wolf wrote:
> > This QMP handler runs in a coroutine, so it must use the corresponding
> > no_co_wrappers instead.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  blockdev.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> > 
> > diff --git a/blockdev.c b/blockdev.c
> > index d7b5c18f0a..eb509cf964 100644
> > --- a/blockdev.c
> > +++ b/blockdev.c
> > @@ -2430,7 +2430,7 @@ void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
> 
> Would it help matters to add another patch that changes the name of
> the function to qmp_co_block_resize?

I'm not opposed to it, but you would have to change the QAPI generator
for that. Currently, it always calls qmp_$COMMAND_NAME() no matter
whether it is coroutine command handler or not.

Kevin


