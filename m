Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B045177A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:29:59 +0100 (CET)
Received: from localhost ([::1]:51860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkU9-0005si-26
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:29:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmkTD-0005CG-Da
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmkTA-0001cv-PI
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637015330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8a58Jy/FLh5y4bWxb0zY7UAJ0bhjn9sg5jlk+OwKH8=;
 b=E9e5OLHzOUNZoOD94nE6C9YS+rN9xZGedtHSJq4/FjaOj1cq7dvSA7yxvl4HAexPJkTw7Y
 dBaetJgrCczQdhoEz6pX55MxSfjd5oCK+USfWQ1sIGclR++gHaGFeJuAC5aU+BqZ/uwpMN
 8UPgzvjI3zaIxhPp78xYE7BxN47zhRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-ZrCNG16dOaWUDm7eE95t-g-1; Mon, 15 Nov 2021 17:28:46 -0500
X-MC-Unique: ZrCNG16dOaWUDm7eE95t-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8FE1019982;
 Mon, 15 Nov 2021 22:28:45 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 353DD5C1A1;
 Mon, 15 Nov 2021 22:28:45 +0000 (UTC)
Date: Mon, 15 Nov 2021 16:28:43 -0600
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: "make check" fails in a clang sanitizer build on
 "nbd-qemu-allocation" iotest
Message-ID: <20211115222843.kvzun266pgav2zqo@redhat.com>
References: <CAFEAcA-8jo5SmV41CP6aquyWWvrQQo5OoXbac=knD4z6A3fHxw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-8jo5SmV41CP6aquyWWvrQQo5OoXbac=knD4z6A3fHxw@mail.gmail.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 15, 2021 at 05:11:54PM +0000, Peter Maydell wrote:
> Hi; running a 'make check' on a clang sanitizer build one of
> the iotests falls over due to a NULL pointer being passed to
> memset():
> 
> 
>   TEST   iotest-qcow2: nbd-qemu-allocation [fail]

> +../../nbd/server.c:1027:16: runtime error: null pointer passed as
> argument 1, which is declared to never be null

The code in question:

    if (client->opt == NBD_OPT_LIST_META_CONTEXT && !nb_queries) {
        /* enable all known contexts */
        meta->base_allocation = true;
        meta->allocation_depth = meta->exp->allocation_depth;
        memset(meta->bitmaps, 1, meta->exp->nr_export_bitmaps);

I suspect what is happening is that meta->bitmaps is NULL when
meta->exp->nr_export_bitmaps is 0. It's annoying that clang's
sanitizer whines even for a 0-length memset, but a strict reading of
POSIX says that we really are in the technically undefined behavior
when passing NULL (even with 0 length), so such whiny behavior is
permitted.  So I'll post a patch.

> 
> Does this look familiar ?

First I've heard of it; thanks for alerting me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


