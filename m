Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D27313AA8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 18:18:12 +0100 (CET)
Received: from localhost ([::1]:38146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AAt-0005RA-Mj
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 12:18:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l95AS-0008KC-LX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l95AK-0004Cm-GY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612785434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2pWzfseJRquDy4rW7GeecjJjagJh83SCfxyXK1dkIQ=;
 b=LI8XT8DhBsSw8vt+hRbH/xDQ5LPSWgyZDAi8SYyq+R3p6NsW4FiMP1HpaCljOWo4niQus5
 +MO3PYQS1+VNsZ+JfocCKKl8Xh0uUOZYMpng7eo8Kt2bEleMXB/iLPsbjuuoFfCKB4Cd9w
 3szubrtwxJlGLTsw7rGna3HSkUFPeaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91--lsmoK8KOeeFxXTMLHrRMA-1; Mon, 08 Feb 2021 06:57:10 -0500
X-MC-Unique: -lsmoK8KOeeFxXTMLHrRMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0579E192D785;
 Mon,  8 Feb 2021 11:57:09 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-172.ams2.redhat.com
 [10.36.115.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D239110016FE;
 Mon,  8 Feb 2021 11:57:06 +0000 (UTC)
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
To: schspa <schspa@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
 <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
 <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
 <20210205140807.GH477672@toto>
 <0b4b2fcdb148bf35cbffbd9cd40ce1b88f883f0c.camel@gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8a477640-0dc3-2995-c893-b3834607383a@redhat.com>
Date: Mon, 8 Feb 2021 12:57:05 +0100
MIME-Version: 1.0
In-Reply-To: <0b4b2fcdb148bf35cbffbd9cd40ce1b88f883f0c.camel@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Kevin Zhao <kevin.zhao@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/08/21 06:34, schspa wrote:
> On Fri, 2021-02-05 at 15:08 +0100, Edgar E. Iglesias wrote:
>> Thanks, that matches how I thought things should work.
>>
>> I wonder if virtio_mmio_bus_get_dev_path() really should be peeking
>> into
>> Sysbus internals mmio[].addr?
>>
> I think mmio[].addr needs to be given a meaningful value even if we
> don't use it.
> 
>> Sysbus mmio[].addr looks like a candidate for removal if we ever get
>> rid
>> of the default system_memory...
>>
>> I don't have any good suggestions how to fix this. I guess we could
>> wrap
>> memory_region_add_subregion() with a sysbus version of it that sets
>> mmio[].addr but that seems like a step backwards to me.
>> Perhaps there's a way fix this in virtio_mmio_bus_get_dev_path()?
> 
> I think we can change virtio_mmio_bus_get_dev_path() with the following
> methods.
> 
> 1. modify TYPE_VIRTIO_MMIO:
>    add a prop to specify a unique device_path for virtio_mmio TypeInfo.
> 2. modify TYPE_VIRTIO_MMIO_BUS
>    add a global static instance count to generate a unique device path.
> 

Please don't CC me out of the blue mid-thread, without at least a hint
as to why the thread could be relevant to me.

If you are CC'ing me because I authored f58b39d2d5b6 ("virtio-mmio:
format transport base address in BusClass.get_dev_path", 2016-07-14),
for <https://bugs.launchpad.net/qemu/+bug/1594239>, *and* now this patch
is deemed incorrect or obsolete, then:

Feel free to do whatever you want with those functions, as long as

(a) the entries in the "bootorder" fw_cfg file remain intact,
(b) LP#1594239 remains fixed.

Thanks
Laszlo


