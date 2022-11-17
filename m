Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B762D596
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 09:55:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovagA-0001dE-Q0; Thu, 17 Nov 2022 03:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ovag7-0001bb-3f
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:55:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ovag4-0007jH-SH
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 03:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668675319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pIJ8jrZwV0hwu/HmOw/arcs/rOaX9RtvNBMMIw+jSTs=;
 b=UQG1WxsEQk9Bq61o3HFs7uvMcxJRmNmMD2i5LF1PqFhJvyMrHarvWhFOqxxrIGkVVdldU9
 GE4n3BG1o+qJd/f19/zlh0Azc4dioQ8ysugmnwTgPrDex5ZaPlUCeM+NhkFK3YyExqm8cP
 J8gysSm+IsMEy8+3QLrKVnKnXuhIn04=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-zQL32nftPmymKbMCqOCEIg-1; Thu, 17 Nov 2022 03:55:18 -0500
X-MC-Unique: zQL32nftPmymKbMCqOCEIg-1
Received: by mail-il1-f200.google.com with SMTP id
 s1-20020a056e021a0100b003026adad6a9so837146ild.18
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 00:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pIJ8jrZwV0hwu/HmOw/arcs/rOaX9RtvNBMMIw+jSTs=;
 b=whUsiKh/UgRL9ylO85uwwslXK14PMSUB4nYwB2/0m2TCGlKa3edXfKaS+THMvk2OfC
 puM4EDUlGDN5ex72tQJuFZ8F1NZptgMGzQmdnBBS4V/FaHsqKZ+3W+jl5BSzAtzvBHP9
 YF8XTj2dlklX13q8synvRXUFoMh3XM+oqyYubQ6ZBc1JMOooShxHTLgMYU5QqFDvWU4X
 TbPmaquCXXXix9qs0eUQcvW8Fa1eH/dnrEkMRFSd0ap7C99RzGaFvjCZwM413JmGz9FJ
 OwPYKC/A7kGV5maQQheodTJCwvsFBm8EsweGbgFaViNKL1Q7YNV2Q2EpOtHzfff8Om9H
 1EgA==
X-Gm-Message-State: ANoB5pkJwewIpWBKS1SXRnOSqyWZ0wcVXnMHQREOvoqDqQy3M9y3XvdW
 PlvoQtgf4eCVp3uost2nXZ1uqKPj/MIj0GzNNGAAm3AwHe+Rc9Sqbo7JLiA1bGerKGxhrqFID0A
 6M3EN36NCq/4lu1+1dvOJseQaGJ9UQjQ=
X-Received: by 2002:a6b:d314:0:b0:6bc:2a47:a874 with SMTP id
 s20-20020a6bd314000000b006bc2a47a874mr872080iob.126.1668675317614; 
 Thu, 17 Nov 2022 00:55:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Fonao72b5k4mylgI/Ml0eIGiEQ50Q387MsexjhOVobnd1zIiviIWc/T9cIunVNBGHm4aOUSNRxBQn/tREakU=
X-Received: by 2002:a6b:d314:0:b0:6bc:2a47:a874 with SMTP id
 s20-20020a6bd314000000b006bc2a47a874mr872074iob.126.1668675317426; Thu, 17
 Nov 2022 00:55:17 -0800 (PST)
MIME-Version: 1.0
References: <20221115184600.747961-1-alexander.ivanov@virtuozzo.com>
 <20221115184600.747961-3-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20221115184600.747961-3-alexander.ivanov@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 17 Nov 2022 10:55:06 +0200
