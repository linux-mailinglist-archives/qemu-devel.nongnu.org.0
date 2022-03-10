Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D4D4D4CC2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:27:18 +0100 (CET)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKhA-0006yf-Rt
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:27:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nSKfz-00068B-3E
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:26:03 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:55684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nSKfx-0002a3-DL
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:26:02 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 41F5D1F381;
 Thu, 10 Mar 2022 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646925958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0GXjsmWVqSQm4OlTIcN0s4FaTxPalcZ/QHseCUllHI=;
 b=LvS6LND7+ujG+Yp8ut5AH1wrqc3IqwumdzF9exWlIpPc9bsLeoN6nEc5Uxhfl3j7v/GdAC
 ktIfemejT6Bgd8Vru8PxSb8Z/dqhH1dl04V2vi1SeslCIy7SJdopd5bKsReHOtQrTy6rgi
 pd5t3kjp3LR5ZhFMDR/uY08Wpv3M5/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646925958;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0GXjsmWVqSQm4OlTIcN0s4FaTxPalcZ/QHseCUllHI=;
 b=FYVSCnVkDOScP3XgELXKdUg50r1v1Izh8hrrv3NGwuiR0waLwAx8oqNaAERcbUB4AK92b2
 W7ppjCyc7C59i1Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BACD13A3D;
 Thu, 10 Mar 2022 15:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8kbgAIYYKmKveAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 10 Mar 2022 15:25:58 +0000
Subject: Re: bad virsh save /dev/null performance (600 MiB/s max)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Jim Fehlig <jfehlig@suse.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com> <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm> <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
 <YiiS9HnS0LsiY2Hb@work-vm> <YiiU2gCbnJOgpZxp@redhat.com>
 <700779ea-4274-7872-6022-d32457a00160@suse.de>
 <47786b29-b1a2-1f6a-568d-b61398e0f641@suse.de> <Yijz9hzJFJoMo7vE@redhat.com>
 <Yij17Z6Sn+YE1F74@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <0caae98e-a1bb-a8df-f049-817403da7835@suse.de>
Date: Thu, 10 Mar 2022 16:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <Yij17Z6Sn+YE1F74@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/22 7:46 PM, Daniel P. Berrangé wrote:
> On Wed, Mar 09, 2022 at 06:37:42PM +0000, Daniel P. Berrangé wrote:
>> On Wed, Mar 09, 2022 at 07:27:12PM +0100, Claudio Fontana wrote:
>>>
>>> One difference I could see looking at the qmp commands issued by libvirt in the "virsh save" case,
>>> is "detach:true" in the migration command (which seems to have no effect in qemu),
>>
>> That is a bug in libvirt - it should not be setting that in QMP.
>>
>> To quote the QAPI spec for 'migrate'
>>
>>   # @detach: this argument exists only for compatibility reasons and
>>   #          is ignored by QEMU
>>
>>
>>>
>>>
>>> and maybe more interestingly this stuff about the "fd":
>>>
>>>
>>> 2022-03-09 17:29:34.247+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
>>>  fd=34
>>> 2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
>>>  len=73 ret=73 errno=0
>>> 2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:457 : QEMU_MONITOR_IO_SEND_FD: mon=0x7faa9003ebf0 fd=34 ret=73 errno=0
>>> 2022-03-09 17:29:34.248+0000: 20387: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7faa9003ebf0 reply={"return": {}, "id": "libvirt-390"}
>>> 2022-03-09 17:29:34.249+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
>>>  fd=-1
>>> 2022-03-09 17:29:34.249+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
>>>  len=113 ret=113 errno=0
>>>
>>>
>>> in qemu I am currently looking at the code in migration/socket.c
>>> vs the code in migration/fd.c , wonder if the difference would
>>> stem from there..
>>
>> When saving to a file, libvirt passes in a pre-opened FD for
>> QEU to use. IIRC this should always be a pipe FD connected to
>> libvirt's iohelper program, sometimes indirectly via a compression
>> program.
> 
> It occurs to me that pipes and sockets likely use very different
> buffer sizes, with sockets larger IIUC, and buffer sizes can impact
> throughput. Could be worth exploring a change to libvirt code to
> use socketpair() instead of pipe() to see if it impacts performance
> in any meaningful way, or playing with fcntl(F_SETPIPE_SZ)
> 
> With regards,
> Daniel
> 

Hello Daniel,

the experiment with F_SETPIPE_SZ was successful, transfer speeds are dramatically increased. Still digging but this is a huge benefit.

Thanks,

Claudio

