Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1267E690A43
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 14:33:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ72T-0008JH-SQ; Thu, 09 Feb 2023 08:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pQ722-0008DV-Gw
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:32:15 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1pQ71z-00025G-O1
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 08:32:09 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B545D37513;
 Thu,  9 Feb 2023 13:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675949522; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mu/YD6hN92LKeskca1XoCsIYJ1QoLKXbfE8d4xZOc6o=;
 b=TjuWvSczo8kJmuSpojSJfaczgJI9C0OnX5gCIVTDD7Z/ixzvQf55zYxD4Dv91MMst4fBwK
 8FmEOUhg5kKIriSBNyD+ebdr/1kQFcNd5pfB6v6gSg2IOQc43jLf9C0iOuqc+CAJBkdvre
 lKzSk+PK4ARJDq4yENXjj21IXEqt0ek=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675949522;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mu/YD6hN92LKeskca1XoCsIYJ1QoLKXbfE8d4xZOc6o=;
 b=t4NDsTrZvBFGZWaGvAJ5wTXCaXgUGyXLQvAeZxLhIw7YqWmssC5jJCUeDT4JgGiyCY/9GF
 VSY4dI8/E1EFIwDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6FE8B1339E;
 Thu,  9 Feb 2023 13:32:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id k51tGdL15GNHdAAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 09 Feb 2023 13:32:02 +0000
Message-ID: <734376eb-0098-8885-190f-f328ddedf81b@suse.de>
Date: Thu, 9 Feb 2023 14:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 00/14] File-based migration support and fixed-ram
 features
Content-Language: en-US
To: Nikolay Borisov <nborisov@suse.com>, dgilbert@redhat.com,
 berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com
References: <20221028103914.908728-1-nborisov@suse.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221028103914.908728-1-nborisov@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

Hello Daniel and all,

resurrecting this series from end of last year,

do we think that this is the right approach and first step to be able to provide good performance for virsh save and virsh restore?

For reference, our previous attempt to get the performance for our use case (libvirt + qemu virsh save and restore under 5 seconds for a 30GB VM on NVMe disk) is here:

https://listman.redhat.com/archives/libvir-list/2022-June/232252.html

However since the option of a libvirt-only solution is not acceptable for upstream libvirt, Nikolay's attempt to create a file:/// migration target in QEMU
seemed to be the next preparatory step.

Do we still agree on this way forward, any comments? Thanks,

Claudio

On 10/28/22 12:39, Nikolay Borisov wrote:
> Here's the 3rd version of file-based migration support [0]. For background
> check the cover letter of the initial. The main changes are :
> 
> - Updated commit message as per Daniel Berrange's suggestino for Patches 1-2
> 
> - Fixed tab in various pages
> 
> - Added comments better explaining how json_writer_start_object in
> qemu_savevm_state_header is matched and also squashed the analyze-migration.py
> parts into patch 3
> 
> - Reworked the way pwritv/preadv are introduced. Now there are generic
> callbacks in QIOChannel that are implemented for the QIOChannelFile.
> 
> - Separated the introduction of QEMUFile-related helpers from the patch
> introducing the io interfaces.
> 
> - Added qtests for the file-based migration as well as for the fixed-ram
> feature.
> 
> [0] https://lore.kernel.org/qemu-devel/20221004123733.2745519-1-nborisov@suse.com/
> 
> Nikolay Borisov (14):
>   migration: support file: uri for source migration
>   migration: Add support for 'file:' uri for incoming migration
>   migration: Initial support of fixed-ram feature for
>     analyze-migration.py
>   io: Add generic pwritev/preadv interface
>   io: implement io_pwritev for QIOChannelFile
>   io: add and implement QIO_CHANNEL_FEATURE_SEEKABLE for channel file
>   migration/qemu-file: add utility methods for working with seekable
>     channels
>   io: Add preadv support to QIOChannelFile
>   migration: add qemu_get_buffer_at
>   migration/ram: Introduce 'fixed-ram' migration stream capability
>   migration: Refactor precopy ram loading code
>   migration: Add support for 'fixed-ram' migration restore
>   tests: Add migrate_incoming_qmp helper
>   tests/qtest: migration-test: Add tests for file-based migration
> 
>  include/exec/ramblock.h             |   7 +
>  include/io/channel.h                |  50 +++++
>  include/migration/qemu-file-types.h |   2 +
>  io/channel-file.c                   |  61 ++++++
>  io/channel.c                        |  26 +++
>  migration/file.c                    |  38 ++++
>  migration/file.h                    |  10 +
>  migration/meson.build               |   1 +
>  migration/migration.c               |  61 +++++-
>  migration/migration.h               |   6 +
>  migration/qemu-file.c               |  82 +++++++
>  migration/qemu-file.h               |   4 +
>  migration/ram.c                     | 328 +++++++++++++++++++++-------
>  migration/savevm.c                  |  48 ++--
>  qapi/migration.json                 |   2 +-
>  scripts/analyze-migration.py        |  49 ++++-
>  tests/qtest/migration-helpers.c     |  19 ++
>  tests/qtest/migration-helpers.h     |   4 +
>  tests/qtest/migration-test.c        |  46 ++++
>  19 files changed, 743 insertions(+), 101 deletions(-)
>  create mode 100644 migration/file.c
>  create mode 100644 migration/file.h
> 
> --
> 2.34.1
> 
> 


