Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9EB4E2A96
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 15:28:05 +0100 (CET)
Received: from localhost ([::1]:55862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJ0u-00089k-0m
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 10:28:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWIxl-0005hQ-21
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:24:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWIxi-0006C5-Ao
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647872684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AkGCkUk8PNujBdMm1eGZp8Mz0Js/byuq7aCgHUur4dQ=;
 b=GLvsPrtKyyaIUC0c+t+p8YnVoYUogmlC7aHLCUFY6n/Q1pKVhCQNReHJAir1JeHVBg05v6
 ENlvLjHLgYejGU+lyyYwcmYtxXeN9fy68yMcRWAroPYKOt6KzrB6IaPIJScuKed1a74xO6
 dN9uY2EuhIzV58n3JjQtFl49YrKBB2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-z6P0MUJdOH-KxfkCIMJjdA-1; Mon, 21 Mar 2022 10:24:41 -0400
X-MC-Unique: z6P0MUJdOH-KxfkCIMJjdA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6652680159B;
 Mon, 21 Mar 2022 14:24:41 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BE461121319;
 Mon, 21 Mar 2022 14:24:39 +0000 (UTC)
Date: Mon, 21 Mar 2022 09:24:37 -0500
From: Eric Blake <eblake@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 10/18] iotests: add qemu_img_map() function
Message-ID: <20220321142437.tcbchgpht3mluhp6@redhat.com>
References: <20220317234937.569525-1-jsnow@redhat.com>
 <20220317234937.569525-11-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220317234937.569525-11-jsnow@redhat.com>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 07:49:29PM -0400, John Snow wrote:
> Add a qemu_img_map() function by analogy with qemu_img_measure(),
> qemu_img_check(), and qemu_img_info() that all return JSON information.
> 
> Replace calls to qemu_img_pipe('map', '--output=json', ...) with this
> new function, which provides better diagnostic information on failure.
> 
> Note: The output for iotest 211 changes, because logging JSON after it
> was deserialized by Python behaves a little differently than logging the
> raw JSON document string itself.
> (iotests.log() sorts the keys for Python 3.6 support.)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---

> +++ b/tests/qemu-iotests/211.out

> @@ -55,9 +53,7 @@ file format: IMGFMT
>  virtual size: 32 MiB (33554432 bytes)
>  cluster_size: 1048576
>  
> -[{ "start": 0, "length": 3072, "depth": 0, "present": true, "zero": false, "data": true, "offset": 1024},
> -{ "start": 3072, "length": 33551360, "depth": 0, "present": true, "zero": true, "data": true, "offset": 4096}]
> -
> +[{"data": true, "depth": 0, "length": 3072, "offset": 1024, "present": true, "start": 0, "zero": false}, {"data": true, "depth": 0, "length": 33551360, "offset": 4096, "present": true, "start": 3072, "zero": true}]

The change in format can produce really long lines for a more complex
map, which can introduce its own problems in legibility. But I can
live with it.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


