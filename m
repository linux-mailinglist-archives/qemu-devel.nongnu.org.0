Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A436AEAEE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:38:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbGN-0003oc-0t; Tue, 07 Mar 2023 12:38:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZbGL-0003nw-Az
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZbGJ-0003xx-1N
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678210685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N07NOrmF/af/LqknqhXDPQaetqT+tlSQy0zbCBgdmFI=;
 b=B9vYCDMy+Osrb+0NqACKNd/0TFlOuWnwMEXwPwnTfoZINg0oa7QiN6J3DGBYpnlQ3yIu8s
 xyzQNpWEUOmoFeSkwzeChW4klgU856iIUQGiQftrkLeCfAI8uPryW0f2JKbCRI82iSKA98
 Ghf0AJjPFFc2caEBxPEBMoavnxCS7Io=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-SHvO3yAfOMiAYmmh9Yhm6g-1; Tue, 07 Mar 2023 12:38:02 -0500
X-MC-Unique: SHvO3yAfOMiAYmmh9Yhm6g-1
Received: by mail-wm1-f69.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso5042161wmb.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678210681;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N07NOrmF/af/LqknqhXDPQaetqT+tlSQy0zbCBgdmFI=;
 b=stHG9Hr8+Jv8se49CQ/gkYF7EV30DI1CfLJsnOO4ljsVrGBWfGX7L/fS6FI34jEykR
 xbckA/gHeiBsH2Dt72Dg3Oom+pxoZ/mLJWqePNBkYxatE2U6DcNBLukMeBWs0kFffp2u
 bCuepS8HtLQCFDKcnt0PYNWxExtTL2E8E23szerSwXsugkPo1mhkpZ0wi9Fr3xc52gNR
 4reASCQZ1McvZEEOgqBpFV5SatQmJFFs0ybB94SwOLkw5GXn5PAbFcTf8cZ3OBQHsaOp
 HA2RtC2VppyrVw3cPPV9sxaLfWxwA6Pg276FQyUwNNTL1kBAwuTuzoZlmDYfTuJ0V3Gv
 1JFQ==
X-Gm-Message-State: AO0yUKV9YKsrGyckSyutf4t1UoJzWU3TdRIA2MQ09szRN+aob6zItVAc
 7glSu+1VqXPnyv01H7ZhHR5zZyAtlpVLzCVh5A62tdcogXUjEXCN19hMecYyEjVd+Plv7wYNHdn
 bWko0wbv33neLWUg=
X-Received: by 2002:a5d:4046:0:b0:2cb:85ba:24f9 with SMTP id
 w6-20020a5d4046000000b002cb85ba24f9mr9265910wrp.66.1678210681542; 
 Tue, 07 Mar 2023 09:38:01 -0800 (PST)
X-Google-Smtp-Source: AK7set98h4Sg9ghY8klQxwoN4EpphqmJ8WtQ6ClxKz5MkJt8YpUCenP3IGXj2Z6mFPfTd4ix2ITq/A==
X-Received: by 2002:a5d:4046:0:b0:2cb:85ba:24f9 with SMTP id
 w6-20020a5d4046000000b002cb85ba24f9mr9265888wrp.66.1678210681242; 
 Tue, 07 Mar 2023 09:38:01 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 t1-20020a5d49c1000000b002c563b124basm12901446wrs.103.2023.03.07.09.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:38:00 -0800 (PST)
Date: Tue, 7 Mar 2023 12:37:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Dave Jiang <dave.jiang@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 0/7] QEMU CXL Provide mock CXL events and irq support
Message-ID: <20230307123733-mutt-send-email-mst@kernel.org>
References: <20230303152903.28103-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303152903.28103-1-Jonathan.Cameron@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Mar 03, 2023 at 03:28:56PM +0000, Jonathan Cameron wrote:
> Whilst I'm an optimist, I suspect this is now 8.1 material because we have
> 5 CXL patch sets outstanding before it.

Yea let's not. I merged what I felt is safe.

