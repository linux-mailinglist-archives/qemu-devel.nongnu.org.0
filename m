Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE566CA2B8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 13:45:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pglHr-0004X0-Da; Mon, 27 Mar 2023 07:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pglHg-0004WE-SD
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pglHe-0006uM-Md
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 07:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679917505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MdxuTfiEge2qhdm7VL00BR0pb4YGRhj0lDv3HU7Ux48=;
 b=OAcE+/bB7CcFS1pWD4CrX41bF6/6UMJX4Lz4HgFDvwQWMgYq3KyurlC6t4cnm6wquP9h8g
 NUHXMi73QKiqvOf4LspwXTmUWuLwq6aY+fxom5zyhe0+q4Fa/paRFsWmg/j6T8b6iVUdKa
 6oyQ35u2EneNHiMaH3ibISk2kPHdpqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-OeZWqPUeOUmyPAaznRl7Yg-1; Mon, 27 Mar 2023 07:45:02 -0400
X-MC-Unique: OeZWqPUeOUmyPAaznRl7Yg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90A98884342;
 Mon, 27 Mar 2023 11:45:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F4B7C15BA0;
 Mon, 27 Mar 2023 11:45:00 +0000 (UTC)
Date: Mon, 27 Mar 2023 13:44:59 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Florian Westphal <fw@strlen.de>
Cc: qemu-block@nongnu.org, eblake@redhat.com, vsementsov@yandex-team.ru,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] nbd/server: push pending frames after sending reply
Message-ID: <ZCGBu4ZVzecC0qJy@redhat.com>
References: <20230324104720.2498-1-fw@strlen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324104720.2498-1-fw@strlen.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 24.03.2023 um 11:47 hat Florian Westphal geschrieben:
> qemu-nbd doesn't set TCP_NODELAY on the tcp socket.
> 
> Kernel waits for more data and avoids transmission of small packets.
> Without TLS this is barely noticeable, but with TLS this really shows.
> 
> Booting a VM via qemu-nbd on localhost (with tls) takes more than
> 2 minutes on my system.  tcpdump shows frequent wait periods, where no
> packets get sent for a 40ms period.
> 
> Add explicit (un)corking when processing (and responding to) requests.
> "TCP_CORK, &zero" after earlier "CORK, &one" will flush pending data.
> 
> VM Boot time:
> main:    no tls:  23s, with tls: 2m45s
> patched: no tls:  14s, with tls: 15s
> 
> VM Boot time, qemu-nbd via network (same lan):
> main:    no tls:  18s, with tls: 1m50s
> patched: no tls:  17s, with tls: 18s
> 
> Future optimization: if we could detect if there is another pending
> request we could defer the uncork operation because more data would be
> appended.
> 
> Signed-off-by: Florian Westphal <fw@strlen.de>

Thanks, applied to the block branch.

Kevin


