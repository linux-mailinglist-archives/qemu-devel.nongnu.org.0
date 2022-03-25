Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E464E6C0D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 02:34:44 +0100 (CET)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXYqh-0005ip-Jt
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 21:34:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXYpS-0004uX-6j
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 21:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nXYpP-0004aN-CN
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 21:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648172001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gV3qYGUuAONjDan5xqtXdyN2RVcv7jBUCYtbHF1vOWU=;
 b=Yj4bPsPRQIM+VFjXVAe/7+8WJnJO0CI9qwxIXRFgITlMzk9nVX998jCkOiTz+GD9vJMQkO
 1IgQ+hv+SsknosI6G5ukqcFaL0UMSYVBOiTdgNUNbWuohQvd8heqityck3FWu06emHJ1KA
 r0ynmcqbB6f8XfensMVlk1+go+A77c0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-c300APfWNE69TCoLmpnfnA-1; Thu, 24 Mar 2022 21:33:18 -0400
X-MC-Unique: c300APfWNE69TCoLmpnfnA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24DF485A5A8;
 Fri, 25 Mar 2022 01:33:18 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90BBA4010A3C;
 Fri, 25 Mar 2022 01:33:17 +0000 (UTC)
Date: Thu, 24 Mar 2022 20:33:15 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 05/17] iotests/040: Fix TestCommitWithFilters test
Message-ID: <20220325013315.draawyxysnfmgejr@redhat.com>
References: <20220324183018.2476551-1-jsnow@redhat.com>
 <20220324183018.2476551-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220324183018.2476551-6-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-512-43304b
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 02:30:06PM -0400, John Snow wrote:
> Without this change, asserting that qemu_io always returns 0 causes this
> test to fail in a way we happened not to be catching previously:
> 
>  qemu.utils.VerboseProcessError: Command
>   '('/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/../../qemu-io',
>   '--cache', 'writeback', '--aio', 'threads', '-f', 'qcow2', '-c',
>   'read -P 4 3M 1M',
>   '/home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img')'
>   returned non-zero exit status 1.
>   ┏━ output ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
>   ┃ qemu-io: can't open device
>   ┃ /home/jsnow/src/qemu/bin/git/tests/qemu-iotests/scratch/3.img:
>   ┃ Could not open backing file: Could not open backing file: Throttle
>   ┃ group 'tg' does not exist
>   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
> 
> Explicitly provide the backing file so that opening the file outside of
> QEMU (Where we will not have throttle groups) will succeed.
> 
> [Patch entirely written by Hanna but I don't have her S-o-B]

Yeah, you'll want that.

> [My commit message is probably also garbage, sorry]

No, it was actually decent.

> [Feel free to suggest a better one]
> [I hope your day is going well]
> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

So giving your S-o-b twice makes up for it, right ;)

Well, you did say v3 would fix this.  But while you're having fun
fixing it, you can add:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


