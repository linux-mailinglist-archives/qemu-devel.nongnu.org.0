Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354644CFF2C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:52:47 +0100 (CET)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCr0-00050v-9h
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nRBOh-0002pk-4t
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:19:27 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:43982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nRBOe-0006CB-JQ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:19:26 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA1071F396;
 Mon,  7 Mar 2022 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646651962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vl5xN4HtNxVpxsBpqTO1mxg1ulwSlC7b9hV0ok5NfiY=;
 b=klCMHqL4/kUQkS8+Inp76mcmARGq45mgg549E2H62NqwqocwFMndDRmj8yaUl069g+4JCN
 5hzFe7m5GdCb+5TlDbF4tb9qooviqH9GKbKIvEy4TA0tlU57AaScwarjxLaTvOmmHm+yqL
 R768R1stp97i9T9QszYQFKdty2XBAqk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646651962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vl5xN4HtNxVpxsBpqTO1mxg1ulwSlC7b9hV0ok5NfiY=;
 b=JzaHOkBwIgkdveRxxvYIpiH3Lpd0oQhu+RJ8OYc3+5ai3NklzsncD/ysMQWdIR2DshTsO7
 6LMudAAupW63a9BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B001713AF0;
 Mon,  7 Mar 2022 11:19:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b01VKTrqJWJyRwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 07 Mar 2022 11:19:22 +0000
From: Claudio Fontana <cfontana@suse.de>
Subject: Re: starting to look at qemu savevm performance, a first regression
 detected
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <8826b03d-e5e9-0e65-cab7-ea1829f48e6c@suse.de>
 <YiXQHIWtHx5BocxK@redhat.com> <62ba8b1e-d641-5b10-c1b3-54b7d5a652e7@suse.de>
 <YiXVh1P4oJNuEtFM@redhat.com>
Message-ID: <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
Date: Mon, 7 Mar 2022 12:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YiXVh1P4oJNuEtFM@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 10:51 AM, Daniel P. Berrangé wrote:
> On Mon, Mar 07, 2022 at 10:44:56AM +0100, Claudio Fontana wrote:
>> Hello Daniel,
>>
>> On 3/7/22 10:27 AM, Daniel P. Berrangé wrote:
>>> On Sat, Mar 05, 2022 at 02:19:39PM +0100, Claudio Fontana wrote:
>>>>
>>>> Hello all,
>>>>
>>>> I have been looking at some reports of bad qemu savevm performance in large VMs (around 20+ Gb),
>>>> when used in libvirt commands like:
>>>>
>>>>
>>>> virsh save domain /dev/null
>>>>
>>>>
>>>>
>>>> I have written a simple test to run in a Linux centos7-minimal-2009 guest, which allocates and touches 20G mem.
>>>>
>>>> With any qemu version since around 2020, I am not seeing more than 580 Mb/Sec even in the most ideal of situations.
>>>>
>>>> This drops to around 122 Mb/sec after commit: cbde7be900d2a2279cbc4becb91d1ddd6a014def .
>>>>
>>>> Here is the bisection for this particular drop in throughput:
>>>>
>>>> commit cbde7be900d2a2279cbc4becb91d1ddd6a014def (HEAD, refs/bisect/bad)
>>>> Author: Daniel P. Berrangé <berrange@redhat.com>
>>>> Date:   Fri Feb 19 18:40:12 2021 +0000
>>>>
>>>>     migrate: remove QMP/HMP commands for speed, downtime and cache size
>>>>     
>>>>     The generic 'migrate_set_parameters' command handle all types of param.
>>>>     
>>>>     Only the QMP commands were documented in the deprecations page, but the
>>>>     rationale for deprecating applies equally to HMP, and the replacements
>>>>     exist. Furthermore the HMP commands are just shims to the QMP commands,
>>>>     so removing the latter breaks the former unless they get re-implemented.
>>>>     
>>>>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>> That doesn't make a whole lot of sense as a bisect result.
>>> How reliable is that bisect end point ? Have you bisected
>>> to that point more than once ?
>>
>> I did run through the bisect itself only once, so I'll double check that.
>> The results seem to be reproducible almost to the second though, a savevm that took 35 seconds before the commit takes 2m 48 seconds after.
>>
>> For this test I am using libvirt v6.0.0.
>>
>> If it helps, these are the current_migration->parameters pre-commit (captured in qemu_savevm_state_iterate):
>>
>>
>> pre-commit: in qemu_savevm_state_iterate:
>>
>> (gdb) p current_migration->parameters
> 
>>   tls_authz = 0x0, has_max_bandwidth = true, max_bandwidth = 9223372036853727232, has_downtime_limit = true, downtime_limit = 300,
> 
> snip
> 
>> and post-commit: in qemu_savevm_state_iterate:
>>
>> (gdb) p current_migration->parameters
> 
> snip
> 
>>   tls_authz = 0x0, has_max_bandwidth = true, max_bandwidth = 134217728, has_downtime_limit = true, downtime_limit = 300,
> 
>> so there seems to be a difference in the max_bandwidth parameter,
>> do we have a limit suddenly having effect for max_bandwidth after the commit?
> 
> Yes, that's very strange. I think we'll need to capture the QMP commands that
> libvirt is sending to QEMU, so see if there';s a difference in what it sends.
> This might indicate a latent bug in libvirt.


