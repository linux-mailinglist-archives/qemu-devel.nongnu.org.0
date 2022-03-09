Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E24D30F4
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 15:24:08 +0100 (CET)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRxEV-0000J0-Vd
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 09:24:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nRxCc-0007xL-Me
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:22:10 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:39244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nRxCa-0005Sm-Rv
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:22:10 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 888FC1F382;
 Wed,  9 Mar 2022 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646835727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sFdOZMLOjmkkoJQ0AaUyAwO0IdUv92TdXdjiEKZvJs=;
 b=AThG6NyMbPpIt8VzQSGi05AJXG/jiEDwaxRV+cMFt2WmK082nSjPVUHK7VVcjRUPYxZJd+
 GfNE3pcZuBl/5oTs27LWvwo4q0yUi6vxvtKRfUJU9b6YIydNXWk5VPbOoTKZvT5wSIOI1M
 tmPSXj0CCOTjE8KzlIh241PncQxYjb4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646835727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sFdOZMLOjmkkoJQ0AaUyAwO0IdUv92TdXdjiEKZvJs=;
 b=FRF/OUx5gZiDCxV+r2dchhmmy5dPfNUvYqsoiEQ2nOS4XnQ7AzE3A4//wmpJUtH3tpOOpa
 xF/d/vXNlyHIA2BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5637613D79;
 Wed,  9 Mar 2022 14:22:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LgZREw+4KGLQPAAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 09 Mar 2022 14:22:07 +0000
Subject: Re: bad qemu savevm to /dev/null performance (600 MiB/s max) (Was:
 Re: starting to look at qemu savevm performance, a first regression detected)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <62ba8b1e-d641-5b10-c1b3-54b7d5a652e7@suse.de>
 <YiXVh1P4oJNuEtFM@redhat.com> <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
 <YiXzw8pF9If2/M7M@redhat.com> <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com> <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm> <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
 <YiiS9HnS0LsiY2Hb@work-vm> <YiiU2gCbnJOgpZxp@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <700779ea-4274-7872-6022-d32457a00160@suse.de>
