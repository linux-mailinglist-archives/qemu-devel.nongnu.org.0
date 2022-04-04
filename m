Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E804F1344
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 12:43:30 +0200 (CEST)
Received: from localhost ([::1]:43734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbKBF-0002QO-DS
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 06:43:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nbK8x-0001My-9M
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 06:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nbK8v-0004Vd-AG
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 06:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649068864;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqzDLJGYw+usGsxo2diJ6VcxT8NxmHvltmdS8kakso8=;
 b=icO9vnu1/gghVPbyWpJR5AlBE1MaKscOdRW0SXs5qFVWnfzjiP1c7HGB6lGM/lM2r7nikz
 oMvVkUTYlPN47Re1Uaz4P2W6QjIFc2bWNWWg2E+Xl5xxfFPG/VNuoAA6tK44PE9X3JLV8W
 +HzK1muBKjL21I8AFYO4D4HbS+FrO2Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493--zRPm2sZNHGEU9ZHVjVIUA-1; Mon, 04 Apr 2022 06:41:00 -0400
X-MC-Unique: -zRPm2sZNHGEU9ZHVjVIUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 689BE801585;
 Mon,  4 Apr 2022 10:41:00 +0000 (UTC)
Received: from [10.72.12.126] (ovpn-12-126.pek2.redhat.com [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7788E40F1C45;
 Mon,  4 Apr 2022 10:40:55 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com> <YkquNlUvAHC+sLh7@redhat.com>
 <YkqvGsdcnupeTMZR@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <896753a5-a40d-74e4-56a8-a46153e3ee26@redhat.com>
Date: Mon, 4 Apr 2022 18:40:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <YkqvGsdcnupeTMZR@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Daniel,

On 4/4/22 4:40 PM, Daniel P. Berrangé wrote:
> On Mon, Apr 04, 2022 at 09:37:10AM +0100, Daniel P. Berrangé wrote:
>> On Sun, Apr 03, 2022 at 10:59:50PM +0800, Gavin Shan wrote:
>>> This adds cluster-id in CPU instance properties, which will be used
>>> by arm/virt machine. Besides, the cluster-id is also verified or
>>> dumped in various spots:
>>>
>>>    * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>>>      CPU with its NUMA node.
>>>
>>>    * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
>>>      CPU with NUMA node when no default association isn't provided.
>>>
>>>    * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>>>      cluster-id.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/core/machine-hmp-cmds.c |  4 ++++
>>>   hw/core/machine.c          | 16 ++++++++++++++++
>>>   qapi/machine.json          |  6 ++++--
>>>   3 files changed, 24 insertions(+), 2 deletions(-)
>>
>> Missing changes to hw/core/machine-smp.c similar to 'dies' in that
>> file.
>>
>> When 'dies' was added we added a 'dies_supported' flag, so we could
>> reject use of 'dies' when it was not supported - which is everywhere
>> except i386 target.
>>
>> We need the same for 'clusters_supported' machine property since
>> AFAICT only the arm 'virt' machine is getting supported in this
>> series.
> 
> Oh, actually I'm mixing up cluster-id and clusters - the latter is
> already supported.
> 

Yeah, @clusters_supported has been existing for a while.

Thanks,
Gavin


