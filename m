Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE65B5E49
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 18:32:52 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXmMc-0005l9-UW
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 12:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oXmKo-0004EZ-3m
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 12:30:58 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oXmKk-0005At-Vn
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 12:30:56 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A57C31FE10;
 Mon, 12 Sep 2022 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1663000251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VLDi45imlYzQdMpBYSrVHVi99mo80/m0sxtB2V06LdA=;
 b=hjCDdFV5ErHzzj4sYbIC2XgwaW7l75VDqzuiqAEmUPqS5Nd869opCgOeZi9HeIq1FuGIav
 4FJ6xA+lJPL2m/FBY8C23c20l2PvpEOXuiLNwVQ6N7De1SPbHot0AJ4ka3eh8AUyFLn7oR
 M11JTbgchJ9N+SMxroWzUxwSSW2/5Cw=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E70D139C8;
 Mon, 12 Sep 2022 16:30:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qh5vELteH2OpdwAAMHmgww
 (envelope-from <nborisov@suse.com>); Mon, 12 Sep 2022 16:30:51 +0000
Message-ID: <a0ba7e7c-f5c4-4772-154a-7e09d540ff9d@suse.com>
Date: Mon, 12 Sep 2022 19:30:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] migration: support file: uri for source migration
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, jfehlig@suse.com,
 Claudio.Fontana@suse.com, quintela@redhat.com
References: <b727f0da-8051-2ce5-b1ab-a57452d2b0c3@suse.com>
 <20220908102633.123536-1-nborisov@suse.com> <Yx9TO61m1tyUU5oy@redhat.com>
From: Nikolay Borisov <nborisov@suse.com>
In-Reply-To: <Yx9TO61m1tyUU5oy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=nborisov@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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



On 12.09.22 г. 18:41 ч., Daniel P. Berrangé wrote:
> On Thu, Sep 08, 2022 at 01:26:32PM +0300, Nikolay Borisov wrote:
>> This is a prototype of supporting a 'file:' based uri protocol for
>> writing out the migration stream of qemu. Currently the code always
>> opens the file in DIO mode and adheres to an alignment of 64k to be
>> generic enough. However this comes with a problem - it requires copying
>> all data that we are writing (qemu metadata + guest ram pages) to a
>> bounce buffer so that we adhere to this alignment.
> 
> The adhoc device metadata clearly needs bounce buffers since it
> is splattered all over RAM with no concern of alignemnt. THe use
> of bounce buffers for this shouldn't be a performance issue though
> as metadata is small relative to the size of the snapshot as a whole.

Bounce buffers can be eliminated altogether so long as we simply switch 
between buffered/DIO mode via fcntl.

> 
> The guest RAM pages should not need bounce buffers at all when using
> huge pages, as alignment will already be way larger than we required.
> Guests with huge pages are the ones which are likely to have huge
> RAM sizes and thus need the DIO mode, so we should be sorted for that.
> 
> When using small pages for guest RAM, if it is not already allocated
> with suitable alignment, I feel like we should be able to make it
> so that we allocate the RAM block with good alignemnt to avoid the
> need for bounce buffers. This would address the less common case of
> a guest with huge RAM size but not huge pages.

Ram blocks are generally allocated with good alignment due to them being 
mmaped(), however as I was toying with eliminating bounce buffers for 
ram I hit an issue where the page headers being written (8 bytes each) 
aren't aligned (naturally). Imo I think the on-disk format can be 
changed the following way:


<ramblock header, containing base address of ramblock>, each subsequent 
page is then written at an offset from the base address of the ramblock, 
that is it's index would be :

page_offset = page_addr - ramblock_base, Then the page is written at 
ramblock_base (in the file) + page_offset. This would eliminate the page 
headers altogether. This leaves aligning the initial ramblock header 
initially. However, this would lead to us potentially having to issue 1 
lseek per page to write - to adjust the the file position, which might 
not be a problem in itself but who knows. How dooes that sound to you?

> 
> Thus if we assume guest RAM is suitably aligned, then we can avoid
> bounce buffers for RAM pages, while still using bounce buffers for
> the metadata.
> 
>>                                                     With this code I get
>> the following performance results:
>>
>>        DIO              exec: cat > file         virsh --bypass-cache
>>        82		     		77							81
>>        82		    	    78							80
>>        80		    	    80							82
>>        82		    	    82							77
>>        77		    	    79							77
>>
>> AVG:  80.6		     		79.2						79.4
>> stddev: 1.959		     	1.720						2.05
>>
>> All numbers are in seconds.
>>
>> Those results are somewhat surprising to me as I'd expected doing the
>> writeout directly within qemu and avoiding copying between qemu and
>> virsh's iohelper process would result in a speed up. Clearly that's not
>> the case, I attribute this to the fact that all memory pages have to be
>> copied into the bounce buffer. There are more measurements/profiling
>> work that I'd have to do in order to (dis)prove this hypotheses and will
>> report back when I have the data.
> 
> When using the libvirt iohelper we have mutliple CPUs involved. IOW the
> bounce buffer copy is taking place on a separate CPU from the QEMU
> migration loop. This ability to use multiple CPUs may well have balanced
> out any benefit from doing DIO on the QEMU side.
> 
> If you eliminate bounce buffers for guest RAM and write it directly to
> the fixed location on disk, then we should see the benefit - and if not
> then something is really wrong in our thoughts.
> 
>> However I'm sending the code now as I'd like to facilitate a discussion
>> as to whether this is an approach that would be acceptable to upstream
>> merging. Any ideas/comments would be much appreciated.
> 
> AFAICT this impl is still using the existing on-disk format, where RAM
> pages are just written inline to the stream. For DIO benefit to be
> maximised we need the on-disk format to be changed, so that the guest
> RAM regions can be directly associated with fixed locations on disk.
> This also means that if guest dirties RAM while its saving, then we
> overwrite the existing content on disk, such that restore only ever
> needs to restore each RAM page once, instead of restoring every
> dirtied version.
> 
> 
> With regards,
> Daniel

