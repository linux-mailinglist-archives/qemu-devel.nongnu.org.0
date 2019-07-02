Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194775CC3C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 10:52:37 +0200 (CEST)
Received: from localhost ([::1]:50732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiEWh-0004RY-1Z
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 04:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57636)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hiEUh-0003WZ-86
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hiEUg-0007PS-00
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:50:31 -0400
Received: from mga12.intel.com ([192.55.52.136]:64992)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hiEUf-0007Mr-MD
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:50:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 01:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="362549433"
Received: from txu2-mobl.ccr.corp.intel.com (HELO [10.239.196.241])
 ([10.239.196.241])
 by fmsmga006.fm.intel.com with ESMTP; 02 Jul 2019 01:50:24 -0700
To: Igor Mammedov <imammedo@redhat.com>
References: <20190614155626.27932-1-tao3.xu@intel.com>
 <20190614155626.27932-7-tao3.xu@intel.com>
 <20190701132532.2699a98a@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <77ae1297-edb1-dcb2-b57e-e9e01b64139a@intel.com>
Date: Tue, 2 Jul 2019 16:50:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190701132532.2699a98a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-devel] [PATCH v5 6/8] hmat acpi: Build Memory Subsystem
 Address Range Structure(s) in ACPI HMAT
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
Cc: ehabkost@redhat.com, jingqi.liu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/2019 7:25 PM, Igor Mammedov wrote:
> On Fri, 14 Jun 2019 23:56:24 +0800
> Tao Xu <tao3.xu@intel.com> wrote:
> 
...
>> @@ -2710,6 +2711,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>>               acpi_add_table(table_offsets, tables_blob);
>>               build_slit(tables_blob, tables->linker, machine);
>>           }
>> +        acpi_add_table(table_offsets, tables_blob);
>> +        build_hmat(tables_blob, tables->linker, machine);
> I'm not sure if we should add it unconditionally.
> Is this table used in any meaningful manner by guest when
> it's incomplete (i.e. populated only with SPA records)?
> 
Hi Igor,

In ACPI 6.2, the linux kernel use it to show the memory ranges' 
node-id(Proximity Domain). In ACPI 6.3, the linux kernel use it to show 
the numa node's closest initiator(Generic Initiator or Processor, directly
attached). It is useful for a memory only numa node, because with 
SPA(renamed as "Memory Proximity Domain Attributes Structure" in ACPI 
6.3) the user-space can know the topology of hardware heterogeneous 
memory. I think I should add a doc to describe the use case in QEMU.

Therefore, the numa CLI may be lack of a input which can indicate the 
Initiator of a memory only numa node. Dan suggested me to add a new 
parameter for that[1].

Maybe like:
-numa node,mem=4G,nodeid=2,initiator=0

[1] https://patchwork.kernel.org/cover/10934417/

Thanks

Tao












