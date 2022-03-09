Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A254D2E73
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:52:15 +0100 (CET)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRurV-0004qj-UC
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:52:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRujh-0007Go-0w
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:44:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nRujd-00034s-Q1
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646826234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWN2kJ0JDhMDxMO6K2PLi3/bRYo+mEmVn7/7Mc/zOOM=;
 b=Tqt5gaHEC00VcQFhRpCMNXTh+qW0mreq3o4Wwj5AqA+TQqQ+nZsDLAMEgoyX8G2U4yqp+7
 46A6eHTv05eiHmfDHuqnwVxT/xeJBROgHndkpZ3G5bQNB2e8JGYLRDjCGGXVkdsqYWl/lV
 0CreTt7TLOt42jF8pKDh8QaUMLLCZT4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-VdFN0V9bN_iR7ZoZNqhdkA-1; Wed, 09 Mar 2022 06:43:53 -0500
X-MC-Unique: VdFN0V9bN_iR7ZoZNqhdkA-1
Received: by mail-wr1-f69.google.com with SMTP id
 n4-20020a5d4844000000b001f1ed76e943so673259wrs.22
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 03:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bWN2kJ0JDhMDxMO6K2PLi3/bRYo+mEmVn7/7Mc/zOOM=;
 b=Y3nfsEgGQsb0ZicjBnhOIDVgUEKt8rjkmOC1X/LYsYqTUCFY3SGWqHDwGHQ4g4F2Ga
 5t3i/2EMSqHaq80syIj9uyZYnuLLd7hC+4Hzsp3mX0Bxqh4aiHbBV8zxDcijnHbTMzrv
 taF3eUGsSqktDyFmSbd4PayNNzG+Q6Xlxm/ulUW8QPvmbqZfZuP9PobA9N2my4s+HBWD
 b+csXRuAuhbDW8g9z+KjsqOW9hbOmlc8c82bt0QWVgdi8fYi/82Cnpzkn+4GVhV/QQuo
 9/9E9QcMwjKhhsI8ThVFVfqlNLF1TmXXJHKEKXDXEfu8LDaUkC8KB0FsIR20r+X0bw13
 NRew==
X-Gm-Message-State: AOAM530jlFfuhsZrOA4HeSWiURzb6OSpO8AWfvqXonSAUItne4mR/ZZu
 fDllbUKmnSzfguvlK8vXSxcmTPSY4btoGs4v7hRs9COztq7pJf5+3k6skEKKdXuKXJDcYwQ63ch
 OOQjlPpBm0ExbIWk=
X-Received: by 2002:adf:eb89:0:b0:1e4:b8f4:da74 with SMTP id
 t9-20020adfeb89000000b001e4b8f4da74mr15655167wrn.408.1646826231425; 
 Wed, 09 Mar 2022 03:43:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9er9QRCG4azvs4MB4RvuHCYoT1UBRVBKn4ghf887LpngjxoSANcubVrnCG6/uS93+w62c9g==
X-Received: by 2002:adf:eb89:0:b0:1e4:b8f4:da74 with SMTP id
 t9-20020adfeb89000000b001e4b8f4da74mr15655154wrn.408.1646826231126; 
 Wed, 09 Mar 2022 03:43:51 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05600c214a00b00389bcc75559sm1657117wml.27.2022.03.09.03.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 03:43:50 -0800 (PST)
Date: Wed, 9 Mar 2022 11:43:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: bad qemu savevm to /dev/null performance (600 MiB/s max) (Was:
 Re: starting to look at qemu savevm performance, a first regression
 detected)
Message-ID: <YiiS9HnS0LsiY2Hb@work-vm>
References: <YiXQHIWtHx5BocxK@redhat.com>
 <62ba8b1e-d641-5b10-c1b3-54b7d5a652e7@suse.de>
 <YiXVh1P4oJNuEtFM@redhat.com>
 <1f70a086-2b72-bd83-414b-476f5e6d0094@suse.de>
 <YiXzw8pF9If2/M7M@redhat.com>
 <5f318297-51c0-366b-758b-733ba27684ba@suse.de>
 <YiX4gfBtgDq/uZpu@redhat.com>
 <5b3d17d2-f07f-8cb1-54ff-6a517dc4eaef@suse.de>
 <YiX6XSlVNw183PTV@work-vm>
 <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
