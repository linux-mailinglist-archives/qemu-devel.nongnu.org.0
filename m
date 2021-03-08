Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB52330821
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:34:16 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9T4-0006fr-W8
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:34:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9Qf-00069g-9W
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:31:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJ9Qb-0001CJ-Nb
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615185100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hBnN/VaFlQVU9Dms6PZ5pc1Hbldf0xoTAJd5aWNOfKk=;
 b=BoOUWYLJe8OWZ6wseYNWRjTDmMAo5AgZuIPzwtK5BRenWV/0GhzOv2lRC9uCS33iy/pz9V
 RqLo9bmH5xPa/6TMTQDB4oh6QvfLIWk428h0DInJTnxUg3+tA2mA+MspflgAqz0IsIDtME
 bYK1EP8J3p3fbG/wNM1CSxe8cNU3jpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-ZkkwxpVlMbazDcuJ9SN7hg-1; Mon, 08 Mar 2021 01:31:38 -0500
X-MC-Unique: ZkkwxpVlMbazDcuJ9SN7hg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 668D4804331
 for <qemu-devel@nongnu.org>; Mon,  8 Mar 2021 06:31:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-143.ams2.redhat.com [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6A360C04;
 Mon,  8 Mar 2021 06:31:26 +0000 (UTC)
Subject: Re: [PATCH 1/3] tests/qtest/vhost-user-test: use share=on with memfd
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210222161017.570837-1-stefanha@redhat.com>
 <20210222161017.570837-2-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ed164725-4437-ca63-42f7-aecee0b71de8@redhat.com>
Date: Mon, 8 Mar 2021 07:31:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210222161017.570837-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/02/2021 17.10, Stefan Hajnoczi wrote:
> For some reason memfd never used share=on. vhost-user relies on
> mmap(MAP_SHARED) so this seems like a problem, but the tests still run
> without it.
> 
> Add share=on for consistency and to prevent future bugs in the test.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   tests/qtest/vhost-user-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index 1a5f5313ff..2db98c4920 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -40,7 +40,7 @@
>   #define QEMU_CMD_MEM    " -m %d -object memory-backend-file,id=mem,size=%dM," \
>                           "mem-path=%s,share=on -numa node,memdev=mem"
>   #define QEMU_CMD_MEMFD  " -m %d -object memory-backend-memfd,id=mem,size=%dM," \
> -                        " -numa node,memdev=mem"
> +                        "share=on -numa node,memdev=mem"

Even if it's not required, it seems to be a good clean up, also with regards 
to the lonely comma at the end of the previous line.

Acked-by: Thomas Huth <thuth@redhat.com>

I assume this will go through the vhost tree, or do you want me to take this 
single patch through my qtest tree?


