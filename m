Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8C652E9D0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:22:30 +0200 (CEST)
Received: from localhost ([::1]:45952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrzm6-0005P7-Sv
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nrzjN-0004bQ-Ti
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:19:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nrzjK-0006C9-3D
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653041973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=alkTkirvG7buE08UmW+vOc7qC+CRBBEyL4pbeNgzNDE=;
 b=KrJdth3SbvqP3LfZWTkt3q3DaVP35WuDTlwJq4T9w0F4FCcvzNHb3AMZe5PJ+xtqlDmXrP
 SDleH0kOYTVC/MFCw/men+KyhbOOTmRfzt400Ju9SAvX0O113Is8qFh2FdX6nZdjxXuATJ
 2GURVE3Qylv6YzwH1mG9llJKDIqkZEg=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-koDZzHvOOvyX_1PtyO-djQ-1; Fri, 20 May 2022 06:19:31 -0400
X-MC-Unique: koDZzHvOOvyX_1PtyO-djQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 j2-20020a2597c2000000b0064b3e54191aso6712807ybo.20
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 03:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=alkTkirvG7buE08UmW+vOc7qC+CRBBEyL4pbeNgzNDE=;
 b=CLmk0V4omwgpeL1hpFw3kzDh1HscR3Zr9znCCOKaAPlH6YCGnuoUttb7tbnGUjAOJV
 gqNqembjRe8jbAUCUugRc7eZb12WqMis+kuIuUslB+1vev1pu+UK9y6gZiZSBDwdNZBP
 Fc8SWDGc6cf7xg3mbpp2jxL2mZ/pE0CxAbziKVpCBhPwzzpFlreV+0K111EM0STsQh7Q
 wdhtNrKOqAhGczz3kJCkuE81fwvCFnYCRU03Zhapx3NAJmo16x8zOqhCeSOsyz+6Jvnl
 loI9dpUPvAmZFNXDN7luRoScErZatxHGxaJoedhkjzupp591BWhed1P/KbhSOBeXS3ui
 Z+sA==
X-Gm-Message-State: AOAM532jPDp60D23bViPJLyRZ8L1LIbH01zrEq9ma5sB73hsXSHz7T2e
 OC3pJQ2X5iU4fOiZz9NnVw9GZh5i/OHiNhX1Wqp3H1/GzrPxg1Gi7gzQdLP68VzyrgIHtH6tXIJ
 WtFFP/eWOyLrytDcO/UNHfItry5gm3RM=
X-Received: by 2002:a5b:f41:0:b0:64a:7639:3bab with SMTP id
 y1-20020a5b0f41000000b0064a76393babmr8450520ybr.138.1653041971109; 
 Fri, 20 May 2022 03:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsBfgg0B0hAQDH/8bUe8tw/E278YWsy69PE7jlHHCI9cV9G3RhULIPyh0VQyPdKrshhrGZVbRoz6gwx/VqcxY=
X-Received: by 2002:a5b:f41:0:b0:64a:7639:3bab with SMTP id
 y1-20020a5b0f41000000b0064a76393babmr8450493ybr.138.1653041970787; Fri, 20
 May 2022 03:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220520021935.676-1-luzhipeng@cestc.cn>
In-Reply-To: <20220520021935.676-1-luzhipeng@cestc.cn>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Fri, 20 May 2022 13:19:19 +0300
Message-ID: <CAPMcbCr3dodeqwjj_4a+Oz3jqKJD4prqAyMRZ7XLxz0YEkW0RA@mail.gmail.com>
Subject: Re: [PATCH v5] qga: add guest-get-diskstats command for Linux guests
To: luzhipeng <luzhipeng@cestc.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Michal Privoznik <mprivozn@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000077c99905df6ed329"
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

--00000000000077c99905df6ed329
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Fri, May 20, 2022 at 5:20 AM luzhipeng <luzhipeng@cestc.cn> wrote:

> Add a new 'guest-get-diskstats' command for report disk io statistics
> for Linux guests. This can be useful for getting io flow or handling
> IO fault, no need to enter guests.
>
> Signed-off-by: luzhipeng <luzhipeng@cestc.cn>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  Changes v4->v5: fix Typo and adjust fileds order in qapi-schema
>  Changes v3->v4:
> https://patchew.org/QEMU/20220515095437.1291-1-luzhipeng@cestc.cn/
>  Changes v2->v3: bugfix for memory leak
>  Changes v1->v2: v1:
> https://patchew.org/QEMU/20220512011930.214-1-luzhipeng@cestc.cn/
>
>  qga/commands-posix.c | 123 +++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c |   6 +++
>  qga/qapi-schema.json |  86 ++++++++++++++++++++++++++++++
>  3 files changed, 215 insertions(+)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 69f209af87..12b50b7124 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2783,6 +2783,122 @@ GuestMemoryBlockInfo
> *qmp_guest_get_memory_block_info(Error **errp)
>      return info;
>  }
>
> +#define MAX_NAME_LEN 128
> +static GuestDiskStatsInfoList *guest_get_diskstats(Error **errp)
> +{
> +#ifdef CONFIG_LINUX
> +    GuestDiskStatsInfoList *head =3D NULL, **tail =3D &head;
> +    const char *diskstats =3D "/proc/diskstats";
> +    FILE *fp;
> +    size_t n;
> +    char *line =3D NULL;
> +
> +    fp =3D fopen(diskstats, "r");
> +    if (fp  =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", diskstats);
> +        return NULL;
> +    }
> +
> +    while (getline(&line, &n, fp) !=3D -1) {
> +        g_autofree GuestDiskStatsInfo *diskstatinfo =3D NULL;
> +        g_autofree GuestDiskStats *diskstat =3D NULL;
> +        char dev_name[MAX_NAME_LEN];
> +        unsigned int ios_pgr, tot_ticks, rq_ticks, wr_ticks, dc_ticks,
> fl_ticks;
> +        unsigned long rd_ios, rd_merges_or_rd_sec, rd_ticks_or_wr_sec,
> wr_ios;
> +        unsigned long wr_merges, rd_sec_or_wr_ios, wr_sec;
> +        unsigned long dc_ios, dc_merges, dc_sec, fl_ios;
> +        unsigned int major, minor;
> +        int i;
> +
> +        i =3D sscanf(line, "%u %u %s %lu %lu %lu"
> +                   "%lu %lu %lu %lu %u %u %u %u"
> +                   "%lu %lu %lu %u %lu %u",
> +                   &major, &minor, dev_name,
> +                   &rd_ios, &rd_merges_or_rd_sec, &rd_sec_or_wr_ios,
> +                   &rd_ticks_or_wr_sec, &wr_ios, &wr_merges, &wr_sec,
> +                   &wr_ticks, &ios_pgr, &tot_ticks, &rq_ticks,
> +                   &dc_ios, &dc_merges, &dc_sec, &dc_ticks,
> +                   &fl_ios, &fl_ticks);
> +
> +        if (i < 7) {
> +            continue;
> +        }
> +
> +        diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1);
> +        diskstatinfo->name =3D g_strdup(dev_name);
> +        diskstatinfo->major =3D major;
> +        diskstatinfo->minor =3D minor;
> +
> +        diskstat =3D g_new0(GuestDiskStats, 1);
> +        if (i =3D=3D 7) {
> +            diskstat->has_read_ios =3D true;
> +            diskstat->read_ios =3D rd_ios;
> +            diskstat->has_read_sectors =3D true;
> +            diskstat->read_sectors =3D rd_merges_or_rd_sec;
> +            diskstat->has_write_ios =3D true;
> +            diskstat->write_ios =3D rd_sec_or_wr_ios;
> +            diskstat->has_write_sectors =3D true;
> +            diskstat->write_sectors =3D rd_ticks_or_wr_sec;
> +        }
> +        if (i >=3D 14) {
> +            diskstat->has_read_ios =3D true;
> +            diskstat->read_ios =3D rd_ios;
> +            diskstat->has_read_sectors =3D true;
> +            diskstat->read_sectors =3D rd_sec_or_wr_ios;
> +            diskstat->has_read_merges =3D true;
> +            diskstat->read_merges =3D rd_merges_or_rd_sec;
> +            diskstat->has_read_ticks =3D true;
> +            diskstat->read_ticks =3D rd_ticks_or_wr_sec;
> +            diskstat->has_write_ios =3D true;
> +            diskstat->write_ios =3D wr_ios;
> +            diskstat->has_write_sectors =3D true;
> +            diskstat->write_sectors =3D wr_sec;
> +            diskstat->has_write_merges =3D true;
> +            diskstat->write_merges =3D wr_merges;
> +            diskstat->has_write_ticks =3D true;
> +            diskstat->write_ticks =3D wr_ticks;
> +            diskstat->has_ios_pgr =3D true;
> +            diskstat->ios_pgr =3D ios_pgr;
> +            diskstat->has_total_ticks =3D true;
> +            diskstat->total_ticks =3D tot_ticks;
> +            diskstat->has_weight_ticks =3D true;
> +            diskstat->weight_ticks =3D rq_ticks;
> +        }
> +        if (i >=3D 18) {
> +            diskstat->has_discard_ios =3D true;
> +            diskstat->discard_ios =3D dc_ios;
> +            diskstat->has_discard_merges =3D true;
> +            diskstat->discard_merges =3D dc_merges;
> +            diskstat->has_discard_sectors =3D true;
> +            diskstat->discard_sectors =3D dc_sec;
> +            diskstat->has_discard_ticks =3D true;
> +            diskstat->discard_ticks =3D dc_ticks;
> +        }
> +        if (i >=3D 20) {
> +            diskstat->has_flush_ios =3D true;
> +            diskstat->flush_ios =3D fl_ios;
> +            diskstat->has_flush_ticks =3D true;
> +            diskstat->flush_ticks =3D fl_ticks;
> +        }
> +
> +        diskstatinfo->stats =3D g_steal_pointer(&diskstat);
> +        QAPI_LIST_APPEND(tail, diskstatinfo);
> +        diskstatinfo =3D NULL;
> +    }
> +    free(line);
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
> @@ -3131,6 +3247,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **err=
p)
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
> index 4d8e506c9e..3aa652e4d2 100644
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
> +# @read-ios: reads completed successfully
> +#
> +# @read-merges: read requests merged
> +#
> +# @write-sectors: sectors written
> +#
> +# @write-ios: writes completed
> +#
> +# @write-merges: write requests merged
> +#
> +# @discard-sectors: sectors discarded
> +#
> +# @discard-ios: discards completed successfully
> +#
> +# @discard-merges: discard requests merged
> +#
> +# @flush-ios: flush requests completed successfully
> +#
> +# @read-ticks: time spent reading(ms)
> +#
> +# @write-ticks: time spent writing(ms)
> +#
> +# @discard-ticks: time spent discarding(ms)
> +#
> +# @flush-ticks: time spent flushing(ms)
> +#
> +# @ios-pgr: number of I/Os currently in flight
> +#
> +# @total-ticks: time spent doing I/Os (ms)
> +#
> +# @weight-ticks: weighted time spent doing I/Os since the last update of
> this field(ms)
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'GuestDiskStats',
> +  'data': {'*read-sectors': 'uint64',
> +           '*read-ios': 'uint64',
> +           '*read-merges': 'uint64',
> +           '*write-sectors': 'uint64',
> +           '*write-ios': 'uint64',
> +           '*write-merges': 'uint64',
> +           '*discard-sectors': 'uint64',
> +           '*discard-ios': 'uint64',
> +           '*discard-merges': 'uint64',
> +           '*flush-ios': 'uint64',
> +           '*read-ticks': 'uint64',
> +           '*write-ticks': 'uint64',
> +           '*discard-ticks': 'uint64',
> +           '*flush-ticks': 'uint64',
> +           '*ios-pgr': 'uint64',
> +           '*total-ticks': 'uint64',
> +           '*weight-ticks': 'uint64'
> +           } }
> +
> +##
> +# @GuestDiskStatsInfo:
> +#
> +# @name disk name
> +#
> +# @major major device number of disk
> +#
> +# @minor minor device number of disk
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

