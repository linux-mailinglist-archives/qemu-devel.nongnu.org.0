Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F433AD172
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 19:49:52 +0200 (CEST)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luIcp-0007OH-FF
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 13:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luIbS-0006Jy-Ol
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luIbQ-0005jC-4u
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624038503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuMNU4nE3MBnlpEc0ZDmlGiet5mP/j/nUMgErlv9/gw=;
 b=f+SVpgm5KS3E2DFnmt4FnAh5MBn8k2mGvr88QcuK1Vw0i/sqAbo5ndNCyBAfkLtOF5LKIa
 XfM8+H4efS+fC8ZXqrNBh7mFVCYq+mtLxJ1MjDiDTmjr8uHUExnIqMCliVSwBJacMx4C7R
 MccAn0flXMDUlk8dTE2ojxmh4Rjw7cY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-8NbV16NINA2TLGOuRh55Hg-1; Fri, 18 Jun 2021 13:48:22 -0400
X-MC-Unique: 8NbV16NINA2TLGOuRh55Hg-1
Received: by mail-ej1-f70.google.com with SMTP id
 de48-20020a1709069bf0b029048ae3ebecabso685027ejc.16
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nuMNU4nE3MBnlpEc0ZDmlGiet5mP/j/nUMgErlv9/gw=;
 b=WTQi6M8lfMEw9Vz6MUoxM+VSr+nQHg+hkpL/e6S0GjxocLZCFBuC0/WRKnm35kNWCT
 2XXlwmrbydSxxVfj0/5QHt/ENxgUm8YOiP41Nhc0LYjM7zl/QpqPOn1ahABeVulo9DSX
 nrynUG8WoQZebCOQETwRDE3IvpmJn5cJb7E11uE9Gt3XUgr1JW2VX6xI67i8MZiFh2dE
 MeRzbQ4U/7XKRg/sEXhSv0bT/JJcWFG9jSxaRkbVCreIjeodsvk6/OlAEBXDeIgDw3f8
 CCDiNKTNyJJsLXTWRSIVldtcPxFnVc4wD3L1KlKtTiPw8AEAlGvK+ZwzQ69B+pZb1hxO
 i9hw==
X-Gm-Message-State: AOAM533/+PoWXIj+yiJ8u0MxHYrARcR5+qbHzxi7HxDFwE5D6/PfvhQX
 GpSDD67BaXqVRQ1pYPXvgfe8AMmDbBE0nLjaIm+hKN8EukpIhEBzuHfVWc0RYSMnu0i6MCPy70Q
 FdPHkP1BSYq57ovM=
X-Received: by 2002:a05:6402:896:: with SMTP id
 e22mr6603654edy.201.1624038501226; 
 Fri, 18 Jun 2021 10:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh5rRb4NZxDxNAdfXIQrgF+LfySbYT59aDuQxTom2lz8OWZdYGvmt+dz+KM1YAOcFvIh3enw==
X-Received: by 2002:a05:6402:896:: with SMTP id
 e22mr6603612edy.201.1624038500934; 
 Fri, 18 Jun 2021 10:48:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g11sm6582851edz.12.2021.06.18.10.48.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 10:48:20 -0700 (PDT)
Subject: Re: [PATCH v3 13/24] modules: use modinfo for dependencies
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210618045353.2510174-1-kraxel@redhat.com>
 <20210618045353.2510174-14-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d54bf050-215d-318a-41f0-85407e50ee2d@redhat.com>
Date: Fri, 18 Jun 2021 19:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618045353.2510174-14-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/06/21 06:53, Gerd Hoffmann wrote:
> Use module database for module dependencies.
> Drop hard-coded dependency list.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   util/module.c | 55 ++++++++++++++++++++-------------------------------
>   1 file changed, 21 insertions(+), 34 deletions(-)
> 
> diff --git a/util/module.c b/util/module.c
> index 8d3e8275b9f7..7d7b69cbdaca 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -182,28 +182,6 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
>   out:
>       return ret;
>   }
> -
> -static const struct {
> -    const char *name;
> -    const char *dep;
> -} module_deps[] = {
> -    { "audio-spice",    "ui-spice-core" },
> -    { "chardev-spice",  "ui-spice-core" },
> -    { "hw-display-qxl", "ui-spice-core" },
> -    { "ui-spice-app",   "ui-spice-core" },
> -    { "ui-spice-app",   "chardev-spice" },
> -
> -    { "hw-display-virtio-gpu-gl", "hw-display-virtio-gpu" },
> -    { "hw-display-virtio-gpu-pci-gl", "hw-display-virtio-gpu-pci" },
> -    { "hw-display-virtio-vga-gl", "hw-display-virtio-vga" },
> -
> -#ifdef CONFIG_OPENGL
> -    { "ui-egl-headless", "ui-opengl"    },
> -    { "ui-gtk",          "ui-opengl"    },
> -    { "ui-sdl",          "ui-opengl"    },
> -    { "ui-spice-core",   "ui-opengl"    },
> -#endif
> -};
>   #endif
>   
>   bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
> @@ -219,9 +197,11 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>       char *dirs[5];
>       char *module_name;
>       int i = 0, n_dirs = 0;
> -    int ret, dep;
> +    int ret;
>       bool export_symbols = false;
>       static GHashTable *loaded_modules;
> +    const QemuModinfo *modinfo;
> +    const char **sl;
>   
>       if (!g_module_supported()) {
>           fprintf(stderr, "Module is not supported by system.\n");
> @@ -234,23 +214,30 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>   
>       module_name = g_strdup_printf("%s%s", prefix, lib_name);
>   
> -    for (dep = 0; dep < ARRAY_SIZE(module_deps); dep++) {
> -        if (strcmp(module_name, module_deps[dep].name) == 0) {
> -            /* we depend on another module */
> -            module_load_one("", module_deps[dep].dep, false);
> -        }
> -        if (strcmp(module_name, module_deps[dep].dep) == 0) {
> -            /* another module depends on us */
> -            export_symbols = true;
> -        }
> -    }
> -
>       if (g_hash_table_contains(loaded_modules, module_name)) {
>           g_free(module_name);
>           return true;
>       }
>       g_hash_table_add(loaded_modules, module_name);
>   
> +    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
> +        if (modinfo->deps) {
> +            if (strcmp(modinfo->name, module_name) == 0) {
> +                /* we depend on other module(s) */
> +                for (sl = modinfo->deps; *sl != NULL; sl++) {
> +                    module_load_one("", *sl, false);
> +                }
> +            } else {
> +                for (sl = modinfo->deps; *sl != NULL; sl++) {
> +                    if (strcmp(module_name, *sl) == 0) {
> +                        /* another module depends on us */
> +                        export_symbols = true;
> +                    }
> +                }
> +            }
> +        }
> +    }
> +
>       search_dir = getenv("QEMU_MODULE_DIR");
>       if (search_dir != NULL) {
>           dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


