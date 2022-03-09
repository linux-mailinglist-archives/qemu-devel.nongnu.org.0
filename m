Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77994D3937
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:50:58 +0100 (CET)
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1Oj-0004JW-Rr
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:50:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nS1LX-0002Dy-U4
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:47:39 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:35982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nS1LW-0000rT-0a
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:47:39 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 650CE21121;
 Wed,  9 Mar 2022 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646851656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXX7Vze6Y9tWR/uf5qCHTKXmvmQfUKyFoeBZI42IS9s=;
 b=E0EAesjg3AtP9lR2J23u+fhL6wneN4WJKHwJ1TiIKciGfeu5/GUefEHnEyLGS11v9QHUI4
 XSzGwPDboxOUxgeVOQwj+KRLyTvyKrYz+g1mwBGo4YxF11SjDeKOraiFWJCB6qNnx6b38W
 mKsUVnSV8lwbXOfkiTPxi1CxeuVBOAA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646851656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXX7Vze6Y9tWR/uf5qCHTKXmvmQfUKyFoeBZI42IS9s=;
 b=CQR073oHn9gHF0XOFEM3dLUr8RibtvrBA5Zw9TQy+vedbcWIe+8m5EwSGwJD4Hc4znKDZl
 ej5tPwjirMCNnjDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3281613D7E;
 Wed,  9 Mar 2022 18:47:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RayaCkj2KGJFNwAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 09 Mar 2022 18:47:36 +0000
Subject: Re: bad virsh save /dev/null performance (600 MiB/s max)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com> <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm> <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
 <YiiS9HnS0LsiY2Hb@work-vm> <YiiU2gCbnJOgpZxp@redhat.com>
 <700779ea-4274-7872-6022-d32457a00160@suse.de>
 <47786b29-b1a2-1f6a-568d-b61398e0f641@suse.de> <Yijz9hzJFJoMo7vE@redhat.com>
 <Yij0cJ3ioN6aiKgA@work-vm>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <ec3e7602-d40b-9784-e2c5-5db5c087129e@suse.de>
Date: Wed, 9 Mar 2022 19:47:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <Yij0cJ3ioN6aiKgA@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
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
Cc: Jim Fehlig <jfehlig@suse.com>, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/22 7:39 PM, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
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
> In which case, what is a simple 'top' showing on the system?

libvirt_iohelper is the top cpu consumer at 60-something%,
qemu-system-x86_64 is at 30-40%.

C.

