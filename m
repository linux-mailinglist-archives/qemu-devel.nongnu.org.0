Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD61057C71C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:09:24 +0200 (CEST)
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oESBO-0007Rz-HL
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oES3q-0003VJ-4G
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oES3m-00037q-Nu
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658394090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5OW+3vAp/+8JjLwpf3YhzDeh4dc7p2wAwBSU3S2jqc=;
 b=Vr2dG36Cb7mwzfXRu4SQn4E9nQwW9TcEsa+q539eqvBwFnRwqdZd+yInAgw84VhWZuj+Dw
 E5P8yoPq5MvXRJz7bI23K0ASZHbpMdJRxj/071GTM53vVxO3sJJX7Fw49VDhHi/1RJwEsk
 QNaDTWoeIL3u/xbGheOgJCxWdMj/Uxk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448--b1A42hZPQOB0y_nILdicw-1; Thu, 21 Jul 2022 05:01:28 -0400
X-MC-Unique: -b1A42hZPQOB0y_nILdicw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v67-20020a1cac46000000b003a2be9fa09cso731441wme.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 02:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=N5OW+3vAp/+8JjLwpf3YhzDeh4dc7p2wAwBSU3S2jqc=;
 b=QdUYEMcEt8W+NBpHoSsirvTZ6wH6imHpLPzR7okhIdUk+PJLyLJ9HWBD+5hO7zWptf
 EBx6BlfPtXCXgqnhhWZNc4WhUn99H0Yo3MOExmBHN9Kb7Gxvf6T43dDbAXxxvj1dWKym
 ukQdf9TyVAjs6gtE1nU+8yhKCcJr1tv+maaVGxLbpbK7/04lOpI97tvbnDlp6OEv1asJ
 +m3psFNtdtO9xPE9a3CVABn/7gaXa20y+BO07RFM07IsB4k4Xo0NtVDFLm9obd0hB0mh
 aBOh+a5sPwgKZUZ/FH64eUj5StUnMX2D/5tCJ5hRj9HiGoVCXqsfUqUpWwfNjiw/UIPu
 zeLA==
X-Gm-Message-State: AJIora/1E8IFk8wwZO9SORTBdnL718gNEb2N/8WFRM1ofJ1W3S1XmVZH
 GW9NaKY8NU/I4lG6B3ZmkrYxe4M25Odn8SSIRbyGULF8tP8AooYAiU7o04b/SSDZj4mmHycIq9z
 gnxw0iiG43HUJwCg=
X-Received: by 2002:a5d:6dab:0:b0:21d:9fc8:3029 with SMTP id
 u11-20020a5d6dab000000b0021d9fc83029mr33823508wrs.172.1658394087683; 
 Thu, 21 Jul 2022 02:01:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tCydCtL/OtkpeuekmsJh+NhHypUEDRK4XWlh0TbauEREITpTWub0CQVfou8nboltjAinGepA==
X-Received: by 2002:a5d:6dab:0:b0:21d:9fc8:3029 with SMTP id
 u11-20020a5d6dab000000b0021d9fc83029mr33823464wrs.172.1658394087195; 
 Thu, 21 Jul 2022 02:01:27 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-217.web.vodafone.de.
 [109.43.179.217]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm1090958wmr.42.2022.07.21.02.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 02:01:26 -0700 (PDT)
Message-ID: <5d7dbb8c-e7c0-3d7c-a721-eb625fe11c93@redhat.com>
Date: Thu, 21 Jul 2022 11:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Failure in iotest 183
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <f629134d-0ce2-46df-13b5-30b735f6bd3d@redhat.com>
 <308c543a-5f72-b0f4-15d4-b98d4db6f4f2@redhat.com>
 <3efdf6ae-1ace-6db6-e947-e6288c41acd7@redhat.com>
