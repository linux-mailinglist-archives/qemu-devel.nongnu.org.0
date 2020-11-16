Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE792B4BB2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:53:04 +0100 (CET)
Received: from localhost ([::1]:46306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehkV-0002El-Td
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kehim-0001Uc-VN
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:51:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kehig-0005nt-Sm
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605545468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGublSHjcjt3qHiIePpIQSsIWKmZJjoqQ5CpTVWosrI=;
 b=YmQZrMG0zPhwg2Pha6GVvNT0vR1FUxgJK5vWmmRgFi/bUONBk3oB+ESzry6syV9RePyDCr
 BALt6GOukwBJ84e1rS8qzI/axGaB9Tzqa2DYkF67OJeBMYjKZ0uu/UtV8TpDoXH3yjo/4k
 U+HkO2vWP3FY0O2lDNg4Mdaofm2EwTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-u_dJI5AuNHii9WmEaWhCtg-1; Mon, 16 Nov 2020 11:51:04 -0500
X-MC-Unique: u_dJI5AuNHii9WmEaWhCtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EA661868426;
 Mon, 16 Nov 2020 16:51:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-126.ams2.redhat.com [10.36.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26FDB1759F;
 Mon, 16 Nov 2020 16:50:58 +0000 (UTC)
Subject: Re: [PATCH 2/2] plugins: Fix two resource leaks in connect_socket()
To: AlexChen <alex.chen@huawei.com>, alex.bennee@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, mjt@tls.msk.ru
References: <5F9975F1.4080205@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c91f4827-0be0-b0d1-f183-d3d868079a50@redhat.com>
Date: Mon, 16 Nov 2020 17:50:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5F9975F1.4080205@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, zhengchuan@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/10/2020 14.45, AlexChen wrote:
> Either accept() fails or exits normally, we need to close the fd.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: AlexChen <alex.chen@huawei.com>
> ---
>  contrib/plugins/lockstep.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
> index 319bd44b83..5aad50869d 100644
> --- a/contrib/plugins/lockstep.c
> +++ b/contrib/plugins/lockstep.c
> @@ -268,11 +268,13 @@ static bool setup_socket(const char *path)
>      socket_fd = accept(fd, NULL, NULL);

I think you could also simply close(fd) here instead, then you don't have to
do it twice below.

 Thomas


>      if (socket_fd < 0 && errno != EINTR) {
>          perror("accept socket");
> +        close(fd);
>          return false;
>      }
> 
>      qemu_plugin_outs("setup_socket::ready\n");
> 
> +    close(fd);
>      return true;
>  }
> 


