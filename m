Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3122E9B4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 02:29:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hW8wt-0002t3-TO
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 20:29:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hW8vl-0002aT-Fe
	for qemu-devel@nongnu.org; Wed, 29 May 2019 20:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hW8vk-00024y-6X
	for qemu-devel@nongnu.org; Wed, 29 May 2019 20:28:29 -0400
Received: from mga03.intel.com ([134.134.136.65]:65534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hW8vj-00023g-UV
	for qemu-devel@nongnu.org; Wed, 29 May 2019 20:28:28 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 May 2019 17:28:25 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 29 May 2019 17:28:23 -0700
Date: Thu, 30 May 2019 08:27:54 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190530002754.GA24526@richard>
References: <20190411071739.22889-1-richardw.yang@linux.intel.com>
	<20190527142114.521ab953@redhat.com>
	<20190528013548.GA8813@richard>
	<20190528142627.6841e91a@redhat.com>
	<20190529003214.GA24428@richard>
	<20190529105750.696fe6d2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529105750.696fe6d2@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
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
Cc: thuth@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
	Wei Yang <richardw.yang@linux.intel.com>, pbonzini@redhat.com,
	rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 29, 2019 at 10:57:50AM +0200, Igor Mammedov wrote:
>On Wed, 29 May 2019 08:32:14 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> On Tue, May 28, 2019 at 02:26:27PM +0200, Igor Mammedov wrote:
>> >On Tue, 28 May 2019 09:35:48 +0800
>> >Wei Yang <richardw.yang@linux.intel.com> wrote:
>> >  
>> >> On Mon, May 27, 2019 at 02:21:14PM +0200, Igor Mammedov wrote:  
>> >> >On Thu, 11 Apr 2019 15:17:39 +0800
>> >> >Wei Yang <richardw.yang@linux.intel.com> wrote:
>> >> >    
>> >> >> pc_memory_pre_plug() is called during hotplug for both pc-dimm and
>> >> >> nvdimm. This is more proper to check apci hotplug capability before
>> >> >> check nvdimm specific capability.    
>> >> >not sure what this about.
>> >> >Currently we are checking if ACPI is enabled
>> >> >  if (!pcms->acpi_dev || !acpi_enabled) { ...
>> >> >before nvdimm check and it looks better to me that we cancel
>> >> >nvdimm hotplug earlier than passing it to
>> >> >    hotplug_handler_pre_plug(pcms->acpi_dev, dev, &local_err)
>> >> >with this patch ACPI device handler will be called before
>> >> >nvdimm check happens, so it's +1 unnecessary call chain in
>> >> >the case of nvdimm, which I'd rather not have.
>> >> >
>> >> >Are there any issues with current call flow?
>> >> >(commit message doesn't really explaining why we need this patch)
>> >> >    
>> >> 
>> >> My idea is to check more generic requirement and then specific one.
>> >> 
>> >> For example, the call flow looks like this:
>> >> 
>> >> pc_memory_pre_plug
>> >> 
>> >>     piix4_device_pre_plug_cb | ich9_pm_device_pre_plug_cb
>> >>         if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
>> >>             !lpc->pm.acpi_memory_hotplug.is_enabled)
>> >> 
>> >>     if (is_nvdimm && !ms->nvdimms_state->is_enabled)
>> >>     
>> >> 
>> >> In hotplug_handler_pre_plug(), it checks the acpi hotplug capability. And then
>> >> if it has memory hotplug capability and is nvdimm, we check whether nvdimm is
>> >> enabled.  
>> >
>> >I don't think pc_memory_pre_plug() should rely on what hotplug_handler_pre_plug()
>> >checks or does. Similarly the later is taking care of whatever piix4 needs to care
>> >and shouldn't care about what machine code does.
>> >  
>> 
>> Agree. It is not proper to let hotplug_handler_pre_plug() take care about
>> machine code.
>> 
>> >Moreover when hotplug_handler_pre_plug() starts to reserve resources, then
>> >if you move check as suggested you'd need to rollback all that
>> >hotplug_handler_pre_plug() done to gracefully abort hotplug.
>> >  
>> 
>> Confused.
>> 
>> hotplug_handler_pre_plug() doesn't reserve resources.
>
>
>it's not currently, but if it would it would not work with your patch properly
>or break unexpectedly since whoever would change hotplug_handler_pre_plug()
>might not notice that machine code need to be taken care of.
>
>Try to consider devices and machine as separate libraries. Which should
>in reasonable limits be independent and work through documented interfaces.
>In that case likehood of breaking something would be less than relying on
>current code impl./call order with implicit inter-dependencies. 
>

So the logic here is check machine then device, right? I think this is
reasonable. To be honest, this rule is not that obvious.

Anyway, I think what you mentioned make sense. Thanks

-- 
Wei Yang
Help you, Help me

