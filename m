Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5E22EA13
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 12:31:55 +0200 (CEST)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k00QE-0002oe-LO
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 06:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k00LJ-0003bf-B1
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 06:26:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30824
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1k00LH-000671-Mk
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 06:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595845606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ygbq+txfC7KfLip4hu8EuUSnXN4O/uzF5z5V9+UkYk=;
 b=LECjzwFA3mTlzH5w6EUgsRiCpzhE8OplNNgjfWWSe/C5C/hdMnLLfNeCcPqKmJEBtnh187
 TwCRqEuZ47OvLlVJO+R1NZsY0PX9ufEb38qJDCcVlkgUU0/mIikoL7ORTu+C579d/Zws0m
 9XHAhIZK1leJV0APKFW2T0vDIUwIfD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-tfkRWJzHMuWx9yZCuuBquQ-1; Mon, 27 Jul 2020 06:26:44 -0400
X-MC-Unique: tfkRWJzHMuWx9yZCuuBquQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F996100CCC1
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 10:26:44 +0000 (UTC)
Received: from [10.72.12.200] (ovpn-12-200.pek2.redhat.com [10.72.12.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7D3069328;
 Mon, 27 Jul 2020 10:26:39 +0000 (UTC)
Subject: Re: [PATCH] virtio-net: check the existence of peer before accesing
 its config
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20200727074328.2279-1-jasowang@redhat.com>
 <20200727053954-mutt-send-email-mst@kernel.org>
 <20200727115322.4e7fe1aa.cohuck@redhat.com>
 <20200727061112-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0cad868a-7f64-47e0-f4bf-014a5fc1bcf6@redhat.com>
Date: Mon, 27 Jul 2020 18:26:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727061112-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=jasowang@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 01:44:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/7/27 下午6:13, Michael S. Tsirkin wrote:
> On Mon, Jul 27, 2020 at 11:53:22AM +0200, Cornelia Huck wrote:
>> On Mon, 27 Jul 2020 05:41:17 -0400
>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>
>>> On Mon, Jul 27, 2020 at 03:43:28PM +0800, Jason Wang wrote:
>>>> We try to get config from peer unconditionally which may lead NULL
>>>> pointer dereference. Add a check before trying to access the config.
>>>>
>>>> Fixes: 108a64818e69b ("vhost-vdpa: introduce vhost-vdpa backend")
>>>> Cc: Cindy Lu <lulu@redhat.com>
>>>> Tested-by: Cornelia Huck <cohuck@redhat.com>
>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> I am a bit lost here. Isn't this invoked
>>> when guest attempts to read the config?
>>> With no peer, what do we return to guest?
>> Same as with a non-vdpa peer? It's the dereference that needs to be
>> guarded.
> So vdpa has a GET_CONFIG ioctl which to me hints that a peer needs to be
> notified on get config calls.
> If we return config from qemu memory here, then I guess we
> need to call GET_CONFIG on connect and validate it -
> does this make sense?
>
> Cindy, Jason?


For "connect" you meant connecting virtio-net to its peer (vDPA)? AFAIK, 
if we start with no peer, there's no way to set a peer afterwards.

Thanks


>
>>> A code comment might be helpful here.
>>>
>>>> ---
>>>>   hw/net/virtio-net.c | 22 +++++++++++-----------
>>>>   1 file changed, 11 insertions(+), 11 deletions(-)


