Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71657695DBD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:58:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRr91-0005nx-Rj; Tue, 14 Feb 2023 03:58:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRr8s-0005nR-9C
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:58:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pRr8o-0004LY-Ee
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676365101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7nK+rKq+J6TxRV+IXKIanZVzxibZF0Q9SGYONh2C6U=;
 b=b0Ih4Lo+Q3P/tpmhfzPcRmfBKghOrPn2j7G+VQS0bhrM5c/WMT6HmApxhr2SgPm/gffLPu
 /YNiyZQ1LQVzF4q1WpKeHsIiYPQ1dH+hti3ouTLuKWEwYPfQzQEYBPc5zKhnD9/hnUu7nk
 nDkoeIUeXAP03mEWRQz8TS0yOTb8Px4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-zFITGly4O3yKqlwQDX3Yqg-1; Tue, 14 Feb 2023 03:58:16 -0500
X-MC-Unique: zFITGly4O3yKqlwQDX3Yqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E90B118A6468;
 Tue, 14 Feb 2023 08:58:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F701121319;
 Tue, 14 Feb 2023 08:58:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E9CF21E6A1F; Tue, 14 Feb 2023 09:58:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org,  armbru@redhat.com,  eblake@redhat.com,
 eduardo@habkost.net,  berrange@redhat.com,  pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com,  mst@redhat.com,
 den-plotnikov@yandex-team.ru,  antonkuchin@yandex-team.ru
Subject: Re: [PATCH v4 16/16] qapi: introduce DEVICE_ON event
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-17-vsementsov@yandex-team.ru>
 <2bd9ad31-39c8-f85b-ae5a-80de8d9ec448@linaro.org>
Date: Tue, 14 Feb 2023 09:58:14 +0100
In-Reply-To: <2bd9ad31-39c8-f85b-ae5a-80de8d9ec448@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Mon, 13 Feb 2023 15:12:03
 +0100")
Message-ID: <873578oc7t.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 13/2/23 15:01, Vladimir Sementsov-Ogievskiy wrote:
>> We have DEVICE_DELETED event, that signals that device_del command is
>> actually completed. But we don't have a counter-part for device_add.
>> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
>> when the device in some intermediate state. Let's add an event that say
>> that the device is finally powered on, power indicator is on and
>> everything is OK for next manipulation on that device.
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   qapi/qdev.json | 13 +++++++++++++
>>   hw/pci/pcie.c  | 13 +++++++++++++
>>   hw/pci/shpc.c  | 12 ++++++++++++
>>   3 files changed, 38 insertions(+)
>> diff --git a/qapi/qdev.json b/qapi/qdev.json
>> index b6ad311dd4..2143bb2792 100644
>> --- a/qapi/qdev.json
>> +++ b/qapi/qdev.json
>> @@ -341,3 +341,16 @@
>>   { 'command': 'query-hotplug',
>>     'data': { 'id': 'str' },
>>     'returns': 'HotplugInfo' }
>> +
>> +##
>> +# @DEVICE_ON:
>> +#
>> +# Emitted whenever the device insertion completion is acknowledged by t=
he guest.
>> +# For now only emitted for SHPC and PCIe-native hotplug.
>> +#
>> +# @path: the hotplugged device's QOM path
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'event': 'DEVICE_ON',
>> +  'data': { 'path': 'str' } }
>
> Could 'qom-path' or 'canonical-path' be more meaningful here?

@qom-path would be clearer, no doubt.  But @path is consistent with the
closely related DEVICE_DELETED event.

>> @@ -816,6 +823,12 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>>           qdev_hotplug_state_event(DEVICE(dev), NULL, child_dev, &change=
d_state);
>>       }
>>   +    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) =
&&
>> +        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
>> +    {
>> +        qapi_event_send_device_on(child_dev->canonical_path);
>> +    }