In the pre-commit case I see:

2022-03-07 10:41:00.928+0000: 132544: info : qemuMonitorJSONIOProcessLine:235 : QEMU_MONITOR_RECV_EVENT: mon=0x7f0fd00028a0 event={"timestamp": {"seconds": 1646649660, "microseconds": 927920}, "event": "STOP"}
2022-03-07 10:41:00.929+0000: 132544: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7f0fd00028a0 reply={"return": {}, "id": "libvirt-13"}
2022-03-07 10:41:00.934+0000: 132549: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7f0fd00028a0 msg={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-14"}^M
 fd=-1
2022-03-07 10:41:00.934+0000: 132544: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7f0fd00028a0 buf={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-14"}^M
 len=93 ret=93 errno=0
2022-03-07 10:41:00.935+0000: 132544: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7f0fd00028a0 reply={"return": {}, "id": "libvirt-14"}
2022-03-07 10:41:00.936+0000: 132549: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7f0fd00028a0 msg={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-15"}^M
 fd=32
2022-03-07 10:41:00.936+0000: 132544: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7f0fd00028a0 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-15"}^M
 len=72 ret=72 errno=0
2022-03-07 10:41:00.936+0000: 132544: info : qemuMonitorIOWrite:457 : QEMU_MONITOR_IO_SEND_FD: mon=0x7f0fd00028a0 fd=32 ret=72 errno=0
2022-03-07 10:41:00.937+0000: 132544: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7f0fd00028a0 reply={"return": {}, "id": "libvirt-15"}
2022-03-07 10:41:00.937+0000: 132549: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7f0fd00028a0 msg={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-16"}^M
 fd=-1
2022-03-07 10:41:00.937+0000: 132544: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7f0fd00028a0 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-16"}^M
 len=112 ret=112 errno=0


In the post-commit case I see:


2022-03-07 10:47:07.316+0000: 134386: info : qemuMonitorJSONIOProcessLine:235 : QEMU_MONITOR_RECV_EVENT: mon=0x7fa4380028a0 event={"timestamp": {"seconds": 1646650027, "microseconds": 316537}, "event": "STOP"}
2022-03-07 10:47:07.317+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"return": {}, "id": "libvirt-13"}
2022-03-07 10:47:07.322+0000: 134391: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7fa4380028a0 msg={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-14"}^M
 fd=-1
2022-03-07 10:47:07.322+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-14"}^M
 len=93 ret=93 errno=0
2022-03-07 10:47:07.324+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"id": "libvirt-14", "error": {"class": "CommandNotFound", "desc": "The command migrate_set_speed has not been found"}}
2022-03-07 10:47:07.324+0000: 134391: error : qemuMonitorJSONCheckError:412 : internal error: unable to execute QEMU command 'migrate_set_speed': The command migrate_set_speed has not been found
2022-03-07 10:47:07.324+0000: 134391: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7fa4380028a0 msg={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-15"}^M
 fd=32
2022-03-07 10:47:07.324+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-15"}^M
 len=72 ret=72 errno=0
2022-03-07 10:47:07.324+0000: 134386: info : qemuMonitorIOWrite:457 : QEMU_MONITOR_IO_SEND_FD: mon=0x7fa4380028a0 fd=32 ret=72 errno=0
2022-03-07 10:47:07.325+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"return": {}, "id": "libvirt-15"}
2022-03-07 10:47:07.326+0000: 134391: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7fa4380028a0 msg={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-16"}^M
 fd=-1
2022-03-07 10:47:07.326+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-16"}^M
 len=112 ret=112 errno=0
2022-03-07 10:47:07.328+0000: 134386: info : qemuMonitorJSONIOProcessLine:235 : QEMU_MONITOR_RECV_EVENT: mon=0x7fa4380028a0 event={"timestamp": {"seconds": 1646650027, "microseconds": 327843}, "event": "MIGRATION", "data": {"status": "setup"}}
2022-03-07 10:47:07.328+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"return": {}, "id": "libvirt-16"}
2022-03-07 10:47:07.449+0000: 134386: info : qemuMonitorJSONIOProcessLine:235 : QEMU_MONITOR_RECV_EVENT: mon=0x7fa4380028a0 event={"timestamp": {"seconds": 1646650027, "microseconds": 449199}, "event": "MIGRATION_PASS", "data": {"pass": 1}}
2022-03-07 10:47:07.449+0000: 134386: info : qemuMonitorJSONIOProcessLine:235 : QEMU_MONITOR_RECV_EVENT: mon=0x7fa4380028a0 event={"timestamp": {"seconds": 1646650027, "microseconds": 449363}, "event": "MIGRATION", "data": {"status": "active"}}
2022-03-07 10:47:07.807+0000: 134387: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7fa4380028a0 msg={"execute":"query-migrate","id":"libvirt-17"}^M
 fd=-1
2022-03-07 10:47:07.807+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"query-migrate","id":"libvirt-17"}^M
 len=47 ret=47 errno=0
2022-03-07 10:47:07.809+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"return": {"blocked": false, "expected-downtime": 300, "status": "active", "setup-time": 121, "total-time": 481, "ram": {"total": 32213049344, "postcopy-requests": 0, "dirty-sync-count": 1, "multifd-bytes": 0, "pages-per-second": 971380, "page-size": 4096, "remaining": 31357165568, "mbps": 70.597440000000006, "transferred": 28723376, "duplicate": 202401, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 26849280, "normal": 6555}}, "id": "libvirt-17"}
2022-03-07 10:47:20.063+0000: 134386: info : qemuMonitorJSONIOProcessLine:235 : QEMU_MONITOR_RECV_EVENT: mon=0x7fa4380028a0 event={"timestamp": {"seconds": 1646650040, "microseconds": 63299}, "event": "MIGRATION_PASS", "data": {"pass": 2}}
2022-03-07 10:47:20.068+0000: 134386: info : qemuMonitorJSONIOProcessLine:235 : QEMU_MONITOR_RECV_EVENT: mon=0x7fa4380028a0 event={"timestamp": {"seconds": 1646650040, "microseconds": 68660}, "event": "MIGRATION_PASS", "data": {"pass": 3}}
2022-03-07 10:47:20.142+0000: 134386: info : qemuMonitorJSONIOProcessLine:235 : QEMU_MONITOR_RECV_EVENT: mon=0x7fa4380028a0 event={"timestamp": {"seconds": 1646650040, "microseconds": 142735}, "event": "MIGRATION", "data": {"status": "completed"}}
2022-03-07 10:47:20.143+0000: 134391: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7fa4380028a0 msg={"execute":"query-migrate","id":"libvirt-18"}^M
 fd=-1
2022-03-07 10:47:20.143+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"query-migrate","id":"libvirt-18"}^M
 len=47 ret=47 errno=0
