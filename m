Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70455E6756
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:42:19 +0200 (CEST)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOLC-0001No-6B
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obNoV-0001o8-0V
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1obNoT-0005C6-Fh
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:08:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663859308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A2j/EVkoBuIAU3n2Wupmc5t/C6S+ltyuPLWnsmQzx9M=;
 b=WXS3FPOgf5QjU+OUZ4kDXeFtHUkKwmN8nT5otz7xNxs0s6V+GiNjJeW4dIpLrP8IeNCTg1
 IkAmjWe8yOaO/jEmjf3Cq5vyrZPTOcOWmcCmX/KULHxxxhED7Vu5/sk7mHmLTkbHwlYCfQ
 vYhOB41C5T+oQ0RocuA0XUF2UOY51mU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-n9u1mILmMVm_i6pxvXCb2g-1; Thu, 22 Sep 2022 11:08:27 -0400
X-MC-Unique: n9u1mILmMVm_i6pxvXCb2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91D2C800B30;
 Thu, 22 Sep 2022 15:08:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 014B72166B2C;
 Thu, 22 Sep 2022 15:08:25 +0000 (UTC)
Date: Thu, 22 Sep 2022 17:08:24 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] qcow2: fix memory leak in qcow2_read_extensions
Message-ID: <Yyx6aB6MoQ1QWQbh@redhat.com>
References: <20220921144515.1166-1-luzhipeng@cestc.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921144515.1166-1-luzhipeng@cestc.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.09.2022 um 16:45 hat luzhipeng geschrieben:
> From: lu zhipeng <luzhipeng@cestc.cn>
> 
> Free feature_table if it is failed in bdrv_pread.
> 
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>

Thanks, applied to the block branch.

Kevin