--00000000000077c99905df6ed329
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-:219" class=3D"gmail-a3s gmail-aiL"><div =
dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@=
redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, May 20, 2022 at 5:20 AM luzhipeng &lt;<a href=3D"mailto:luzhipeng@cestc.c=
n">luzhipeng@cestc.cn</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Add a new &#39;guest-get-diskstats&#39; command for re=
port disk io statistics<br>
for Linux guests. This can be useful for getting io flow or handling<br>
IO fault, no need to enter guests.<br>
<br>
Signed-off-by: luzhipeng &lt;<a href=3D"mailto:luzhipeng@cestc.cn" target=
=3D"_blank">luzhipeng@cestc.cn</a>&gt;<br>
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0Changes v4-&gt;v5: fix Typo and adjust fileds order in qapi-schema<br=
>
=C2=A0Changes v3-&gt;v4: <a href=3D"https://patchew.org/QEMU/20220515095437=
.1291-1-luzhipeng@cestc.cn/" rel=3D"noreferrer" target=3D"_blank">https://p=
atchew.org/QEMU/20220515095437.1291-1-luzhipeng@cestc.cn/</a><br>
=C2=A0Changes v2-&gt;v3: bugfix for memory leak <br>
=C2=A0Changes v1-&gt;v2: v1:<a href=3D"https://patchew.org/QEMU/20220512011=
930.214-1-luzhipeng@cestc.cn/" rel=3D"noreferrer" target=3D"_blank">https:/=
/patchew.org/QEMU/20220512011930.214-1-luzhipeng@cestc.cn/</a><br>
<br>
=C2=A0qga/commands-posix.c | 123 ++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0qga/commands-win32.c |=C2=A0 =C2=A06 +++<br>
=C2=A0qga/qapi-schema.json |=C2=A0 86 ++++++++++++++++++++++++++++++<br>
=C2=A03 files changed, 215 insertions(+)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 69f209af87..12b50b7124 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2783,6 +2783,122 @@ GuestMemoryBlockInfo *qmp_guest_get_memory_block_in=
fo(Error **errp)<br>
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
+<br>
+=C2=A0 =C2=A0 fp =3D fopen(diskstats, &quot;r&quot;);<br>
+=C2=A0 =C2=A0 if (fp=C2=A0 =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;open(\&quo=
t;%s\&quot;)&quot;, diskstats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree GuestDiskStatsInfo *diskstatinfo =
=3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_autofree GuestDiskStats *diskstat =3D NULL;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char dev_name[MAX_NAME_LEN];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int ios_pgr, tot_ticks, rq_ticks, wr_=
ticks, dc_ticks, fl_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long rd_ios, rd_merges_or_rd_sec, rd_=
ticks_or_wr_sec, wr_ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long wr_merges, rd_sec_or_wr_ios, wr_=
sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long dc_ios, dc_merges, dc_sec, fl_io=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int major, minor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D sscanf(line, &quot;%u %u %s %lu %lu %lu&=
quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;%lu %lu %lu %lu %u %u %u %u&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;%lu %lu %lu %u %lu %u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
major, &amp;minor, dev_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
rd_ios, &amp;rd_merges_or_rd_sec, &amp;rd_sec_or_wr_ios,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
rd_ticks_or_wr_sec, &amp;wr_ios, &amp;wr_merges, &amp;wr_sec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
wr_ticks, &amp;ios_pgr, &amp;tot_ticks, &amp;rq_ticks,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
dc_ios, &amp;dc_merges, &amp;dc_sec, &amp;dc_ticks,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
fl_ios, &amp;fl_ticks);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &lt; 7) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo =3D g_new0(GuestDiskStatsInfo, 1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;name =3D g_strdup(dev_name);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;major =3D major;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;minor =3D minor;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat =3D g_new0(GuestDiskStats, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i =3D=3D 7) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ios =3D tr=
ue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ios =3D rd_ios=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_sectors =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_sectors =3D rd=
_merges_or_rd_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ios =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ios =3D rd_se=
c_or_wr_ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_sectors =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_sectors =3D r=
d_ticks_or_wr_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 14) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ios =3D tr=
ue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ios =3D rd_ios=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_sectors =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_sectors =3D rd=
_sec_or_wr_ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_merges =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_merges =3D rd_=
merges_or_rd_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_read_ticks =3D =
true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;read_ticks =3D rd_t=
icks_or_wr_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ios =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ios =3D wr_io=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_sectors =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_sectors =3D w=
r_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_merges =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_merges =3D wr=
_merges;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_write_ticks =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;write_ticks =3D wr_=
ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_ios_pgr =3D tru=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;ios_pgr =3D ios_pgr=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_total_ticks =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;total_ticks =3D tot=
_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_weight_ticks =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;weight_ticks =3D rq=
_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 18) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_ios =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_ios =3D dc_=
ios;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_merges =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_merges =3D =
dc_merges;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_sectors=
 =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_sectors =3D=
 dc_sec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_discard_ticks =