Message-ID: <CAPMcbCr2quZ26MkhVmfYA=-ktEZANccZRiyDw5qFZk4NpMrtNA@mail.gmail.com>
Subject: Re: [PATCH 2/2] qga: Add ZFS TRIM support for FreeBSD
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 marcandre.lureau@gmail.com
Content-Type: multipart/alternative; boundary="0000000000008a870305eda6bf8a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--0000000000008a870305eda6bf8a
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Tue, Nov 15, 2022 at 8:46 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Use zpool tool for ZFS pools trimming in FreeBSD.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  qga/commands-bsd.c    | 109 ++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-common.h |   1 +
>  2 files changed, 110 insertions(+)
>
> diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
> index 15cade2d4c..960c4209e5 100644
> --- a/qga/commands-bsd.c
> +++ b/qga/commands-bsd.c
> @@ -170,6 +170,115 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error
> **errp)
>  }
>  #endif /* CONFIG_FSFREEZE */
>
> +#if defined(CONFIG_FSTRIM)
> +typedef struct FsPool {
> +    char *name;
> +    QTAILQ_ENTRY(FsPool) next;
> +} FsPool;
> +
> +typedef QTAILQ_HEAD(FsPoolList, FsPool) FsPoolList;
> +
> +static void build_fs_pool_list(FsPoolList *pools, Error **errp)
> +{
> +    FILE *fp;
> +    char *line = NULL, *p;
> +    size_t linecap = 0;
> +    ssize_t linelen;
> +    FsPool *pool;
> +
> +    fp = popen("/sbin/zpool list -H", "r");
> +    if (fp == NULL) {
> +        error_setg_errno(errp, errno, "failed to run zpool");
> +        return;
> +    }
> +
> +    while ((linelen = getline(&line, &linecap, fp)) > 0) {
> +        p = strchr(line, '\t');
> +        if (!p) {
> +            continue;
> +        }
> +
> +        *p = '\0';
> +
> +        pool = g_new0(FsPool, 1);
> +        pool->name = g_strdup(line);
> +        QTAILQ_INSERT_TAIL(pools, pool, next);
> +    }
> +
> +    free(line);
> +    pclose(fp);
> +}
> +
> +static void free_fs_pool_list(FsPoolList *pools)
> +{
> +    FsPool *pool, *temp;
> +
> +    if (!pools) {
> +        return;
> +    }
> +
> +    QTAILQ_FOREACH_SAFE(pool, pools, next, temp) {
> +        QTAILQ_REMOVE(pools, pool, next);
> +        g_free(pool->name);
> +        g_free(pool);
> +    }
> +}
> +
> +/*
> + * Walk the list of ZFS pools in the guest, and trim them.
> + */
> +GuestFilesystemTrimResponse *
> +qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
> +{
> +    GuestFilesystemTrimResponse *response;
> +    GuestFilesystemTrimResultList *list;
> +    GuestFilesystemTrimResult *result;
> +    int ret;
> +    FsPoolList pools;
> +    FsPool *pool;
> +    char cmd[256];
> +    Error *local_err = NULL;
> +
> +    slog("guest-fstrim called");
> +
> +    QTAILQ_INIT(&pools);
> +    build_fs_pool_list(&pools, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        return NULL;
> +    }
> +
> +    response = g_malloc0(sizeof(*response));
> +
> +    QTAILQ_FOREACH(pool, &pools, next) {
> +        result = g_malloc0(sizeof(*result));
> +        result->path = g_strdup(pool->name);
> +
> +        list = g_malloc0(sizeof(*list));
> +        list->value = result;
> +        list->next = response->paths;
> +        response->paths = list;
> +
> +        snprintf(cmd, sizeof(cmd), "/sbin/zpool trim %s", pool->name);
> +        ret = system(cmd);
> +        if (ret != 0) {
> +            result->error = g_strdup_printf("failed to trim %s: %s",
> +                                            pool->name, strerror(errno));
> +            result->has_error = true;
> +            continue;
> +        }
> +
> +        result->has_minimum = true;
> +        result->minimum = 0;
> +        result->has_trimmed = true;
> +        result->trimmed = 0;
> +    }
> +
> +    free_fs_pool_list(&pools);
> +    return response;
> +}
> +#endif /* CONFIG_FSTRIM */
> +
>  #ifdef HAVE_GETIFADDRS
>  /*
>   * Fill "buf" with MAC address by ifaddrs. Pointer buf must point to a
> diff --git a/qga/commands-common.h b/qga/commands-common.h
> index 8c1c56aac9..922f9c479b 100644
> --- a/qga/commands-common.h
> +++ b/qga/commands-common.h
> @@ -28,6 +28,7 @@
>  #ifdef UFSSUSPEND
>  #define CONFIG_FSFREEZE
>  #endif
> +#define CONFIG_FSTRIM
>  #endif /* __FreeBSD__ */
>
>  #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
> --
> 2.34.1
>
>

