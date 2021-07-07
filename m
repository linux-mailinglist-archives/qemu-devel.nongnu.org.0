Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BD53BE85F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 14:51:45 +0200 (CEST)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m171k-0000Ou-4Y
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 08:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vashirov@redhat.com>)
 id 1m15Pc-0000bw-RD
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:08:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vashirov@redhat.com>)
 id 1m15Pb-0003wg-9u
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625656093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NAUUwTVkGfKI3yl2RsTlRev3vnZfIw9bfJ0gg/nD+EM=;
 b=SZ1JnI6XNq7Sq/KEaiyHT84wHzLOONnmIxWkF+6Jsm09CKW/UrJujEy8XC4sPrr9+ZpvVK
 PtaedcME883aHYLPottwm2xsuaYq5Q2i2yllMkAxti6msKiOXIIvxonfu9qlH/6qXtudAA
 HgmB536QWKs8cTVjA+N+4UdQyWUs51w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-33mW_yQKNeSJcmG-d8wQiA-1; Wed, 07 Jul 2021 07:08:12 -0400
X-MC-Unique: 33mW_yQKNeSJcmG-d8wQiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11468100B3AC
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 11:08:11 +0000 (UTC)
Received: from redhat.com (unknown [10.40.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8586560C9F
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 11:08:10 +0000 (UTC)
Date: Wed, 7 Jul 2021 13:08:07 +0200
From: Viktor Ashirov <vashirov@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] tcg: Move tb_phys_invalidate_count to tb_ctx (#457)
Message-ID: <YOWLFwE+C7P8w4Da@redhat.com>
References: <20210707035532.421820-1-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210707035532.421820-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vashirov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vashirov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 07 Jul 2021 08:49:00 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 06, 2021 at 08:55:32PM -0700, Richard Henderson wrote:
> We can call do_tb_phys_invalidate from an iocontext, which has
> no per-thread tcg_ctx.  Move this to tb_ctx, which is global.
> The actual update still takes place with a lock held, so only
> an atomic set is required, not an atomic increment.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/457
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Viktor Ashirov <vashirov@redhat.com>


