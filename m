Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14FA675842
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:14:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIt4y-0002g4-A4; Fri, 20 Jan 2023 10:13:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pIt4u-0002cb-RW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:13:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1pIt4t-0006fE-As
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 10:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674227594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TxDsk0Pjxqexvj0e8E3wGO5ASRGf1VjLI9O+kztGYm8=;
 b=PQxAIRgTzWtvOwLpz1Egv9QoKYXV4LU9AWlxlMg8okTmSwPiuq9nOagEm/DnZM4O0N+yEX
 76nC/Y5iarTnUM2gB6j8/l1lDfVX27RCRaI6j+Ntl/7G7lDLpwSvX19wjBas8vKyJutUDS
 rKPZ79bQL+DJl52XxBywoBYeHqC8B50=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-Ni9sKXBtOOCc8QvKx0NFKg-1; Fri, 20 Jan 2023 10:13:12 -0500
X-MC-Unique: Ni9sKXBtOOCc8QvKx0NFKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14FB5802C1C;
 Fri, 20 Jan 2023 15:13:12 +0000 (UTC)
Received: from [10.39.208.26] (unknown [10.39.208.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01D981121318;
 Fri, 20 Jan 2023 15:13:09 +0000 (UTC)
Message-ID: <fbe712bb-a1cc-6f83-501a-8549e842f49d@redhat.com>
Date: Fri, 20 Jan 2023 16:13:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] Revert "vhost-user: Introduce nested event loop in
 vhost_user_read()"
Content-Language: en-US
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yajun Wu <yajunw@nvidia.com>, Peter Maydell <peter.maydell@linaro.org>,
 Parav Pandit <parav@nvidia.com>, qemu-stable@nongnu.org
References: <20230119172424.478268-1-groug@kaod.org>
 <20230119172424.478268-3-groug@kaod.org>
From: Maxime Coquelin <maxime.coquelin@redhat.com>
In-Reply-To: <20230119172424.478268-3-groug@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/19/23 18:24, Greg Kurz wrote:
> This reverts commit a7f523c7d114d445c5d83aecdba3efc038e5a692.
> 
> The nested event loop is broken by design. It's only user was removed.
> Drop the code as well so that nobody ever tries to use it again.
> 
> I had to fix a couple of trivial conflicts around return values because
> of 025faa872bcf ("vhost-user: stick to -errno error return convention").
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   hw/virtio/vhost-user.c | 65 ++++--------------------------------------
>   1 file changed, 5 insertions(+), 60 deletions(-)
> 

Acked-by: Maxime Coquelin <maxime.coquelin@redhat.com>

Thanks,
Maxime


