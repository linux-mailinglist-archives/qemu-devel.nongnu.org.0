Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C028338E58D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 13:36:48 +0200 (CEST)
Received: from localhost ([::1]:42086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll8t5-0005qv-Dx
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 07:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ll8sA-000559-N7
 for qemu-devel@nongnu.org; Mon, 24 May 2021 07:35:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ll8s8-0003ci-Nu
 for qemu-devel@nongnu.org; Mon, 24 May 2021 07:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621856147;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+QD9yq11JG5TnEnibhU934eMSsOkyPks8c4YU+R/z0=;
 b=IQ5FlCy4GJ58vduPi1hxxSTu7VBOau6+0vpuWZnD39+iRXGClkUHOBGoFODPNDb5efaylc
 qa1tUOM+AX7AAZ/VunxTZTiIuRpGsq7b6gGoBQwDROPoxhFHVuzgDbT/nx92KreSctxDkN
 oAWqICR9jRj5YM2L+6P9xOQ/AdnJ/Ys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-EqimnvtWOeCT9NiyL5nZ-Q-1; Mon, 24 May 2021 07:35:45 -0400
X-MC-Unique: EqimnvtWOeCT9NiyL5nZ-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 663CA180FD66;
 Mon, 24 May 2021 11:35:43 +0000 (UTC)
Received: from redhat.com (ovpn-113-248.ams2.redhat.com [10.36.113.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 275EB5C541;
 Mon, 24 May 2021 11:35:40 +0000 (UTC)
Date: Mon, 24 May 2021 12:35:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] linux-user: glib-ify is_proc_myself
Message-ID: <YKuPiul64Uu9vlHs@redhat.com>
References: <20210524112323.2310-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210524112323.2310-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: yamamoto@midokura.com, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 24, 2021 at 12:23:23PM +0100, Alex Bennée wrote:
> I'm not sure if this is neater than the original code but it does
> remove a bunch of the !strcmp's in favour of glib's more natural bool
> results. While we are at it make the function a bool return and fixup
> the fake_open function prototypes.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/syscall.c | 30 ++++++++++++------------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index e739921e86..18e953de9d 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -7987,33 +7987,27 @@ static int open_self_auxv(void *cpu_env, int fd)
>      return 0;
>  }
>  
> -static int is_proc_myself(const char *filename, const char *entry)
> +static bool is_proc_myself(const char *filename, const char *entry)
>  {
> -    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
> +    if (g_str_has_prefix(filename, "/proc/")) {
>          filename += strlen("/proc/");
> -        if (!strncmp(filename, "self/", strlen("self/"))) {
> +        if (g_str_has_prefix(filename, "self/")) {
>              filename += strlen("self/");
> -        } else if (*filename >= '1' && *filename <= '9') {
> -            char myself[80];
> -            snprintf(myself, sizeof(myself), "%d/", getpid());
> -            if (!strncmp(filename, myself, strlen(myself))) {
> -                filename += strlen(myself);
> -            } else {
> -                return 0;
> +        } else if (g_ascii_isdigit(*filename)) {
> +            g_autofree char * myself = g_strdup_printf("%d/", getpid());
> +            if (!g_str_has_prefix(filename, myself)) {
> +                return false;
>              }
> -        } else {
> -            return 0;
> -        }
> -        if (!strcmp(filename, entry)) {
> -            return 1;
> +            filename += strlen(myself);
>          }
> +        return g_str_has_prefix(filename, entry);
>      }
> -    return 0;
> +    return false;
>  }

Diff is hard to compare, so this is what it looks like:

 static bool is_proc_myself(const char *filename, const char *entry)
 {
     if (g_str_has_prefix(filename, "/proc/")) {
         filename += strlen("/proc/");
         if (g_str_has_prefix(filename, "self/")) {
             filename += strlen("self/");
         } else if (g_ascii_isdigit(*filename)) {
             g_autofree char * myself = g_strdup_printf("%d/", getpid());
             if (!g_str_has_prefix(filename, myself)) {
                 return false;
             }
             filename += strlen(myself);
         }
         return g_str_has_prefix(filename, entry);
     }
     return false;
 }

I think if we don't mind two heap allocs it can be simplified to:

  static int is_proc_myself(const char *filename, const char *entry)
  {
    g_autofree char *procself = g_strdup_printf("/proc/self/%s", entry);
    g_autofree char *procpid = g_strdup_printf("/proc/%d/%s", getpid(), entry);
    return g_str_equal(filename, procself) || g_str_equal(filename, procpid);
  }


This makes me wonder if the code needs to cope with non-canonicalized
filenames though. eg /proc///self/maps  or /proc/./self/maps

Is something further up ensuring canonicalization of 'filename' ?


>  
>  #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN) || \
>      defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
> -static int is_proc(const char *filename, const char *entry)
> +static bool is_proc(const char *filename, const char *entry)
>  {
>      return strcmp(filename, entry) == 0;
>  }
> @@ -8097,7 +8091,7 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
>      struct fake_open {
>          const char *filename;
>          int (*fill)(void *cpu_env, int fd);
> -        int (*cmp)(const char *s1, const char *s2);
> +        bool (*cmp)(const char *s1, const char *s2);
>      };
>      const struct fake_open *fake_open;
>      static const struct fake_open fakes[] = {
> -- 
> 2.20.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


