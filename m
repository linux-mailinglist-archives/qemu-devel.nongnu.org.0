Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0484CFEEC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:37:00 +0100 (CET)
Received: from localhost ([::1]:45252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCbj-0004uL-73
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:36:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nRBC5-0005RM-Gy
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:06:26 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:49998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nRBC3-0004I0-Kp
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:06:25 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DC898210EF;
 Mon,  7 Mar 2022 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646651180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/M+m2+lM5IafhK6DSbJrDQiv9dxPo6qgwdYClOeHr6I=;
 b=XBvzoleGsYsZ7VpzntxBgBeaJXUcW0D90l+p1hKsmEVMyNn2ERwgr/Rx0dfXS2laua0kbf
 Xg37XzdTyLhV92gc7C/7qJCSJ4vChStSfm9DcfmtNBbz4B3+lsGXGF9d89Fgyf+JLAcdGt
 J1TbVr/Dv20CGBs60Mx26nP5Sd28O1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646651180;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/M+m2+lM5IafhK6DSbJrDQiv9dxPo6qgwdYClOeHr6I=;
 b=/5rwkYIaAS5o0YXz1RL5IXnIaJzxN8JQp6MZyz+R++3qJHe6sbjy0SADkctXaC1D3jAT75
 4SqFzH7BvENwlWDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2FB713A96;
 Mon,  7 Mar 2022 11:06:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MeMUKiznJWKXQAAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 07 Mar 2022 11:06:20 +0000
Subject: Re: starting to look at qemu savevm performance, a first regression
 detected
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <0ffe2660-4bae-9a84-e981-687b2c7a8877@suse.de>
 <5c028590-d71b-91a8-9ee6-d43cd162ec13@suse.de> <YiXfRe9qRHC+dVi5@work-vm>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <29a4b12d-a4b9-1652-22ea-0a273ca8f1b5@suse.de>
Date: Mon, 7 Mar 2022 12:06:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YiXfRe9qRHC+dVi5@work-vm>
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 11:32 AM, Dr. David Alan Gilbert wrote:
> * Claudio Fontana (cfontana@suse.de) wrote:
>> On 3/5/22 2:20 PM, Claudio Fontana wrote:
>>>
>>> Hello all,
>>>
>>> I have been looking at some reports of bad qemu savevm performance in large VMs (around 20+ Gb),
>>> when used in libvirt commands like:
>>>
>>>
>>> virsh save domain /dev/null
>>>
>>>
>>>
>>> I have written a simple test to run in a Linux centos7-minimal-2009 guest, which allocates and touches 20G mem.
>>>
>>> With any qemu version since around 2020, I am not seeing more than 580 Mb/Sec even in the most ideal of situations.
>>>
>>> This drops to around 122 Mb/sec after commit: cbde7be900d2a2279cbc4becb91d1ddd6a014def .
>>>
>>> Here is the bisection for this particular drop in throughput:
>>>
>>> commit cbde7be900d2a2279cbc4becb91d1ddd6a014def (HEAD, refs/bisect/bad)
>>> Author: Daniel P. Berrangé <berrange@redhat.com>
>>> Date:   Fri Feb 19 18:40:12 2021 +0000
>>>
>>>     migrate: remove QMP/HMP commands for speed, downtime and cache size
>>>     
>>>     The generic 'migrate_set_parameters' command handle all types of param.
>>>     
>>>     Only the QMP commands were documented in the deprecations page, but the
>>>     rationale for deprecating applies equally to HMP, and the replacements
>>>     exist. Furthermore the HMP commands are just shims to the QMP commands,
>>>     so removing the latter breaks the former unless they get re-implemented.
>>>     
>>>     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>     Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>>
>>> git bisect start
>>> # bad: [5c8463886d50eeb0337bd121ab877cf692731e36] Merge remote-tracking branch 'remotes/kraxel/tags/kraxel-20220304-pull-request' into staging
>>> git bisect bad 5c8463886d50eeb0337bd121ab877cf692731e36
>>> # good: [6cdf8c4efa073eac7d5f9894329e2d07743c2955] Update version for 4.2.1 release
>>> git bisect good 6cdf8c4efa073eac7d5f9894329e2d07743c2955
>>> # good: [b0ca999a43a22b38158a222233d3f5881648bb4f] Update version for v4.2.0 release
>>> git bisect good b0ca999a43a22b38158a222233d3f5881648bb4f
>>> # skip: [e2665f314d80d7edbfe7f8275abed7e2c93c0ddc] target/mips: Alias MSA vector registers on FPU scalar registers
>>> git bisect skip e2665f314d80d7edbfe7f8275abed7e2c93c0ddc
>>> # good: [4762c82cbda22b1036ce9dd2c5e951ac0ed0a7d3] tests/docker: Install static libc package in CentOS 7
>>> git bisect good 4762c82cbda22b1036ce9dd2c5e951ac0ed0a7d3
>>> # bad: [d4127349e316b5c78645f95dba5922196ac4cc23] Merge remote-tracking branch 'remotes/berrange-gitlab/tags/crypto-and-more-pull-request' into staging
>>> git bisect bad d4127349e316b5c78645f95dba5922196ac4cc23
>>> # bad: [d90f154867ec0ec22fd719164b88716e8fd48672] Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.1-20210504' into staging
>>> git bisect bad d90f154867ec0ec22fd719164b88716e8fd48672
>>> # good: [dd5af6ece9b101d29895851a7441d848b7ccdbff] tests/docker: add a test-tcg for building then running check-tcg
>>> git bisect good dd5af6ece9b101d29895851a7441d848b7ccdbff
>>> # bad: [90ec1cff768fcbe1fa2870d2018f378376f4f744] target/riscv: Adjust privilege level for HLV(X)/HSV instructions
>>> git bisect bad 90ec1cff768fcbe1fa2870d2018f378376f4f744
>>> # good: [373969507a3dc7de2d291da7e1bd03acf46ec643] migration: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
>>> git bisect good 373969507a3dc7de2d291da7e1bd03acf46ec643
>>> # good: [4083904bc9fe5da580f7ca397b1e828fbc322732] Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210317' into staging
>>> git bisect good 4083904bc9fe5da580f7ca397b1e828fbc322732
>>> # bad: [009ff89328b1da3ea8ba316bf2be2125bc9937c5] vl: allow passing JSON to -object
>>> git bisect bad 009ff89328b1da3ea8ba316bf2be2125bc9937c5
>>> # bad: [50243407457a9fb0ed17b9a9ba9fc9aee09495b1] qapi/qom: Drop deprecated 'props' from object-add
>>> git bisect bad 50243407457a9fb0ed17b9a9ba9fc9aee09495b1
>>> # bad: [1b507e55f8199eaad99744613823f6929e4d57c6] Merge remote-tracking branch 'remotes/berrange-gitlab/tags/dep-many-pull-request' into staging
>>> git bisect bad 1b507e55f8199eaad99744613823f6929e4d57c6
>>> # bad: [24e13a4dc1eb1630eceffc7ab334145d902e763d] chardev: reject use of 'wait' flag for socket client chardevs
>>> git bisect bad 24e13a4dc1eb1630eceffc7ab334145d902e763d
>>> # good: [8becb36063fb14df1e3ae4916215667e2cb65fa2] monitor: remove 'query-events' QMP command
>>> git bisect good 8becb36063fb14df1e3ae4916215667e2cb65fa2
>>> # bad: [8af54b9172ff3b9bbdbb3191ed84994d275a0d81] machine: remove 'query-cpus' QMP command
>>> git bisect bad 8af54b9172ff3b9bbdbb3191ed84994d275a0d81
>>> # bad: [cbde7be900d2a2279cbc4becb91d1ddd6a014def] migrate: remove QMP/HMP commands for speed, downtime and cache size
>>> git bisect bad cbde7be900d2a2279cbc4becb91d1ddd6a014def
>>> # first bad commit: [cbde7be900d2a2279cbc4becb91d1ddd6a014def] migrate: remove QMP/HMP commands for speed, downtime and cache size
>>>
>>>
>>> Are there some obvious settings / options I am missing to regain the savevm performance after this commit?
>>
>> Answering myself: 
> 
> <oops we seem to have split this thread into two>
> 
>> this seems to be due to a resulting different default xbzrle cache size (probably interactions between libvirt/qemu versions?).
>>
>> When forcing the xbzrle cache size to a larger value, the performance is back.
> 
> That's weird that 'virsh save' is ending up using xbzrle.

virsh save (or qemu savevm..) seems to me like it uses a subset of the migration code and migration parameters but not all..

> 
>>>
>>> I have seen projects attempting to improve other aspects of performance (snapshot performance, etc), is there something going on to improve the transfer of RAM in savevm too?
>>
>>
>> Still I would think that we should be able to do better than 600ish Mb/s , any ideas, prior work on this,
>> to improve savevm performance, especially looking at RAM regions transfer speed?
> 
> My normal feeling is ~10Gbps for a live migrate over the wire; I rarely
> try virsh save though.
> If you're using xbzrle that might explain it; it's known to eat cpu -
> but I'd never expect it to have been used with 'virsh save'.

some valgrind shows it among the top cpu eaters;

I wonder why we are able to do more than 2x better for actual live migration, compared with virsh save /dev/null ...

Thanks,

Claudio


