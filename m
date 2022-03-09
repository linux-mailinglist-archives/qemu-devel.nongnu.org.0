Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E54D38D1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 19:28:31 +0100 (CET)
Received: from localhost ([::1]:50120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS130-0002f4-7j
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 13:28:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nS11p-0001Eq-Bn
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:27:17 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:34854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nS11n-0006MC-Bx
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 13:27:17 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CDE4221121;
 Wed,  9 Mar 2022 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646850433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3Mo3a1SDsSkM90aeuDtQgQzRK/lUhetkU43d6z7hYg=;
 b=jpArAkBJ704jcjrk+5yy73Fg6z0WpQ4tbaScFSQriBB/h3MIb5V3xqgoJ8eQNqWooETVeF
 eBKCUYhjKWrlsomJmI9GT3FRR5RShagIZqNhU0ItgiUP4M83lmOIBbdYKLS3/8cYWRWyTZ
 TmM9ihNsfd+TV9bUe4mNWnyeOzsSz9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646850433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3Mo3a1SDsSkM90aeuDtQgQzRK/lUhetkU43d6z7hYg=;
 b=X7gBojwM0L6UA6lJUK0o5W6FAJzxOwYAd0dea1hI2lUGpJvJc2XSkqyZ6cQc+YsbeMGjaa
 amizWrZnM44oBHBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D9A213D7D;
 Wed,  9 Mar 2022 18:27:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k4kSFYHxKGLNLwAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 09 Mar 2022 18:27:13 +0000
Subject: Re: bad virsh save /dev/null performance (600 MiB/s max)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <62ba8b1e-d641-5b10-c1b3-54b7d5a652e7@suse.de>
 <YiXVh1P4oJNuEtFM@redhat.com> <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
 <YiXzw8pF9If2/M7M@redhat.com> <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com> <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm> <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
 <YiiS9HnS0LsiY2Hb@work-vm> <YiiU2gCbnJOgpZxp@redhat.com>
 <700779ea-4274-7872-6022-d32457a00160@suse.de>
Message-ID: <47786b29-b1a2-1f6a-568d-b61398e0f641@suse.de>
Date: Wed, 9 Mar 2022 19:27:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <700779ea-4274-7872-6022-d32457a00160@suse.de>
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

On 3/9/22 3:22 PM, Claudio Fontana wrote:
> On 3/9/22 12:51 PM, Daniel P. Berrangé wrote:
>> On Wed, Mar 09, 2022 at 11:43:48AM +0000, Dr. David Alan Gilbert wrote:
>>> * Claudio Fontana (cfontana@suse.de) wrote:
>>>> On 3/7/22 1:28 PM, Dr. David Alan Gilbert wrote:
>>>>> * Claudio Fontana (cfontana@suse.de) wrote:
>>>>>> On 3/7/22 1:20 PM, Daniel P. Berrangé wrote:
>>>>>>> On Mon, Mar 07, 2022 at 01:09:55PM +0100, Claudio Fontana wrote:
>>>>>>>> Got it, this explains it, sorry for the noise on this.
>>>>>>>>
>>>>>>>> I'll continue to investigate the general issue of low throughput with virsh save / qemu savevm .
>>>>>>>
>>>>>>> BTW, consider measuring with the --bypass-cache flag to virsh save.
>>>>>>> This causes libvirt to use a I/O helper that uses O_DIRECT when
>>>>>>> saving the image. This should give more predictable results by
>>>>>>> avoiding the influence of host I/O cache which can be in a differnt
>>>>>>> state of usage each time you measure.  It was also intended that
>>>>>>> by avoiding hitting cache, saving the memory image of a large VM
>>>>>>> will not push other useful stuff out of host I/O  cache which can
>>>>>>> negatively impact other running VMs.
>>>>>>>
>>>>>>> Also it is possible to configure compression on the libvirt side
>>>>>>> which may be useful if you have spare CPU cycles, but your storage
>>>>>>> is slow. See 'save_image_format' in the /etc/libvirt/qemu.conf
>>>>>>>
>>>>>>> With regards,
>>>>>>> Daniel
>>>>>>>
>>>>>>
>>>>>> Hi Daniel, thanks for these good info,
>>>>>>
>>>>>> regarding slow storage, for these tests I am saving to /dev/null to avoid having to take storage into account
>>>>>> (and still getting low bandwidth unfortunately) so I guess compression is out of the question.
>>>>>
>>>>> What type of speeds do you get if you try a migrate to a netcat socket?
>>>>
>>>> much faster apparently, 30 sec savevm vs 7 seconds for migration to a netcat socket sent to /dev/null.
>>>>
>>>> nc -l -U /tmp/savevm.socket
>>>>
>>>> virsh suspend centos7
>>>> Domain centos7 suspended
>>>>
>>>> virsh qemu-monitor-command --cmd '{ "execute": "migrate", "arguments": { "uri": "unix:///tmp/savevm.socket" } }' centos7
>>>>
>>>> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate" }' centos7
>>>> {"return":{"blocked":false,"status":"completed","setup-time":118,"downtime":257,"total-time":7524,"ram":{"total":32213049344,"postcopy-requests":0,"dirty-sync-count":3,"multifd-bytes":0,"pages-per-second":1057530,"page-size":4096,"remaining":0,"mbps":24215.572437483122,"transferred":22417172290,"duplicate":2407520,"dirty-pages-rate":0,"skipped":0,"normal-bytes":22351847424,"normal":5456994}},"id":"libvirt-438"}
>>>>
>>>> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate-parameters" }' centos7
>>>> {"return":{"cpu-throttle-tailslow":false,"xbzrle-cache-size":67108864,"cpu-throttle-initial":20,"announce-max":550,"decompress-threads":2,"compress-threads":8,"compress-level":0,"multifd-channels":8,"multifd-zstd-level":1,"announce-initial":50,"block-incremental":false,"compress-wait-thread":true,"downtime-limit":300,"tls-authz":"","multifd-compression":"none","announce-rounds":5,"announce-step":100,"tls-creds":"","multifd-zlib-level":1,"max-cpu-throttle":99,"max-postcopy-bandwidth":0,"tls-hostname":"","throttle-trigger-threshold":50,"max-bandwidth":9223372036853727232,"x-checkpoint-delay":20000,"cpu-throttle-increment":10},"id":"libvirt-439"}
>>>>
>>>>
>>>> I did also a run with multifd-channels:1 instead of 8, if it matters:
>>>
>>> I suspect you haven't actually got multifd enabled ( check
>>> query-migrate-capabilities ?).
>>>>
>>>> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate" }' centos7
>>>> {"return":{"blocked":false,"status":"completed","setup-time":119,"downtime":260,"total-time":8601,"ram":{"total":32213049344,"postcopy-requests":0,"dirty-sync-count":3,"multifd-bytes":0,"pages-per-second":908820,"page-size":4096,"remaining":0,"mbps":21141.861157274227,"transferred":22415264188,"duplicate":2407986,"dirty-pages-rate":0,"skipped":0,"normal-bytes":22349938688,"normal":5456528}},"id":"libvirt-453"}
>>>>
>>>> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate-parameters" }' centos7
>>>> {"return":{"cpu-throttle-tailslow":false,"xbzrle-cache-size":67108864,"cpu-throttle-initial":20,"announce-max":550,"decompress-threads":2,"compress-threads":8,"compress-level":0,"multifd-channels":1,"multifd-zstd-level":1,"announce-initial":50,"block-incremental":false,"compress-wait-thread":true,"downtime-limit":300,"tls-authz":"","multifd-compression":"none","announce-rounds":5,"announce-step":100,"tls-creds":"","multifd-zlib-level":1,"max-cpu-throttle":99,"max-postcopy-bandwidth":0,"tls-hostname":"","throttle-trigger-threshold":50,"max-bandwidth":9223372036853727232,"x-checkpoint-delay":20000,"cpu-throttle-increment":10},"id":"libvirt-454"}
>>>>
>>>>
>>>> Still we are in the 20 Gbps range, or around 2560 MiB/s, way faster than savevm which does around 600 MiB/s when the wind is in its favor..
>>>
>>> Yeh that's what I'd hope for off a decent CPU; hmm there's not that much
>>> savevm specific is there?
>>
>> BTW, quick clarification here.
>>
>> IIUC, Claudio says the test is 'virsh save $VMNAME /some/file'. This
>> is *not* running 'savevm' at the QEMU level. So it is a bit misleading
>> refering to it as savevm in the thread here.
> 
> 
> Thanks, this is a helpful clarification, I was wrongly assuming those were linked.
> Indeed the use case is virsh save.
> 
>>
>> 'virsh save' is simply wired up to the normal QEMU 'migrate' commands,
>> with libvirt giving QEMU a pre-opened FD, which libvirt processes the
>> other end of to write out to disk.
>>
>> IOW, the performance delta is possibly on libvirt's side rather
>> than QEMU's.
> 
> Interesting, also Ccing Jim on this, I'll continue to do more experiments.
> 


One difference I could see looking at the qmp commands issued by libvirt in the "virsh save" case,
is "detach:true" in the migration command (which seems to have no effect in qemu),


and maybe more interestingly this stuff about the "fd":


2022-03-09 17:29:34.247+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
 fd=34
2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-390"}^M
 len=73 ret=73 errno=0
2022-03-09 17:29:34.247+0000: 20387: info : qemuMonitorIOWrite:457 : QEMU_MONITOR_IO_SEND_FD: mon=0x7faa9003ebf0 fd=34 ret=73 errno=0
2022-03-09 17:29:34.248+0000: 20387: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7faa9003ebf0 reply={"return": {}, "id": "libvirt-390"}
2022-03-09 17:29:34.249+0000: 20390: info : qemuMonitorSend:995 : QEMU_MONITOR_SEND_MSG: mon=0x7faa9003ebf0 msg={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
 fd=-1
2022-03-09 17:29:34.249+0000: 20387: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7faa9003ebf0 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-391"}^M
 len=113 ret=113 errno=0


in qemu I am currently looking at the code in migration/socket.c vs the code in migration/fd.c , wonder if the difference would stem from there..

Thanks,

CLaudio