--0000000000008a870305eda6bf8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 1=
5, 2022 at 8:46 PM Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@=
virtuozzo.com">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Use zpool tool for ZFS pools t=
rimming in FreeBSD.<br>
<br>
Signed-off-by: Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virt=
uozzo.com" target=3D"_blank">alexander.ivanov@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/commands-bsd.c=C2=A0 =C2=A0 | 109 +++++++++++++++++++++++++++++++=
+++++++++++<br>
=C2=A0qga/commands-common.h |=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 110 insertions(+)<br>
<br>
diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c<br>
index 15cade2d4c..960c4209e5 100644<br>
--- a/qga/commands-bsd.c<br>
+++ b/qga/commands-bsd.c<br>
@@ -170,6 +170,115 @@ GuestCpuStatsList *qmp_guest_get_cpustats(Error **err=
p)<br>
=C2=A0}<br>
=C2=A0#endif /* CONFIG_FSFREEZE */<br>
<br>
+#if defined(CONFIG_FSTRIM)<br>
+typedef struct FsPool {<br>
+=C2=A0 =C2=A0 char *name;<br>
+=C2=A0 =C2=A0 QTAILQ_ENTRY(FsPool) next;<br>
+} FsPool;<br>
+<br>
+typedef QTAILQ_HEAD(FsPoolList, FsPool) FsPoolList;<br>
+<br>
+static void build_fs_pool_list(FsPoolList *pools, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 FILE *fp;<br>
+=C2=A0 =C2=A0 char *line =3D NULL, *p;<br>
+=C2=A0 =C2=A0 size_t linecap =3D 0;<br>
+=C2=A0 =C2=A0 ssize_t linelen;<br>
+=C2=A0 =C2=A0 FsPool *pool;<br>
+<br>
+=C2=A0 =C2=A0 fp =3D popen(&quot;/sbin/zpool list -H&quot;, &quot;r&quot;)=
;<br>
+=C2=A0 =C2=A0 if (fp =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &quot;failed to =
run zpool&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 while ((linelen =3D getline(&amp;line, &amp;linecap, fp)) &g=
t; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D strchr(line, &#39;\t&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!p) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *p =3D &#39;\0&#39;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pool =3D g_new0(FsPool, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pool-&gt;name =3D g_strdup(line);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(pools, pool, next);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free(line);<br>
+=C2=A0 =C2=A0 pclose(fp);<br>
+}<br>
+<br>
+static void free_fs_pool_list(FsPoolList *pools)<br>
+{<br>
+=C2=A0 =C2=A0 FsPool *pool, *temp;<br>
+<br>
+=C2=A0 =C2=A0 if (!pools) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH_SAFE(pool, pools, next, temp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 QTAILQ_REMOVE(pools, pool, next);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(pool-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(pool);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+/*<br>
+ * Walk the list of ZFS pools in the guest, and trim them.<br>
+ */<br>
+GuestFilesystemTrimResponse *<br>
+qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 GuestFilesystemTrimResponse *response;<br>
+=C2=A0 =C2=A0 GuestFilesystemTrimResultList *list;<br>
+=C2=A0 =C2=A0 GuestFilesystemTrimResult *result;<br>
+=C2=A0 =C2=A0 int ret;<br>
+=C2=A0 =C2=A0 FsPoolList pools;<br>
+=C2=A0 =C2=A0 FsPool *pool;<br>
+=C2=A0 =C2=A0 char cmd[256];<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 slog(&quot;guest-fstrim called&quot;);<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_INIT(&amp;pools);<br>
+=C2=A0 =C2=A0 build_fs_pool_list(&amp;pools, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, local_err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 response =3D g_malloc0(sizeof(*response));<br>
+<br>
+=C2=A0 =C2=A0 QTAILQ_FOREACH(pool, &amp;pools, next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D g_malloc0(sizeof(*result));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;path =3D g_strdup(pool-&gt;name);<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list =3D g_malloc0(sizeof(*list));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list-&gt;value =3D result;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 list-&gt;next =3D response-&gt;paths;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 response-&gt;paths =3D list;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(cmd, sizeof(cmd), &quot;/sbin/zpool t=
rim %s&quot;, pool-&gt;name);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D system(cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;error =3D g_strdup_pr=
intf(&quot;failed to trim %s: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pool-&gt;name, strerror(errno));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_error =3D true;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_minimum =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;minimum =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;has_trimmed =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result-&gt;trimmed =3D 0;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free_fs_pool_list(&amp;pools);<br>
+=C2=A0 =C2=A0 return response;<br>
+}<br>
+#endif /* CONFIG_FSTRIM */<br>
+<br>
=C2=A0#ifdef HAVE_GETIFADDRS<br>
=C2=A0/*<br>
=C2=A0 * Fill &quot;buf&quot; with MAC address by ifaddrs. Pointer buf must=
 point to a<br>
diff --git a/qga/commands-common.h b/qga/commands-common.h<br>
index 8c1c56aac9..922f9c479b 100644<br>
--- a/qga/commands-common.h<br>
+++ b/qga/commands-common.h<br>
@@ -28,6 +28,7 @@<br>
=C2=A0#ifdef UFSSUSPEND<br>
=C2=A0#define CONFIG_FSFREEZE<br>
=C2=A0#endif<br>
+#define CONFIG_FSTRIM<br>
=C2=A0#endif /* __FreeBSD__ */<br>
<br>
=C2=A0#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000008a870305eda6bf8a--


