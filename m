Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2C33C7E74
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:18:23 +0200 (CEST)
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3YDu-00066z-Sa
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m3YCY-00058W-GO
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:16:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60040
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m3YCW-0002pQ-IX
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 02:16:58 -0400
Received: from host86-145-86-170.range86-145.btcentralplus.com
 ([86.145.86.170] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m3YCK-0004hO-Ao; Wed, 14 Jul 2021 07:16:48 +0100
To: Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-37-pbonzini@redhat.com>
 <20210713134347.1dc8c4b7.alex.williamson@redhat.com>
 <20210713171000.0e3447f9.alex.williamson@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2e95d601-9449-9331-46b1-5a1bb2f48735@ilande.co.uk>
Date: Wed, 14 Jul 2021 07:16:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713171000.0e3447f9.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.170
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PULL 36/40] vl: switch -M parsing to keyval
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.368,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/07/2021 00:10, Alex Williamson wrote:

> On Tue, 13 Jul 2021 13:43:47 -0600
> Alex Williamson <alex.williamson@redhat.com> wrote:
> 
>> On Tue,  6 Jul 2021 12:01:37 +0200
>> Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>> Switch from QemuOpts to keyval.  This enables the introduction
>>> of non-scalar machine properties, and JSON syntax in the future.
>>>
>>> For JSON syntax to be supported right now, we would have to
>>> consider what would happen if string-based dictionaries (produced by
>>> -M key=val) were to be merged with strongly-typed dictionaries
>>> (produced by -M {'key': 123}).
>>>
>>> The simplest way out is to never enter the situation, and only allow one
>>> -M option when JSON syntax is in use.  However, we want options such as
>>> -smp to become syntactic sugar for -M, and this is a problem; as soon
>>> as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
>>> together with -smp.  Therefore, allowing JSON syntax right now for -M
>>> would be a forward-compatibility nightmare and it would be impossible
>>> anyway to introduce -M incrementally in tools.
>>>
>>> Instead, support for JSON syntax is delayed until after the main
>>> options are converted to QOM compound properties.  These include -boot,
>>> -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
>>> syntax is introduced, these options will _also_ be forbidden together
>>> with -M '{...}'.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   softmmu/vl.c | 315 ++++++++++++++++++++++++---------------------------
>>>   1 file changed, 146 insertions(+), 169 deletions(-)
>>
>> This breaks the below long standing test VM.  libvirt log and xml
>> provided below.  I'm using libvirt version 7.3.0.
> 
> A trivial reproducer:
> 
> qemu-system-x86_64 -blockdev '{"driver":"file","filename":"/usr/share/edk2/ovmf/OVMF_CODE.fd","node-name":"pflash0-storage","auto-read-only":true,"discard":"unmap"}' -blockdev '{"node-name":"pflash0-format","read-only":true,"driver":"raw","file":"pflash0-storage"}' -machine pc,pflash0=pflash0-format
> 
> backtrace:
> 
> #0  error_setg_internal
>      (errp=0x7fffffffd6c8, src=0x55555618bc10 "../../home/alwillia/Work/qemu.git/qapi/qobject-input-visitor.c", line=172, func=0x55555618bf20 <__func__.27> "qobject_input_get_object", fmt=0x55555618bc98 "Parameter '%s' is missing") at ../../home/alwillia/Work/qemu.git/util/error.c:93
> #1  0x0000555555f8d255 in qobject_input_get_object (qiv=0x5555569c59b0, name=0x555556920ef0 "drive", consume=true, errp=0x7fffffffd6c8) at ../../home/alwillia/Work/qemu.git/qapi/qobject-input-visitor.c:172
> #2  0x0000555555f8d28b in qobject_input_get_keyval (qiv=0x5555569c59b0, name=0x555556920ef0 "drive", errp=0x7fffffffd6c8) at ../../home/alwillia/Work/qemu.git/qapi/qobject-input-visitor.c:184
> #3  0x0000555555f8e3a9 in qobject_input_type_str_keyval (v=0x5555569c59b0, name=0x555556920ef0 "drive", obj=0x7fffffffd5a8, errp=0x7fffffffd6c8)
>      at ../../home/alwillia/Work/qemu.git/qapi/qobject-input-visitor.c:551
> #4  0x0000555555f59e51 in visit_type_str (v=0x5555569c59b0, name=0x555556920ef0 "drive", obj=0x7fffffffd5a8, errp=0x7fffffffd6c8) at ../../home/alwillia/Work/qemu.git/qapi/qapi-visit-core.c:337
> #5  0x00005555558c3b70 in set_drive_helper (obj=0x5555569208a0, v=0x5555569c59b0, name=0x555556920ef0 "drive", opaque=0x5555564c8300 <pflash_cfi01_properties>, iothread=false, errp=0x7fffffffd6c8)
>      at ../../home/alwillia/Work/qemu.git/hw/core/qdev-properties-system.c:97
> #6  0x00005555558c3e0b in set_drive (obj=0x5555569208a0, v=0x5555569c59b0, name=0x555556920ef0 "drive", opaque=0x5555564c8300 <pflash_cfi01_properties>, errp=0x7fffffffd6c8)
>      at ../../home/alwillia/Work/qemu.git/hw/core/qdev-properties-system.c:171
> #7  0x0000555555edb821 in field_prop_set (obj=0x5555569208a0, v=0x5555569c59b0, name=0x555556920ef0 "drive", opaque=0x5555564c8300 <pflash_cfi01_properties>, errp=0x7fffffffd6c8)
>      at ../../home/alwillia/Work/qemu.git/hw/core/qdev-properties.c:86
> #8  0x0000555555eb7f15 in object_property_set (obj=0x5555569208a0, name=0x555556920ef0 "drive", v=0x5555569c59b0, errp=0x7fffffffd768) at ../../home/alwillia/Work/qemu.git/qom/object.c:1402
> #9  0x0000555555ebad9e in property_set_alias (obj=0x55555683dde0, v=0x5555569c59b0, name=0x5555566fc8a0 "pflash0", opaque=0x555556920ed0, errp=0x7fffffffd768)
>      at ../../home/alwillia/Work/qemu.git/qom/object.c:2695
> #10 0x0000555555eb7f15 in object_property_set (obj=0x55555683dde0, name=0x5555566fc8a0 "pflash0", v=0x5555569c59b0, errp=0x7fffffffd7b8) at ../../home/alwillia/Work/qemu.git/qom/object.c:1402
> #11 0x0000555555eb3aa3 in object_set_properties_from_qdict (obj=0x55555683dde0, qdict=0x5555566fa5b0, v=0x5555569c59b0, errp=0x5555565d9308 <error_fatal>)
>      at ../../home/alwillia/Work/qemu.git/qom/object_interfaces.c:55
> #12 0x0000555555eb3bc3 in object_set_properties_from_keyval (obj=0x55555683dde0, qdict=0x5555566fa5b0, from_json=false, errp=0x5555565d9308 <error_fatal>)
>      at ../../home/alwillia/Work/qemu.git/qom/object_interfaces.c:79
> #13 0x0000555555cb3f5f in qemu_apply_machine_options (qdict=0x5555566fa5b0) at ../../home/alwillia/Work/qemu.git/softmmu/vl.c:1833
> #14 0x0000555555cb8606 in qemu_init (argc=7, argv=0x7fffffffdae8, envp=0x7fffffffdb28) at ../../home/alwillia/Work/qemu.git/softmmu/vl.c:3634
> #15 0x00005555558326d1 in main (argc=7, argv=0x7fffffffdae8, envp=0x7fffffffdb28) at ../../home/alwillia/Work/qemu.git/softmmu/main.c:49

Is this the same bug fixed by the proposed patch at 
https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg03324.html?


ATB,

Mark.

