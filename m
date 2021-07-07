Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5E3BE735
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 13:36:11 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15qd-0003KY-1x
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 07:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vashirov@redhat.com>)
 id 1m15pD-0002AE-7o
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vashirov@redhat.com>)
 id 1m15pA-0006S1-NN
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 07:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625657679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NAUUwTVkGfKI3yl2RsTlRev3vnZfIw9bfJ0gg/nD+EM=;
 b=KyUXuh10cSKqwyXEVUem6RMvGS7HJcl9jptM7c/aErp1lPAluaFZuK3wxS5F8/JasgGIAl
 Qlxny8JVXKc/3FPeKrEm9q65+onByX10Px3eGb7JP34o3AZLWDGaxX9E2lX+a1gkYeegcN
 OkSVMDlTUc/QmI+otehAhFIgkot06NA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-PdRpLTShNyGBfcptAyKmrQ-1; Wed, 07 Jul 2021 07:34:38 -0400
X-MC-Unique: PdRpLTShNyGBfcptAyKmrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A26A2100C660
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 11:34:37 +0000 (UTC)
Received: from redhat.com (unknown [10.40.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21D5310A33FA
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 11:34:36 +0000 (UTC)
Date: Wed, 7 Jul 2021 13:34:34 +0200
From: Viktor Ashirov <vashirov@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] tcg: Move tb_phys_invalidate_count to tb_ctx (#457)
Message-ID: <YOWRSqTLRDTIyAun@redhat.com>
References: <20210707035532.421820-1-richard.henderson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210707035532.421820-1-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vashirov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vashirov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


