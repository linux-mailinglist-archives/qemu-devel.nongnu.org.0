Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DD6F0894
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:46:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3or-0002tP-B9; Thu, 27 Apr 2023 11:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ps3oD-0001sa-ES
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ps3oB-0004py-D1
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682610322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xe6vBaDC0b2JWv5I3REbhBv7Gu57kCai938LR5v7ef8=;
 b=f2JC0bOOtzuvTtwCQsSLajDh4xMpgPDR05w4g1OlRlvRaxo2yDbVo5R2HRgnS4sUVGn0Pv
 ubTyaUnJ6pSjlPOoC9qhLZGrCm8Wko+RjmrgM+6vX2ht4jPaSGQ7BHSMOpWsN6MLiamKR1
 KXT0JVP7Xv+GB8PaOWjE9O1DWDqA8dc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-zKyKEziwODOzDuW95a7XaA-1; Thu, 27 Apr 2023 11:10:28 -0400
X-MC-Unique: zKyKEziwODOzDuW95a7XaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBE3910334B1;
 Thu, 27 Apr 2023 15:09:38 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5AE2166B46;
 Thu, 27 Apr 2023 15:09:37 +0000 (UTC)
Date: Thu, 27 Apr 2023 10:09:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Subject: Re: [PATCH 04/20] block: Don't call no_coroutine_fns in
 qmp_block_resize()
Message-ID: <mxv3i2omraa2vbo4thkeg6jing6buyo2ka6v5gpclywdqdaq6p@dyxsecg63mbr>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-5-kwolf@redhat.com>
 <xudwiuo2m5jpry5f5rferub76tarvvv5ea3ry6ye4j3dgprum5@sypt7dy3gspy>
 <ZEpZPAGgIKT7jNmR@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEpZPAGgIKT7jNmR@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Apr 27, 2023 at 01:15:08PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 22:08 hat Eric Blake geschrieben:
> > On Tue, Apr 25, 2023 at 07:31:42PM +0200, Kevin Wolf wrote:
> > > This QMP handler runs in a coroutine, so it must use the corresponding
> > > no_co_wrappers instead.
> > > 
> > > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > > ---
> > >  blockdev.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > 
> > > 
> > > diff --git a/blockdev.c b/blockdev.c
> > > index d7b5c18f0a..eb509cf964 100644
> > > --- a/blockdev.c
> > > +++ b/blockdev.c
> > > @@ -2430,7 +2430,7 @@ void coroutine_fn qmp_block_resize(const char *device, const char *node_name,
> > 
> > Would it help matters to add another patch that changes the name of
> > the function to qmp_co_block_resize?
> 
> I'm not opposed to it, but you would have to change the QAPI generator
> for that. Currently, it always calls qmp_$COMMAND_NAME() no matter
> whether it is coroutine command handler or not.

Oh, that indeed is a bigger task, not worth holding up this series
for.

But the QAPI generater DOES have the 'coroutine':true information
available, if we wanted to automate that.  Having a naming convention
that reflects usage patterns is helpful during code reviews.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


