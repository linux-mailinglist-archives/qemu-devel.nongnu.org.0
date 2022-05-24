Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E129B532A67
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:32:05 +0200 (CEST)
Received: from localhost ([::1]:36384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntThk-0005mh-E9
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntTcD-0002iH-Ie
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:26:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ntTcA-0001ha-CJ
 for qemu-devel@nongnu.org; Tue, 24 May 2022 08:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653395177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WgisZKXd9JwAzL20URz5fflHep/HD6t9N/oQ2zY6TWg=;
 b=Jdu+yw0P+cONdU47MmMhoh+1u0nnETvYUP4qf+KgVewsfMGI+IdDsKnm6MywvbNmkluDCQ
 xNoHl+/lWacGnIwsuNywxRrFKBm37SbSklV4i1tOJcHuUUwVNchRGVbLvBNXdHkdDLNaI+
 Js3nSSDnEzht4D8isbdj9p4K75Ygovg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-3ZElDQ87PqaiWX0E_7gjAw-1; Tue, 24 May 2022 08:26:13 -0400
X-MC-Unique: 3ZElDQ87PqaiWX0E_7gjAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AD85811E83;
 Tue, 24 May 2022 12:26:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DEFA4C27E8A;
 Tue, 24 May 2022 12:26:11 +0000 (UTC)
Date: Tue, 24 May 2022 14:26:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Alberto Faria <afaria@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] block: drop unused bdrv_co_drain() API
Message-ID: <YozO4ORJF3UAIBM3@redhat.com>
References: <20220521122714.3837731-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521122714.3837731-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 21.05.2022 um 14:27 hat Stefan Hajnoczi geschrieben:
> bdrv_co_drain() has not been used since commit 9a0cec664eef ("mirror:
> use bdrv_drained_begin/bdrv_drained_end") in 2016. Remove it so there
> are fewer drain scenarios to worry about.
> 
> Use bdrv_drained_begin()/bdrv_drained_end() instead. They are "mixed"
> functions that can be called from coroutine context. Unlike
> bdrv_co_drain(), these functions provide control of the length of the
> drained section, which is usually the right thing.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, applied to the block branch.

Kevin


