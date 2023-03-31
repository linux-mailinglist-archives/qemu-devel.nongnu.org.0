Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB16D240E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 17:32:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piGiL-0001lT-6p; Fri, 31 Mar 2023 11:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1piGiJ-0001lK-FP
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:30:51 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1piGiH-0000Tr-Tx
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:30:51 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35CDA1FD63;
 Fri, 31 Mar 2023 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680276648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6t4QV1DgAeKXlh8Lwo3OIsNL0gbm7x0eRuttn9INbAI=;
 b=uJkuu778f+YuqXnm2+fw9wB8rtxcrNB0yENal0FOHbT4XwPfOs/uw9RoSxudgIVcLBzVIO
 xoS5qriroWHkGYjtggBfdvH7i/yawVa5+2R71HCHGwXihdWbbzkJ4E42Q0jdsTz23lN+ME
 sz6Eno27PwpKueOYGl7lUYJZ4lJ4Tms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680276648;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6t4QV1DgAeKXlh8Lwo3OIsNL0gbm7x0eRuttn9INbAI=;
 b=Ao79ktS7Vqh2P31YZ4vfGR/MeAgOWnDbfa1Rg2ThfUjuGTwK30o2PpNPebEG2+RzHJSZmS
 +rVXlSvtA1BELzCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A7F36133B6;
 Fri, 31 Mar 2023 15:30:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jmrVG6f8JmTcCwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 31 Mar 2023 15:30:47 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com, dfaggioli@suse.com, dgilbert@redhat.com, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Juan Quintela
 <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
In-Reply-To: <ZCbzmZXz3JG/jElA@x1n>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
 <87edp5oukh.fsf@suse.de> <ZCbzmZXz3JG/jElA@x1n>
Date: Fri, 31 Mar 2023 12:30:45 -0300
Message-ID: <878rfdos4a.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> writes:

> On Fri, Mar 31, 2023 at 11:37:50AM -0300, Fabiano Rosas wrote:
>> >> Outgoing migration to file. NVMe disk. XFS filesystem.
>> >> 
>> >> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
>> >>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
>> >>   10m -v`:
>> >> 
>> >> migration type  | MB/s | pages/s |  ms
>> >> ----------------+------+---------+------
>> >> savevm io_uring |  434 |  102294 | 71473
>> >
>> > So I assume this is the non-live migration scenario.  Could you explain
>> > what does io_uring mean here?
>> >
>> 
>> This table is all non-live migration. This particular line is a snapshot
>> (hmp_savevm->save_snapshot). I thought it could be relevant because it
>> is another way by which we write RAM into disk.
>
> I see, so if all non-live that explains, because I was curious what's the
> relationship between this feature and the live snapshot that QEMU also
> supports.
>
> I also don't immediately see why savevm will be much slower, do you have an
> answer?  Maybe it's somewhere but I just overlooked..
>

I don't have a concrete answer. I could take a jab and maybe blame the
extra memcpy for the buffer in QEMUFile? Or perhaps an unintended effect
of bandwidth limits?

> IIUC this is "vm suspend" case, so there's an extra benefit knowledge of
> "we can stop the VM".  It smells slightly weird to build this on top of
> "migrate" from that pov, rather than "savevm", though.  Any thoughts on
> this aspect (on why not building this on top of "savevm")?
>

I share the same perception. I have done initial experiments with
savevm, but I decided to carry on the work that was already started by
others because my understanding of the problem was yet incomplete.

One point that has been raised is that the fixed-ram format alone does
not bring that many performance improvements. So we'll need
multi-threading and direct-io on top of it. Re-using multifd
infrastructure seems like it could be a good idea.

> Thanks,
>
>> 
>> The io_uring is noise, I was initially under the impression that the
>> block device aio configuration affected this scenario.
>> 
>> >> file:           | 3017 |  855862 | 10301
>> >> fixed-ram       | 1982 |  330686 | 15637
>> >> ----------------+------+---------+------
>> >> fixed-ram + multifd + O_DIRECT
>> >>          2 ch.  | 5565 | 1500882 |  5576
>> >>          4 ch.  | 5735 | 1991549 |  5412
>> >>          8 ch.  | 5650 | 1769650 |  5489
>> >>         16 ch.  | 6071 | 1832407 |  5114
>> >>         32 ch.  | 6147 | 1809588 |  5050
>> >>         64 ch.  | 6344 | 1841728 |  4895
>> >>        128 ch.  | 6120 | 1915669 |  5085
>> >> ----------------+------+---------+------
>> >
>> > Thanks,
>> 

