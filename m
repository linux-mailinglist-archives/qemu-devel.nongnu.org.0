Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565DC30878F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:49:05 +0100 (CET)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5QOm-0002UW-ES
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5QLC-0008BI-Mj
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:45:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5QL9-00088p-6P
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611913518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xdnp3aRvVqPsjiEOpSq1buI9IzLu6eawUX42xdUnkjU=;
 b=Hd1lM/IvH3L8UjRYvd6G8HZOXIa8bZQeV8jLlyt7KDZ+msWR09Conet4seOKCzz7AWupDi
 mkfL8GsiGJe3IsHKGTeixppR+Hzp+AuyEaG9mt6jg4bTIxxe/NZY+JF0YCZBpjDhAI5pqw
 BVC8ydjHzh4wcrCphwC4FRlPd4KlkOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-IGfBM3BMM8GxP2i7jjosCg-1; Fri, 29 Jan 2021 04:45:16 -0500
X-MC-Unique: IGfBM3BMM8GxP2i7jjosCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 305B5801A9D;
 Fri, 29 Jan 2021 09:45:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 824D462686;
 Fri, 29 Jan 2021 09:45:13 +0000 (UTC)
Subject: Re: [PATCH] iotests/testrunner: fix recognition of python tests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129090616.84145-1-vsementsov@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <feed1001-7c44-e073-627c-c42289c05c41@redhat.com>
Date: Fri, 29 Jan 2021 10:45:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129090616.84145-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/2021 10.06, Vladimir Sementsov-Ogievskiy wrote:
> We should drop final '\n' before comparing with python3 shebang.
> 
> Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/testrunner.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index a581be6a29..24b3fba115 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -248,7 +248,7 @@ class TestRunner(ContextManager['TestRunner']):
>   
>           with f_test.open(encoding="utf-8") as f:
>               try:
> -                if f.readline() == '#!/usr/bin/env python3':
> +                if f.readline().rstrip() == '#!/usr/bin/env python3':
>                       args.insert(0, self.env.python)
>               except UnicodeDecodeError:  # binary test? for future.
>                   pass

Together with your other patch, this fixes "make vm-build-netbsd" for me, 
thanks!

Tested-by: Thomas Huth <thuth@redhat.com>


