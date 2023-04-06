Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0C76D9BD6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:08:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRDP-0008MS-3u; Thu, 06 Apr 2023 11:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pkRDM-0008MH-Ol
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pkRDK-0000d1-Pk
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680793666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzzcOOkb3MNnlYmEbvXxaqJBZSrFNKDCc5AfkvsrKhw=;
 b=fZ8EX1YQk/t9sLtPF+Eo+7JGhZMccR3oULwxNjCa1KB8Z3dnGS/U6Bh6NmpWdAIUo1+JB0
 hJYHPRfNlGVighw/UNnYKljTT7Xu1G2rBY3xhBTrlZ91CbPPhmSwCbF9+TVwQHg9XIK4iB
 cruq+3CiQwqHA82PCbvjwDC/Kx7tEJE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-2ilzeT75MRaY9iHRdBQf-Q-1; Thu, 06 Apr 2023 11:07:42 -0400
X-MC-Unique: 2ilzeT75MRaY9iHRdBQf-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DAE93C18343;
 Thu,  6 Apr 2023 15:07:42 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35281C158BA;
 Thu,  6 Apr 2023 15:07:42 +0000 (UTC)
Date: Thu, 6 Apr 2023 10:07:40 -0500
From: Eric Blake <eblake@redhat.com>
To: =?utf-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Florian Westphal <fw@strlen.de>, 
 Kevin Wolf <kwolf@redhat.com>
Subject: Re: qemu-nbd performance regression in bd2cd4a4
Message-ID: <pnfyjo4jqh2xl2y2n3tk3pk44u7agxmbopd2bm5cf5wuxveyge@ise6yazqzt4l>
References: <3ffec0e7-7a4e-f31f-9a80-43eff755d72b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ffec0e7-7a4e-f31f-9a80-43eff755d72b@redhat.com>
User-Agent: NeoMutt/20230322
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

On Thu, Apr 06, 2023 at 12:55:38PM +0200, Lukáš Doktor wrote:
> Hello Florian, folks,
> 
> my CI caught ~5% regression (in 60s runs, when using 240s it was about 10%) in qemu-nbd performance bisected multiple-times up to bd2cd4a441ded163b62371790876f28a9b834317 in fio when using 4k blocks read. Note that other scenarios (reads using 1024k blocks, writes using 4 nor 1024k blocks) were not affected. Is this expected?

Large operations (1024k blocks) are dominated by the transaction
itself, and not the network overhead.  Small operations (4k reads)
used to benefit from TCP batching (introduces latency, but less
network overhead), but we intentionally started corking things
(decreases latency, but now the network is prone to send smaller
packets which means more network overhead).  So a slight decrease in
performance for only small size traffic is not surprising.  I'm not
sure if anything can be done about it in the short term, because the
benefits in the other direction (magnitude order of improvement for
TLS traffic) by being transactional instead of batching outweigh the
network overhead of small transactions, and most clients are going to
do more than just minimum-size reads.

However, commit bd2cd4a44 does mention a potential future optimization
of not uncorking if there is an easy way to detect if another reply in
the queue will be sent shortly.  Also, distinct actions for corking
and uncorking costs extra system calls; it may be possible to utilize
MSG_MORE on the existing data syscall paths instead of having to
separately cork/uncork, which in turn could still mark message
transaction boundaries with less overhead.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


