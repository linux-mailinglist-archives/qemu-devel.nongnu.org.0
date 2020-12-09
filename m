Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64B72D4BFC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:37:25 +0100 (CET)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6DE-0001Bk-BI
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn69M-0007Wh-TU
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:33:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kn69J-0005Qz-Bf
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607545999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rI8c0uSR6LqgxzymvF10i6a7wHqPlm74EOU7GkjHcqc=;
 b=hLIdwMToChEQwDB5m20ie5QEygyxAKa3msXXV2XkaI/R/fJQUkCJInOsp5RxpuxWWJ5TUe
 05sWP0G1W20TpZLEmKgW77rCyW6lmow1JIV4vZgMieeQl0KVFTPE6u+VPDvh25NWxVYk4a
 dYSYkZcQWXRXcwgPlKGUyJkaoLc5f7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-CQvL7dOTNIKQbHEl5SR17Q-1; Wed, 09 Dec 2020 15:33:15 -0500
X-MC-Unique: CQvL7dOTNIKQbHEl5SR17Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7187B190A7A1;
 Wed,  9 Dec 2020 20:33:14 +0000 (UTC)
Received: from starship (unknown [10.35.206.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B3EE60BF3;
 Wed,  9 Dec 2020 20:33:12 +0000 (UTC)
Message-ID: <88d19986b199c449f327b56cca436890be586421.camel@redhat.com>
Subject: Re: [PATCH v4 4/4] block: qcow2: remove the created file on
 initialization error
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Date: Wed, 09 Dec 2020 22:33:11 +0200
In-Reply-To: <w51k0tqnag7.fsf@maestria.local.igalia.com>
References: <20201209164441.867945-1-mlevitsk@redhat.com>
 <20201209164441.867945-5-mlevitsk@redhat.com>
 <w51k0tqnag7.fsf@maestria.local.igalia.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-12-09 at 18:41 +0100, Alberto Garcia wrote:
> On Wed 09 Dec 2020 05:44:41 PM CET, Maxim Levitsky wrote:
> > @@ -3847,12 +3847,13 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
> >  
> >      /* Create the qcow2 image (format layer) */
> >      ret = qcow2_co_create(create_options, errp);
> > +
> > +finish:
> >      if (ret < 0) {
> > -        goto finish;
> > +        bdrv_co_delete_file_noerr(bs);
> > +        bdrv_co_delete_file_noerr(data_bs);
> >      }
> >  
> > -    ret = 0;
> 
> Many/most functions in qcow2.c force ret to be 0 on success, we could
> also keep that here (although in practice I don't think that ret can be
> greater than 0 in this case, or that the caller would care).

I also noticed this when I was sending the patches, and I wasn't sure
if I want to keep that 'ret = 0' or not.
I will add it back.

Best regards,
	Maxim Levitsky

> 
> Either way,
> 
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> 
> Berto
> 



