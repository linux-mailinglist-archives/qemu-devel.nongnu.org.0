Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0FF60FEF5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:10:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6K4-0004bD-Fy; Thu, 27 Oct 2022 13:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo6Js-0004Mm-Jb
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo6Jr-00053a-AB
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:05:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666890326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=82B9sL6SK6ysukNbs8w/m8UTxKCI1MHSpnTfLwpz434=;
 b=FksNKdML54mSaTRE+W/4/Cifd3ayMJkGTxsY0U8wyF7OF3WohGBO0fnFDS5N3UXrLeZgQG
 PRbYRP1Xumll+CilvLkAhLCAuXhePJx44Zijl2d0z0F2IqZsaFmtgBB2r5fIAzBr2IScll
 FaK0eS2RKggGcqjsin40r/Cu79C7bsk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-WwGn5U4eMZmqgqCFd3luKA-1; Thu, 27 Oct 2022 13:05:23 -0400
X-MC-Unique: WwGn5U4eMZmqgqCFd3luKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E09A93C0D1AE;
 Thu, 27 Oct 2022 17:05:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29B2918EB4;
 Thu, 27 Oct 2022 17:05:22 +0000 (UTC)
Date: Thu, 27 Oct 2022 19:05:20 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, afaria@redhat.com
Subject: Re: [PATCH 19/24] qcow2: switch to *_co_* functions
Message-ID: <Y1q6UDf/rHC1vzuP@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
 <20221013123711.620631-20-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013123711.620631-20-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 13.10.2022 um 14:37 hat Paolo Bonzini geschrieben:
> From: Alberto Faria <afaria@redhat.com>
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

> @@ -1699,8 +1699,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>          }
>  
>          s->image_backing_file = g_malloc(len + 1);
> -        ret = bdrv_pread(bs->file, header.backing_file_offset, len,
> -                         s->image_backing_file, 0);
> +        ret = bdrv_co_pread(bs->file, header.backing_file_offset, len,
> +                            bs->auto_backing_file, 0);

This was an incorrect conflict resolution, it reverts part of commit
ec64b1ca081 (s->image_backing_file vs. bs->auto_backing_file).

I'll fix this while applying.

Kevin


