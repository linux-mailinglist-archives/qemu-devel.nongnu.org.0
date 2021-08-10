Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2A73E55BB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:42:39 +0200 (CEST)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNLK-0005I7-Mh
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mDNIn-00037z-6L
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:40:01 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:58464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mDNIk-0001jm-Q0
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:40:00 -0400
Received: from fwd32.aul.t-online.de (fwd32.aul.t-online.de [172.20.26.144])
 by mailout04.t-online.de (Postfix) with SMTP id CB2BE2C33;
 Tue, 10 Aug 2021 10:38:38 +0200 (CEST)
Received: from [192.168.211.200]
 (EITHX+ZEQh2KtnJVOdQEnISCuYKwms3TRPDoSmq1o-YRvj7S-q6B6B2pLy1C8+DZCD@[79.208.26.7])
 by fwd32.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mDNHS-3JOhwu0; Tue, 10 Aug 2021 10:38:38 +0200
Subject: Re: [PATCH 3/3] ps2: migration support for command reply queue
To: Gerd Hoffmann <kraxel@redhat.com>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
 <20210807121202.6294-3-vr_qemu@t-online.de>
 <20210809101808.ds3kf37np46gxedc@sirius.home.kraxel.org>
 <87553bd1-6493-d04c-ab44-6a239dde6cbe@t-online.de>
 <20210810054021.m6isaht5yb3pgaoz@sirius.home.kraxel.org>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <cfa666f0-1282-29e4-a798-cd258369f897@t-online.de>
Date: Tue, 10 Aug 2021 10:38:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210810054021.m6isaht5yb3pgaoz@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: EITHX+ZEQh2KtnJVOdQEnISCuYKwms3TRPDoSmq1o-YRvj7S-q6B6B2pLy1C8+DZCD
X-TOI-EXPURGATEID: 150726::1628584718-00006026-97B8228E/0/0 CLEAN NORMAL
X-TOI-MSGID: 43dcfeb1-62b5-4da5-9936-563fe29d80ce
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>    Hi,
>
>> this part actually works. .needed is only evaluated on the sending side. For
>> the receiving side subsections are optional.  Migration doesn't fail if a
>> subsection isn't loaded. Before I sent this patch series one of the
>> migration tests was a migration from 6.0.92 to 6.0.92 with one byte in the
>> command reply queue and 3 bytes in the scancode queue. The migration didn't
>> fail.
> Hmm, ok.  If you actually tested it you are probably right.  My memory
> tells me ->needed() is evaluated on both sending and receiving side as
> the migration data stream does not carry the information whenever a
> subsection is present or not.  But maybe my memories are wrong, or
> things have changed, I don't follow migration changes that closely.
>
>>> If we can't find something we can add a property simliar to the one
>>> for the extended keyboard state.
>> What is the best way to add such a compat property? The ps2 keyboard isn't a
>> qdev device. I can't just add a property to the device class. Do I have to
>> add a property to the i8042 and the pl050 device and propagate the property
>> value with the ps2_kbd_init() call to the PS2KbdState?
> Yes, I think so.  But double-check the migration thing first, if your
> approach works that is the easier way of course.
>
> take care,
>    Gerd
>

Hi Gerd,

this are the results of 5 migrations. I added a trace statement to 
function ps2_common_post_load() in my qemu-master. The first trace line 
is for ps2kbd, the second for ps2mouse.

#1 Migrate qemu 6.0.92 to qemu 6.0.92
   2 scancodes in ps2 keyboard queue

ps2_common_post_load: count 2, ccount 0
ps2_common_post_load: count 0, ccount 0

migration OK

./scripts/analyze-migration.py -f /var/tmp/qemu-state -d desc | less
         {
             "name": "ps2kbd",
             "instance_id": 0,
             "vmsd_name": "ps2kbd",
             "version": 3,
             "fields": [
                 {
                     "name": "common",
                     "type": "struct",
                     "struct": {
                         "vmsd_name": "PS2 Common State",
                         "version": 3,
                         "fields": [
                             {
                                 "name": "write_cmd",
                                 "type": "int32",
                                 "size": 4
                             },
                             {
                                 "name": "queue.rptr",
                                 "type": "int32",
                                 "size": 4
                             },
                             {
                                 "name": "queue.wptr",
                                 "type": "int32",
                                 "size": 4
                             },
                             {
                                 "name": "queue.count",
                                 "type": "int32",
                                 "size": 4
                             },
                             {
                                 "name": "queue.data",
                                 "type": "buffer",
                                 "size": 256
                             }
                         ]
                     },
                     "size": 272
                 },

#2 Migrate qemu 6.0.92 to qemu 6.0.92
   1 command reply and 2 scancodes in ps2 keyboard queue

ps2_common_post_load: count 3, ccount 1
ps2_common_post_load: count 0, ccount 0

migration OK

./scripts/analyze-migration.py -f /var/tmp/qemu-state -d desc | less
         {
             "name": "ps2kbd",
             "instance_id": 0,
             "vmsd_name": "ps2kbd",
             "version": 3,
             "fields": [
                 {
                     "name": "common",
                     "type": "struct",
                     "struct": {
                         "vmsd_name": "PS2 Common State",
                         "version": 3,
                         "fields": [
                             {
                                 "name": "write_cmd",
                                 "type": "int32",
                                 "size": 4
                             },
                             {
                                 "name": "queue.rptr",
                                 "type": "int32",
                                 "size": 4
                             },
                             {
                                 "name": "queue.wptr",
                                 "type": "int32",
                                 "size": 4
                             },
                             {
                                 "name": "queue.count",
                                 "type": "int32",
                                 "size": 4
                             },
                             {
                                 "name": "queue.data",
                                 "type": "buffer",
                                 "size": 256
                             }
                         ]
                     },
                     "size": 272
                 },
                 {
                     "name": "scan_enabled",
                     "type": "int32",
                     "size": 4
                 },
                 {
                     "name": "translate",
                     "type": "int32",
                     "size": 4
                 },
                 {
                     "name": "scancode_set",
                     "type": "int32",
                     "size": 4
                 }
             ],
             "subsections": [
                 {
                     "vmsd_name": "ps2kbd/command_reply_queue",
                     "version": 0,
                     "fields": [
                         {
                             "name": "common.queue.cwptr",
                             "type": "int32",
                             "size": 4
                         }
                     ]
                 }
             ]
         },

#3 Migrate qemu 5.2.0 to qemu 6.0.92
   4 scancodes in ps2 keyboard queue

ps2_common_post_load: count 4, ccount 0
ps2_common_post_load: count 0, ccount 0

Migration OK

#4 Migrate qemu 6.0.92 to qemu 5.2.0
   2 scancodes in ps2 keyboard queue

Migration OK

#5 Migrate qemu 6.0.92 to qemu 5.2.0
   1 command reply and 2 scancodes in ps2 keyboard queue

qemu-system-x86_64: error while loading state for instance 0x0 of device 
'ps2kbd'
qemu-system-x86_64: load of migration failed: No such file or directory

Migration FAILED

With best regards,
Volker

