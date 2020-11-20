Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60932BA631
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:31:06 +0100 (CET)
Received: from localhost ([::1]:38236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2l0-0007Yc-0c
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1kg2if-0005nW-DS
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:28:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:53872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1kg2id-0006Kk-Fm
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:28:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E30EBAC60;
 Fri, 20 Nov 2020 09:28:36 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 20 Nov 2020 09:28:36 +0000
From: Lin Ma <lma@suse.de>
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] qga: Correct loop count in qmp_guest_get_vcpus()
In-Reply-To: <CAJ+F1C+wUoeT-xTA1Rv6XWBBQfEB_mzOXHBBbEt7OcEQ9+84bQ@mail.gmail.com>
References: <20201119084557.27870-1-lma@suse.com>
 <CAJ+F1C+wUoeT-xTA1Rv6XWBBQfEB_mzOXHBBbEt7OcEQ9+84bQ@mail.gmail.com>
User-Agent: Roundcube Webmail
Message-ID: <7594e6cebc51b395c98dbc8714beb7ff@suse.de>
X-Sender: lma@suse.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=lma@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, QEMU <qemu-devel@nongnu.org>,
 Lin Ma <lma@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020-11-19 14:46, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Nov 19, 2020 at 12:48 PM Lin Ma <lma@suse.com> wrote:
> 
>> The guest-get-vcpus returns incorrect vcpu info in case we hotunplug
>> vcpus(not
>> the last one).
>> e.g.:
>> A VM has 4 VCPUs: cpu0 + 3 hotunpluggable online vcpus(cpu1, cpu2 and
>> cpu3).
>> Hotunplug cpu2,  Now only cpu0, cpu1 and cpu3 are present & online.
>> 
>> ./qmp-shell /tmp/qmp-monitor.sock
>> (QEMU) query-hotpluggable-cpus
>> {"return": [
>> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, 
>> "vcpus-count": 1,
>>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
>> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, 
>> "vcpus-count": 1,
>>  "qom-path": "/machine/peripheral/cpu2", "type": "host-x86_64-cpu"},
>> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, 
>> "vcpus-count": 1,
>>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
>> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, 
>> "vcpus-count": 1,
>>  "qom-path": "/machine/unattached/device[0]", "type": 
>> "host-x86_64-cpu"}
>> ]}
>> 
>> (QEMU) device_del id=cpu2
>> {"return": {}}
>> 
>> (QEMU) query-hotpluggable-cpus
>> {"return": [
>> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 3}, 
>> "vcpus-count": 1,
>>  "qom-path": "/machine/peripheral/cpu3", "type": "host-x86_64-cpu"},
>> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 2}, 
>> "vcpus-count": 1,
>>  "type": "host-x86_64-cpu"},
>> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 1}, 
>> "vcpus-count": 1,
>>  "qom-path": "/machine/peripheral/cpu1", "type": "host-x86_64-cpu"},
>> {"props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, 
>> "vcpus-count": 1,
>>  "qom-path": "/machine/unattached/device[0]", "type": 
>> "host-x86_64-cpu"}
>> ]}
>> 
>> Before:
>> ./qmp-shell -N /tmp/qmp-ga.sock
>> Welcome to the QMP low-level shell!
>> Connected
>> (QEMU) guest-get-vcpus
>> {"return": [
>> {"online": true, "can-offline": false, "logical-id": 0},
>> {"online": true, "can-offline": true, "logical-id": 1}]}
>> 
>> After:
>> ./qmp-shell -N /tmp/qmp-ga.sock
>> Welcome to the QMP low-level shell!
>> Connected
>> (QEMU) guest-get-vcpus
>> {"execute":"guest-get-vcpus"}
>> {"return": [
>> {"online": true, "can-offline": false, "logical-id": 0},
>> {"online": true, "can-offline": true, "logical-id": 1},
>> {"online": true, "can-offline": true, "logical-id": 3}]}
>> 
>> Signed-off-by: Lin Ma <lma@suse.com>
>> ---
>>  qga/commands-posix.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>> 
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 3bffee99d4..accc893373 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -2182,15 +2182,15 @@ GuestLogicalProcessorList
>> *qmp_guest_get_vcpus(Error **errp)
>>  {
>>      int64_t current;
>>      GuestLogicalProcessorList *head, **link;
>> -    long sc_max;
>> +    long max_loop_count;
>>      Error *local_err = NULL;
>> 
>>      current = 0;
>>      head = NULL;
>>      link = &head;
>> -    sc_max = SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
>> +    max_loop_count = SYSCONF_EXACT(_SC_NPROCESSORS_CONF, &local_err);
>> 
>> -    while (local_err == NULL && current < sc_max) {
>> +    while (local_err == NULL && current < max_loop_count) {
>>          GuestLogicalProcessor *vcpu;
>>          GuestLogicalProcessorList *entry;
>>          int64_t id = current++;
>> @@ -2206,6 +2206,8 @@ GuestLogicalProcessorList 
>> *qmp_guest_get_vcpus(Error
>> **errp)
>>              entry->value = vcpu;
>>              *link = entry;
>>              link = &entry->next;
>> +        } else {
>> +            max_loop_count += 1;
>> 
> 
> This looks like a recipe for infinite loop on error.
Emm...It is possible.
> 
> Shouldn't we loop over all the /sys/devices/system/cpu/cpu#/ instead?
Originally I'd like to use the function fnmatch to handle pattern cpu# 
to
loop over all of the /sys/devices/system/cpu/cpu#/, But it introduces 
the
header file fnmatch.h and make things complicated a little.

> 
> (possibly parse /sys/devices/system/cpu/present, but I doubt it's 
> necessary)
IMO the 'present' won't help.

I'm about to post the V2, I made tiny change in the V2, Please help to 
review.

BTW, The local_err will be set in case of error, right? It could avoid 
infinite loop.

Thanks a lot,
Lin

