Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36229234F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:03:21 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQ8W-0007h9-3u
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kUPyF-00058b-Ow
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:52:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kUPyE-00085i-5w
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603093961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sOAqa7tvF3J67zDQCLiIgo0h3okHU0xOGgb5mn9F2g4=;
 b=IclCOPfm41CmOwWW1FvptygvxQbxkpk8IqTgsM/ut3ZWJlFgI30pwvi6xmNPrl6wLeMRo2
 32HNO9cKummZi6IutSJNdoTekeNqmWMUmgmhqK/9ivuVApmqncf7wF5AV4zSU41Dc3bBn+
 2b8IzxJ9P6AoPhkwHV38pFqcaft1ZvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-R7ljmaz2OzyNwrIv0C8Rdw-1; Mon, 19 Oct 2020 03:52:37 -0400
X-MC-Unique: R7ljmaz2OzyNwrIv0C8Rdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7767764080;
 Mon, 19 Oct 2020 07:52:36 +0000 (UTC)
Received: from [10.72.13.124] (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F15061A4D7;
 Mon, 19 Oct 2020 07:52:28 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] vhost-vdpa: Add qemu_close in vhost_vdpa_cleanup
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20201016030909.9522-1-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c8c9edad-a62e-b633-3d2b-7bd58497ab81@redhat.com>
Date: Mon, 19 Oct 2020 15:52:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201016030909.9522-1-lulu@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/10/16 上午11:09, Cindy Lu wrote:
> fix the bug that fd will still open after the cleanup
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>
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


Acked-by: Jason Wang <jasowang@redhat.com>



