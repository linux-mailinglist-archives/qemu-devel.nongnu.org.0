Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915A62BCE8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 03:37:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVR3O-0007qG-1e
	for lists+qemu-devel@lfdr.de; Mon, 27 May 2019 21:37:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVR2N-0007Y4-98
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVR2L-0001Hu-Mr
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:36:23 -0400
Received: from mga07.intel.com ([134.134.136.100]:5782)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hVR2L-0001G3-Fx
	for qemu-devel@nongnu.org; Mon, 27 May 2019 21:36:21 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 May 2019 18:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,520,1549958400"; d="scan'208";a="179049679"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2019 18:36:17 -0700
Date: Tue, 28 May 2019 09:35:48 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190528013548.GA8813@richard>
References: <20190411071739.22889-1-richardw.yang@linux.intel.com>
	<20190527142114.521ab953@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527142114.521ab953@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
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

On Mon, May 27, 2019 at 02:21:14PM +0200, Igor Mammedov wrote:
>On Thu, 11 Apr 2019 15:17:39 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> pc_memory_pre_plug() is called during hotplug for both pc-dimm and
>> nvdimm. This is more proper to check apci hotplug capability before
>> check nvdimm specific capability.
>not sure what this about.
>Currently we are checking if ACPI is enabled
>  if (!pcms->acpi_dev || !acpi_enabled) { ...
>before nvdimm check and it looks better to me that we cancel
>nvdimm hotplug earlier than passing it to
>    hotplug_handler_pre_plug(pcms->acpi_dev, dev, &local_err)
>with this patch ACPI device handler will be called before
>nvdimm check happens, so it's +1 unnecessary call chain in
>the case of nvdimm, which I'd rather not have.
>
>Are there any issues with current call flow?
>(commit message doesn't really explaining why we need this patch)
>

My idea is to check more generic requirement and then specific one.

For example, the call flow looks like this:

pc_memory_pre_plug

    piix4_device_pre_plug_cb | ich9_pm_device_pre_plug_cb
        if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
            !lpc->pm.acpi_memory_hotplug.is_enabled)

    if (is_nvdimm && !ms->nvdimms_state->is_enabled)
    

In hotplug_handler_pre_plug(), it checks the acpi hotplug capability. And then
if it has memory hotplug capability and is nvdimm, we check whether nvdimm is
enabled.

This is why I suggest to change the order here. No functional issue for
current code.

-- 
Wei Yang
Help you, Help me

