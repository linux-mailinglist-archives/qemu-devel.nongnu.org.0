Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518F22ACF5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 May 2019 04:31:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hV5QC-0004mt-4z
	for lists+qemu-devel@lfdr.de; Sun, 26 May 2019 22:31:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hV5P4-00048h-OT
	for qemu-devel@nongnu.org; Sun, 26 May 2019 22:30:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hV5P3-00083b-Qm
	for qemu-devel@nongnu.org; Sun, 26 May 2019 22:30:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:39178)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hV5P3-0007vd-Eb
	for qemu-devel@nongnu.org; Sun, 26 May 2019 22:30:21 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2019 19:30:14 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga006.jf.intel.com with ESMTP; 26 May 2019 19:30:12 -0700
Date: Mon, 27 May 2019 10:29:43 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190527022943.GA8993@richard>
References: <20190411071739.22889-1-richardw.yang@linux.intel.com>
	<fc11042f-023f-3396-e68a-22dfd4ab0be7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc11042f-023f-3396-e68a-22dfd4ab0be7@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-devel] [PATCH] hw/i386/pc: check apci hotplug capability
 before nvdimm's
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: pbonzini@redhat.com, rth@twiddle.net,
	Wei Yang <richardw.yang@linux.intel.com>, ehabkost@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 11, 2019 at 10:32:39AM +0200, Thomas Huth wrote:
>On 11/04/2019 09.17, Wei Yang wrote:
>> pc_memory_pre_plug() is called during hotplug for both pc-dimm and
>> nvdimm. This is more proper to check apci hotplug capability before
>> check nvdimm specific capability.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  hw/i386/pc.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index f2c15bf1f2..d48b6f9582 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -2091,17 +2091,17 @@ static void pc_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>>          return;
>>      }
>>  
>> -    if (is_nvdimm && !ms->nvdimms_state->is_enabled) {
>> -        error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M'");
>> -        return;
>> -    }
>> -
>>      hotplug_handler_pre_plug(pcms->acpi_dev, dev, &local_err);
>>      if (local_err) {
>>          error_propagate(errp, local_err);
>>          return;
>>      }
>>  
>> +    if (is_nvdimm && !ms->nvdimms_state->is_enabled) {
>> +        error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M'");
>> +        return;
>> +    }
>> +
>>      pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev),
>>                       pcmc->enforce_aligned_dimm ? NULL : &legacy_align, errp);
>>  }
>
>Works fine for me, too (i.e. no crash with older machine types).
>
>Tested-by: Thomas Huth <thuth@redhat.com>
>

Would someone pick up this one :-)

Thanks

-- 
Wei Yang
Help you, Help me

