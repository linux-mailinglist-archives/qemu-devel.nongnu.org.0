Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8C6B2C63
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 18:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paKRC-0001zm-3U; Thu, 09 Mar 2023 12:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1paKRA-0001zM-P5
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 12:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1paKR9-0002ti-Fw
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 12:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678384339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6/Qz1ogbgU4t8mNleTskqLGPfH7xLgwRjtyVh5OsODU=;
 b=KzeKVFGP9x1nxxfWmGzrizuRA0XetXw1RtbpZ21XNBiHfW3tdaaKvLPBwhjCOl2MoMjWp7
 Gihkq+fc5wSHnUA0ttpCtjuMfKe8uOAPIhLvZSLM0KvEi90jYGh5xgdKjPRaLIzA6c8xcD
 xwwE5bXi11NxVkP0xkq4DZHnqd+mq3c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-6ES4y3YYPCCDk82kLXRHGQ-1; Thu, 09 Mar 2023 12:52:15 -0500
X-MC-Unique: 6ES4y3YYPCCDk82kLXRHGQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 561BF3C0D869;
 Thu,  9 Mar 2023 17:52:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.237])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8147140CF8ED;
 Thu,  9 Mar 2023 17:52:14 +0000 (UTC)
Date: Thu, 9 Mar 2023 18:52:13 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, pbonzini@redhat.com
Subject: Re: [PATCH] qed: remove spurious BDRV_POLL_WHILE()
Message-ID: <ZAoczYP8a2tN/Vzw@redhat.com>
References: <20230309163134.398707-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309163134.398707-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.03.2023 um 17:31 hat Stefan Hajnoczi geschrieben:
> This looks like a copy-paste or merge error. BDRV_POLL_WHILE() is
> already called above. It's not needed in the qemu_in_coroutine() case.
> 
> Fixes: 9fb4dfc570ce ("qed: make bdrv_qed_do_open a coroutine_fn")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks, applied to the block branch.

Kevin