2022-03-07 10:47:20.145+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"return": {"blocked": false, "status": "completed", "setup-time": 121, "downtime": 79, "total-time": 12815, "ram": {"total": 32213049344, "postcopy-requests": 0, "dirty-sync-count": 3, "multifd-bytes": 0, "pages-per-second": 32710, "page-size": 4096, "remaining": 0, "mbps": 584.63040491570825, "transferred": 927267953, "duplicate": 7655360, "dirty-pages-rate": 0, "skipped": 0, "normal-bytes": 856694784, "normal": 209154}}, "id": "libvirt-18"}
2022-03-07 10:47:20.145+0000: 134391: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7fa4380028a0 msg={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-19"}^M
 fd=-1
2022-03-07 10:47:20.145+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-19"}^M
 len=93 ret=93 errno=0
2022-03-07 10:47:20.146+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"id": "libvirt-19", "error": {"class": "CommandNotFound", "desc": "The command migrate_set_speed has not been found"}}
2022-03-07 10:47:20.147+0000: 134391: error : qemuMonitorJSONCheckError:412 : internal error: unable to execute QEMU command 'migrate_set_speed': The command migrate_set_speed has not been found
2022-03-07 10:47:20.150+0000: 134391: info : qemuMonitorClose:917 : QEMU_MONITOR_CLOSE: mon=0x7fa4380028a0 refs=2


> 
> If you libvirt_log_filters=2:qemu_monitor   then it ought to capture the
> QMP commands.
> 
> Regards,
> Daniel
> 


