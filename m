Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97911A57E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 08:58:27 +0100 (CET)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iewt8-00018e-57
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 02:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iews2-0000dH-6x
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 02:57:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iews0-0007rf-JR
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 02:57:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20447
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iews0-0007pu-DY
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 02:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576051035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=FJm3k4SMDD4lvJ9bx+MGvrp8DJkjWpG0g/HGOiqVT+A=;
 b=VkHf/m4Oj/fBOxOIxwAQsj7Ijx6F8lXdAbeGKBIV7HIXSaf+Wu3cQ6L3sRn1oDF0waKDZL
 kA3v/f4Tth5uz62jaHXb6T73raU6yoS5VgCw652xni5wCvRhapSK9tFEPZpzCho4SsX9WB
 AXCiDFIeICrb1WvhP6HEoVOPx1rNyeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-3xzgCYDfO5688tMf0GXFDA-1; Wed, 11 Dec 2019 02:57:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D6CF800D4E;
 Wed, 11 Dec 2019 07:57:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-11.ams2.redhat.com [10.36.117.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3F5A5C1B0;
 Wed, 11 Dec 2019 07:57:09 +0000 (UTC)
Subject: Re: [PATCH] vhost-user-test: fix a memory leak
To: pannengyuan@huawei.com, lvivier@redhat.com, pbonzini@redhat.com
References: <1576025722-41720-1-git-send-email-pannengyuan@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <eb4d58d0-ac2e-e69d-0a04-87fd5fc14e6e@redhat.com>
Date: Wed, 11 Dec 2019 08:57:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1576025722-41720-1-git-send-email-pannengyuan@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 3xzgCYDfO5688tMf0GXFDA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi!

On 11/12/2019 01.55, pannengyuan@huawei.com wrote:
[...]
> diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
> index 91ea373..54be931 100644
> --- a/tests/vhost-user-test.c
> +++ b/tests/vhost-user-test.c
> @@ -717,6 +717,8 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
>      guint64 size;
>  
>      if (!wait_for_fds(s)) {
> +        g_free(uri);
> +        test_server_free(dest);
>          return;
>      }

Well spotted. But I'd prefer to rather move the allocation of these
resources after the if-statement instead of doing the allocation at the
declaration of the variables already. Or maybe use a "goto out" and jump
to the end of the function instead? ... whatever you prefer, but
duplicating the "free" functions sounds like a cumbersome solution to me.

 Thanks,
  Thomas


