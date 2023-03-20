Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820176C1042
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 12:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peDKk-0005ok-4b; Mon, 20 Mar 2023 07:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peDKh-0005oI-L3
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:05:43 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1peDKf-0007gl-1s
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:05:43 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8928921B70;
 Mon, 20 Mar 2023 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679310335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94RLxPPnicIHdpONc1FnXqELy48n0ZICqY4x67Q9jHo=;
 b=X3Vhg+B7y4wYABcacFMUTm+2c3Gz4JiUkaaPFruTKspF8JfjbW3Dk51puEbEzxQoR4AUbi
 FdiZfKBy6WN5f3ESNWEfzgpVng2U3aFYbjvvAlT2Zd+RWWWcaeTI5KowK/ZgnAuEVX8Y/d
 7DU+UT8YRAagEvfjrodb636P3hpCDPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679310335;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94RLxPPnicIHdpONc1FnXqELy48n0ZICqY4x67Q9jHo=;
 b=6jwFsRIosWCEstFWPn4cddPwhANkGsbBfL4InvaY3XUH+vUvfF82hIvpZhjbNGP1JoDe1M
 MOMRDtwoMZgSHFBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F7A113416;
 Mon, 20 Mar 2023 11:05:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xvi4Df89GGQPKQAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 20 Mar 2023 11:05:35 +0000
Message-ID: <a9934691-b0aa-dc1f-b496-2066bcfa4e46@suse.de>
Date: Mon, 20 Mar 2023 12:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 10/14] migration/ram: Introduce 'fixed-ram' migration
 stream capability
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
References: <20221028103914.908728-1-nborisov@suse.com>
 <20221028103914.908728-11-nborisov@suse.com> <Y+Z6wh7mEobCN5J8@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <Y+Z6wh7mEobCN5J8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 2/10/23 18:11, Daniel P. Berrangé wrote:
