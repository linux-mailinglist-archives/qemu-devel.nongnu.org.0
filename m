Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E8526030
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:52:19 +0200 (CEST)
Received: from localhost ([::1]:47134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSu9-0004Kk-T5
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1npSss-0003UQ-UV
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1npSso-0007JS-Tq
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652439054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uobSzNjjEPPjNzl35KZVK5DaO/LVc86Rehnh6gNuxoY=;
 b=XFl5t4Iyf+54jvrbgVVUyNlzRPJno9ztqFm2QYI6lW7GqHiGQfv3+kcyeAp9As2tYjp84Z
 ck+sJY7quqH1uq/dn1vIw07UpW2isSYMqh1wOhQMsvdJvm+FR1hi4fPPAqLOLVt7ELtEBH
 9N9csWkLHz6wOt9Kyav2UkCTo0hl4pI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-xmvKo9iFNGGC8D_cAtjdPw-1; Fri, 13 May 2022 06:50:51 -0400
X-MC-Unique: xmvKo9iFNGGC8D_cAtjdPw-1
Received: by mail-yb1-f198.google.com with SMTP id
 v64-20020a25abc6000000b0064a22f2a1e7so6922067ybi.17
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 03:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uobSzNjjEPPjNzl35KZVK5DaO/LVc86Rehnh6gNuxoY=;
 b=5dZf9QDAUi3dNgeLZXRm3fCYD35X1Hb0yIQeAXhNdaq5hm/PNi335eXhQ3AVS93nW/
 t8POeSWciKCWn7+4o/26uS88+Bmy8frrlv6Fgr3o51KPD+VgUydXb32f0ajbJ2DNVaI3
 sHzBQrcwJq3jPv0PlE78Onbu931JxkCiPbX8SqejinmaMlSeEGC11Hudss1pwYcyc6kD
 BTjuw9lwwEWzTCPrHqGn0+QUSx3hka8bMtfiWl2Umfvp9Jdtp5V92T6xD9CpPqRM+wKr
 APZX5NeiIAKG3nktk2ASnGwtLvxJLJnDS4Yoii5me+EFPyt7VKO0WXzqTv5hx6FBObrX
 3Jbg==
X-Gm-Message-State: AOAM532/89sr7C+V7bVdIzJzWNPz1s93uFdig3LwHMxnUuS9oO662JPm
 v6WH8LfzMT6gimpfllcm7jE1d9JntGzO/Y2xuwADnWv8rRKvz7KZxHOqaTJcuIhrHFam8s36vur
 HHhSN3hM0wQ+/AIs6wX6SDTFFAih+Dz8=
X-Received: by 2002:a5b:f41:0:b0:64a:7639:3bab with SMTP id
 y1-20020a5b0f41000000b0064a76393babmr4033497ybr.138.1652439050511; 
 Fri, 13 May 2022 03:50:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytXq65hiLIazGGcBW6fHPxCixqOmKbMPFNoEnQ2HplR+XMk/pERXmbZVnVQzJGwLt8qcPPhwvqnKKrNAdDbk8=
X-Received: by 2002:a5b:f41:0:b0:64a:7639:3bab with SMTP id
 y1-20020a5b0f41000000b0064a76393babmr4033478ybr.138.1652439050300; Fri, 13
 May 2022 03:50:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220513103924.1332-1-luzhipeng@cestc.cn>
In-Reply-To: <20220513103924.1332-1-luzhipeng@cestc.cn>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Fri, 13 May 2022 13:50:39 +0300
Message-ID: <CAPMcbCqXGMOC-z+LQgduJ98uk68Jk=+UyPD0es8O-h-RiBXQdA@mail.gmail.com>
Subject: Re: [PATCH v2] qga: add guest-get-diskstats command for Linux guests
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Michal Privoznik <mprivozn@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009b442c05dee2723c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000009b442c05dee2723c
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022 at 1:40 PM luzhipeng <luzhipeng@cestc.cn> wrote:

> Add a new 'guest-get-diskstats' command for report disk io statistics
> for Linux guests. This can be usefull for getting io flow or handling
> IO fault, no need to enter guests.
>
> Signed-off-by: luzhipeng <luzhipeng@cestc.cn>
>
> ---
> Changes v1->v2:
>  v1:https://patchew.org/QEMU/20220512011930.214-1-luzhipeng@cestc.cn/
>
>  qga/commands-posix.c | 97 ++++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c |  6 +++
>  qga/qapi-schema.json | 86 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 189 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 69f209af87..7a16d84e3a 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2783,6 +2783,96 @@ GuestMemoryBlockInfo
> *qmp_guest_get_memory_block_info(Error **errp)
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
> +    unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks,
> fl_ticks;
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
> +        GuestDiskStatsInfo *diskstatinfo;
> +        GuestDiskStats *diskstat;
> +        i = sscanf(line, "%u %u %s %lu %lu %lu"
> +                   "%lu %lu %lu %lu %u %u %u %u"
> +                   "%lu %lu %lu %u %lu %u",
> +                  &major, &minor, dev_name,
> +                  &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
> +                  &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
> +                  &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
> +                  &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
> +                  &fl_ios, &fl_ticks);
> +
> +        diskstatinfo = g_new0(GuestDiskStatsInfo, 1);
> +        diskstat = g_new0(GuestDiskStats, 1);
>
+        if (i < 7) {
>

diskstatinfo and diskstat pointers do not have g_autoptr attribute and
will be not added to the results list.
So, looks like we have a memory leak in this case.


> +            continue;
> +        }
> +        diskstatinfo->name = g_strdup(dev_name);
> +        diskstatinfo->major = major;
> +        diskstatinfo->minor = minor;
> +        if (i == 7) {
> +            diskstat->read_ios = rd_ios;
> +            diskstat->read_sectors = rd_merges_or_rd_sec;
> +            diskstat->write_ios = rd_sec_or_wr_ios;
> +            diskstat->write_sectors = rd_ticks_or_wr_sec;
> +        }
> +        if (i >= 14) {
> +            diskstat->read_ios = rd_ios;
> +            diskstat->read_sectors = rd_sec_or_wr_ios;
> +            diskstat->read_merges = rd_merges_or_rd_sec;
> +            diskstat->read_ticks = rd_ticks_or_wr_sec;
> +            diskstat->write_ios = wr_ios;
> +            diskstat->write_sectors = wr_sec;
> +            diskstat->write_merges = wr_merges;
> +            diskstat->write_ticks = wr_ticks;
> +            diskstat->ios_pgr = ios_pgr;
> +            diskstat->total_ticks = tot_ticks;
> +            diskstat->weight_ticks = rq_ticks;
> +        }
> +        if (i >= 18) {
> +            diskstat->discard_ios = dc_ios;
> +            diskstat->discard_merges = dc_merges;
> +            diskstat->discard_sectors = dc_sec;
> +            diskstat->discard_ticks = dc_ticks;
> +        }
> +        if (i >= 20) {
> +            diskstat->flush_ios = fl_ios;
> +            diskstat->flush_ticks = fl_ticks;
> +        }
> +
> +        diskstatinfo->stats = diskstat;
> +        QAPI_LIST_APPEND(tail, diskstatinfo);
> +    }
> +    g_free(line);
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
> @@ -3131,6 +3221,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
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
> index 4d8e506c9e..94aad4f2ae 100644
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
> +# @read-sectors: sectors read
> +#
> +# @write-sectors: sectors written
> +#
> +# @discard-sectors: sectors discarded
> +#
> +# @read-ios: reads completed successfully
> +#
> +# @read-merges: Number of read requests merged
> +#
> +# @write-ios: writes completed
> +#
> +# @write-merges: Number of write requests merged
> +#
> +# @discard-ios: Number of discards completed successfully
> +#
> +# @discard-merges: NUmber of discard requests merged
> +#
> +# @flush-ios: Number of flush requests completed successfully
> +#
> +# @read-ticks: time spent reading(ms)
> +#
> +# @write-ticks: time spent writing(ms)
> +#
> +# @discard-ticks: time spent discarding(ms)
> +#
> +# @flush-ticks: time spent flushing(ms)
> +#
> +# @ios-pgr: Number of I/Os currently in flight
> +#
> +# @total-ticks: time spent doing I/Os (ms)
> +#
> +# @weight-ticks: weighted time spent doing I/Os since the last update of
> this field(ms)
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'GuestDiskStats',
> +  'data': {'read-sectors': 'uint64',
> +            'write-sectors': 'uint64',
> +            'discard-sectors': 'uint64',
> +            'read-ios': 'uint64',
> +            'read-merges': 'uint64',
> +            'write-ios': 'uint64',
> +            'write-merges': 'uint64',
> +            'discard-ios': 'uint64',
> +            'discard-merges': 'uint64',
> +            'flush-ios': 'uint64',
> +            'read-ticks': 'uint64',
> +            'write-ticks': 'uint64',
> +            'discard-ticks': 'uint64',
> +            'flush-ticks': 'uint64',
> +            'ios-pgr': 'uint64',
> +            'total-ticks': 'uint64',
> +            'weight-ticks': 'uint64'
> +           } }
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
> +# Retrieve information about disk stats.
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

