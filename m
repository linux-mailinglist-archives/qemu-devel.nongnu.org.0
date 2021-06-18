Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33613AD171
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 19:48:26 +0200 (CEST)
Received: from localhost ([::1]:40018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luIbQ-0005ic-Ju
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 13:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luIZQ-0004lH-AF
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:46:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1luIZO-0004Tm-Se
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 13:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624038378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OU8KTRuypteXsSafeQ8uuxh6LuP4xaFBhF5koy19PEk=;
 b=A34lZGn7nhpv4kmocWnBHmhiEnw89wVhjdUFE/Il8+iZ/gFVowwgOKZ8ldTXrpnxdmF34j
 uiWA9f+4nI1flttMtEMyTgvgZ9jv1f/n4s8XcUc8LcJlkyKz00vbjzZT0UF8cMT6uIVSwo
 90KuVa+QWrPiOyDE2YshiG+I7fTP+7U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-HNamD1P8NI-yjJHUKMQRFw-1; Fri, 18 Jun 2021 13:46:16 -0400
X-MC-Unique: HNamD1P8NI-yjJHUKMQRFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so4677168wrc.16
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OU8KTRuypteXsSafeQ8uuxh6LuP4xaFBhF5koy19PEk=;
 b=sHFNSuK1QhxcWB6lbJBSeCH4TeKgzHzHiVdeaGIIh9O56p0rZSo3Cd1SJNlwvFwje+
 hl07uuvLEA6f9enSUvMZBc1aIApkXSCspkmMFj09fGu5f4JT1oL41r1fgh8uteOcKAPF
 huS130EoT7k5yEHS18n3w/4usS6Yc1b57TI88OtdFI+2GVq9w9onxtuvSecYvpV16w/C
 KSUOrLz879si23qwpYgXlgz4knXgDnCbhUib8I7tWKKzwcOBgtAPkJOGk7w9lre2n9xq
 cnD0nKEHZChxvX2wNkxBvc+lcZuf2nzktNcRX3Ee3dJCQEzJuWYY13muwZLpy8mjgjX5
 SRkg==
X-Gm-Message-State: AOAM530GfnNVr4dEh9h1H1geB/vfzB1Pxatb/vv8He8fhqmcAkjdFvBW
 /p3dYaFnaF4zGKdXM/aF8DyN75ZD2p/tEWNDwd3mQuq2GUnJbzapIxYjcN4S8fNV7E0QrYMiNxs
 WzkA7bFITKGwGv9M=
X-Received: by 2002:a5d:5182:: with SMTP id k2mr14027960wrv.262.1624038375874; 
 Fri, 18 Jun 2021 10:46:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh7N0FsTsPk9x/P0WSb0UxpBv19Y/QuncHU64guBmZruyTvXI8vOzI8FHbGFy/Uy1FzVqjVA==
X-Received: by 2002:a5d:5182:: with SMTP id k2mr14027916wrv.262.1624038375606; 
 Fri, 18 Jun 2021 10:46:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t11sm9376665wrz.7.2021.06.18.10.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 10:46:14 -0700 (PDT)
Subject: Re: [PATCH v3 01/24] modules: add modinfo macros
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210618045353.2510174-1-kraxel@redhat.com>
 <20210618045353.2510174-2-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d857c938-3cfd-15e4-2598-f9d2ffa15752@redhat.com>
Date: Fri, 18 Jun 2021 19:46:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618045353.2510174-2-kraxel@redhat.com>
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
> Add macros for module info annotations.
> 
> Instead of having that module meta-data stored in lists in util/module.c
> place directly in the module source code.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   include/qemu/module.h | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/include/qemu/module.h b/include/qemu/module.h
> index 944d403cbd15..81ef086da023 100644
> --- a/include/qemu/module.h
> +++ b/include/qemu/module.h
> @@ -73,4 +73,29 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
>   void module_load_qom_one(const char *type);
>   void module_load_qom_all(void);
>   
> +/*
> + * module info annotation macros
> + *
> + * scripts/modinfo-collect.py will collect module info,
> + * using the preprocessor and -DQEMU_MODINFO
> + */
> +#ifdef QEMU_MODINFO
> +# define modinfo(kind, value) \
> +    MODINFO_START kind value MODINFO_END
> +#else
> +# define modinfo(kind, value)
> +#endif
> +
> +/* module implements QOM type <name> */
> +#define module_obj(name) modinfo(obj, name)
> +
> +/* module has a dependency on <name> */
> +#define module_dep(name) modinfo(dep, name)
> +
> +/* module is for target architecture <name> */
> +#define module_arch(name) modinfo(arch, name)
> +
> +/* module registers QemuOpts <name> */
> +#define module_opts(name) modinfo(opts, name)
> +
>   #endif
> 

Let's ensure that the module system is documented in some file of 
docs/devel.

Paolo