MIME-Version: 1.0
In-Reply-To: <51b486fc-2c71-e1c6-6412-d462234d67fb@suse.de>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Claudio Fontana (cfontana@suse.de) wrote:
> On 3/7/22 1:28 PM, Dr. David Alan Gilbert wrote:
> > * Claudio Fontana (cfontana@suse.de) wrote:
> >> On 3/7/22 1:20 PM, Daniel P. Berrangé wrote:
> >>> On Mon, Mar 07, 2022 at 01:09:55PM +0100, Claudio Fontana wrote:
> >>>> On 3/7/22 1:00 PM, Daniel P. Berrangé wrote:
> >>>>> On Mon, Mar 07, 2022 at 12:19:22PM +0100, Claudio Fontana wrote:
> >>>>>> On 3/7/22 10:51 AM, Daniel P. Berrangé wrote:
> >>>>>>> On Mon, Mar 07, 2022 at 10:44:56AM +0100, Claudio Fontana wrote:
> >>>>>>>> Hello Daniel,
> >>>>>>>>
> >>>>>>>> On 3/7/22 10:27 AM, Daniel P. Berrangé wrote:
> >>>>>>>>> On Sat, Mar 05, 2022 at 02:19:39PM +0100, Claudio Fontana wrote:
> >>>>>>>>>>
> >>>>>>>>>> Hello all,
> >>>>>>>>>>
> >>>>>>>>>> I have been looking at some reports of bad qemu savevm performance in large VMs (around 20+ Gb),
> >>>>>>>>>> when used in libvirt commands like:
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> virsh save domain /dev/null
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> I have written a simple test to run in a Linux centos7-minimal-2009 guest, which allocates and touches 20G mem.
> >>>>>>>>>>
> >>>>>>>>>> With any qemu version since around 2020, I am not seeing more than 580 Mb/Sec even in the most ideal of situations.
> >>>>>>>>>>
> >>>>>>>>>> This drops to around 122 Mb/sec after commit: cbde7be900d2a2279cbc4becb91d1ddd6a014def .
> >>>>>>>>>>
> >>>>>>>>>> Here is the bisection for this particular drop in throughput:
> >>>>>>>>>>
> >>>>>>>>>> commit cbde7be900d2a2279cbc4becb91d1ddd6a014def (HEAD, refs/bisect/bad)
> >>>>>>>>>> Author: Daniel P. Berrangé <berrange@redhat.com>
> >>>>>>>>>> Date:   Fri Feb 19 18:40:12 2021 +0000
> >>>>>>>>>>
> >>>>>>>>>>     migrate: remove QMP/HMP commands for speed, downtime and cache size
> >>>>>>>>>>     
> >>>>>>>>>>     The generic 'migrate_set_parameters' command handle all types of param.
> >>>>>>>>>>     
> >>>>>>>>>>     Only the QMP commands were documented in the deprecations page, but the
> >>>>>>>>>>     rationale for deprecating applies equally to HMP, and the replacements
> >>>>>>>>>>     exist. Furthermore the HMP commands are just shims to the QMP commands,
> >>>>>>>>>>     so removing the latter breaks the former unless they get re-implemented.
> >>>>>>>>>>     
> >>>>>>>>>>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>>>>>>>>>     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> >>>>>>>>>
> >>>>>>>>> That doesn't make a whole lot of sense as a bisect result.
> >>>>>>>>> How reliable is that bisect end point ? Have you bisected
> >>>>>>>>> to that point more than once ?
> >>>>>>>>
> >>>>>>>> I did run through the bisect itself only once, so I'll double check that.
> >>>>>>>> The results seem to be reproducible almost to the second though, a savevm that took 35 seconds before the commit takes 2m 48 seconds after.
> >>>>>>>>
> >>>>>>>> For this test I am using libvirt v6.0.0.
> >>>>>
> >>>>> I've just noticed this.  That version of libvirt is 2 years old and
> >>>>> doesn't have full support for migrate_set_parameters.
> >>>>>
> >>>>>
> >>>>>> 2022-03-07 10:47:20.145+0000: 134386: info : qemuMonitorIOWrite:452 : QEMU_MONITOR_IO_WRITE: mon=0x7fa4380028a0 buf={"execute":"migrate_set_speed","arguments":{"value":9223372036853727232},"id":"libvirt-19"}^M
> >>>>>>  len=93 ret=93 errno=0
> >>>>>> 2022-03-07 10:47:20.146+0000: 134386: info : qemuMonitorJSONIOProcessLine:240 : QEMU_MONITOR_RECV_REPLY: mon=0x7fa4380028a0 reply={"id": "libvirt-19", "error": {"class": "CommandNotFound", "desc": "The command migrate_set_speed has not been found"}}
> >>>>>> 2022-03-07 10:47:20.147+0000: 134391: error : qemuMonitorJSONCheckError:412 : internal error: unable to execute QEMU command 'migrate_set_speed': The command migrate_set_speed has not been found
> >>>>>
> >>>>> We see the migrate_set_speed failing and libvirt obviously ignores that
> >>>>> failure.
> >>>>>
> >>>>> In current libvirt migrate_set_speed is not used as it properly
> >>>>> handles migrate_set_parameters AFAICT.
> >>>>>
> >>>>> I think you just need to upgrade libvirt if you want to use this
> >>>>> newer QEMU version
> >>>>>
> >>>>> Regards,
> >>>>> Daniel
> >>>>>
> >>>>
> >>>> Got it, this explains it, sorry for the noise on this.
> >>>>
> >>>> I'll continue to investigate the general issue of low throughput with virsh save / qemu savevm .
> >>>
> >>> BTW, consider measuring with the --bypass-cache flag to virsh save.
> >>> This causes libvirt to use a I/O helper that uses O_DIRECT when
> >>> saving the image. This should give more predictable results by
> >>> avoiding the influence of host I/O cache which can be in a differnt
> >>> state of usage each time you measure.  It was also intended that
> >>> by avoiding hitting cache, saving the memory image of a large VM
> >>> will not push other useful stuff out of host I/O  cache which can
> >>> negatively impact other running VMs.
> >>>
> >>> Also it is possible to configure compression on the libvirt side
> >>> which may be useful if you have spare CPU cycles, but your storage
> >>> is slow. See 'save_image_format' in the /etc/libvirt/qemu.conf
> >>>
> >>> With regards,
> >>> Daniel
> >>>
> >>
> >> Hi Daniel, thanks for these good info,
> >>
> >> regarding slow storage, for these tests I am saving to /dev/null to avoid having to take storage into account
> >> (and still getting low bandwidth unfortunately) so I guess compression is out of the question.
> > 
> > What type of speeds do you get if you try a migrate to a netcat socket?
> 
> much faster apparently, 30 sec savevm vs 7 seconds for migration to a netcat socket sent to /dev/null.
> 
> nc -l -U /tmp/savevm.socket
> 
> virsh suspend centos7
> Domain centos7 suspended
> 
> virsh qemu-monitor-command --cmd '{ "execute": "migrate", "arguments": { "uri": "unix:///tmp/savevm.socket" } }' centos7
> 
> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate" }' centos7
> {"return":{"blocked":false,"status":"completed","setup-time":118,"downtime":257,"total-time":7524,"ram":{"total":32213049344,"postcopy-requests":0,"dirty-sync-count":3,"multifd-bytes":0,"pages-per-second":1057530,"page-size":4096,"remaining":0,"mbps":24215.572437483122,"transferred":22417172290,"duplicate":2407520,"dirty-pages-rate":0,"skipped":0,"normal-bytes":22351847424,"normal":5456994}},"id":"libvirt-438"}
> 
> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate-parameters" }' centos7
> {"return":{"cpu-throttle-tailslow":false,"xbzrle-cache-size":67108864,"cpu-throttle-initial":20,"announce-max":550,"decompress-threads":2,"compress-threads":8,"compress-level":0,"multifd-channels":8,"multifd-zstd-level":1,"announce-initial":50,"block-incremental":false,"compress-wait-thread":true,"downtime-limit":300,"tls-authz":"","multifd-compression":"none","announce-rounds":5,"announce-step":100,"tls-creds":"","multifd-zlib-level":1,"max-cpu-throttle":99,"max-postcopy-bandwidth":0,"tls-hostname":"","throttle-trigger-threshold":50,"max-bandwidth":9223372036853727232,"x-checkpoint-delay":20000,"cpu-throttle-increment":10},"id":"libvirt-439"}
> 
> 
> I did also a run with multifd-channels:1 instead of 8, if it matters:

