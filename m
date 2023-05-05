Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCFA6F8281
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:03:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puu9a-00085c-Sk; Fri, 05 May 2023 08:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puu9U-0007xx-A5
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:03:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1puu9R-0002Wy-SA
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683288185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bJmgY0356kdTnshh7dLASN2k0uzIurBCyyr2dPyT9q0=;
 b=JcG9lf+F4eX4x9AH/nyaZWtFkQr2yIQquRWevIcWZLtLwdg+J9dPlQNUiqPopmYPvsaSkp
 SCYNFGDBBDls/5XR/Oe7gBr0k/yrdGvkTdDD1efH9bpuqABnUlntiMcVqKF2ZiKGRAl2f4
 ckefiKYyEXnilY7QmbXU0xvYc4Aej28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-ToVTv_GUPQ29Ui-trGOGYg-1; Fri, 05 May 2023 08:03:02 -0400
X-MC-Unique: ToVTv_GUPQ29Ui-trGOGYg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFDFB1824604;
 Fri,  5 May 2023 12:03:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B973F492C3F;
 Fri,  5 May 2023 12:03:00 +0000 (UTC)
Date: Fri, 5 May 2023 14:02:59 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: stefanha@redhat.com, eblake@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [PATCH v2 04/20] block: Don't call no_coroutine_fns in
 qmp_block_resize()
Message-ID: <ZFTwcxUzQIrFybQV@redhat.com>
References: <20230504115750.54437-1-kwolf@redhat.com>
 <20230504115750.54437-5-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504115750.54437-5-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

Am 04.05.2023 um 13:57 hat Kevin Wolf geschrieben:
> This QMP handler runs in a coroutine, so it must use the corresponding
> no_co_wrappers instead.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

I just noticed that this actually fixes a reported hang in 8.0. So let's
add:

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2185688
Cc: qemu-stable@nongnu.org

Kevin


