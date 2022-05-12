Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B564552488D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 11:06:36 +0200 (CEST)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np4mJ-00057j-PB
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 05:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np4Ie-0003mu-Fe
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np4Ib-0006wJ-F7
 for qemu-devel@nongnu.org; Thu, 12 May 2022 04:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652344547;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=rxlIlTaInPxAX9k1Tpo4ZziQcxHeTWOLiANo2KXGvA8=;
 b=hYpSBYeirGfQm9M6QniD3mL3Z7dBfykxyJAeNYTR6/XKwkhY5CMj38/1xv/wtm/a7qeAB1
 eJNgLZTkvPc3CHnf1TlKYrACpQd/xuZXY0lEYjArxT0WCCR9ZKTuk4KjwcL7GobTS5zbLK
 cDlhHn8/rHSuk+Zm3F1DEULg3rsUW6E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-MYr9gknBNiaMqDti8X70eQ-1; Thu, 12 May 2022 04:35:44 -0400
X-MC-Unique: MYr9gknBNiaMqDti8X70eQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E400329324AC;
 Thu, 12 May 2022 08:35:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C67E40C1244;
 Thu, 12 May 2022 08:35:41 +0000 (UTC)
Date: Thu, 12 May 2022 09:35:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH RESEND] qga: add guest-get-diskstats command for Linux
 guests
Message-ID: <YnzG2kjhg+3CudeU@redhat.com>
References: <20220512011930.214-1-luzhipeng@cestc.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220512011930.214-1-luzhipeng@cestc.cn>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 12, 2022 at 09:19:30AM +0800, luzhipeng wrote:
> Add a new 'guest-get-diskstats' command for report disk io statistics
> for Linux guests. This can be usefull for getting io flow or handling
> IO fault, no need to enter guests.
> 
> Signed-off-by: luzhipeng <luzhipeng@cestc.cn>
> ---
>  qga/commands-posix.c | 94 ++++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c |  6 +++
>  qga/qapi-schema.json | 86 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 186 insertions(+)
> 
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 69f209af87..2b96c9ae6e 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2783,6 +2783,93 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_info(Error **errp)
>      return info;
>  }
>  
> +#define MAX_NAME_LEN 128
> +static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
> +{
> +#ifdef CONFIG_LINUX
> +    GuestDiskStatsInfoList *head = NULL, **tail = &head;
> +    const char *diskstats = "/proc/diskstats";
> +    FILE *fp;
> +    size_t n;
> +    char *line = NULL;
> +    char dev_name[MAX_NAME_LEN];
> +    int i;
> +    unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks, fl_ticks;
> +    unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec, wr_ios;
> +    unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
> +    unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
> +    unsigned int major, minor;
> +
> +    fp = fopen(diskstats, "r");
> +    if (fp  == NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        return NULL;
> +    }
> +    while (getline(&line, &n, fp) != -1) {
> +        i = sscanf(line, "%u %u %s %lu %lu %lu"
> +                   "%lu %lu %lu %lu %u %u %u %u"
> +                   "%lu %lu %lu %u %lu %u",
> +                  &major, &minor, dev_name,
> +                  &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
> +                  &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
> +                  &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
> +                  &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
> +                  &fl_ios, &fl_ticks);

Nothing free's the 'line' buffer after this point.

> +        GuestDiskStatsInfo *diskstatinfo = g_malloc0(sizeof *diskstatinfo);

Our preferred style is g_new0 rather than g_malloc0 eg

  g_new0(GuestDiskStatsInfo, 1)

> +        GuestDiskStats *diskstat = g_malloc0(sizeof *diskstat);
> +        if (i >= 14) {
> +            diskstatinfo->name = g_strdup(dev_name);
> +            diskstatinfo->major = major;
> +            diskstatinfo->minor = minor;
> +            diskstat->rd_ios = rd_ios;
> +            diskstat->rd_merges = rd_merges_or_rd_sec;
> +            diskstat->rd_sectors = rd_sec_or_wr_ios;
> +            diskstat->rd_ticks = rd_ticks_or_wr_sec;
> +            diskstat->wr_ios = wr_ios;
> +            diskstat->wr_merges = wr_merges;
> +            diskstat->wr_sectors = wr_sec;
> +            diskstat->wr_ticks = wr_ticks;
> +            diskstat->ios_pgr = ios_pgr;
> +            diskstat->tot_ticks = tot_ticks;
> +            diskstat->rq_ticks = rq_ticks;
> +            if (i >= 18) {
> +                diskstat->dc_ios = dc_ios;
> +                diskstat->dc_merges = dc_merges;
> +                diskstat->dc_sectors = dc_sec;
> +                diskstat->dc_ticks = dc_ticks;
> +            }
> +            if (i >= 20) {
> +                diskstat->fl_ios = fl_ios;
> +                diskstat->fl_ticks = fl_ticks;
> +            }
> +            diskstatinfo->stats = diskstat;
> +            QAPI_LIST_APPEND(tail, diskstatinfo);
> +        } else if (i == 7) {
> +            diskstatinfo->name = g_strdup(dev_name);
> +            diskstatinfo->major = major;
> +            diskstatinfo->minor = minor;
> +            diskstat->rd_ios = rd_ios;
> +            diskstat->rd_sectors = rd_merges_or_rd_sec;
> +            diskstat->wr_ios = rd_sec_or_wr_ios;
> +            diskstat->wr_sectors = rd_ticks_or_wr_sec;

In this branch nothing adds 'diskstat' to 'diskstatinfo', nor
'diskstatinfo' to 'tail'.

> +        } else {
> +            g_free(diskstat);
> +            g_free(diskstatinfo);
> +        }

THe whole body structure needs changing IMHO

  GuestDiskStatsInfo *diskstatinfo;
  GuestDiskStats *diskstat;

  i = scanf(....)
  if  (i < 7)
     continue

  diskstatinfo = g_new0(GuestDiskStatsInfo, 1);
  diskstat = g_new0(GuestDiskStats, 1);

  ...fill in first 7 fields...

  if (i >= 14) {
    ...next fields...
  }

  if (i >= 18) {
    ...next fields...
  }

  if (i >= 20) {
    ...next fields...
  }

  diskstatinfo->stats = diskstat;
  QAPI_LIST_APPEND(tail, diskstatinfo);


> +    }
> +    fclose(fp);
> +    return head;
> +#else
> +    g_debug("disk stats reporting available only for Linux");
> +    return NULL;
> +#endif
> +}
> +
> +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> +{
> +    return guest_get_diskstats(errp);
> +}
> +
>  #else /* defined(__linux__) */
>  
>  void qmp_guest_suspend_disk(Error **errp)
> @@ -3131,6 +3218,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
>      return NULL;
>  }
>  
> +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> +
> +
>  #endif /* CONFIG_FSFREEZE */
>  
>  #if !defined(CONFIG_FSTRIM)
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index d56b5fd2a7..dcdeb76a68 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2532,3 +2532,9 @@ char *qga_get_host_name(Error **errp)
>  
>      return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
>  }
> +
> +GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 4d8e506c9e..ec48629476 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1490,3 +1490,89 @@
>  { 'command': 'guest-ssh-remove-authorized-keys',
>    'data': { 'username': 'str', 'keys': ['str'] },
>    'if': 'CONFIG_POSIX' }
> +
> +##
> +# @GuestDiskStats:
> +#
> +# @rd-sectors: of sectors read