> On Fri, Oct 28, 2022 at 01:39:10PM +0300, Nikolay Borisov wrote:
>> Implement 'fixed-ram' feature. The core of the feature is to ensure that
>> each ram page of the migration stream has a specific offset in the
>> resulting migration stream. The reason why we'd want such behavior are
>> two fold:
>>
>>  - When doing a 'fixed-ram' migration the resulting file will have a
>>    bounded size, since pages which are dirtied multiple times will
>>    always go to a fixed location in the file, rather than constantly
>>    being added to a sequential stream. This eliminates cases where a vm
>>    with, say, 1g of ram can result in a migration file that's 10s of
>>    Gbs, provided that the workload constantly redirties memory.
>>
>>  - It paves the way to implement DIO-enabled save/restore of the
>>    migration stream as the pages are ensured to be written at aligned
>>    offsets.
>>
>> The features requires changing the format. First, a bitmap is introduced
>> which tracks which pages have been written (i.e are dirtied) during
>> migration and subsequently it's being written in the resultin file,
>> again at a fixed location for every ramblock. Zero pages are ignored as
>> they'd be zero in the destination migration as well. With the changed
>> format data would look like the following:
>>
>> |name len|name|used_len|pc*|bitmap_size|pages_offset|bitmap|pages|
>>
>> * pc - refers to the page_size/mr->addr members, so newly added members
>> begin from "bitmap_size".
>>
>> This layout is initialized during ram_save_setup so instead of having a
>> sequential stream of pages that follow the ramblock headers the dirty
>> pages for a ramblock follow its header. Since all pages have a fixed
>> location RAM_SAVE_FLAG_EOS is no longer generated on every migration
>> iteration but there is effectively a single RAM_SAVE_FLAG_EOS right at
>> the end.
>>
>> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
>> ---
>>  include/exec/ramblock.h |  7 +++
>>  migration/migration.c   | 51 +++++++++++++++++++++-
>>  migration/migration.h   |  1 +
>>  migration/ram.c         | 97 +++++++++++++++++++++++++++++++++--------
>>  migration/savevm.c      |  1 +
>>  qapi/migration.json     |  2 +-
>>  6 files changed, 138 insertions(+), 21 deletions(-)
> 
> This patch probably ought to extends the docs/devel/migration.rst
> file. Specifically the text following the 'Stream structure'
> heading.
> 
>>
>> diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
>> index 6cbedf9e0c9a..30216c1a41d3 100644
>> --- a/include/exec/ramblock.h
>> +++ b/include/exec/ramblock.h
>> @@ -43,6 +43,13 @@ struct RAMBlock {
>>      size_t page_size;
>>      /* dirty bitmap used during migration */
>>      unsigned long *bmap;
>> +    /* shadow dirty bitmap used when migrating to a file */
>> +    unsigned long *shadow_bmap;
>> +    /* offset in the file pages belonging to this ramblock are saved, used
>> +     * only during migration to a file
>> +     */
>> +    off_t bitmap_offset;
>> +    uint64_t pages_offset;
>>      /* bitmap of already received pages in postcopy */
>>      unsigned long *receivedmap;
>>  
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 11ceea340702..c7383845a5b4 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -165,7 +165,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>>      MIGRATION_CAPABILITY_XBZRLE,
>>      MIGRATION_CAPABILITY_X_COLO,
>>      MIGRATION_CAPABILITY_VALIDATE_UUID,
>> -    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>> +    MIGRATION_CAPABILITY_ZERO_COPY_SEND,
>> +    MIGRATION_CAPABILITY_FIXED_RAM);
>>  
>>  /* When we add fault tolerance, we could have several
>>     migrations at once.  For now we don't need to add
>> @@ -1326,6 +1327,27 @@ static bool migrate_caps_check(bool *cap_list,
>>      }
>>  #endif
>>  
>> +    if (cap_list[MIGRATION_CAPABILITY_FIXED_RAM]) {
>> +	    if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
>> +		    error_setg(errp, "Directly mapped memory incompatible with multifd");
>> +		    return false;
>> +	    }
>> +
>> +	    if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
>> +		    error_setg(errp, "Directly mapped memory incompatible with xbzrle");
>> +		    return false;
>> +	    }
>> +
>> +	    if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
>> +		    error_setg(errp, "Directly mapped memory incompatible with compression");
>> +		    return false;
>> +	    }
>> +
>> +	    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
>> +		    error_setg(errp, "Directly mapped memory incompatible with postcopy ram");
>> +		    return false;
>> +	    }
>> +    }
>>  
>>      /* incoming side only */
>>      if (runstate_check(RUN_STATE_INMIGRATE) &&
>> @@ -2630,6 +2652,11 @@ MultiFDCompression migrate_multifd_compression(void)
>>      return s->parameters.multifd_compression;
>>  }
>>  
>> +int migrate_fixed_ram(void)
>> +{
>> +    return migrate_get_current()->enabled_capabilities[MIGRATION_CAPABILITY_FIXED_RAM];
>> +}
>> +
>>  int migrate_multifd_zlib_level(void)
>>  {
>>      MigrationState *s;
>> @@ -4190,6 +4217,21 @@ static void *bg_migration_thread(void *opaque)
>>      return NULL;
>>  }
>>  
>> +static int
>> +migrate_check_fixed_ram(MigrationState *s, Error **errp)
>> +{
>> +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_FIXED_RAM])
>> +        return 0;
>> +
>> +    if (!qemu_file_is_seekable(s->to_dst_file)) {
>> +        error_setg(errp, "Directly mapped memory requires a seekable transport");
>> +        return -1;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +
>>  void migrate_fd_connect(MigrationState *s, Error *error_in)
>>  {
>>      Error *local_err = NULL;
>> @@ -4265,6 +4307,12 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>>          return;
>>      }
>>  
>> +    if (migrate_check_fixed_ram(s, &local_err) < 0) {
>> +	    migrate_fd_cleanup(s);
>> +	    migrate_fd_error(s, local_err);
>> +	    return;
>> +    }
>> +
>>      if (resume) {
>>          /* Wakeup the main migration thread to do the recovery */
>>          migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
>> @@ -4398,6 +4446,7 @@ static Property migration_properties[] = {
>>      DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
>>  
>>      /* Migration capabilities */
>> +    DEFINE_PROP_MIG_CAP("x-fixed-ram", MIGRATION_CAPABILITY_FIXED_RAM),
>>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
>>      DEFINE_PROP_MIG_CAP("x-rdma-pin-all", MIGRATION_CAPABILITY_RDMA_PIN_ALL),
>>      DEFINE_PROP_MIG_CAP("x-auto-converge", MIGRATION_CAPABILITY_AUTO_CONVERGE),
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 96f27aba2210..9aab1b16f407 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -410,6 +410,7 @@ bool migrate_zero_blocks(void);
>>  bool migrate_dirty_bitmaps(void);
>>  bool migrate_ignore_shared(void);
>>  bool migrate_validate_uuid(void);
>> +int migrate_fixed_ram(void);
>>  
>>  bool migrate_auto_converge(void);
>>  bool migrate_use_multifd(void);
>> diff --git a/migration/ram.c b/migration/ram.c
>> index dc1de9ddbc68..4f5ddaff356b 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1261,9 +1261,14 @@ static int save_zero_page_to_file(RAMState *rs, QEMUFile *file,
>>      int len = 0;
>>  
>>      if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
>> -        len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
>> -        qemu_put_byte(file, 0);
>> -        len += 1;
>> +        if (migrate_fixed_ram()) {
>> +            /* for zero pages we don't need to do anything */
>> +            len = 1;
>> +        } else {
>> +            len += save_page_header(rs, file, block, offset | RAM_SAVE_FLAG_ZERO);
>> +            qemu_put_byte(file, 0);
>> +            len += 1;
>> +        }
>>          ram_release_page(block->idstr, offset);
>>      }
>>      return len;
>> @@ -1342,15 +1347,22 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>>  static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>>                              uint8_t *buf, bool async)
>>  {
>> -    ram_transferred_add(save_page_header(rs, rs->f, block,
>> -                                         offset | RAM_SAVE_FLAG_PAGE));
>> -    if (async) {
>> -        qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
>> -                              migrate_release_ram() &&
>> -                              migration_in_postcopy());
>> -    } else {
>> -        qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
>> -    }
>> +
>> +	if (migrate_fixed_ram()) {
>> +		qemu_put_buffer_at(rs->f, buf, TARGET_PAGE_SIZE,
>> +				   block->pages_offset + offset);
>> +		set_bit(offset >> TARGET_PAGE_BITS, block->shadow_bmap);
>> +	} else {
>> +		ram_transferred_add(save_page_header(rs, rs->f, block,
>> +						     offset | RAM_SAVE_FLAG_PAGE));
>> +		if (async) {
>> +			qemu_put_buffer_async(rs->f, buf, TARGET_PAGE_SIZE,
>> +					      migrate_release_ram() &&
>> +					      migration_in_postcopy());
>> +		} else {
>> +			qemu_put_buffer(rs->f, buf, TARGET_PAGE_SIZE);
>> +		}
>> +	}
>>      ram_transferred_add(TARGET_PAGE_SIZE);
>>      ram_counters.normal++;
>>      return 1;
>> @@ -2683,6 +2695,8 @@ static void ram_save_cleanup(void *opaque)
>>          block->clear_bmap = NULL;
>>          g_free(block->bmap);
>>          block->bmap = NULL;
>> +        g_free(block->shadow_bmap);
>> +        block->shadow_bmap = NULL;
>>      }
>>  
>>      xbzrle_cleanup();
>> @@ -3044,6 +3058,7 @@ static void ram_list_init_bitmaps(void)
>>               */
>>              block->bmap = bitmap_new(pages);
>>              bitmap_set(block->bmap, 0, pages);
>> +            block->shadow_bmap = bitmap_new(block->used_length >> TARGET_PAGE_BITS);
>>              block->clear_bmap_shift = shift;
>>              block->clear_bmap = bitmap_new(clear_bmap_size(pages, shift));
>>          }
>> @@ -3226,12 +3241,34 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>              qemu_put_buffer(f, (uint8_t *)block->idstr, strlen(block->idstr));
>>              qemu_put_be64(f, block->used_length);
>>              if (migrate_postcopy_ram() && block->page_size !=
>> -                                          qemu_host_page_size) {
>> +                qemu_host_page_size) {
>>                  qemu_put_be64(f, block->page_size);
>>              }
>>              if (migrate_ignore_shared()) {
>>                  qemu_put_be64(f, block->mr->addr);
>>              }
>> +
>> +            if (migrate_fixed_ram()) {
>> +                long num_pages = block->used_length >> TARGET_PAGE_BITS;
>> +                long bitmap_size = BITS_TO_LONGS(num_pages) * sizeof(unsigned long);
>> +
>> +
>> +                /* Needed for external programs (think analyze-migration.py) */
>> +                qemu_put_be32(f, bitmap_size);
>> +
>> +                /*
>> +                 * Make pages offset aligned to TARGET_PAGE_SIZE to enable
>> +                 * DIO in the future. Also add 8 to account for the page offset
>> +                 * itself
>> +                 */
>> +                block->bitmap_offset = qemu_get_offset(f) + 8;
>> +                block->pages_offset = ROUND_UP(block->bitmap_offset +
>> +                                               bitmap_size, TARGET_PAGE_SIZE);
> 
> I'm not sure that rounding to TARGET_PAGE_SIZE is sufficient.
> 
> If we've built QEMU for a 32-bit i686 target, but are running on a 64-bit
> kernel, is TARGET_PAGE_SIZE going to offer sufficient alignement to keep
> the kernel happy.
> 
> Also O_DIRECT has alignment constraints beyond simply the page size. The
> page size alignment is most important for the buffers being passed
> back and forth. The on-disk alignment constraint is actually defined by
> the filesystem and storage it is on, and on-disk alignment is what
> matters when we decide on pages_offset.

For comparison, in the libvirt iohelper the alignment of DIRECT I/O-friendly transfers is 64K,
as per libvirt commit:

commit 12291656b135ed788e41dadbd2d15e613ddea9b5
Author: Eric Blake <eblake@redhat.com>
Date:   Tue Jul 12 08:35:05 2011 -0600

    save: let iohelper work on O_DIRECT fds
    
    Required for a coming patch where iohelper will operate on O_DIRECT
    fds.  There, the user-space memory must be aligned to file system
    boundaries (at least 512, but using page-aligned works better, and
    some file systems prefer 64k).  Made tougher by the fact that
    VIR_ALLOC won't work on void *, but posix_memalign won't work on
    char * and isn't available everywhere.
    
    This patch makes some simplifying assumptions - namely, output
    to an O_DIRECT fd will only be attempted on an empty seekable
    file (hence, no need to worry about preserving existing data
    on a partial block, and ftruncate will work to undo the effects
    of having to round up the size of the last block written), and
    input from an O_DIRECT fd will only be attempted on a complete
    seekable file with the only possible short read at EOF.
    
    * configure.ac (AC_CHECK_FUNCS_ONCE): Check for posix_memalign.
    * src/util/iohelper.c (runIO): Use aligned memory, and handle
    quirks of O_DIRECT on last write.


> 
> If we want to allow saved state to be copied across different filesystems/
> hosts, we need to consider the worst case alignment that would exist on
> any conceivable host deployment now or in the future.
> 
> Given that RAM sizes are measured 1000's of MBs in any scenario where
> we care about save/restore speed enough to use the fixed-ram feature,
> we can afford to waste a little space.
> 
> IOW, we could round pages_offset upto the nearest 1 MB boundary,
> which ought to be well enough aligned to cope with any constraint
> we might imagine ? Or possibly even align to 4 MB, which is a common
> size for small-ish huge pages.
> 
> 
>> +                qemu_put_be64(f, block->pages_offset);
>> +
>> +                /* Now prepare offset for next ramblock */
>> +                qemu_set_offset(f, block->pages_offset + block->used_length, SEEK_SET);
>> +            }
>>          }
>>      }
>>  
>> @@ -3249,6 +3286,17 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>      return 0;
>>  }
>>  
>> +static void ram_save_shadow_bmap(QEMUFile *f)
>> +{
>> +    RAMBlock *block;
>> +
>> +    RAMBLOCK_FOREACH_MIGRATABLE(block) {
>> +        long num_pages = block->used_length >> TARGET_PAGE_BITS;
>> +        long bitmap_size = BITS_TO_LONGS(num_pages) * sizeof(unsigned long);
>> +        qemu_put_buffer_at(f, (uint8_t *)block->shadow_bmap, bitmap_size, block->bitmap_offset);
>> +    }
>> +}
>> +
>>  /**
>>   * ram_save_iterate: iterative stage for migration
>>   *
>> @@ -3358,9 +3406,15 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
>>              return ret;
>>          }
>>  
>> -        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>> -        qemu_fflush(f);
>> -        ram_transferred_add(8);
>> +	/*
>> +	 * For fixed ram we don't want to pollute the migration stream with
>> +	 * EOS flags.
>> +	 */
>> +	if (!migrate_fixed_ram()) {
>> +            qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>> +            qemu_fflush(f);
>> +            ram_transferred_add(8);
>> +	}
>>  
>>          ret = qemu_file_get_error(f);
>>      }
>> @@ -3405,7 +3459,10 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>>              pages = ram_find_and_save_block(rs);
>>              /* no more blocks to sent */
>>              if (pages == 0) {
>> -                break;
>> +                if (migrate_fixed_ram()) {
>> +                    ram_save_shadow_bmap(f);
>> +                }
>> +            break;
>>              }
>>              if (pages < 0) {
>>                  ret = pages;
>> @@ -3428,8 +3485,10 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>>          return ret;
>>      }
>>  
>> -    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>> -    qemu_fflush(f);
>> +    if (!migrate_fixed_ram()) {
>> +        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>> +        qemu_fflush(f);
>> +    }
>>  
>>      return 0;
>>  }
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 44a222888306..847a8bdfb6ce 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -240,6 +240,7 @@ static bool should_validate_capability(int capability)
>>      /* Validate only new capabilities to keep compatibility. */
>>      switch (capability) {
>>      case MIGRATION_CAPABILITY_X_IGNORE_SHARED:
>> +    case MIGRATION_CAPABILITY_FIXED_RAM:
>>          return true;
>>      default:
>>          return false;
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 88ecf86ac876..6196617171e8 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -485,7 +485,7 @@
>>  ##
>>  { 'enum': 'MigrationCapability',
>>    'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
>> -           'compress', 'events', 'postcopy-ram',
>> +           'compress', 'events', 'postcopy-ram', 'fixed-ram',
>>             { 'name': 'x-colo', 'features': [ 'unstable' ] },
>>             'release-ram',
>>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>> -- 
>> 2.34.1
>>
> 
> With regards,
> Daniel

Thanks,

Claudio

