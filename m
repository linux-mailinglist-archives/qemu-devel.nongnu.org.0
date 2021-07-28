Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 690293D8CB3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 13:24:54 +0200 (CEST)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8hgD-0007f9-0w
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 07:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m8hfE-00070H-6i
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:23:52 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:35377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m8hfC-0000HC-I2
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 07:23:51 -0400
Received: by mail-io1-xd31.google.com with SMTP id y9so2585086iox.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xvlZTsRXR+EWywUXp+PCyXK+M0dpN+flNOM0lRxaNQ8=;
 b=ZDWKMr2ASAxEdcHTlPODVJRtJscdbji4lZwRFUBOl8ugeYWu6cmMeRyR/uiwXBR/WF
 CyE0Cjxam+Xqm7/QIAXVZGQliewVM+/JcF8kzvvf4qsgSXxe0WUKs84pPTf5pMmjuTFk
 gSf94xXr2dfSaXKu45snlaMyAYR+K4WdLUAAPl8ay5cqErGOsqIacxi4GkBQFqF6Yeoy
 D/FabbNm1WpwpMuFKdc5977kMaM6k1fYI2WMJjNTX2k7LIRiUKu3wwFd2/DcWWwD2G4z
 wig/PBK2gGF+UGDf1l5sLBcStQacDRoCJWo01o2HqWgC0QVIr7mTviau+eKzY5jhCSH4
 7a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xvlZTsRXR+EWywUXp+PCyXK+M0dpN+flNOM0lRxaNQ8=;
 b=NVrBBLFhxSurwh0Z6Uh38TYET35RJqnQE+7YOqWsQgCj7ToFeUi4l3hre3hI20oqUw
 iRJcUvye4TmPsEq6zewqh/XTwkNYXzzsL4VIhTb4kLuPWoH1jZc/i1fnEjLObqkbbNUJ
 VFj6AaGZ552MYv62bO3i7kFz3lGK2SRggIwntetFRfEcDH7g5c598etLUM5dzeHHKssy
 LymLbc6ydmifZ57YC38TZnKNiQK57WX5NZYW5Ok7xgsUBZHt4/aZ6G9R0k+2R1bm9MMD
 rufVHxmOBPANZFKPn5AiHjer9tZs9vwj7q/XkluLlamq+SJNi8kF8GMpdLW/6o5xR2Ue
 qpoA==
X-Gm-Message-State: AOAM532+x/u/t3Q1kaX6RrHuo29qdMc1hLin8BYOKqqAh6Ch+TgU3jLJ
 02sj8HWJuXti5zanMiJX3na46T93wOaRZXWL0VM=
X-Google-Smtp-Source: ABdhPJxWuZSOWJq9d8iysgnD4pQWgLDzEyiEZTk6o2XMY4fCUlqNVLz2Q89pJEsbVSOvJnvs0fex1MA9+iw1IjIqL70=
X-Received: by 2002:a05:6638:1af:: with SMTP id
 b15mr25858394jaq.124.1627471429272; 
 Wed, 28 Jul 2021 04:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210722123635.60608-1-david@redhat.com>
 <20210722123635.60608-4-david@redhat.com>
In-Reply-To: <20210722123635.60608-4-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 28 Jul 2021 13:23:38 +0200
Message-ID: <CAM9Jb+g_mu3Jc+7RFR0hQ8tfhX2cx+hQ8d-FvoF5DZV6-JevTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] util/oslib-posix: Don't create too many threads
 with small memory or little pages
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Let's limit the number of threads to something sane, especially that
> - We don't have more threads than the number of pages we have
> - We don't have threads that initialize small (< 64 MiB) memory
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  util/oslib-posix.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 2ae6c3aaab..a1d309d495 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -40,6 +40,7 @@
>  #include <libgen.h>
>  #include "qemu/cutils.h"
>  #include "qemu/compiler.h"
> +#include "qemu/units.h"
>
>  #ifdef CONFIG_LINUX
>  #include <sys/syscall.h>
> @@ -529,7 +530,8 @@ static void *do_madv_populate_write_pages(void *arg)
>      return NULL;
>  }
>
> -static inline int get_memset_num_threads(int smp_cpus)
> +static inline int get_memset_num_threads(size_t hpagesize, size_t numpages,
> +                                         int smp_cpus)
>  {
>      long host_procs = sysconf(_SC_NPROCESSORS_ONLN);
>      int ret = 1;
> @@ -537,6 +539,12 @@ static inline int get_memset_num_threads(int smp_cpus)
>      if (host_procs > 0) {
>          ret = MIN(MIN(host_procs, MAX_MEM_PREALLOC_THREAD_COUNT), smp_cpus);
>      }
> +
> +    /* Especially with gigantic pages, don't create more threads than pages. */
> +    ret = MIN(ret, numpages);
> +    /* Don't start threads to prealloc comparatively little memory. */
> +    ret = MIN(ret, MAX(1, hpagesize * numpages / (64 * MiB)));
> +
>      /* In case sysconf() fails, we fall back to single threaded */
>      return ret;
>  }
> @@ -546,7 +554,7 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
>  {
>      static gsize initialized = 0;
>      MemsetContext context = {
> -        .num_threads = get_memset_num_threads(smp_cpus),
> +        .num_threads = get_memset_num_threads(hpagesize, numpages, smp_cpus),
>      };
>      size_t numpages_per_thread, leftover;
>      void *(*touch_fn)(void *);

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