s/: of sectors read/: Number of sectors read/

and use ': Number of' for all cases below that start ': of'

> +#
> +# @wr-sectors: of sectors write
> +#
> +# @dc-sectors: of sectors discard
> +#
> +# @rd-ios: of read operations issued to the device
> +#
> +# @rd-merges: of read requests merged
> +#
> +# @wr-ios: of write operations issued to the device
> +#
> +# @wr-merges: of write requests merged
> +#
> +# @dc-ios: of discard operations issued to the device
> +#
> +# @dc-merges: of discard requests merged
> +#
> +# @fl-ios: of flush requests issued to the device
> +#
> +# @rd-ticks: Time of read requests in queue

Document what units is time measured in. ie how long is
a 'tick' ?  Ideally we should report in a standardized
OS independant unit such as "milliseconds" (assuming
we don't need more granularity micro/nano ?)

> +#
> +# @wr-ticks: Time of write requests in queue
> +#
> +# @dc-ticks: Time of discard requests in queue
> +#
> +# @fl-ticks: Time of flush requests in queue
> +#
> +# @ios-pgr: of I/Os in progress

'in flight' rather than 'in progress' perhaps

> +#
> +# @tot-ticks: of ticks total (for this device) for I/O
> +#
> +# @rq-ticks: of ticks requests spent in queue
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'GuestDiskStats',
> +  'data': {'rd-sectors': 'uint64',
> +            'wr-sectors': 'uint64',
> +            'dc-sectors': 'uint64',
> +            'rd-ios': 'uint64',
> +            'rd-merges': 'uint64',
> +            'wr-ios': 'uint64',
> +            'wr-merges': 'uint64',
> +            'dc-ios': 'uint64',
> +            'dc-merges': 'uint64',
> +            'fl-ios': 'uint64',
> +            'rd-ticks': 'uint64',
> +            'wr-ticks': 'uint64',
> +            'dc-ticks': 'uint64',
> +            'fl-ticks': 'uint64',
> +            'ios-in-flight': 'uint64',
> +            'tot-ticks': 'uint64',
> +            'rq-ticks': 'uint64'
> +           } }

I wonder if we should just spell out the words instead
of abbreviating here ie

 { 'struct': 'GuestDiskStats',
   'data': {'read-sectors': 'uint64',
             'write-sectors': 'uint64',
             'discard-sectors': 'uint64',
             'read-ios': 'uint64',
             'read-merges': 'uint64',
             'write-ios': 'uint64',
             'write-merges': 'uint64',
             'discard-ios': 'uint64',
             'discard-merges': 'uint64',
             'flush-ios': 'uint64',
             'read-ticks': 'uint64',
             'write-ticks': 'uint64',
             'discard-ticks': 'uint64',
             'flush-ticks': 'uint64',
             'ios-pgr': 'uint64',
             'total-ticks': 'uint64',
             'queued-ticks': 'uint64'
            } }

> +
> +##
> +# @GuestDiskStatsInfo:
> +#
> +# @name disk name
> +#
> +# @major major of disk
> +#
> +# @minor minor of disk
> +##
> +{ 'struct': 'GuestDiskStatsInfo',
> +  'data': {'name': 'str',
> +           'major': 'uint64',
> +           'minor': 'uint64',
> +           'stats': 'GuestDiskStats' } }
> +
> +##
> +# @guest-get-diskstats:
> +#
> +# Retrieve information about disk io.
> +# Returns: List of disk stats of guest.
> +#
> +# Since: 7.1
> +##
> +{ 'command': 'guest-get-diskstats',
> +  'returns': ['GuestDiskStatsInfo']
> +}
> -- 
> 2.31.1
> 
> 
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


