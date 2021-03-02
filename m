Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1998E32979B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:10:30 +0100 (CET)
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH12z-0003U3-5O
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lH125-00032T-IY
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:09:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lH124-0002LM-4k
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 04:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614676171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pr7lP0725GJES9PxSb0YrMN/5OhYrZXt7zpF5MXBzEI=;
 b=LjSRS7JNzbHJLWB911+w0/szMmXVADccapQhYa5SpZHMZe505pKvsiiFAJb902Iysa9IYX
 zC4ofvIsA1ewLRrEJW26gIJpgmVkSYx307drkqf2X8L3xwPEBot0Kv+UGu+s4IMigMAlkE
 5ust8tTcYp08RXl2UA6cOqGMlgSTfwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-dcopR7fTPLKwZ-2B6f0AKg-1; Tue, 02 Mar 2021 04:09:29 -0500
X-MC-Unique: dcopR7fTPLKwZ-2B6f0AKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432B2803648;
 Tue,  2 Mar 2021 09:09:28 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-124.pek2.redhat.com
 [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD73E5945F;
 Tue,  2 Mar 2021 09:09:26 +0000 (UTC)
Subject: Re: [PATCH] net: Fix build error when DEBUG_NET is on
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
References: <20210228050218.24517-1-bmeng.cn@gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <400f2fa1-24d4-f83d-d23e-ae65411a57d3@redhat.com>
Date: Tue, 2 Mar 2021 17:09:24 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228050218.24517-1-bmeng.cn@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/28 1:02 下午, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
>
> "qemu-common.h" should be included to provide the forward declaration
> of qemu_hexdump() when DEBUG_NET is on.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


Applied.

Thanks


>
> ---
>
> Changes in v2:
> - add "Reviewed-By" tag
>
>   net/net.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/net/net.c b/net/net.c
> index fb7b7dcc25..32d71c1172 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu-common.h"
>   
>   #include "net/net.h"
>   #include "clients.h"


