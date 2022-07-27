Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C2582C55
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:45:44 +0200 (CEST)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGkAI-0001Vm-HF
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:45:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGjyB-0001do-Ml
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 12:33:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oGjy8-0007Fr-Lo
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 12:33:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658939587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEegl9xaSyx902Aa0QFzFMg1MUKaxlRwUVNpnZmayVE=;
 b=Fph3qNEz9dSqtTMMermvc0QpmmCgpimzNZ9Iswm7TrAzqzkAKz5Fefa4yiu8Oib3S4d+9u
 gcIU2/gOx/XJ8DAp8owWvYAOxmx46Fvr7UCj04ZuGmHgZDtmAtu6ae5OZz4GVMxzZg7iOG
 PN7En8ThEymhQex3LRUDLL4y163ppew=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-EgVVf_rlMBWI1QxSN00_WA-1; Wed, 27 Jul 2022 12:33:02 -0400
X-MC-Unique: EgVVf_rlMBWI1QxSN00_WA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B2B28039A6;
 Wed, 27 Jul 2022 16:33:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35683C27D95;
 Wed, 27 Jul 2022 16:32:59 +0000 (UTC)
Date: Wed, 27 Jul 2022 18:32:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, stefanha@redhat.com,
 mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk, jasowang@redhat.com,
 Coiby Xu <Coiby.Xu@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH  v3 05/21] block/vhost-user-blk-server: don't expose
 VHOST_USER_F_PROTOCOL_FEATURES
Message-ID: <YuFouVA/fg6fyZqb@redhat.com>
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726192150.2435175-6-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.07.2022 um 21:21 hat Alex Bennée geschrieben:
> This bit is unused in actual VirtIO feature negotiation and should
> only appear in the vhost-user messages between master and slave.
> 
> [AJB: experiment, this doesn't break the tests but I'm not super
> confident of the range of tests]
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

I guess the rationale is that this doesn't make a difference because
vu_get_features_exec(), which is the only caller of .get_features(),
adds the VHOST_USER_F_PROTOCOL_FEATURES bit back before sending a
response.

Can you please add this to the commit message?

>  block/export/vhost-user-blk-server.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-user-blk-server.c
> index 3409d9e02e..d31436006d 100644
> --- a/block/export/vhost-user-blk-server.c
> +++ b/block/export/vhost-user-blk-server.c
> @@ -125,8 +125,7 @@ static uint64_t vu_blk_get_features(VuDev *dev)
>                 1ull << VIRTIO_BLK_F_MQ |
>                 1ull << VIRTIO_F_VERSION_1 |
>                 1ull << VIRTIO_RING_F_INDIRECT_DESC |
> -               1ull << VIRTIO_RING_F_EVENT_IDX |
> -               1ull << VHOST_USER_F_PROTOCOL_FEATURES;
> +               1ull << VIRTIO_RING_F_EVENT_IDX ;

This has an extra space before the semicolon.

Kevin


