Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C003489C1
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 08:01:19 +0100 (CET)
Received: from localhost ([::1]:38872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJza-0006M3-5i
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 03:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPJxx-0005uE-9F
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lPJxu-0005Up-NM
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616655573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLwWvqm6hmybrWvn6uTp6rFICSVqwBULrG8knfN83WM=;
 b=PMQnhe7fWcZrV7nxuygvDicIrz6I9COX3UluBu6Gu8uVHRL99F78s0lunks/wpUoeUSPZk
 8D96DQyDQLzpclZ/iaQprh8QbNCNz8IdfGKN3fD8pPOwmY87Rc01Q7zinyJNJbowNF7ByB
 iVAX8SMGlznS1IkQffPcIijRQYvH/KY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-BUz_t68uPQeDLTDsoN1SEg-1; Thu, 25 Mar 2021 02:59:31 -0400
X-MC-Unique: BUz_t68uPQeDLTDsoN1SEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66761107ACCD;
 Thu, 25 Mar 2021 06:59:30 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-186.pek2.redhat.com
 [10.72.13.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97D4A5194B;
 Thu, 25 Mar 2021 06:59:25 +0000 (UTC)
Subject: Re: [RFC PATCH v2 0/3] virtio-net: graceful drop of vhost for TAP
To: Yuri Benditovich <yuri.benditovich@daynix.com>, mst@redhat.com,
 berrange@redhat.com
References: <20210322122452.369750-1-yuri.benditovich@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <aa33a355-5980-5ff5-7264-02d6fc7f5f9d@redhat.com>
Date: Thu, 25 Mar 2021 14:59:24 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322122452.369750-1-yuri.benditovich@daynix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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


ÔÚ 2021/3/22 ÏÂÎç8:24, Yuri Benditovich Ð´µÀ:
> Allow fallback to userspace only upon migration, only for specific features
> and only if 'vhostforce' is not requested.
>
> Changes from v1:
> Patch 1 dropeed (will be submitted in another series)
> Added device callback in case the migration should fail due to missing features


Hi Yuri:

Have a quick glance at the series. A questions is why we need to do the 
fallback only during load?

I think we should do it in the device initializating. E.g when the vhost 
features can not satisfy, we should disable vhost since there.

Thanks


>
> Yuri Benditovich (3):
>    net: add ability to hide (disable) vhost_net
>    virtio: introduce 'missing_features_migrated' device callback
>    virtio-net: implement missing_features_migrated callback
>
>   hw/net/vhost_net.c         |  4 ++-
>   hw/net/virtio-net.c        | 51 ++++++++++++++++++++++++++++++++++++++
>   hw/virtio/virtio.c         |  8 ++++++
>   include/hw/virtio/virtio.h |  8 ++++++
>   include/net/net.h          |  1 +
>   5 files changed, 71 insertions(+), 1 deletion(-)
>


