Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77EE6D22C7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:39:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFtK-0004FX-KS; Fri, 31 Mar 2023 10:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1piFtH-0004F1-Ha
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:38:07 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1piFtF-0006qC-Dw
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:38:07 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1BC821A5F;
 Fri, 31 Mar 2023 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680273473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=snY7drbdjkmlgf0pWIS/7rxdCTggmV1lfkruO1K+rcc=;
 b=B4jOtp1cQdM2m9pcty6ysbWg4uang3gTiVNcBjWRpeTLKnI1ec9vtpA7QtWXLkn7ltbukR
 W5NKqRiYfB4WYIFeQcHPjxnOpN2Dlqv9mUdraqrMTHTsUuNkirNquoIdfY//fUfoEHtjvv
 ahulsC++zQE967Pn051sL47lr0vfyx4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680273473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=snY7drbdjkmlgf0pWIS/7rxdCTggmV1lfkruO1K+rcc=;
 b=d3pIIFpt1k4veRI0/YAZlhX54bcVjgRUsBSCW4CoZG2rZJ7NBl6RpCVAN2StNL4LCKZLCq
 i+BW4iCxa1ZGglCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2311F134F7;
 Fri, 31 Mar 2023 14:37:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VxJUNkDwJmQEbgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 31 Mar 2023 14:37:52 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com, dfaggioli@suse.com, dgilbert@redhat.com, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Juan Quintela
 <quintela@redhat.com>
Subject: Re: [RFC PATCH v1 00/26] migration: File based migration with
 multifd and fixed-ram
In-Reply-To: <ZCYCE0llX9WANK18@x1n>
References: <20230330180336.2791-1-farosas@suse.de> <ZCYCE0llX9WANK18@x1n>
Date: Fri, 31 Mar 2023 11:37:50 -0300
Message-ID: <87edp5oukh.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

> On Thu, Mar 30, 2023 at 03:03:10PM -0300, Fabiano Rosas wrote:
>> Hi folks,
>
> Hi,
>
>> 
>> I'm continuing the work done last year to add a new format of
>> migration stream that can be used to migrate large guests to a single
>> file in a performant way.
>> 
>> This is an early RFC with the previous code + my additions to support
>> multifd and direct IO. Let me know what you think!
>> 
>> Here are the reference links for previous discussions:
>> 
>> https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg01813.html
>> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg01338.html
>> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg05536.html
>> 
>> The series has 4 main parts:
>> 
>> 1) File migration: A new "file:" migration URI. So "file:mig" does the
>>    same as "exec:cat > mig". Patches 1-4 implement this;
>> 
>> 2) Fixed-ram format: A new format for the migration stream. Puts guest
>>    pages at their relative offsets in the migration file. This saves
>>    space on the worst case of RAM utilization because every page has a
>>    fixed offset in the migration file and (potentially) saves us time
>>    because we could write pages independently in parallel. It also
>>    gives alignment guarantees so we could use O_DIRECT. Patches 5-13
>>    implement this;
>> 
>> With patches 1-13 these two^ can be used with:
>> 
>> (qemu) migrate_set_capability fixed-ram on
>> (qemu) migrate[_incoming] file:mig
>
> Have you considered enabling the new fixed-ram format with postcopy when
> loading?
>
> Due to the linear offseting of pages, I think it can achieve super fast vm
> loads due to O(1) lookup of pages and local page fault resolutions.
>

I don't think we have looked that much at the loading side yet. Good to
know that it has potential to be faster. I'll look into it. Thanks for
the suggestion.

>> 
>> --> new in this series:
>> 
>> 3) MultiFD support: This is about making use of the parallelism
>>    allowed by the new format. We just need the threading and page
>>    queuing infrastructure that is already in place for
>>    multifd. Patches 14-24 implement this;
>> 
>> (qemu) migrate_set_capability fixed-ram on
>> (qemu) migrate_set_capability multifd on
>> (qemu) migrate_set_parameter multifd-channels 4
>> (qemu) migrate_set_parameter max-bandwith 0
>> (qemu) migrate[_incoming] file:mig
>> 
>> 4) Add a new "direct_io" parameter and enable O_DIRECT for the
>>    properly aligned segments of the migration (mostly ram). Patch 25.
>> 
>> (qemu) migrate_set_parameter direct-io on
>> 
>> Thanks! Some data below:
>> =====
>> 
>> Outgoing migration to file. NVMe disk. XFS filesystem.
>> 
>> - Single migration runs of stopped 32G guest with ~90% RAM usage. Guest
>>   running `stress-ng --vm 4 --vm-bytes 90% --vm-method all --verify -t
>>   10m -v`:
>> 
>> migration type  | MB/s | pages/s |  ms
>> ----------------+------+---------+------
>> savevm io_uring |  434 |  102294 | 71473
>
> So I assume this is the non-live migration scenario.  Could you explain
> what does io_uring mean here?
>

This table is all non-live migration. This particular line is a snapshot
(hmp_savevm->save_snapshot). I thought it could be relevant because it
is another way by which we write RAM into disk.

The io_uring is noise, I was initially under the impression that the
block device aio configuration affected this scenario.

>> file:           | 3017 |  855862 | 10301
>> fixed-ram       | 1982 |  330686 | 15637
>> ----------------+------+---------+------
>> fixed-ram + multifd + O_DIRECT
>>          2 ch.  | 5565 | 1500882 |  5576
>>          4 ch.  | 5735 | 1991549 |  5412
>>          8 ch.  | 5650 | 1769650 |  5489
>>         16 ch.  | 6071 | 1832407 |  5114
>>         32 ch.  | 6147 | 1809588 |  5050
>>         64 ch.  | 6344 | 1841728 |  4895
>>        128 ch.  | 6120 | 1915669 |  5085
>> ----------------+------+---------+------
>
> Thanks,

