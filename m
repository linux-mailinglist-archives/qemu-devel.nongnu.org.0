Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F925F5909
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 19:22:24 +0200 (CEST)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og868-0007sZ-55
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 13:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1og7Ld-00020I-HK
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1og7La-0006jG-4E
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 12:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664987653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b59QQpJUPlwf817yMiGws2E2OALQbdGD1MLLBiTKTWQ=;
 b=fvKXNCnx4xHzC5peWNbPnv3wq3EwVNO8boewzOwheUsKWbYqtG0VrvDRXmlIQAnYF/57ez
 wSvWRsG+6rYA81iuUo+5vshj/KqstgwyjYbDAfAdLTLoHmh5A2KvqYcAAayU2XSO5+VHX5
 3geENqd3E59QyFaI4LhfM7LEo1AX12M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-71s7AFUdM7qZwUAOjeYGZg-1; Wed, 05 Oct 2022 12:34:11 -0400
X-MC-Unique: 71s7AFUdM7qZwUAOjeYGZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8115485A583;
 Wed,  5 Oct 2022 16:34:11 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFCF240B40C7;
 Wed,  5 Oct 2022 16:34:10 +0000 (UTC)
Date: Wed, 5 Oct 2022 18:34:09 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] coroutine: Make qemu_coroutine_self() return NULL if not
 in coroutine
Message-ID: <Yz2yAWVMUrkaCNYY@redhat.com>
References: <20221005142006.926013-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005142006.926013-1-afaria@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 05.10.2022 um 16:20 hat Alberto Faria geschrieben:
> qemu_coroutine_self() is used in several places outside of coroutine
> context (mostly in qcow2 tracing calls).
> 
> Ensure qemu_coroutine_self() works properly when not called from
> coroutine context, returning NULL in that case, and remove its
> coroutine_fn annotation.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

The coroutine_fn annotation for qemu_coroutine_self() is wrong, but I
think it already works outside of coroutine context, and consistently in
all three backends, by returning &leader.

Changing that to NULL makes me kind of nervous because the callers might
actually access the leader Coroutine object, and after this change they
would crash. (And even if they didn't crash, they wouldn't be able to
distinguish the leader coroutines of different threads any more.)

Do we have an actual reason to make this chance? That is, do we have any
case that was broken before?

Kevin