I suspect you haven't actually got multifd enabled ( check
query-migrate-capabilities ?).
> 
> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate" }' centos7
> {"return":{"blocked":false,"status":"completed","setup-time":119,"downtime":260,"total-time":8601,"ram":{"total":32213049344,"postcopy-requests":0,"dirty-sync-count":3,"multifd-bytes":0,"pages-per-second":908820,"page-size":4096,"remaining":0,"mbps":21141.861157274227,"transferred":22415264188,"duplicate":2407986,"dirty-pages-rate":0,"skipped":0,"normal-bytes":22349938688,"normal":5456528}},"id":"libvirt-453"}
> 
> virt97:/mnt # virsh qemu-monitor-command --cmd '{ "execute": "query-migrate-parameters" }' centos7
> {"return":{"cpu-throttle-tailslow":false,"xbzrle-cache-size":67108864,"cpu-throttle-initial":20,"announce-max":550,"decompress-threads":2,"compress-threads":8,"compress-level":0,"multifd-channels":1,"multifd-zstd-level":1,"announce-initial":50,"block-incremental":false,"compress-wait-thread":true,"downtime-limit":300,"tls-authz":"","multifd-compression":"none","announce-rounds":5,"announce-step":100,"tls-creds":"","multifd-zlib-level":1,"max-cpu-throttle":99,"max-postcopy-bandwidth":0,"tls-hostname":"","throttle-trigger-threshold":50,"max-bandwidth":9223372036853727232,"x-checkpoint-delay":20000,"cpu-throttle-increment":10},"id":"libvirt-454"}
> 
> 
> Still we are in the 20 Gbps range, or around 2560 MiB/s, way faster than savevm which does around 600 MiB/s when the wind is in its favor..

Yeh that's what I'd hope for off a decent CPU; hmm there's not that much
savevm specific is there?

Dave

> Thanks,
> 
> Claudio
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


