Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE6032B7EE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:10:31 +0100 (CET)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHRGo-0006tR-SV
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lHRF8-0005t9-GL
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:08:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lHRF6-0005Pu-Rc
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614776924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oUoz2yPxM1iD68TTHMRZcqrcwChnyWydTeXmPIfN6HE=;
 b=YitI8fx5inDJFzmiGZyR5Q/+KKZNotjnBMyU/WjQkNBUIZeALhTdKqF2R8msNUcXOaBGAl
 v0X1Ds973JygxfuRzOg1XY4+rOlMqusTA2v4/RsPD1uTMyFbCuXs6jBDy9It1m4zEJIc7U
 syUll8SkKzli0FuXKutU7PrEEny+lDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-mJdbe6QEMgix3COGZ-QOpg-1; Wed, 03 Mar 2021 08:08:40 -0500
X-MC-Unique: mJdbe6QEMgix3COGZ-QOpg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 223B58017FF
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 13:08:39 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-107.pek2.redhat.com
 [10.72.12.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 055A25D705;
 Wed,  3 Mar 2021 13:08:28 +0000 (UTC)
Subject: Re: Inconsistent virtio-net-pci MSI vector count
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <YD9qmto5pHys+jEm@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e8c8874f-6b1a-ac0e-5ab6-826611cd3ef3@redhat.com>
Date: Wed, 3 Mar 2021 21:08:27 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YD9qmto5pHys+jEm@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/3 6:53 下午, Stefan Hajnoczi wrote:
> Hi Jason,
> I stumbled across something strange with virtio-net multi-queue today.
> It doesn't seem to be a bug in practice, just an inconsistency. Here are
> the details in case you think something needs to be changed:
>
> libvirt uses the vectors = 2 * N + 2 formula from
> https://www.linux-kvm.org/page/Multiqueue to calculate the number of PCI
> MSI vectors, where N is the number of rx/tx queue pairs.
>
> QEMU's virtio-net-pci device has 3 MSI vectors by default. This is
> inconsistent with the formula that libvirt uses (should be 4 instead of
> 3).


Yes.


>
> Luckily, the Linux virtio_net.ko driver does not configure a callback
> function for the control virtqueue. Therefore it can still use MSI with
> only 3 vectors (config, rx, tx) instead of 4 (config, rx, tx, ctrl).
>
> But other driver implementations might need the ctrl vq vector and would
> not have enough MSI vectors.
>
> Perhaps new QEMU machine types should set vectors to 4 by default?


Or it's time to accept this:

https://lists.gnu.org/archive/html/qemu-devel/2014-03/msg01330.html

Thanks


>
> Stefan


