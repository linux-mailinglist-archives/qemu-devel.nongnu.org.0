Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2660FF33
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:17:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6Ti-00085J-PJ; Thu, 27 Oct 2022 13:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo6TY-0005xZ-SX
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo6TX-0006lO-9U
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666890926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PbYxlCTDtjSRtNQGqY19JMLqkbj5vMJ87uhqvu0N4D8=;
 b=N4PmKuZAcA2R+hZK5gxIAMG9XvAy7h0pXmtNHlHOux2Vdl6a1l33ZFThNUIuINljgN3wLy
 GG/XEhcK1GANFn0p2M92g/JeDK6NbJMlhzWgFuRkl871e4J1okOLPYfl8VU2pw5JlFEzQx
 wuPZAZ7fuY9mwRtWNunFvitZBLpcqaw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-QxFwa_RLNRWzKQW-qiF80g-1; Thu, 27 Oct 2022 13:15:22 -0400
X-MC-Unique: QxFwa_RLNRWzKQW-qiF80g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEDAD85A59D;
 Thu, 27 Oct 2022 17:15:21 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2835BC15BA8;
 Thu, 27 Oct 2022 17:15:21 +0000 (UTC)
Date: Thu, 27 Oct 2022 19:15:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, afaria@redhat.com
Subject: Re: [PATCH 00/24] More coroutine_fn fixes
Message-ID: <Y1q8p4nBR81QYZGH@redhat.com>
References: <20221013123711.620631-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013123711.620631-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 13.10.2022 um 14:36 hat Paolo Bonzini geschrieben:
> Most of these were extracted from Alberto's static analysis series.
> After this series, the only errors reported by the analyzer are:
> 
> - a call to bs->drv->bdrv_co_drain_begin from bdrv_open_driver.  This
>   relies on bdrv_co_drain_begin not having to yield, which is indeed the
>   case right after opening but is iffy
> 
> - assigning coroutine_fn to non-coroutine_fn in the human monitor
>   for the two coroutine commands screendump and block_resize.

Thanks, fixed up coding style warnings in checkpatch and the mismerges
in patches 19 and 23, and applied to the block branch.

Kevin


