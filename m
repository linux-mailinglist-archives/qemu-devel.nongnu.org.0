Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5486F5ED9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 21:05:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puHmd-00065a-6B; Wed, 03 May 2023 15:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puHmV-000658-PZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 15:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1puHmU-0005Re-EK
 for qemu-devel@nongnu.org; Wed, 03 May 2023 15:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683140689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c+T4YUa9po7jnXwumNuSbcnkg2LKqa1eL2u9hofRk/A=;
 b=TXXmfkKznojRgX50f4PEKOT06wVHgyLzq7eHI5pWuzr5M76Kzga60kdmeaq18eYFtIdKaX
 OUtIEHf8lPan/CHEz3LOfItV1P35msWaFmDySJOsPat3iARaMQmEM1+F47SZP7HaRckOCO
 JsQnyN9L95W2Q0KjsyFYuAO2h1tI+rc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-qPkv4s-RNse_SElQxdVuVw-1; Wed, 03 May 2023 15:04:45 -0400
X-MC-Unique: qPkv4s-RNse_SElQxdVuVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80070800B35;
 Wed,  3 May 2023 19:04:45 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7894085720;
 Wed,  3 May 2023 19:04:44 +0000 (UTC)
Date: Wed, 3 May 2023 14:04:42 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, hreitz@redhat.com, vsementsov@virtuozzo.com, 
 nikita.lapshin@virtuozzo.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] iotests/nbd-reconnect-on-open: Fix NBD socket path
Message-ID: <2tyrn6emab7dqt2atqmamrgqscumnktlrzqxq4ewnad36fwu5c@oszw5zoqzwcn>
References: <20230503165019.8867-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503165019.8867-1-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, May 03, 2023 at 06:50:19PM +0200, Kevin Wolf wrote:
> Socket paths need to be short to avoid failures. This is why there is a
> iotests.sock_dir (defaulting to /tmp) separate from the disk image base
> directory.
> 
> Make use of it to fix failures in too deeply nested test directories.
> 
> Fixes: ab7f7e67a7e7b49964109501dfcde4ec29bae60e
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/tests/nbd-reconnect-on-open     | 3 ++-
>  tests/qemu-iotests/tests/nbd-reconnect-on-open.out | 4 ++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

Just barely missed today's NBD pull request; I'll queue it for my next
one, or it can go in through your block tree if you beat me to it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