--0000000000009b442c05dee2723c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 13, 2022 at 1:40 PM luzhi=
peng &lt;<a href=3D"mailto:luzhipeng@cestc.cn">luzhipeng@cestc.cn</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add a new =
&#39;guest-get-diskstats&#39; command for report disk io statistics<br>
for Linux guests. This can be usefull for getting io flow or handling<br>
IO fault, no need to enter guests.<br>
<br>
Signed-off-by: luzhipeng &lt;<a href=3D"mailto:luzhipeng@cestc.cn" target=
=3D"_blank">luzhipeng@cestc.cn</a>&gt;<br>
<br>
---<br>
Changes v1-&gt;v2:<br>
=C2=A0v1:<a href=3D"https://patchew.org/QEMU/20220512011930.214-1-luzhipeng=
@cestc.cn/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/2=
0220512011930.214-1-luzhipeng@cestc.cn/</a><br>
<br>
=C2=A0qga/commands-posix.c | 97 +++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/commands-win32.c |=C2=A0 6 +++<br>
=C2=A0qga/qapi-schema.json | 86 +++++++++++++++++++++++++++++++++++++++<br>
=C2=A03 files changed, 189 insertions(+)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 69f209af87..7a16d84e3a 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2783,6 +2783,96 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_inf=
o(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0return info;<br>
=C2=A0}<br>
<br>
+#define MAX_NAME_LEN 128<br>
+static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)<br>
+{<br>
+#ifdef CONFIG_LINUX<br>
+=C2=A0 =C2=A0 GuestDiskStatsInfoList *head =3D NULL, **tail =3D &amp;head;=
<br>
+=C2=A0 =C2=A0 const char *diskstats =3D &quot;/proc/diskstats&quot;;<br>
+=C2=A0 =C2=A0 FILE *fp;<br>
+=C2=A0 =C2=A0 size_t n;<br>
+=C2=A0 =C2=A0 char *line =3D NULL;<br>
+=C2=A0 =C2=A0 char dev_name[MAX_NAME_LEN];<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_tick=
s, fl_ticks;<br>
+=C2=A0 =C2=A0 unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_se=
c, wr_ios;<br>
+=C2=A0 =C2=A0 unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;<br>
+=C2=A0 =C2=A0 unsigned long dc_ios, dc_merges, dc_sec, fl_ios;<br>
+=C2=A0 =C2=A0 unsigned int major, minor;<br>
+<br>
+=C2=A0 =C2=A0 fp =3D fopen(diskstats, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 if (fp=C2=A0 =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, diskstats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestDiskStatsInfo *diskstatinfo;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GuestDiskStats *diskstat;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D sscanf(line, &quot;%u %u %s %lu %lu %lu&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;%lu %lu %lu %lu %u %u %u %u&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;%lu %lu %lu %u %lu %u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;major,=
 &amp;minor, dev_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;rd_ios=
, &amp;rd_merges_or_rd_sec, &amp;rd_sec_or_wr_ios,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;rd_tic=
ks_or_wr_sec, &amp;wr_ios, &amp;wr_merges, &amp;wr_sec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;wr_tic=
ks, &amp;ios_pgr, &amp;tot_ticks, &amp;rq_ticks,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;dc_ios=
, &amp;dc_merges, &amp;dc_sec, &amp;dc_ticks,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;fl_ios=
, &amp;fl_ticks);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat =3D g_new0(GuestDiskStats, 1);<br></b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &lt; 7) {<br></blockquote><div><br></div=
><div>diskstatinfo and diskstat pointers do not have <span class=3D"gmail-p=
l-c1">g_<span class=3D"gmail-text-bold gmail-hx_keyword-hl gmail-rounded-2 =
gmail-d-inline-block">autoptr attribute and</span></span></div><div><span c=
lass=3D"gmail-pl-c1"><span class=3D"gmail-text-bold gmail-hx_keyword-hl gma=
il-rounded-2 gmail-d-inline-block">will be not added to the results list.</=
span></span></div><div><span class=3D"gmail-pl-c1"><span class=3D"gmail-tex=
t-bold gmail-hx_keyword-hl gmail-rounded-2 gmail-d-inline-block">So, looks =
like we have a memory leak in this case.<code></code></span></span></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;name =3D g_strdup(dev_name);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;major =3D major;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;minor =3D minor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 7) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ios =3D rd_ios=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_sectors =3D rd=
_merges_or_rd_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ios =3D rd_se=
c_or_wr_ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_sectors =3D r=
d_ticks_or_wr_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 14) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ios =3D rd_ios=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_sectors =3D rd=
_sec_or_wr_ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_merges =3D rd_=
merges_or_rd_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ticks =3D rd_t=
icks_or_wr_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ios =3D wr_io=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_sectors =3D w=
r_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_merges =3D wr=
_merges;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ticks =3D wr_=
ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;ios_pgr =3D ios_pgr=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;total_ticks =3D tot=
_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;weight_ticks =3D rq=
_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 18) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_ios =3D dc_=
ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_merges =3D =
dc_merges;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_sectors =3D=
 dc_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_ticks =3D d=
