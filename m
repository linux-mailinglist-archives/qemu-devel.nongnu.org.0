Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAAD124B62
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 16:16:55 +0100 (CET)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihb4I-0004jc-2K
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 10:16:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47288)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1ihb2P-0003Kb-IX
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:14:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1ihb2N-0002lF-Lw
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:14:56 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53349)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1ihb2N-0002Wp-GR
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 10:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576682093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LEXL9L6D+lLRDo0K1f9hDp2Kza1NO97jTD93A4wXzQ=;
 b=ZWh7m6mHZyg+XONyM87kwU81lK1qAZ84aIHyJhTDXGhqhAnVrOisK58FHWRgsZuKuqNywG
 WwEvST5iA8YjsdOG+fkp2HFbtPudfYZQ9Ed/jw9eoVpbVHZLVsxIcJwhZyRIlojstx0dE5
 cly2IilJzyLQvQ5Pt78BVa8vu9EgX0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-g71fGyVMM-aniL7g-qnXyg-1; Wed, 18 Dec 2019 10:14:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C18801B18BF8;
 Wed, 18 Dec 2019 15:14:50 +0000 (UTC)
Received: from localhost (ovpn-117-153.ams2.redhat.com [10.36.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A44F60303;
 Wed, 18 Dec 2019 15:14:45 +0000 (UTC)
Date: Wed, 18 Dec 2019 16:14:43 +0100
From: Jens Freimann <jfreimann@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: qom device lifecycle interaction with hotplug/hotunplug ?
Message-ID: <20191218151443.gwh647paandzoboz@jenstp.localdomain>
References: <20191129132641.4c7da6c5@redhat.com>
 <CAFEAcA_gcxqu+N5iV0L5WLyWmm5yxTFNMtmqQryBgVd4CCCT8A@mail.gmail.com>
 <20191129200545.GG14595@habkost.net>
 <CAFEAcA-BkETOSpOwBegDcbO3bqxDO_a9xoTB7Fc8Ajw_+CDcFA@mail.gmail.com>
 <20191203214004.GS14595@habkost.net>
 <20191204091824.cwufcnlfj5vm4vqu@jenstp.localdomain>
 <20191204143537.GA498046@habkost.net>
 <20191204162125.udpzdse3zchpfinw@jenstp.localdomain>
 <20191204185106.GC498046@habkost.net>
 <54dc79b4-d033-7990-2f8d-e3787a2803d8@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <54dc79b4-d033-7990-2f8d-e3787a2803d8@greensocs.com>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: g71fGyVMM-aniL7g-qnXyg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 11, 2019 at 01:52:33PM +0100, Damien Hedde wrote:
>On 12/4/19 7:51 PM, Eduardo Habkost wrote:
>> On Wed, Dec 04, 2019 at 05:21:25PM +0100, Jens Freimann wrote:
>>> On Wed, Dec 04, 2019 at 11:35:37AM -0300, Eduardo Habkost wrote:
>>>> On Wed, Dec 04, 2019 at 10:18:24AM +0100, Jens Freimann wrote:
>>>>> On Tue, Dec 03, 2019 at 06:40:04PM -0300, Eduardo Habkost wrote:
>>>>>> +jfreimann, +mst
>And if migration fails this same device is plugged back using
>failover_replug_primary():
>> static bool failover_replug_primary(VirtIONet *n, Error **errp)
>> {
>>     [...]
>>     qdev_set_parent_bus(n->primary_dev, n->primary_bus);
>>     [...]
>>     hotplug_ctrl =3D qdev_get_hotplug_handler(n->primary_dev);
>>     if (hotplug_ctrl) {
>>         hotplug_handler_pre_plug(hotplug_ctrl, n->primary_dev, &err);
>>         if (err) {
>>             goto out;
>>         }
>>         hotplug_handler_plug(hotplug_ctrl, n->primary_dev, errp);
>>     }
>>     [...]
>> }
>
>My concern is about the qdev_set_parent_bus() call above (because I
>touch this function in my series) and don't want to have side effects ther=
e.
>
>I looked at the code and thought the partial unplug has the effect of
>cutting off the unplug procedure just before doing the qdev real unplug.
>In pcie_unplug_device() we return before doing the object_unparent():
>> static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, ...
>>  {
>>      [...]
>>      if (dev->partially_hotplugged) {
>>          dev->qdev.pending_deleted_event =3D false;
>>          return;
>>      }
>>      hotplug_handler_unplug(hotplug_ctrl, DEVICE(dev), &error_abort);
>>      object_unparent(OBJECT(dev));
>>  }
>
>From my understanding, object_unparent() is the only way to really
>unplug a device from a bus regarding qdev (and it also unrealizes the
>device). So I have the feeling that qdev_set_parent_bus() here is a
>no-op (because primary_dev is already on primary_bus).

I tested this now and it really is a no-op. It was required in a
earlier version of the patches and I missed to remove it when I
reworked the re-plug functionality.

I will send a patch to remove it.

regards
Jens


