Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9072C0135
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:19:21 +0100 (CET)
Received: from localhost ([::1]:33384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh74B-0008Q3-0w
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kh71n-0006Yy-Uy
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:16:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kh71m-00014y-CV
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606119409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QL+2g9xVT+FChSI9ZGbhgHBFFDDfR3KyHpGqh/in5q8=;
 b=MYhM1C/oLNZr9WrwHDoaH5aaAQ6nHRJYAXtaUTYMmhxNxGRWaInlfHvGNuqHe2IATkWUoM
 x9IludyATS1GD5hVhph2xRwPBuf1mmM30lLBu5l2N6aRFxhuZNvub5dxK0kOrpGLFP0zg8
 P9gKUP8S6eJXBu58Pyj4AUEYY//Fspo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-Nzwl-mmJPlu29i1J1U7Y3g-1; Mon, 23 Nov 2020 03:16:47 -0500
X-MC-Unique: Nzwl-mmJPlu29i1J1U7Y3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 949B78144E3;
 Mon, 23 Nov 2020 08:16:46 +0000 (UTC)
Received: from [10.72.13.199] (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE7D60871;
 Mon, 23 Nov 2020 08:16:44 +0000 (UTC)
Subject: Re: [PATCH] net: Use correct default-path macro for downscript
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201123062954.9680-1-zhukeqian1@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3da7c6f9-dd67-b535-4661-977a67336170@redhat.com>
Date: Mon, 23 Nov 2020 16:16:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201123062954.9680-1-zhukeqian1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/23 下午2:29, Keqian Zhu wrote:
> Fixes: 63c4db4c2e6d (net: relocate paths to helpers and scripts)
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>   net/tap.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/tap.c b/net/tap.c
> index c46ff66184..b8e5cca51c 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -951,7 +951,8 @@ free_fail:
>               script = default_script = get_relocated_path(DEFAULT_NETWORK_SCRIPT);
>           }
>           if (!downscript) {
> -            downscript = default_downscript = get_relocated_path(DEFAULT_NETWORK_SCRIPT);
> +            downscript = default_downscript =
> +                                 get_relocated_path(DEFAULT_NETWORK_DOWN_SCRIPT);
>           }
>   
>           if (tap->has_ifname) {


Applied.

Thanks