c_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 20) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;flush_ios =3D fl_io=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;flush_ticks =3D fl_=
ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;stats =3D diskstat;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, diskstatinfo);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 g_free(line);<br>
+=C2=A0 =C2=A0 fclose(fp);<br>
+=C2=A0 =C2=A0 return head;<br>
+#else<br>
+=C2=A0 =C2=A0 g_debug(&quot;disk stats reporting available only for Linux&=
quot;);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+#endif<br>
+}<br>
+<br>
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 return guest_get_diskstats(errp);<br>
+}<br>
+<br>
=C2=A0#else /* defined(__linux__) */<br>
<br>
=C2=A0void qmp_guest_suspend_disk(Error **errp)<br>
@@ -3131,6 +3221,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)=
<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
+<br>
+<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
<br>
=C2=A0#if !defined(CONFIG_FSTRIM)<br>
diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
index d56b5fd2a7..dcdeb76a68 100644<br>
--- a/qga/commands-win32.c<br>
+++ b/qga/commands-win32.c<br>
@@ -2532,3 +2532,9 @@ char *qga_get_host_name(Error **errp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);<br=
>
=C2=A0}<br>
+<br>
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 error_setg(errp, QERR_UNSUPPORTED);<br>
+=C2=A0 =C2=A0 return NULL;<br>
+}<br>
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json<br>
index 4d8e506c9e..94aad4f2ae 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -1490,3 +1490,89 @@<br>
=C2=A0{ &#39;command&#39;: &#39;guest-ssh-remove-authorized-keys&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;username&#39;: &#39;str&#39;, &#39;keys=
&#39;: [&#39;str&#39;] },<br>
=C2=A0 =C2=A0&#39;if&#39;: &#39;CONFIG_POSIX&#39; }<br>
+<br>
+##<br>
+# @GuestDiskStats:<br>
+#<br>
+# @read-sectors: sectors read<br>
+#<br>
+# @write-sectors: sectors written<br>
+#<br>
+# @discard-sectors: sectors discarded<br>
+#<br>
+# @read-ios: reads completed successfully<br>
+#<br>
+# @read-merges: Number of read requests merged<br>
+#<br>
+# @write-ios: writes completed<br>
+#<br>
+# @write-merges: Number of write requests merged<br>
+#<br>
+# @discard-ios: Number of discards completed successfully<br>
+#<br>
+# @discard-merges: NUmber of discard requests merged<br>
+#<br>
+# @flush-ios: Number of flush requests completed successfully<br>
+#<br>
+# @read-ticks: time spent reading(ms)<br>
+#<br>
+# @write-ticks: time spent writing(ms)<br>
+#<br>
+# @discard-ticks: time spent discarding(ms)<br>
+#<br>
+# @flush-ticks: time spent flushing(ms)<br>
+#<br>
+# @ios-pgr: Number of I/Os currently in flight<br>
+#<br>
+# @total-ticks: time spent doing I/Os (ms)<br>
+#<br>
+# @weight-ticks: weighted time spent doing I/Os since the last update of t=
his field(ms)<br>
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;struct&#39;: &#39;GuestDiskStats&#39;,<br>
+=C2=A0 &#39;data&#39;: {&#39;read-sectors&#39;: &#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;write-sectors&#39;: &#39;ui=
nt64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;discard-sectors&#39;: &#39;=
uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;read-ios&#39;: &#39;uint64&=
#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;read-merges&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;write-ios&#39;: &#39;uint64=
&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;write-merges&#39;: &#39;uin=
t64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;discard-ios&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;discard-merges&#39;: &#39;u=
int64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;flush-ios&#39;: &#39;uint64=
&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;read-ticks&#39;: &#39;uint6=
4&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;write-ticks&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;discard-ticks&#39;: &#39;ui=
nt64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;flush-ticks&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ios-pgr&#39;: &#39;uint64&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;total-ticks&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;weight-ticks&#39;: &#39;uin=
t64&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} }<br>
+<br>
+##<br>
+# @GuestDiskStatsInfo:<br>
+#<br>
+# @name disk name<br>
+#<br>
+# @major major of disk<br>
+#<br>
+# @minor minor of disk<br>
+##<br>
+{ &#39;struct&#39;: &#39;GuestDiskStatsInfo&#39;,<br>
+=C2=A0 &#39;data&#39;: {&#39;name&#39;: &#39;str&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;major&#39;: &#39;uint64&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;minor&#39;: &#39;uint64&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;stats&#39;: &#39;GuestDiskSt=
ats&#39; } }<br>
+<br>
+##<br>
+# @guest-get-diskstats:<br>
+#<br>
+# Retrieve information about disk stats.<br>
+# Returns: List of disk stats of guest.<br>
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;command&#39;: &#39;guest-get-diskstats&#39;,<br>
+=C2=A0 &#39;returns&#39;: [&#39;GuestDiskStatsInfo&#39;]<br>
+}<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000009b442c05dee2723c--


