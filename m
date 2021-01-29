Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF86308C0A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:59:53 +0100 (CET)
Received: from localhost ([::1]:59962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Y3k-0003wt-CV
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l5Y2O-00032S-5P
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:58:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l5Y2L-00010L-IB
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:58:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611943104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIgP+LAmQmgg/HGy//NZEK2rBvKJXxkmOQ39wMYOYfM=;
 b=e4MFo2/neP+xpVTe09PbglZLD8Tecf+cKq+ud5Y+/LhxvTkSC9ydETNp0jV4AaqVsl/m1Q
 eBNGoHbtB1zKvpI3I1odGgflRa8py7WB8S9NsjeZrmj8tuAhwCk8RbLgdRJnxh56LloVUE
 UXhIXdbAgyNkNG8H2LWe6EBiiQw5XIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-Ge97tMpHNo-0qr_HsOQ0Fg-1; Fri, 29 Jan 2021 12:58:22 -0500
X-MC-Unique: Ge97tMpHNo-0qr_HsOQ0Fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B3D5180A09E;
 Fri, 29 Jan 2021 17:58:21 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09C4A1945C;
 Fri, 29 Jan 2021 17:58:19 +0000 (UTC)
Subject: Re: [PATCH] iotests/testrunner: fix recognition of python tests
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210129090616.84145-1-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a7bd5ab5-e1eb-9612-1945-f2e861b26e3b@redhat.com>
Date: Fri, 29 Jan 2021 12:58:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129090616.84145-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 4:06 AM, Vladimir Sementsov-Ogievskiy wrote:
> We should drop final '\n' before comparing with python3 shebang.
> 
> Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reviewed-by: John Snow <jsnow@redhat.com>

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
> 


