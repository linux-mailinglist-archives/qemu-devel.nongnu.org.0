Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B032968A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:54:11 +0100 (CET)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGyv4-0001to-6X
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:54:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGyu0-0001Md-S1
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:53:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lGytx-0003If-2t
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 01:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614667979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pq/NAGAQpu/ZUotcDLCHMX/rECdayQfdHwIKWKG8XEY=;
 b=Py4jZkcXDGFZli8VtOtSOUBTLYcKmlvG/Kr5gEyX4rQbiO+Oasbv8pbPsSulfVv2imgH7z
 SqhJJEoOVX8D9HJfxh+mGLyz5ITpeOa7eiqOcx81h0BG+Z535L9e+FRUkmKgeae1OZqLnJ
 F7UYGr2qQi2TDXMdw8Ji9mfIwxYnuYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-evBpENT-Pc2_fKaui-34CQ-1; Tue, 02 Mar 2021 01:52:54 -0500
X-MC-Unique: evBpENT-Pc2_fKaui-34CQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CB2E1935780;
 Tue,  2 Mar 2021 06:52:53 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-133.pek2.redhat.com
 [10.72.12.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 509115D71F;
 Tue,  2 Mar 2021 06:52:51 +0000 (UTC)
Subject: Re: [PATCH V2 7/7] rtl8193: switch to use qemu_receive_packet() for
 loopback
To: P J P <ppandit@redhat.com>
References: <20210302055500.51954-1-jasowang@redhat.com>
 <20210302055500.51954-9-jasowang@redhat.com>
 <42np32r6-nr45-psnq-n61r-8on26spo4rp0@erqung.pbz>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <380cd877-d841-2471-b97e-45788f4c9c54@redhat.com>
Date: Tue, 2 Mar 2021 14:52:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <42np32r6-nr45-psnq-n61r-8on26spo4rp0@erqung.pbz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: alxndr@bu.edu, philmd@redhat.com, qemu-devel@nongnu.org,
 qemu-security@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/2 2:39 下午, P J P wrote:
> +-- On Tue, 2 Mar 2021, Jason Wang wrote --+
> |          DPRINTF("+++ transmit loopback mode\n");
> | -        rtl8139_do_receive(qemu_get_queue(s->nic), buf, size, do_interrupt);
> | +        qemu_receive_packet(qemu_get_queue(s->nic), buf, size);
> |
> ...
> |[PATCH V2 7/7] rtl8193: switch to use qemu_receive_packet() for loopback
>
> * Patch 'V2' need not be here.
>
> Thank you.


Right, looks like a stale patch in the directory.

Will not apply this one when mergeing the series.

Thanks


> --
>   - P J P
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


