Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DA35B897B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:50:53 +0200 (CEST)
Received: from localhost ([::1]:46000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSmy-0006nT-8Q
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oYSO8-0001GW-S9
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:25:13 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:40204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1oYSO3-0000ux-CA
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:25:12 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1DDE33923;
 Wed, 14 Sep 2022 13:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1663161903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TA5cU1U92o/Y2z4ScBdpMQWT9ZQulS1ug4bQ2jjh8qo=;
 b=B3gm2vDQub3tqgZ+5gUcnq6nImr4b26HIwCF+6ZJ9jdc1zCByxAnfSLzQCItXEqyQG5Tzn
 SzKnzUq48lmHUkWNCFCkH57kct8F1J1Odamr8bikd3hAnYqPUD7GWW0U8XWa4wO5fzOoGP
 0NSTt7u/lroIQDN1EuIuTzZW5O6uALY=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9EC9E13494;
 Wed, 14 Sep 2022 13:25:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4nwRJC/WIWPOGAAAMHmgww
 (envelope-from <nborisov@suse.com>); Wed, 14 Sep 2022 13:25:03 +0000
Message-ID: <28a98d5b-3a12-8404-c862-ac9634fd7cfe@suse.com>
Date: Wed, 14 Sep 2022 16:25:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: Nikolay Borisov <nborisov@suse.com>
Subject: Proposal for a fixed ram migration stream format for file-based
 migrations
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 dgilbert@redhat.com, Claudio Fontana <Claudio.Fontana@suse.com>,
 Jim Fehlig <jfehlig@suse.com>, quintela@redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=nborisov@suse.com;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hello,

Based on several discussions I've had in the past 2 days and time spent
looking at the migration stream code I came up with the following
proposal for changes to the stream format. Let me recap what we have
right now:


<migration header><ramsize><ramblock header #1><ramblock header #2>...<page#1 offset>(<block name>)<actual page#1 data><device state>

Where <block name> is put only when the current page we are writing
to belongs to a different block than the last written page. My proposal is to
change this format to:

<migration header><ramsize><ramblock #1 header><all dirtied pages belonging to ramblock #1><ramblock #2 header>...<device state>

Each page belonging to a ramblock would be at a fixed offset in the file. Which is going to be
<ramblock hdr offset> + page_offset. The size of the region for a particular ramblock would be
ramblock::used_length but not the whole range is going to be written, only those pages which
have been dirtied. If we assume a 1tb ramblock then we'd make the the region 1 tb but it will
be sparsely populated. This means that we can have the following layout for the memory range:


|---p---ppp----pp---p|
0		     1tb

Each 'p' signifies an allocated page and '-' is a page which hasn't been dirtied ergo its
index in the stream is not touched. This of course would result in having a lot of holes, so when
the incoming migration starts parsing the stream it might end up in a situation
where page at offset 0 is read, but then it has to jump some at arbitrary
location for the next page. To avoid resorting to calling into the filesystem and dealing with
fiemap's format I also intend to extend the ramblock header format by adding a dirty bitmap in
which every bit would signify whether a page has been written or not, the bit's position would be
used to index into the allocated space for pages. Simple maths shows that for 4k pages, 1tb can be
indexed with just 32kbytes of memory. The way the indexing would work is

page = ramblock->offset (this is the offset in the file, not the in-memory ::ofset field) +
bit's position * target_page_size

That way we can still handle sparsely dirtied memory and have direct mapping in the file, this
dirty bitmap would be populated during the course of ram migration and once the final page is written,
those in-memory bitmaps would be written into their respective positions in the file, needless to say
this would be supported only on seekable channels (for now only file-based channels).

Another important thing worth mentioning is I don't intend on incrementing the
format version but rather introducing a new migration capability.

Any thoughts/comments/suggestions, would be highly appreciated.

