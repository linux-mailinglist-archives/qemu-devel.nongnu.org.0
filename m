Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85950A937
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:31:07 +0200 (CEST)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcW8-0004WO-Fd
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhcTH-0002h2-I2
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nhcTE-0004zy-3M
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650569282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uj+7d9XEljzGQbXouBcltp54wvB5fj4qGeqR1hM9fck=;
 b=F6xg94L6+oyHarlJxmZO7E7RPPxoZUQX5mKmWUvYOOWixEWG+c5ZM1ylHfhETKpIzknPc3
 9TZzZWZEewLdnRgertJ71UA79m0JccEBiRNtoLghmpte7+YztadqqQazQSKt9iYYHg1dzz
 5FljzG/hH78vGDROA3tzBCkTAq6yQRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-CTo9SB2FMJyG1of6Cnu4tA-1; Thu, 21 Apr 2022 15:27:58 -0400
X-MC-Unique: CTo9SB2FMJyG1of6Cnu4tA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C78AD18812C0;
 Thu, 21 Apr 2022 19:27:57 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57CB840B42BB;
 Thu, 21 Apr 2022 19:27:57 +0000 (UTC)
Date: Thu, 21 Apr 2022 14:27:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Dirk =?utf-8?Q?M=C3=BCller?= <dmueller@suse.de>
Subject: Re: [PATCH v2] Only advertise aio=io_uring if support is actually
 available
Message-ID: <20220421192755.eksb7rfapjsw7qmb@redhat.com>
References: <20220421165048.12608-1-dmueller@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220421165048.12608-1-dmueller@suse.de>
User-Agent: NeoMutt/20211029-35-db88c3
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 21, 2022 at 06:50:48PM +0200, Dirk Müller wrote:
> Change --help output for aio option to only list the aio backend options that
> are actually available. io_uring is an optional, linux only backend
> option so hide it for cases where it isn't there.

As pointed out by Dan, this commit message is not quite accurate.  It
hides only one of the two conditional options, but 'native' is also a
Linux-only optional backend (CONFIG_LINUX_AIO).

> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Dirk Müller <dmueller@suse.de>
> ---
>  block/file-posix.c | 4 ++++
>  qemu-nbd.c         | 4 ++++
>  qemu-options.hx    | 6 +++++-
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