> Current bottleneck being QAPI review
> for the RAS error series.
> 
> v4 changes: Thanks to Ira and to some feedback I received off list.
> - More endian fixes for a future big endian architecture using it.
> - Comment typo
> 
> One challenge here is striking the right balance between lots of constraints
> in the injection code to enforce particular reserved bits etc by breaking
> out all the flags as individual parameters vs having a reasonably concise
> API.  I think this set strikes the right balance but others may well
> disagree :)   Note that Ira raised the question of whether we should be
> automatically establishing the volatile flag based on the Device Physical
> Address of the injected error. My proposal is to not do so for now, but
> to possibly revisit tightening the checking of injected errors in future.
> Whilst the volatile flag is straight forwards, some of the other flags that
> could be automatically set (or perhaps checked for validiaty) are much more
> complex. Adding verification at this stage would greatly increase the
> complexity of the patch + we are missing other elements that would interact
> with this.  I'm not concerned about potential breaking of backwards compatibility
> if it only related to the injection of errors that make no sense for a real
> device.
> 
> Based on following series (in order)
> 1. [PATCH v4 00/10] hw/cxl: CXL emulation cleanups and minor fixes for upstream
> (in staging currently so fingers crossed that one is fine)
> 2. [PATCH v6 0/8] hw/cxl: RAS error emulation and injection
> 3. [PATCH v2 0/2] hw/cxl: Passthrough HDM decoder emulation
> 4. [PATCH v4 0/2] hw/mem: CXL Type-3 Volatile Memory Support
> 5. [PATCH v4 0/6] hw/cxl: Poison get, inject, clear
> 
> Based on: Message-Id: 20230206172816.8201-1-Jonathan.Cameron@huawei.com
> Based-on: Message-id: 20230227112751.6101-1-Jonathan.Cameron@huawei.com
> Based-on: Message-id: 20230227153128.8164-1-Jonathan.Cameron@huawei.com
> Based-on: Message-id: 20230227163157.6621-1-Jonathan.Cameron@huawei.com
> Based-on: Message-id: 20230303150908.27889-1-Jonathan.Cameron@huawei.com
> 
> v2 cover letter.
> 
> CXL Event records inform the OS of various CXL device events.  Thus far CXL
> memory devices are emulated and therefore don't naturally generate events.
> 
> Add an event infrastructure and mock event injection.  Previous versions
> included a bulk insertion of lots of events.  However, this series focuses on
> providing the ability to inject individual events through QMP.  Only the
> General Media Event is included in this series as an example.  Other events can
> be added pretty easily once the infrastructure is acceptable.
> 
> In addition, this version updates the code to be in line with the
> specification based on discussions around the kernel patches.
> 
> Injection examples;
> 
> { "execute": "cxl-inject-gen-media-event",
>     "arguments": {
>         "path": "/machine/peripheral/cxl-mem0",
>         "log": "informational",
>         "flags": 1,
>         "physaddr": 1000,
>         "descriptor": 3,
>         "type": 3,
>         "transaction-type": 192,
>         "channel": 3,
>         "device": 5,
>         "component-id": "iras mem"
>     }}
> 
> 
> { "execute": "cxl-inject-dram-event",
>     "arguments": {
>         "path": "/machine/peripheral/cxl-mem0",
>         "log": "informational",
>         "flags": 1,
>         "physaddr": 1000,
>         "descriptor": 3,
>         "type": 3,
>         "transaction-type": 192,
>         "channel": 3,
>         "rank": 17,
>         "nibble-mask": 37421234,
>         "bank-group": 7,
>         "bank": 11,
>         "row": 2,
>         "column": 77,
>         "correction-mask": [33, 44, 55, 66]
>     }}
> 
> { "execute": "cxl-inject-memory-module-event",
>   "arguments": {
>     "path": "/machine/peripheral/cxl-mem0",
>     "log": "informational",
>     "flags": 1,
>     "type": 3,
>     "health-status": 3,
>     "media-status": 7,
>     "additional-status": 33,
>     "life-used": 30,
>     "temperature": -15,
>     "dirty-shutdown-count": 4,
>     "corrected-volatile-error-count": 3233,
>     "corrected-persistent-error-count": 1300
>   }}
> 
> 
> Ira Weiny (4):
>   hw/cxl/events: Add event status register
>   hw/cxl/events: Wire up get/clear event mailbox commands
>   hw/cxl/events: Add event interrupt support
>   hw/cxl/events: Add injection of General Media Events
> 
> Jonathan Cameron (3):
>   hw/cxl: Move CXLRetCode definition to cxl_device.h
>   hw/cxl/events: Add injection of DRAM events
>   hw/cxl/events: Add injection of Memory Module Events
> 
>  hw/cxl/cxl-device-utils.c   |  43 +++++-
>  hw/cxl/cxl-events.c         | 248 ++++++++++++++++++++++++++++++
>  hw/cxl/cxl-mailbox-utils.c  | 166 ++++++++++++++------
>  hw/cxl/meson.build          |   1 +
>  hw/mem/cxl_type3.c          | 292 +++++++++++++++++++++++++++++++++++-
>  hw/mem/cxl_type3_stubs.c    |  35 +++++
>  include/hw/cxl/cxl_device.h |  80 +++++++++-
>  include/hw/cxl/cxl_events.h | 168 +++++++++++++++++++++
>  qapi/cxl.json               | 120 +++++++++++++++
>  9 files changed, 1097 insertions(+), 56 deletions(-)
>  create mode 100644 hw/cxl/cxl-events.c
>  create mode 100644 include/hw/cxl/cxl_events.h
> 
> -- 
> 2.37.2


