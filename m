Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A1204E51
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 11:45:53 +0200 (CEST)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnfV2-0006pc-Lr
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 05:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jnfSn-0004RT-3D
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 05:43:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57392
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jnfSl-0006Hn-IE
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 05:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592905410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEtukad9MnLt+gKf7X+qH5fOBlYUE8JROO+7a3AgKIk=;
 b=JRCapSTyThFUlLcX6DlrMI7NNi7zVI3mLFgk/pFGABIkyRFRuujwG9DnbmmOmSt0IuYfe8
 eqkVJ4hM7vZ+vCpaXpK+gzyzu+TzgW3tuck5aOFMPeDwKTS8OLZ7Zp4x4mOo6db25zM09s
 OEYRPVwQT3f+0TwRtA4MM7A7323RB8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-7BRymzv7OwCZGNIgRv26jQ-1; Tue, 23 Jun 2020 05:43:26 -0400
X-MC-Unique: 7BRymzv7OwCZGNIgRv26jQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1719E804001;
 Tue, 23 Jun 2020 09:43:24 +0000 (UTC)
Received: from [10.72.12.144] (ovpn-12-144.pek2.redhat.com [10.72.12.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0446778910;
 Tue, 23 Jun 2020 09:43:03 +0000 (UTC)
Subject: Re: [PATCH v1 00/10] vDPA support in qemu
To: Cindy Lu <lulu@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20200622153756.19189-1-lulu@redhat.com>
 <877dvy45vr.fsf@dusky.pond.sub.org>
 <CACLfguWUoV7Ngt0U3Rdenvyp1s0PcWk2xsJirYGvHR3KSmZoeA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c8929663-27f2-93d6-e7b5-a3dc269fa7d2@redhat.com>
Date: Tue, 23 Jun 2020 17:43:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACLfguWUoV7Ngt0U3Rdenvyp1s0PcWk2xsJirYGvHR3KSmZoeA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: rdunlap@infradead.org, Michael Tsirkin <mst@redhat.com>,
 mhabets@solarflare.com, qemu-devel@nongnu.org,
 Rob Miller <rob.miller@broadcom.com>, saugatm@xilinx.com, hanand@xilinx.com,
 hch@infradead.org, Eugenio Perez Martin <eperezma@redhat.com>,
 jgg@mellanox.com, Shahaf Shuler <shahafs@mellanox.com>, kevin.tian@intel.com,
 parav@mellanox.com, Vitaly Mireyno <vmireyno@marvell.com>, "Liang,
 Cunming" <cunming.liang@intel.com>, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, Stefan Hajnoczi <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, Ariel Adam <aadam@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/6/23 下午5:16, Cindy Lu wrote:
> On Tue, Jun 23, 2020 at 3:07 PM Markus Armbruster <armbru@redhat.com> wrote:
>> Cindy Lu <lulu@redhat.com> writes:
>>
>>> vDPA device is a device that uses a datapath which complies with the
>>> virtio specifications with vendor specific control path. vDPA devices
>>> can be both physically located on the hardware or emulated by software.
>>> This RFC introduce the vDPA support in qemu
>>> TODO
>>> 1) vIOMMU support
>>> 2) live migration support
>> This gives me the foggiest of ideas on what vDPA is.  Could we use
>> docs/interop/vhost-vdpa.rst?
>>
> Sure will add this
>
>

Not sure it's the best place since vhost-vdpa is kernel specific.

Maybe kernel docs (TBD) is a better place and we can refer it this file 
in the future.

But it doesn't harm if you said something more here and refer the kernel 
commit here: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4c8cf31885f69e86be0b5b9e6677a26797365e1d

Thanks