=3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;discard_ticks =3D d=
c_ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i &gt;=3D 20) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_flush_ios =3D t=
rue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;flush_ios =3D fl_io=
s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;has_flush_ticks =3D=
 true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstat-&gt;flush_ticks =3D fl_=
ticks;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo-&gt;stats =3D g_steal_pointer(&am=
p;diskstat);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QAPI_LIST_APPEND(tail, diskstatinfo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 diskstatinfo =3D NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 free(line);<br>
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
@@ -3131,6 +3247,13 @@ GuestDiskInfoList *qmp_guest_get_disks(Error **errp)=
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
index 4d8e506c9e..3aa652e4d2 100644<br>
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
+# @read-ios: reads completed successfully<br>
+#<br>
+# @read-merges: read requests merged<br>
+#<br>
+# @write-sectors: sectors written<br>
+#<br>
+# @write-ios: writes completed<br>
+#<br>
+# @write-merges: write requests merged<br>
+#<br>
+# @discard-sectors: sectors discarded<br>
+#<br>
+# @discard-ios: discards completed successfully<br>
+#<br>
+# @discard-merges: discard requests merged<br>
+#<br>
+# @flush-ios: flush requests completed successfully<br>
+#<br>
+# @read-ticks: time spent reading(ms)<br>
+#<br>
+# @write-ticks: time spent writing(ms)<br>
+#<br>
+# @discard-ticks: time spent discarding(ms)<br>
+#<br>
+# @flush-ticks: time spent flushing(ms)<br>
+#<br>
+# @ios-pgr: number of I/Os currently in flight<br>
+#<br>
+# @total-ticks: time spent doing I/Os (ms)<br>
+#<br>
+# @weight-ticks: weighted time spent doing I/Os since the last update of t=
his field(ms)<br>
+#<br>
+# Since: 7.1<br>
+##<br>
+{ &#39;struct&#39;: &#39;GuestDiskStats&#39;,<br>
+=C2=A0 &#39;data&#39;: {&#39;*read-sectors&#39;: &#39;uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*read-ios&#39;: &#39;uint64&=
#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*read-merges&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*write-sectors&#39;: &#39;ui=
nt64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*write-ios&#39;: &#39;uint64=
&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*write-merges&#39;: &#39;uin=
t64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*discard-sectors&#39;: &#39;=
uint64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*discard-ios&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*discard-merges&#39;: &#39;u=
int64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*flush-ios&#39;: &#39;uint64=
&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*read-ticks&#39;: &#39;uint6=
4&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*write-ticks&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*discard-ticks&#39;: &#39;ui=
nt64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*flush-ticks&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*ios-pgr&#39;: &#39;uint64&#=
39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*total-ticks&#39;: &#39;uint=
64&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*weight-ticks&#39;: &#39;uin=
t64&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} }<br>
+<br>
+##<br>
+# @GuestDiskStatsInfo:<br>
+#<br>
+# @name disk name<br>
+#<br>
+# @major major device number of disk<br>
+#<br>
+# @minor minor device number of disk<br>
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
</blockquote></div>

--00000000000077c99905df6ed329--


