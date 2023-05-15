Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1308702B23
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:10:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyW3y-0003mX-QD; Mon, 15 May 2023 07:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyW3k-0003lX-NZ
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:08:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pyW3j-0007rl-6r
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684148886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V9uunHdkIcrxkaU1Qm32hCojthWVMq6i/lWy7g4lK3U=;
 b=Dx8AVET2gEWZqWqxEkoyNxBJ6Zw+TIlvYCk2oKW5fDjPLWSbkwyBTfKeijIK+r96ewciGi
 L/6bInDH1xWOx5uJvrLR6nHNSqkKymIiAA811tw8tOC53UaWK/9R4VvLbIq4RziNzSwh2K
 3qmb/k5BAv2Nd+bCsPhjJVlyOqhlpV4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-No5pCQDONd2HGWz0gSxLVQ-1; Mon, 15 May 2023 07:08:02 -0400
X-MC-Unique: No5pCQDONd2HGWz0gSxLVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E23C3C0254E;
 Mon, 15 May 2023 11:08:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FFE363ABB;
 Mon, 15 May 2023 11:08:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1EEC621E681C; Mon, 15 May 2023 13:08:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,  kwolf@redhat.com,  eesposit@redhat.com,
 vsementsov@yandex-team.ru
Subject: Re: Question about QMP and BQL
References: <87h6sh2zug.fsf@suse.de>
Date: Mon, 15 May 2023 13:08:01 +0200
In-Reply-To: <87h6sh2zug.fsf@suse.de> (Fabiano Rosas's message of "Fri, 12 May
 2023 15:01:43 -0300")
Message-ID: <87y1lpyhri.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Kevin, any advice?

Fabiano Rosas <farosas@suse.de> writes:

> Is there a way to execute a long-standing QMP command outside of the
> BQL?
>
> The situation we're seeing is a slow query-block due to a slow system
> call (fstat over NFS) causing the main thread to spend too long
> holding the global mutex and locking up the vcpu thread when it goes
> out of the guest for MMIO.
>
> The call chain for QMP is:
>
> qmp_query_block
> bdrv_query_info
> bdrv_block_device_info
> bdrv_query_image_info
> bdrv_do_query_node_info
> bdrv_get_allocated_file_size
> bdrv_poll_co <- Waiting with qemu_global_mutex locked
>
> [coroutine] bdrv_co_get_allocated_file_size_entry
> bdrv_co_get_allocated_file_size
> raw_co_get_allocated_file_size
> fstat <- SLOW!
>
> The closest I got was moving the coroutine into a separate iothread,
> unlocking the global mutex and releasing the bdrv aio_context around
> aio_poll. It feels wrong though because we're technically still
> operating on the block state but not holding the context.
>
> Is there a more standard way if doing this? Is it possible at all?


