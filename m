Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B3F3AD186
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 19:52:16 +0200 (CEST)
Received: from localhost ([::1]:45728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luIf9-0001Tg-T2
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 13:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luIcd-0007jY-As
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:49:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luIcb-0006UA-IP
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:49:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624038577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SzzyY3dPy1ekBpKQyAGUykdHfPn7HIoJ3EuVKf5uu80=;
 b=LBp/rnRTUz0YV9L6Kc2bBonkMekoClxvLu0h8xUR/QjiBUdXy/7dqixSp3Iecwa6ksszsX
 LQRt6b3nDl+E15Tq6UvdSIFFE2Z4hAHx9hnQz8Bs2dEjdgQxCjYTNKp1ITDFfhP4ejL6FM
 G2ZHjv5fbCssaNsMA0Ej94DGh4aLMAY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-0uWhKbRiN7Sbr4PB16IvZA-1; Fri, 18 Jun 2021 13:49:33 -0400
X-MC-Unique: 0uWhKbRiN7Sbr4PB16IvZA-1
Received: by mail-ed1-f69.google.com with SMTP id
 i22-20020a05640242d6b0290392e051b029so4108478edc.11
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SzzyY3dPy1ekBpKQyAGUykdHfPn7HIoJ3EuVKf5uu80=;
 b=OUiXjEDWXXTi2E2uqpD+kgQq5Tk8lfS0j5fkY4x7Ba5rv0MwazjQtjMylZ7mMt6F6o
 GWDBdKr2gLlaxwYIzLTgd4N29l+g1orYk0sFXzgSakJ4+4SJWrASB8hKFbaKczq1xD80
 pmaL2PQSWfJ09b1T7T4b2xd0Uz3eOpi4QLETUgkiklvmQQJaCd/Q7881Hs67QoLn6Oks
 y45z3wBXGrCPpXqk58Ukj3MNQvhxyiMCUoSQKOycEQKTVZNS1f3VLIlsWUpmfacABXsI
 /niKx/0QfPASIS+7/e4zERp4V2CTF76b9/K+TIi/zW2+pIgvGjZ2H07Os99bc9L3SFE1
 jQ/w==
X-Gm-Message-State: AOAM53315Ym4d+zg/H+76ms4qgWuPhac0KC4v4L5uChL46MncM875Qro
 u0QcRWlLH3yRlFh6zSpo4XTaclm9BjoknQ64sh0DkanuV92qTSpn9ftUWAVuZvI28Gw6IIxLB+i
 9QltcQGdsMLq9JEA=
X-Received: by 2002:a05:6402:2805:: with SMTP id
 h5mr6903293ede.379.1624038572655; 
 Fri, 18 Jun 2021 10:49:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYwytjBz2v+kJOolo7w26TjsBvoGICIi7UHx3jHW8rm+fNcPAFj735vGhj9WfvY+nkfHt9JA==
X-Received: by 2002:a05:6402:2805:: with SMTP id
 h5mr6903258ede.379.1624038572447; 
 Fri, 18 Jun 2021 10:49:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r4sm1277504ejd.105.2021.06.18.10.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 10:49:31 -0700 (PDT)
Subject: Re: [PATCH v3 14/24] modules: use modinfo for qom load
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210618045353.2510174-1-kraxel@redhat.com>
 <20210618045353.2510174-15-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bd95eb0c-7b25-de79-a2f2-67e2795f2d1d@redhat.com>
Date: Fri, 18 Jun 2021 19:49:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618045353.2510174-15-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.202, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Use module database to figure which module implements a given QOM type.
> Drop hard-coded object list.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   util/module.c | 77 ++++++++++++++++-----------------------------------
>   1 file changed, 24 insertions(+), 53 deletions(-)
> 
> diff --git a/util/module.c b/util/module.c
> index 7d7b69cbdaca..745ae0fb20ed 100644
> --- a/util/module.c
> +++ b/util/module.c
> @@ -280,80 +280,51 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
>       return success;
>   }
>   
> -/*
> - * Building devices and other qom objects modular is mostly useful in
> - * case they have dependencies to external shared libraries, so we can
> - * cut down the core qemu library dependencies.  Which is the case for
> - * only a very few devices & objects.
> - *
> - * So with the expectation that this will be rather the exception than
> - * the rule and the list will not gain that many entries, go with a
> - * simple manually maintained list for now.
> - *
> - * The list must be sorted by module (module_load_qom_all() needs this).
> - */
> -static struct {
> -    const char *type;
> -    const char *prefix;
> -    const char *module;
> -} const qom_modules[] = {
> -    { "ccid-card-passthru",    "hw-", "usb-smartcard"         },
> -    { "ccid-card-emulated",    "hw-", "usb-smartcard"         },
> -    { "usb-redir",             "hw-", "usb-redirect"          },
> -    { "qxl-vga",               "hw-", "display-qxl"           },
> -    { "qxl",                   "hw-", "display-qxl"           },
> -    { "virtio-gpu-device",     "hw-", "display-virtio-gpu"    },
> -    { "virtio-gpu-gl-device",  "hw-", "display-virtio-gpu-gl" },
> -    { "vhost-user-gpu",        "hw-", "display-virtio-gpu"    },
> -    { "virtio-gpu-pci-base",   "hw-", "display-virtio-gpu-pci" },
> -    { "virtio-gpu-pci",        "hw-", "display-virtio-gpu-pci" },
> -    { "virtio-gpu-gl-pci",     "hw-", "display-virtio-gpu-pci-gl" },
> -    { "vhost-user-gpu-pci",    "hw-", "display-virtio-gpu-pci" },
> -    { "virtio-gpu-ccw",        "hw-", "s390x-virtio-gpu-ccw"   },
> -    { "virtio-vga-base",       "hw-", "display-virtio-vga"    },
> -    { "virtio-vga",            "hw-", "display-virtio-vga"    },
> -    { "virtio-vga-gl",         "hw-", "display-virtio-vga-gl" },
> -    { "vhost-user-vga",        "hw-", "display-virtio-vga"    },
> -    { "chardev-braille",       "chardev-", "baum"             },
> -    { "chardev-spicevmc",      "chardev-", "spice"            },
> -    { "chardev-spiceport",     "chardev-", "spice"            },
> -};
> +#ifdef CONFIG_MODULES
>   
>   static bool module_loaded_qom_all;
>   
>   void module_load_qom_one(const char *type)
>   {
> -    int i;
> +    const QemuModinfo *modinfo;
> +    const char **sl;
>   
>       if (!type) {
>           return;
>       }
> -    for (i = 0; i < ARRAY_SIZE(qom_modules); i++) {
> -        if (strcmp(qom_modules[i].type, type) == 0) {
> -            module_load_one(qom_modules[i].prefix,
> -                            qom_modules[i].module,
> -                            false);
> -            return;
> +
> +    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
> +        if (!modinfo->objs) {
> +            continue;
> +        }
> +        for (sl = modinfo->objs; *sl != NULL; sl++) {
> +            if (strcmp(type, *sl) == 0) {
> +                module_load_one("", modinfo->name, false);
> +            }
>           }
>       }
>   }
>   
>   void module_load_qom_all(void)
>   {
> -    int i;
> +    const QemuModinfo *modinfo;
>   
>       if (module_loaded_qom_all) {
>           return;
>       }
> -    for (i = 0; i < ARRAY_SIZE(qom_modules); i++) {
> -        if (i > 0 && (strcmp(qom_modules[i - 1].module,
> -                             qom_modules[i].module) == 0 &&
> -                      strcmp(qom_modules[i - 1].prefix,
> -                             qom_modules[i].prefix) == 0)) {
> -            /* one module implementing multiple types -> load only once */
> +
> +    for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
> +        if (!modinfo->objs) {
>               continue;
>           }
> -        module_load_one(qom_modules[i].prefix, qom_modules[i].module, true);
> +        module_load_one("", modinfo->name, false);
>       }
>       module_loaded_qom_all = true;
>   }
> +
> +#else
> +
> +void module_load_qom_one(const char *type) {}
> +void module_load_qom_all(void) {}
> +
> +#endif
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


