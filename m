Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767EC5E7D1E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 16:32:42 +0200 (CEST)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1objjM-0001mD-NB
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 10:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1objfG-0008T2-5g
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:28:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1objfB-00031J-Kf
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663943300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+q+6CUAHTLCWAE6RxURz3B2yVNjv9uGqyp/1OLGnPSQ=;
 b=W/s5wRrSFCRRO1+O79XfL/ZzEW6dF0cefif1XtkOVzN7bjTdOkZpuRWcXK7rgOyFkZY/1s
 glQE9vkw7vulA88xEfZm6Hhdi7EnrfvZI2zYDUw2hIaZUgBG28MBshgH2myZ2pryeqId/W
 IonmBjIr3ANqluA3Xjah1TN//TFSHiI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-rVmqBf8CN3e5eERVbRHGlA-1; Fri, 23 Sep 2022 10:28:17 -0400
X-MC-Unique: rVmqBf8CN3e5eERVbRHGlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D6F1185A78B;
 Fri, 23 Sep 2022 14:28:17 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B4DF2166B2A;
 Fri, 23 Sep 2022 14:28:16 +0000 (UTC)
Date: Fri, 23 Sep 2022 16:28:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block: unmap (discard) blocks only if discard_zeros flag
 is true
Message-ID: <Yy3Cfovcpq3OrOP1@redhat.com>
References: <20220923100224.537-1-luzhipeng@cestc.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923100224.537-1-luzhipeng@cestc.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.09.2022 um 12:02 hat luzhipeng geschrieben:
> From: lu zhipeng <luzhipeng@cestc.cn>
> 
> we can unmap(discard) blocks for block devices of supporting discard zeros
> or regular file.
> 
> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>

This more or less restores the state before commit 34fa110e. The commit
message there explains that s->discard_zeroes is unreliable (in
particular, it is false on block devices on recent kernels even though
they may support zeroing by discard just fine).

We should instead remove s->discard_zeroes because it is currently
unused. I'll send a patch.

Kevin