Date: Wed, 9 Mar 2022 15:22:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YiiU2gCbnJOgpZxp@redhat.com>
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
Cc: Jim Fehlig <jfehlig@suse.com>, qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/22 12:51 PM, Daniel P. Berrangé wrote:
> On Wed, Mar 09, 2022 at 11:43:48AM +0000, Dr. David Alan Gilbert wrote:
>> * Claudio Fontana (cfontana@suse.de) wrote:
>>> On 3/7/22 1:28 PM, Dr. David Alan Gilbert wrote:
>>>> * Claudio Fontana (cfontana@suse.de) wrote:
>>>>> On 3/7/22 1:20 PM, Daniel P. Berrangé wrote:
>>>>>> On Mon, Mar 07, 2022 at 01:09:55PM +0100, Claudio Fontana wrote:
>>>>>>> Got it, this explains it, sorry for the noise on this.
>>>>>>>
>>>>>>> I'll continue to investigate the general issue of low throughput with virsh save / qemu savevm .
>>>>>>
>>>>>> BTW, consider measuring with the --bypass-cache flag to virsh save.
>>>>>> This causes libvirt to use a I/O helper that uses O_DIRECT when
>>>>>> saving the image. This should give more predictable results by
>>>>>> avoiding the influence of host I/O cache which can be in a differnt
>>>>>> state of usage each time you measure.  It was also intended that
>>>>>> by avoiding hitting cache, saving the memory image of a large VM
>>>>>> will not push other useful stuff out of host I/O  cache which can
>>>>>> negatively impact other running VMs.
>>>>>>
>>>>>> Also it is possible to configure compression on the libvirt side
>>>>>> which may be useful if you have spare CPU cycles, but your storage
>>>>>> is slow. See 'save_image_format' in the /etc/libvirt/qemu.conf
>>>>>>
>>>>>> With regards,
>>>>>> Daniel
>>>>>>
>>>>>
>>>>> Hi Daniel, thanks for these good info,
>>>>>
>>>>> regarding slow storage, for these tests I am saving to /dev/null to avoid having to take storage into account
>>>>> (and still getting low bandwidth unfortunately) so I guess compression is out of the question.
>>>>
>>>> What type of speeds do you get if you try a migrate to a netcat socket?
>>>
>>> much faster apparently, 30 sec savevm vs 7 seconds for migration to a netcat socket sent to /dev/null.
>>>
>>> nc -l -U /tmp/savevm.socket
>>>
>>> virsh suspend centos7
>>> Domain centos7 suspended
>>>
>>> virsh qemu-monitor-command --cmd '{ "execute": "migrate", "arguments": { "uri": "unix:///tmp/savevm.socket" } }' centos7
>>>
>>> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate" }' centos7
>>> {"return":{"blocked":false,"status":"completed","setup-time":118,"downtime":257,"total-time":7524,"ram":{"total":32213049344,"postcopy-requests":0,"dirty-sync-count":3,"multifd-bytes":0,"pages-per-second":1057530,"page-size":4096,"remaining":0,"mbps":24215.572437483122,"transferred":22417172290,"duplicate":2407520,"dirty-pages-rate":0,"skipped":0,"normal-bytes":22351847424,"normal":5456994}},"id":"libvirt-438"}
>>>
>>> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate-parameters" }' centos7
>>> {"return":{"cpu-throttle-tailslow":false,"xbzrle-cache-size":67108864,"cpu-throttle-initial":20,"announce-max":550,"decompress-threads":2,"compress-threads":8,"compress-level":0,"multifd-channels":8,"multifd-zstd-level":1,"announce-initial":50,"block-incremental":false,"compress-wait-thread":true,"downtime-limit":300,"tls-authz":"","multifd-compression":"none","announce-rounds":5,"announce-step":100,"tls-creds":"","multifd-zlib-level":1,"max-cpu-throttle":99,"max-postcopy-bandwidth":0,"tls-hostname":"","throttle-trigger-threshold":50,"max-bandwidth":9223372036853727232,"x-checkpoint-delay":20000,"cpu-throttle-increment":10},"id":"libvirt-439"}
>>>
>>>
>>> I did also a run with multifd-channels:1 instead of 8, if it matters:
>>
>> I suspect you haven't actually got multifd enabled ( check
>> query-migrate-capabilities ?).
>>>
>>> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate" }' centos7
>>> {"return":{"blocked":false,"status":"completed","setup-time":119,"downtime":260,"total-time":8601,"ram":{"total":32213049344,"postcopy-requests":0,"dirty-sync-count":3,"multifd-bytes":0,"pages-per-second":908820,"page-size":4096,"remaining":0,"mbps":21141.861157274227,"transferred":22415264188,"duplicate":2407986,"dirty-pages-rate":0,"skipped":0,"normal-bytes":22349938688,"normal":5456528}},"id":"libvirt-453"}
>>>
>>> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate-parameters" }' centos7
>>> {"return":{"cpu-throttle-tailslow":false,"xbzrle-cache-size":67108864,"cpu-throttle-initial":20,"announce-max":550,"decompress-threads":2,"compress-threads":8,"compress-level":0,"multifd-channels":1,"multifd-zstd-level":1,"announce-initial":50,"block-incremental":false,"compress-wait-thread":true,"downtime-limit":300,"tls-authz":"","multifd-compression":"none","announce-rounds":5,"announce-step":100,"tls-creds":"","multifd-zlib-level":1,"max-cpu-throttle":99,"max-postcopy-bandwidth":0,"tls-hostname":"","throttle-trigger-threshold":50,"max-bandwidth":9223372036853727232,"x-checkpoint-delay":20000,"cpu-throttle-increment":10},"id":"libvirt-454"}
>>>
>>>
>>> Still we are in the 20 Gbps range, or around 2560 MiB/s, way faster than savevm which does around 600 MiB/s when the wind is in its favor..
>>
>> Yeh that's what I'd hope for off a decent CPU; hmm there's not that much
>> savevm specific is there?
> 
> BTW, quick clarification here.
> 
> IIUC, Claudio says the test is 'virsh save $VMNAME /some/file'. This
> is *not* running 'savevm' at the QEMU level. So it is a bit misleading
> refering to it as savevm in the thread here.


Thanks, this is a helpful clarification, I was wrongly assuming those were linked.
Indeed the use case is virsh save.

> 
> 'virsh save' is simply wired up to the normal QEMU 'migrate' commands,
> with libvirt giving QEMU a pre-opened FD, which libvirt processes the
> other end of to write out to disk.
> 
> IOW, the performance delta is possibly on libvirt's side rather
> than QEMU's.

Interesting, also Ccing Jim on this, I'll continue to do more experiments.

> 
> Regards,
> Daniel
> 


