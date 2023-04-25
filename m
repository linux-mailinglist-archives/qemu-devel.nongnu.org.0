Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4783F6EE970
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 23:12:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prPxV-000384-51; Tue, 25 Apr 2023 17:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prPxU-00037g-0H
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 17:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1prPxS-0001q4-Jr
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 17:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682457138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OxuQoVo7c4yKr65FCU2t/G64q4IWl8jUlgFDzFBuwrc=;
 b=HQBy1RbzccBD9TJpT4idetQORmn6tNJmml/6BdosESMa1Qe7jXNqPdFIfaADo2kloQjSKF
 ux2JJCwXqjFw5lxdHe/Fc9+INERoEaXy7crdlWNEeBKsXilXb8L3rTJ62FQQD/OYbb1tiI
 u+h6DyBE/vivcvAFMApAE9vbCJOjcwA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-WJPBRgSyPZOlAiNDoGyrqQ-1; Tue, 25 Apr 2023 17:12:14 -0400
X-MC-Unique: WJPBRgSyPZOlAiNDoGyrqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF6C6811E7C;
 Tue, 25 Apr 2023 21:12:13 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AD952166B3A;
 Tue, 25 Apr 2023 21:12:13 +0000 (UTC)
Date: Tue, 25 Apr 2023 16:12:11 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, stefanha@redhat.com, pbonzini@redhat.com, 
 eesposit@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 14/20] block: Mark bdrv_co_get_info() and callers
 GRAPH_RDLOCK
Message-ID: <adohqi5yiod23do5veho4ngxop3bk5yh3z7mhxu3eljcjcfhvv@wtt2wiwrhuvi>
References: <20230425173158.574203-1-kwolf@redhat.com>
 <20230425173158.574203-15-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230425173158.574203-15-kwolf@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Tue, Apr 25, 2023 at 07:31:52PM +0200, Kevin Wolf wrote:
> From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> This adds GRAPH_RDLOCK annotations to declare that callers of
> bdrv_co_get_info() need to hold a reader lock for the graph.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/block/block-io.h         |  7 +++++--
>  include/block/block_int-common.h |  4 ++--
>  block.c                          |  2 ++
>  block/crypto.c                   |  2 +-
>  block/io.c                       | 11 +++++------
>  block/mirror.c                   |  8 ++++++--
>  block/raw-format.c               |  2 +-
>  7 files changed, 22 insertions(+), 14 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


