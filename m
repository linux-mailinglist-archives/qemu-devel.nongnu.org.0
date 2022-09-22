Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B865E6480
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 15:59:02 +0200 (CEST)
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obMjF-0005CL-Fq
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 09:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obM3m-0006j1-K8
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:16:17 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:41507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obM3d-0001kV-Rd
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 09:16:03 -0400
Received: by mail-ua1-f54.google.com with SMTP id y20so3634831uao.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 06:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SuAidEXs3s47XBVXihNuJ/P2yUmhI9Vkj0uYcTmzACw=;
 b=hMTbujvdsyzQ69QdDDQzEi+h1+bOjKC4DXWR689XylFlehoPQWJJt95s/ugRMBXxeQ
 rMdijE5t8XfCQ+S8YjrNddeeFu8fcqTvvfaGJpRrfaz02Tcw6vyBBfc2ZDCDTWeCmava
 e1M2Nka2mgI3dNVJ0GMdvkfFYod+Anw4v/vrby3uxeDnZ4EBKQ8ltDpeDguIcIveo4Jy
 nClqQnSmzQuAYv6AZ3lNWdcxX/A0MmgyQ+5TOyUepDKboyCQElnxGVOvbi/FZNdie0i0
 2lHSOQA0ATZpmEBAGe3YbZc66PQDUxZ3JVGHyVXeb98EiCoUHhS76WDXRO57Od6rgDBD
 u3hg==
X-Gm-Message-State: ACrzQf2hyefqxvjOghhkhL+/sZntEKPxI0rN/+BP1/AsoRElg7AS2GPr
 6364RWZShoUncejne5382387pt6D9G50UNqjwe4=
X-Google-Smtp-Source: AMsMyM4iKsyXsfgysT0H/YPOIaBe+zWqlmWQRyAo39OnSkzQxGYvIBSXbSO4yQdrDGe+fh14fnC0cQfL+EsNiS9QO9U=
X-Received: by 2002:ab0:c07:0:b0:3ae:8f1f:2c53 with SMTP id
 a7-20020ab00c07000000b003ae8f1f2c53mr1218666uak.17.1663852560448; Thu, 22 Sep
 2022 06:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-15-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-15-armbru@redhat.com>
Date: Thu, 22 Sep 2022 15:15:48 +0200
Message-ID: <CAAdtpL5RoFEzEJFXZT44oi9YQr9N84sSoy5xPKLkkdxWRiwMjw@mail.gmail.com>
Subject: Re: [PATCH 14/27] qapi migration: Elide redundant has_FOO in
 generated C
To: Markus Armbruster <armbru@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, 
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.222.54;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ua1-f54.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Thu, Sep 15, 2022 at 10:52 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/migration.json.
>
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  migration/block-dirty-bitmap.c |  4 ++--
>  migration/colo.c               |  1 -
>  migration/migration.c          | 27 ++++++++-------------------
>  monitor/hmp-cmds.c             | 26 +++++++++++---------------
>  monitor/misc.c                 |  2 +-
>  scripts/qapi/schema.py         |  1 -
>  6 files changed, 22 insertions(+), 39 deletions(-)

> @@ -1556,7 +1548,7 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>  #ifdef CONFIG_LINUX
>      if (migrate_use_zero_copy_send() &&
>          ((params->has_multifd_compression && params->multifd_compression) ||
> -         (params->has_tls_creds && params->tls_creds && *params->tls_creds))) {
> +         (params->tls_creds && params->tls_creds && *params->tls_creds))) {
>          error_setg(errp,
>                     "Zero copy only available for non-compressed non-TLS multifd migration");
>          return false;

Checking params->tls_creds once should be enough ;)

