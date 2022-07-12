Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB4571203
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 07:54:20 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB8qh-0000Yd-8U
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 01:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oB8kU-00078S-BC
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 01:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oB8kR-0008Ht-B3
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 01:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657604868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MVc+wPCpeS6fZMKqOF/EkfYdYrqILw11YjDnX6xQ0E0=;
 b=I9Lp/BwIf//Ed/r5CLytuMuE9RoLJmqKpLWsI7sI9D8c4Ez0dlb7/c0iPoygmrp3IjPp2a
 NcZGJ+wjTYWYVSnW+X3mD96zcpIHS+ZGUz2GB/vH0Ji6w7Fxo3EtmplGU2l7Vc5pUnfFMB
 9c1U6FdQF5zKZgEdzZW6RXDUqFzKX2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-a8Usd239NzekVkcGwmVjjQ-1; Tue, 12 Jul 2022 01:47:46 -0400
X-MC-Unique: a8Usd239NzekVkcGwmVjjQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE49A8032F0;
 Tue, 12 Jul 2022 05:47:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A948492C3B;
 Tue, 12 Jul 2022 05:47:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2FF1621E690D; Tue, 12 Jul 2022 07:47:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org,  damien.lemoal@opensource.wdc.com,
 dmitry.fomichev@wdc.com,  Stefan Hajnoczi <stefanha@redhat.com>,  Hanna
 Reitz <hreitz@redhat.com>,  qemu-block@nongnu.org,  Eric Blake
 <eblake@redhat.com>,  Kevin Wolf <kwolf@redhat.com>,  Fam Zheng
 <fam@euphon.net>,  hare@suse.de
Subject: Re: [RFC v4 0/9] Add support for zoned device
References: <20220712021345.8530-1-faithilikerun@gmail.com>
Date: Tue, 12 Jul 2022 07:47:44 +0200
In-Reply-To: <20220712021345.8530-1-faithilikerun@gmail.com> (Sam Li's message
 of "Tue, 12 Jul 2022 10:13:36 +0800")
Message-ID: <87pmiaubjz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sam Li <faithilikerun@gmail.com> writes:

> This patch series adds support for zoned device to virtio-blk emulation. Zoned
> Storage can support sequential writes, which reduces write amplification in SSD,
> leading to higher write throughput and increased capacity.

Forgive me if this has already been discussed, or is explained deeper in
the patch series...

The commit message sounds like you're extending virtio-blk to optionally
emulate zoned storage.  Correct?

PATCH 1 adds a new block block device driver 'zoned_host_device', and
PATCH 9 exposes it in QAPI.  This is for passing through a zoned host
device, correct?


