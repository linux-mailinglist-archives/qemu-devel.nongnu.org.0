Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4114681164
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:13:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUtw-0001Ep-Ni; Mon, 30 Jan 2023 09:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUto-0001Cb-TZ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:12:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUti-0000IE-Oh
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675087957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/JfOpjghu1xEkXUaTMrcOhwi5M2JrjC97o13QlidUK8=;
 b=VpMHIcQPYRqWmM16iStx/GYDuNIM3FSJtabW7Ovn/WGWb6x3wSRx7GdP2SZJbtybJ+ZHas
 P0ReHBUkl3JRFv/0VsRBt9JNnAweLyFFWWK3reEBheWrOPJrglTwI9PC2aoGY4OieECSb3
 eqAjdXS5krGsLdZ8XBygSaquGwYlw/I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-Ob_DJLSUOi65rPVlJjPkVA-1; Mon, 30 Jan 2023 09:12:36 -0500
X-MC-Unique: Ob_DJLSUOi65rPVlJjPkVA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l8-20020a05600c1d0800b003dc25f6bb5dso7647869wms.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/JfOpjghu1xEkXUaTMrcOhwi5M2JrjC97o13QlidUK8=;
 b=0jBiJIUjMnXkm9F9LHg8iKOUSJ5sQKkQ0pwN44OgPhs1EO6TEMAkFVihiZ7TUsV7ea
 PD+9GcVHsMyJ2et+Pdn7c/j0tPAaB1/udxLXD9rihzhK5dpTLQ2JIWoFG3mU3nBnpNL1
 L23tE5ZGaCSTidAjA1TZZVSiAkhUGqxfV78LEV+XYaEaE9N7EDPJIWpAMJ/hXnWpnpTb
 LwjyEqEU0Tp2glzxYuZtTOTmrPlP+oLTxsGEb0L957lDYWk4GnQJ3OxxpzxlOo6lVWWd
 NaaZ3uT4+g+EmL5gqSqeOiYgE0Sga6567YodsHc9JsgaQKOgP5RRhG3gq9iBG7YNaVVV
 ZgTQ==
X-Gm-Message-State: AFqh2koOSa7wHpOm/O/FukI1t/seA7CNRxJGpMEeKOqtIfVhlmAk7lYo
 mS1NsM0oeboxwyqIefdDR5GjZCiCXrg6HJjX56aSqmLNABsZLD991sVzWYbRrnHxM6otunRnI0S
 LV7SXhMgAvqBd3Xw=
X-Received: by 2002:a05:600c:1c2a:b0:3cf:d0b1:8aa1 with SMTP id
 j42-20020a05600c1c2a00b003cfd0b18aa1mr48027873wms.0.1675087955468; 
 Mon, 30 Jan 2023 06:12:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9TAXpE01r9HA8uSktOWQsibC9/rxGSG9jlES6a9brbM56rTswWAF4+QxzlicTpQW/dLjj2A==
X-Received: by 2002:a05:600c:1c2a:b0:3cf:d0b1:8aa1 with SMTP id
 j42-20020a05600c1c2a00b003cfd0b18aa1mr48027839wms.0.1675087955281; 
 Mon, 30 Jan 2023 06:12:35 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 o25-20020a1c7519000000b003daf6e3bc2fsm24805883wmc.1.2023.01.30.06.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:12:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v5 04/20] scripts/clean-includes: Improve --git commit
 message
In-Reply-To: <20230130132156.1868019-5-armbru@redhat.com> (Markus Armbruster's
 message of "Mon, 30 Jan 2023 14:21:40 +0100")
References: <20230130132156.1868019-1-armbru@redhat.com>
 <20230130132156.1868019-5-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 15:12:33 +0100
Message-ID: <87sffsnmb2.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> The script drops #include "qemu/osdep.h" from headers.  Mention it in
> the commit message it uses for --git.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/clean-includes | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index f0466a6262..f9722c3aec 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -193,8 +193,8 @@ if [ "$GIT" = "yes" ]; then
>      git commit --signoff -F - <<EOF
>  $GITSUBJ: Clean up includes
>  
> -Clean up includes so that osdep.h is included first and headers
> -which it implies are not included manually.
> +Clean up includes so that qemu/osdep.h is included first in .c, and
> +not in .h, and headers which it implies are not included manually.

I give a tree.

Clean up includes so qemu/osdep.h is never used in .h files.  It makes
sure that qemu/osdep.h is only used in .c files.  Once there, it assures
that .h files already included in qemu/osdep.h are not included a second
time on the .c file.

What do you think?
And yes, not using "include" the "include files" is .... interesting/confusing/....


Anyways, if you preffer old text or net one.

Reviewed-by: Juan Quintela <quintela@redhat.com>


