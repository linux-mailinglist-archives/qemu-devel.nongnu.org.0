Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0893129AF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:19:30 +0100 (CET)
Received: from localhost ([::1]:60528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8y1K-0003Ld-1M
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:19:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l8x1V-00005G-0H
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:15:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l8x1Q-0000HQ-Cv
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612754129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uHnSbwd/pM8n/hEFL0N+4TeUQ2SSoJal6qjjiK3qPyQ=;
 b=U6jVvzXL0gqsR2OMDI8iLPhGrL2LKZE9Ue97ywM0a6ctutrT6A3y+uTNJd/mOSdxH8xQYs
 RiAnKifvcrjgdqSRf9HAYIYNFToQ+2clc+0S+fLwLPY3rkVRKexAtGUKFQPaLlJ3L9//J7
 xcj0Yi9yBVQRmkQn9fs9MeAdLgnum/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-XjquQGaWOCWQAbd567bP4g-1; Sun, 07 Feb 2021 22:15:27 -0500
X-MC-Unique: XjquQGaWOCWQAbd567bP4g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3016192AB78;
 Mon,  8 Feb 2021 03:15:26 +0000 (UTC)
Received: from [10.72.13.185] (ovpn-13-185.pek2.redhat.com [10.72.13.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01E2E5D9CA;
 Mon,  8 Feb 2021 03:15:21 +0000 (UTC)
Subject: Re: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap
 netdev
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210204202915.15925-4-yuri.benditovich@daynix.com>
 <20210205083742-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <afc2b49b-4751-9a16-0859-8543b7ee8796@redhat.com>
Date: Mon, 8 Feb 2021 11:15:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205083742-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/5 下午9:38, Michael S. Tsirkin wrote:
> On Thu, Feb 04, 2021 at 10:29:15PM +0200, Yuri Benditovich wrote:
>> Currently virtio-net silently clears features if they are
>> not supported by respective vhost. This may create migration
>> problems in future if vhost features on the source and destination
>> are different. Implement graceful fallback to no-vhost mode
>> when some acked features contradict with vhost. The decision is
>> taken on set_features call and the vhost will be disabled
>> till next reset (or migration).
>> Such fallback is currently enabled only for TAP netdev.
>>
>> Signed-off-by: Yuri Benditovich<yuri.benditovich@daynix.com>
> Sounds good, but I don't think we should do this if
> vhostforce=on is set.


If we do this, does it mean we won't maintain migration compatibility 
when vhostforce is on?

Thanks


>
> Also, let's document this behaviour with the vhost option so people
> are not suprized.
>


