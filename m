Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB45379E3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:29:30 +0200 (CEST)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdaS-0007fX-TP
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nvdSs-0004m7-Fa
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nvdSp-00007p-Rm
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653909695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zj3ZkiP5ytmwUgaA2lgK7WJSeIsF7uLjKFY0siRpgCs=;
 b=G83Qit4clTrRStOh6Qp2ZWplVYl41zrOTezVvveQLd6cEyx3KchOLNm0zmCLkC3nj+jbr6
 8Sh6ZU5sS3JUCbV8gxjPuvTRgyZ6bi84ARhEmvdD1JNByIpMKPEdmkPqYhfhyD6Zb8VCkf
 rtkNHhG/lw771c8XF9VViOKbkZkDCb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-bLi1NUEFPguhqbKvVzX9Ng-1; Mon, 30 May 2022 07:21:29 -0400
X-MC-Unique: bLi1NUEFPguhqbKvVzX9Ng-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBA5680A0AD;
 Mon, 30 May 2022 11:21:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94E57492C3B;
 Mon, 30 May 2022 11:21:27 +0000 (UTC)
Date: Mon, 30 May 2022 13:21:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Lieven <pl@kamp.de>,
 Ilya Dryomov <idryomov@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Tingting Mao <timao@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v2] block/rbd: report a better error when namespace does
 not exist
Message-ID: <YpSotiJdS6MEwwyT@redhat.com>
References: <20220517071012.6120-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517071012.6120-1-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.05.2022 um 09:10 hat Stefano Garzarella geschrieben:
> If the namespace does not exist, rbd_create() fails with -ENOENT and
> QEMU reports a generic "error rbd create: No such file or directory":
> 
>     $ qemu-img create rbd:rbd/namespace/image 1M
>     Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
>     qemu-img: rbd:rbd/namespace/image: error rbd create: No such file or directory
> 
> Unfortunately rados_ioctx_set_namespace() does not fail if the namespace
> does not exist, so let's use rbd_namespace_exists() in qemu_rbd_connect()
> to check if the namespace exists, reporting a more understandable error:
> 
>     $ qemu-img create rbd:rbd/namespace/image 1M
>     Formatting 'rbd:rbd/namespace/image', fmt=raw size=1048576
>     qemu-img: rbd:rbd/namespace/image: namespace 'namespace' does not exist
> 
> Reported-by: Tingting Mao <timao@redhat.com>
> Reviewed-by: Ilya Dryomov <idryomov@gmail.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks, applied to the block branch.

Kevin


