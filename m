Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B396F256D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 19:18:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psoBO-0008KS-Eb; Sat, 29 Apr 2023 13:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1psoBA-0008Io-Q8
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 13:16:14 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1psoB8-0002Pc-8T
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 13:16:12 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1psoAq-0001tX-SZ; Sat, 29 Apr 2023 19:15:52 +0200
Message-ID: <ebf091d1-54da-9835-3f37-2433d1bc48d0@maciej.szmigiero.name>
Date: Sat, 29 Apr 2023 19:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <cover.1682584770.git.maciej.szmigiero@oracle.com>
 <f6adc90d94f4ee6be8051c11b9f4a5ff507e7e49.1682584770.git.maciej.szmigiero@oracle.com>
 <03741af0-5983-32c1-7649-7b879dd6f02b@linaro.org>
Content-Language: en-US, pl-PL
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH v4 3/3] Add a Hyper-V Dynamic Memory Protocol driver
 (hv-balloon)
In-Reply-To: <03741af0-5983-32c1-7649-7b879dd6f02b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 29.04.2023 00:59, Philippe Mathieu-Daudé wrote:
> On 27/4/23 11:08, Maciej S. Szmigiero wrote:
>> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>>
>> This driver is like virtio-balloon on steroids: it allows both changing the
>> guest memory allocation via ballooning and inserting pieces of extra RAM
>> into it on demand from a provided memory backend.
>>
>> One of advantages of these over ACPI-based PC DIMM hotplug is that such
>> memory can be hotplugged in much smaller granularity because the ACPI DIMM
>> slot limit does not apply.
>>
>> In order to enable hot-adding additional memory a new memory backend needs
>> to be created and provided to the driver via the "memdev" parameter.
>> This can be achieved by, for example, adding
>> "-object memory-backend-ram,id=mem1,size=32G" to the QEMU command line and
>> then instantiating the driver with "memdev=mem1" parameter.
>>
>> In contrast with ACPI DIMM hotplug where one can only request to unplug a
>> whole DIMM stick this driver allows removing memory from guest in single
>> page (4k) units via ballooning.
>>
>> The actual resizing is done via ballooning interface (for example, via
>> the "balloon" HMP command)
>> This includes resizing the guest past its boot size - that is, hot-adding
>> additional memory in granularity limited only by the guest alignment
>> requirements.
>>
>> After a VM reboot the guest is back to its original (boot) size.
>>
>> In the future, the guest boot memory size might be changed on reboot
>> instead, taking into account the effective size that VM had before that
>> reboot (much like Hyper-V does).
>>
>> For performance reasons, the guest-released memory is tracked in a few
>> range trees, as a series of (start, count) ranges.
>> Each time a new page range is inserted into such tree its neighbors are
>> checked as candidates for possible merging with it.
>>
>> Besides performance reasons, the Dynamic Memory protocol itself uses page
>> ranges as the data structure in its messages, so relevant pages need to be
>> merged into such ranges anyway.
>>
>> One has to be careful when tracking the guest-released pages, since the
>> guest can maliciously report returning pages outside its current address
>> space, which later clash with the address range of newly added memory.
>> Similarly, the guest can report freeing the same page twice.
>>
>> The above design results in much better ballooning performance than when
>> using virtio-balloon with the same guest: 230 GB / minute with this driver
>> versus 70 GB / minute with virtio-balloon.
>>
>> During a ballooning operation most of time is spent waiting for the guest
>> to come up with newly freed page ranges, processing the received ranges on
>> the host side (in QEMU and KVM) is nearly instantaneous.
>>
>> The unballoon operation is also pretty much instantaneous:
>> thanks to the merging of the ballooned out page ranges 200 GB of memory can
>> be returned to the guest in about 1 second.
>> With virtio-balloon this operation takes about 2.5 minutes.
>>
>> These tests were done against a Windows Server 2019 guest running on a
>> Xeon E5-2699, after dirtying the whole memory inside guest before each
>> balloon operation.
>>
>> Using a range tree instead of a bitmap to track the removed memory also
>> means that the solution scales well with the guest size: even a 1 TB range
>> takes just a few bytes of such metadata.
>>
>> Since the required GTree operations aren't present in every Glib version
>> a check for them was added to "configure" script, together with new
>> "--enable-hv-balloon" and "--disable-hv-balloon" arguments.
>> If these GTree operations are missing in the system's Glib version this
>> driver will be skipped during QEMU build.
>>
>> An optional "status-report=on" device parameter requests memory status
>> events from the guest (typically sent every second), which allow the host
>> to learn both the guest memory available and the guest memory in use
>> counts.
>> They are emitted externally as "HV_BALLOON_STATUS_REPORT" QMP events.
>>
>> The driver is named hv-balloon since the Linux kernel client driver for
>> the Dynamic Memory Protocol is named as such and to follow the naming
>> pattern established by the virtio-balloon driver.
>> The whole protocol runs over Hyper-V VMBus.
>>
>> The driver was tested against Windows Server 2012 R2, Windows Server 2016
>> and Windows Server 2019 guests and obeys the guest alignment requirements
>> reported to the host via DM_CAPABILITIES_REPORT message.
>>
>> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
>> ---
>>   Kconfig.host           |    3 +
>>   configure              |   36 +
>>   hw/hyperv/Kconfig      |    5 +
>>   hw/hyperv/hv-balloon.c | 2040 ++++++++++++++++++++++++++++++++++++++++
>>   hw/hyperv/meson.build  |    1 +
>>   hw/hyperv/trace-events |   16 +
>>   meson.build            |    4 +-
>>   qapi/machine.json      |   25 +
>>   8 files changed, 2129 insertions(+), 1 deletion(-)
>>   create mode 100644 hw/hyperv/hv-balloon.c
>>
>> diff --git a/Kconfig.host b/Kconfig.host
>> index d763d89269..2ee71578f3 100644
>> --- a/Kconfig.host
>> +++ b/Kconfig.host
>> @@ -46,3 +46,6 @@ config FUZZ
>>   config VFIO_USER_SERVER_ALLOWED
>>       bool
>>       imply VFIO_USER_SERVER
>> +
>> +config HV_BALLOON_POSSIBLE
>> +    bool
> 
> Should this be restricted to little-endian hosts?

"HV_BALLOON_POSSIBLE" just means that the glib version is new enough to
build this driver.

The driver is x86-specific, that's why it ("HV_BALLOON") depends on
"VMBUS", which depends on "HYPERV", which is "default n" and selected
only by "PC".

Thanks,
Maciej


