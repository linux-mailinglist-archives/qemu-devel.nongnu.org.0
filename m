Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744C62C08A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 09:46:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVWoq-0005MC-7v
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 03:46:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tao3.xu@intel.com>) id 1hVWno-0004pI-Tf
	for qemu-devel@nongnu.org; Tue, 28 May 2019 03:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tao3.xu@intel.com>) id 1hVWnn-0003Fy-RK
	for qemu-devel@nongnu.org; Tue, 28 May 2019 03:45:44 -0400
Received: from mga06.intel.com ([134.134.136.31]:23318)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <tao3.xu@intel.com>)
	id 1hVWnj-00032B-Jx; Tue, 28 May 2019 03:45:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2019 00:45:24 -0700
X-ExtLoop1: 1
Received: from shzintpr02.sh.intel.com (HELO [0.0.0.0]) ([10.239.4.160])
	by orsmga001.jf.intel.com with ESMTP; 28 May 2019 00:45:22 -0700
To: Igor Mammedov <imammedo@redhat.com>
References: <20190508061726.27631-1-tao3.xu@intel.com>
	<20190508061726.27631-4-tao3.xu@intel.com>
	<20190523154743.5fdd4b81@redhat.com>
From: Tao Xu <tao3.xu@intel.com>
Message-ID: <663c8744-78e4-842c-d9e7-91b36ba30d91@intel.com>
Date: Tue, 28 May 2019 15:43:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523154743.5fdd4b81@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: Re: [Qemu-devel] [PATCH v4 03/11] numa: move numa global variable
 numa_info into MachineState
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, jingqi.liu@intel.com,
	qemu-devel@nongnu.org, ehabkost@redhat.com, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, david@gibson.dropbear.id.au, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 23/05/2019 21:47, Igor Mammedov wrote:
> On Wed,  8 May 2019 14:17:18 +0800
> Tao Xu <tao3.xu@intel.com> wrote:
> 
...
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 8ff08814fd..845b737ab9 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -602,7 +602,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>       if (nb_numa_nodes > 0) {
>>           mem_base = binfo->loader_start;
>>           for (i = 0; i < nb_numa_nodes; i++) {
>> -            mem_len = numa_info[i].node_mem;
>> +            mem_len = ms->numa_state->nodes[i].node_mem;
> in 1/11 I've suggested to add nb_numa_nodes, but it might be to add
> a pointer to MachineState there.
> It would also help to simplify arm_load_dtb later as there are other
> bits that we copy to arm_boot_info from MachineState.
> 

Hi Igor,

Thank you for your review. I will simplify arm_load_dtb() in the next 
version of patch and improve the other issues.

Tao

