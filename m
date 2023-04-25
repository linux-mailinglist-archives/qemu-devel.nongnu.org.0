Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4C66EE1A5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:10:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prHUZ-00017e-Kk; Tue, 25 Apr 2023 08:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prHUW-00016J-3I
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:09:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prHUT-0001m8-68
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 08:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682424587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39D8AlVCnf+P9VC2FR2RaP/bkeMrF9UP8PtmZLKljsQ=;
 b=D0+TZ+S+lrqG0L1OTVFe2Zxx/Z1JpR2m52dudhSxo5KrefkJQ3vf/OCoPaGatQF7amP8Xa
 rF29tIJ8STJ63h5HljlmkmknnvgAwbIRsLqR3a2nwwShTDr2/C7VmmRGNStrf4NCVIVvCY
 uCkmhhMW1S9DZr0WMZVgaAiR1w7gI7Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-gTUXeWYbPYWrkXT8gbtA5Q-1; Tue, 25 Apr 2023 08:09:44 -0400
X-MC-Unique: gTUXeWYbPYWrkXT8gbtA5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12338101A555;
 Tue, 25 Apr 2023 12:09:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC16440C6E67;
 Tue, 25 Apr 2023 12:09:42 +0000 (UTC)
Date: Tue, 25 Apr 2023 14:09:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: wangliangzz@126.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org,
 hreitz@redhat.com, eesposit@redhat.com, Wang Liang <wangliangzz@inspur.com>
Subject: Re: [PATCH v2] block/monitor/block-hmp-cmds.c: Fix crash when
 execute hmp_commit
Message-ID: <ZEfDBdRE1bxK/L+o@redhat.com>
References: <20230424103902.45265-1-wangliangzz@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424103902.45265-1-wangliangzz@126.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Am 24.04.2023 um 12:39 hat wangliangzz@126.com geschrieben:
> From: Wang Liang <wangliangzz@inspur.com>
> 
> hmp_commit() calls blk_is_available() from a non-coroutine context (and in
> the main loop). blk_is_available() is a co_wrapper_mixed_bdrv_rdlock
> function, and in the non-coroutine context it calls AIO_WAIT_WHILE(),
> which crashes if the aio_context lock is not taken before.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1615
> Signed-off-by: Wang Liang <wangliangzz@inspur.com>

Thanks, applied to the block branch.

Kevin