In-Reply-To: <3efdf6ae-1ace-6db6-e947-e6288c41acd7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/2022 12.20, Thomas Huth wrote:
> On 05/07/2022 11.58, Hanna Reitz wrote:
>> On 05.07.22 11:35, Thomas Huth wrote:
>>>
>>>  Hi!
>>>
>>> I've just hit a failure in iotest 183:
>>>
>>> --- /home/thuth/devel/qemu/tests/qemu-iotests/183.out
>>> +++ /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch/183/183.out.bad
>>> @@ -30,7 +30,7 @@
>>>         'arguments': { 'uri': 'unix:SOCK_DIR/migrate', 'blk': true } }
>>>  {"return": {}}
>>>  { 'execute': 'query-status' }
>>> -{"return": {"status": "postmigrate", "singlestep": false, "running": 
>>> false}}
>>> +{"return": {"status": "completed", "setup-time": 0, "downtime": 2448, 
>>> "total-time": 2872, "ram": {"total": 134750208, "postcopy-requests": 0, 
>>> "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 0, 
>>> "downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 
>>> 0, "mbps": 188.63209192200557, "transferred": 496829, "precopy-bytes": 
>>> 496829, "duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, 
>>> "normal-bytes": 200704, "normal": 49}}}
>>
>> Weird because query-status cannot return something with '"status": 
>> "completed"' in it.  We can see the '"status": "postmigrate"' object 
>> somewhere below, so it seems to me like the silent=yes part for the 
>> query-migrate execution didn’t work as intended.
>>
>> (And it does seem to work below, when waiting for a “100 %” to appear on 
>> $dest.)
>>
>> It’s been a while since we’ve touched common.qemu, so nothing comes to my 
>> mind immediately that might have broken this.
> ...
>> I’ve never hit this so far.
>>
>> The only things to try I can come up with would be to bisect, or to try 
>> adding `silent=$silent` to the `_timed_wait_for` calls in `send_qemu_cmd`...
> 
> Seems also like it does not reproduce that easily, though - I've just seen 
> it once so far while running "make -j6 check SPEED=slow", so lots of other 
> stuff was happening at the same time. I'll keep an eye on it to see whether 
> I can reproduce it more easily somehow.

I just reproduced it by running "./check -raw -j8" directly:

--- /home/thuth/devel/qemu/tests/qemu-iotests/183.out
+++ /home/thuth/tmp/qemu-build/tests/qemu-iotests/scratch/183/183.out.bad
@@ -30,7 +30,7 @@
         'arguments': { 'uri': 'unix:SOCK_DIR/migrate', 'blk': true } }
  {"return": {}}
  { 'execute': 'query-status' }
-{"return": {"status": "postmigrate", "singlestep": false, "running": false}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 1003, 
"total-time": 1537, "ram": {"total": 134750208, "postcopy-requests": 0, 
"dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 288578, 
"downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, 
"mbps": 352.48204554326611, "transferred": 497205, "precopy-bytes": 497205, 
"duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 
200704, "normal": 49}}}

  === Do some I/O on the destination ===

@@ -53,8 +53,16 @@
  === Shut down and check image ===

  {"execute":"quit"}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 1003, 
"total-time": 1537, "ram": {"total": 134750208, "postcopy-requests": 0, 
"dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 288578, 
"downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, 
"mbps": 352.48204554326611, "transferred": 497205, "precopy-bytes": 497205, 
"duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 
200704, "normal": 49}}}
+{"execute":"quit"}
  {"return": {}}
-{"execute":"quit"}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 1003, 
"total-time": 1537, "ram": {"total": 134750208, "postcopy-requests": 0, 
"dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 288578, 
"downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, 
"mbps": 352.48204554326611, "transferred": 497205, "precopy-bytes": 497205, 
"duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 
200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 1003, 
"total-time": 1537, "ram": {"total": 134750208, "postcopy-requests": 0, 
"dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 288578, 
"downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, 
"mbps": 352.48204554326611, "transferred": 497205, "precopy-bytes": 497205, 
"duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 
200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 1003, 
"total-time": 1537, "ram": {"total": 134750208, "postcopy-requests": 0, 
"dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 288578, 
"downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, 
"mbps": 352.48204554326611, "transferred": 497205, "precopy-bytes": 497205, 
"duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 
200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 1003, 
"total-time": 1537, "ram": {"total": 134750208, "postcopy-requests": 0, 
"dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 288578, 
"downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, 
"mbps": 352.48204554326611, "transferred": 497205, "precopy-bytes": 497205, 
"duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 
200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 1003, 
"total-time": 1537, "ram": {"total": 134750208, "postcopy-requests": 0, 
"dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 288578, 
"downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, 
"mbps": 352.48204554326611, "transferred": 497205, "precopy-bytes": 497205, 
"duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 
200704, "normal": 49}}}
+{"return": {"status": "completed", "setup-time": 0, "downtime": 1003, 
"total-time": 1537, "ram": {"total": 134750208, "postcopy-requests": 0, 
"dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 288578, 
"downtime-bytes": 0, "page-size": 4096, "remaining": 0, "postcopy-bytes": 0, 
"mbps": 352.48204554326611, "transferred": 497205, "precopy-bytes": 497205, 
"duplicate": 32849, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 
200704, "normal": 49}}}
+{"return": {"status": "postmigrate", "singlestep": false, "running": false}}
  {"return": {}}
  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, 
"event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, 
"event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}

It does not seem to happen if I run with "-j1" instead.

  Thomas


