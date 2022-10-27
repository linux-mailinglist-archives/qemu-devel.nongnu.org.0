Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50560FF00
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:11:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6ME-0001Lc-GI; Thu, 27 Oct 2022 13:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo6MC-00017D-EH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo6MB-0005U9-2Z
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666890470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rP7TBpoeuuPCzXd10FHE8F4Jjg1w1wOqwGgdBlVHmh4=;
 b=Sleu3i+nO7a3xkfdPkFG6GsmM1WEzjh1X6vvvGEGLOPz24psJ2RV23yKDVc4CRiFwVzsOj
 NmBhwCJN9rPT62BTcDUX8NJXohBEWnL2dZ14JfFKHqiGPqdWHH/SkHofg6yQOCLs3aptZ6
 qI9Hb2txyWvGPn0uW2IEag6C083VZP0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-CjHxl7xoP5O4In3ip7HL7g-1; Thu, 27 Oct 2022 13:07:46 -0400
X-MC-Unique: CjHxl7xoP5O4In3ip7HL7g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AAAB3C0F426;
 Thu, 27 Oct 2022 17:07:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEF40477F55;
 Thu, 27 Oct 2022 17:07:45 +0000 (UTC)
Date: Thu, 27 Oct 2022 19:07:44 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, afaria@redhat.com
Subject: Re: [PATCH 23/24] vmdk: switch to *_co_* functions
Message-ID: <Y1q64L39YhSaVb1T@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
 <20221013123711.620631-24-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013123711.620631-24-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

> @@ -1624,12 +1624,11 @@ static int coroutine_fn get_cluster_offset(BlockDriverState *bs,
>      }
>      l2_table = (char *)extent->l2_cache + (min_index * l2_size_bytes);
>      BLKDBG_EVENT(extent->file, BLKDBG_L2_LOAD);
> -    if (bdrv_pread(extent->file,
> +    if (bdrv_co_pread(extent->file,
>                  (int64_t)l2_offset * 512,
>                  l2_size_bytes,
> -                l2_table,
> -                0
> -            ) < 0) {
> +                l2_table, 0
> +            ) != l2_size_bytes) {

Another incorrect conflict resolution, this would revert part of commit
353a5d84b25. Fixing it up as well.

Kevin


