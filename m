Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA76F1DB3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 19:56:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSKD-00043C-Ot; Fri, 28 Apr 2023 13:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSKB-00042t-CE
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSK9-0004dg-OU
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 13:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682704561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eFb+r9es7E5J7cvljWyAQkgkS6xWiYY72c8fgsW1lKA=;
 b=GOzIagevwoaR4G/+3oM5XUIWrhIdqiFH5T5NQbJ3dUAeLbKZ/fmZneGcbS/8sP+6BEQL0I
 33q4AHzq+JUfqLbv906zgCOy6EZv13Skh3X6r+uAdpxbIV0QNLxq4cUnutoUh9q3S5x+UP
 iFAQ2ZBPBOYiC8P8qimW3kYv0dcPQmA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-5kfGWc_5MBeGqW5BJyZ2YQ-1; Fri, 28 Apr 2023 13:55:59 -0400
X-MC-Unique: 5kfGWc_5MBeGqW5BJyZ2YQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2f625d521abso6190f8f.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 10:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682704558; x=1685296558;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFb+r9es7E5J7cvljWyAQkgkS6xWiYY72c8fgsW1lKA=;
 b=WjW8k84X+imzMF+Z8W6Lj88C6Bs7+8nIRxTsc7KS5yr06fO2HXlKLOWndhqdY4l67h
 yW0OE2BF8ZZ3IKKncSNpr6ck9TReR5zPSTb0ic6I/L0McyKAwzOLi50IHmdCVTLldqi7
 hWnEPsPMM1DJkHybQ9Xhj5FXljvnPdS852Hiv3Mv9PqBk7wYXzDXdKxjtFqXo0LCJcAd
 Bj6+wPKQuNqCzPwpzwjxqHX+ZnvfJ8G1N+AMrpXQGuC8msyMpFzPbDAReIwnxherojsa
 2tPfWuzyV9dhINTDyK+E68fNARJO2dur/GiQHd5dsysAFAR2EEspyKNFLMhi6tRMlP3G
 QgkA==
X-Gm-Message-State: AC+VfDz7F1Mx3zDuATMuv5b0FOvue4ygK4X/BbmeHR7vGhSVMYpw2KR2
 JokaSwYU5VglPJTASBVNSR9yOHWAm7XM/hz0Qae2dcuLzlQxeE9Y+8KfaveQRVNhhv/JQAm4IRs
 EoOMg1heG8AxRXGw=
X-Received: by 2002:a5d:414b:0:b0:2f5:2e27:af40 with SMTP id
 c11-20020a5d414b000000b002f52e27af40mr4188762wrq.70.1682704558622; 
 Fri, 28 Apr 2023 10:55:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oLHfD7Jk69b+Apa92DJtP7V6AoaKfkhoeD/m0+fdcYRobwL/BTwB+3H5l5WOAC4yg0omoNw==
X-Received: by 2002:a5d:414b:0:b0:2f5:2e27:af40 with SMTP id
 c11-20020a5d414b000000b002f52e27af40mr4188739wrq.70.1682704558340; 
 Fri, 28 Apr 2023 10:55:58 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 q11-20020a5d574b000000b003049d7b9f4csm7693051wrw.32.2023.04.28.10.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 10:55:57 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  peter.maydell@linaro.org,
 pbonzini@redhat.com,  marcandre.lureau@redhat.com,  berrange@redhat.com,
 thuth@redhat.com,  philmd@linaro.org,  mst@redhat.com,
 imammedo@redhat.com,  anisinha@redhat.com,  eblake@redhat.com,
 kraxel@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 arei.gonglei@huawei.com,  pizhenwei@bytedance.com,  jsnow@redhat.com,
 vsementsov@yandex-team.ru,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,  peterx@redhat.com,
 leobras@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 pavel.dovgaluk@ispras.ru,  jiri@resnulli.us,  stefanb@linux.vnet.ibm.com,
 stefanha@redhat.com,  lukasstraub2@web.de,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  victortoso@redhat.com
Subject: Re: [PATCH 04/17] meson: Fix to make QAPI generator output depend
 on main.py
In-Reply-To: <20230428105429.1687850-5-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 28 Apr 2023 12:54:16 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-5-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 19:55:56 +0200
Message-ID: <877ctv99hv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> @qapi_gen_depends is missing scripts/qapi/main.py.  Fix that, and drop
> a duplicate scripts/qapi/common.py.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


> ---
>  meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index c44d05a13f..ed24df2ade 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2834,12 +2834,12 @@ qapi_gen_depends = [ meson.current_source_dir() / 'scripts/qapi/__init__.py',
>                       meson.current_source_dir() / 'scripts/qapi/expr.py',
>                       meson.current_source_dir() / 'scripts/qapi/gen.py',
>                       meson.current_source_dir() / 'scripts/qapi/introspect.py',
> +                     meson.current_source_dir() / 'scripts/qapi/main.py',
>                       meson.current_source_dir() / 'scripts/qapi/parser.py',
>                       meson.current_source_dir() / 'scripts/qapi/schema.py',
>                       meson.current_source_dir() / 'scripts/qapi/source.py',
>                       meson.current_source_dir() / 'scripts/qapi/types.py',
>                       meson.current_source_dir() / 'scripts/qapi/visit.py',
> -                     meson.current_source_dir() / 'scripts/qapi/common.py',
>                       meson.current_source_dir() / 'scripts/qapi-gen.py'
>  ]

And here you see why putting things in alphabetical order (when
possible) avoids this kind of duplications.


