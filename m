Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E179327383B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 03:58:19 +0200 (CEST)
Received: from localhost ([::1]:38996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKXZS-0004Xk-VB
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 21:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kKXXr-0003al-5o
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 21:56:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kKXXo-0001Ka-Kg
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 21:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600739795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfi6QGSCyh/3tvi4gIq9B1LvJfVKbAeaEHa65qGYWmY=;
 b=jQT3+dI2/54wmAbfo1TRwY59UZ1TpLWs45OzYDj+7NOkXuS3YBwlclD48ETXBIZRII0KrB
 n7TBLVSaARa22M5Se+2K6P2rBLRfc5lVQl2NE5YBuugKqEfnoySVPtMmYZC8In+m/HVmvr
 N33BIe6IRoD8yJx/fb+w+wZdrnhsGg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-JQeSCXBnN0iedOiF10tF2w-1; Mon, 21 Sep 2020 21:56:34 -0400
X-MC-Unique: JQeSCXBnN0iedOiF10tF2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC629188C132;
 Tue, 22 Sep 2020 01:56:32 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84B6078823;
 Tue, 22 Sep 2020 01:56:28 +0000 (UTC)
Subject: Re: [PATCH 2/3] vhost-vdpa: Add qemu_close in vhost_vdpa_cleanup
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20200917155851.20636-1-lulu@redhat.com>
 <20200917155851.20636-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <582dede8-34a1-58ef-6deb-aa11098b63d4@redhat.com>
Date: Tue, 22 Sep 2020 09:56:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917155851.20636-2-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 01:43:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/9/17 下午11:58, Cindy Lu wrote:
> fix the bug that fd will still open after the cleanup
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   net/vhost-vdpa.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index bc0e0d2d35..0480b92102 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -144,6 +144,10 @@ static void vhost_vdpa_cleanup(NetClientState *nc)
>           g_free(s->vhost_net);
>           s->vhost_net = NULL;
>       }
> +     if (s->vhost_vdpa.device_fd >= 0) {
> +        qemu_close(s->vhost_vdpa.device_fd);
> +        s->vhost_vdpa.device_fd = -1;
> +    }
>   }
>   
>   static bool vhost_vdpa_has_vnet_hdr(NetClientState *nc)


