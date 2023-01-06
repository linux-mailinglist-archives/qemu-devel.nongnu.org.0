Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9099866090D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 22:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDujm-0003m6-Lj; Fri, 06 Jan 2023 16:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDujj-0003kB-KE
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:58:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDuji-0006DY-5o
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 16:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673042329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ogyxi5XLn7tptWomuniGsEvSBymeOCuHJfCTTUsHNKc=;
 b=KEFIKU262RPGY7ZSnVGfb9IiYxoPv7kdM/A+kuJvrYfLOQsiRNVKvorOLGfdCxTcBJlJLe
 ShB6U8xFSmx3eRDCoInGRS+jyNLZd1V0BEDHPpEuXtBBiN2Yt9ke4Gmq24cQtgApZxuMd2
 pMhmgjWerRvSfyv5Ab3aDi+1BP3dIx4=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-eAryXZ23O6yrVFsZcDZ0UQ-1; Fri, 06 Jan 2023 16:58:48 -0500
X-MC-Unique: eAryXZ23O6yrVFsZcDZ0UQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 i13-20020ac2522d000000b004cb23bf5c6cso1004984lfl.20
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 13:58:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ogyxi5XLn7tptWomuniGsEvSBymeOCuHJfCTTUsHNKc=;
 b=Snn4QAsag5ghYy15FG53T2tlSK2fIxNVpT4HGUDAWuumrBF3wikESxeKMQbOuwskqn
 te+5kngSwogfSoSk+u+pBON2kTIq+GlvY4nwnCeBTOgiJgq/VYE482ELlKFYZbf1uWnG
 2dmJri6oVTlqWfsQ/DpuSLgx6u/td3SId41/bQAhnerNgPa3/ePn6jAf2FmO+3iS73cH
 jDTJw6Mfp8suPN9wkm4ygMMCGPFwcR8eROuozbfQe6DzSUE3zYkCO7flZqh1C/Q/4uCe
 GS8PKwwwLx/FHy464U2y09wEr6t8nZRJwM3NAXza4LCFAcGEHhDDmWKrWTL0yCe2/Gsl
 rsBw==
X-Gm-Message-State: AFqh2krHDzK8C/5m/Si3Vi7ELoOqkH221cvoX1OegniYW/l5YRNY6a4l
 amgMasWlDqkaYbE6AdgCFzRK/Ld7TkmVJNwSb0PSsbrQ/ygUwPY7+4SrvHXGDyrtLtlxBY91JS5
 vrF8VwOjYfCYXGZXiLcniea0ycu6mgAA=
X-Received: by 2002:a2e:b8cc:0:b0:279:c7b0:e05a with SMTP id
 s12-20020a2eb8cc000000b00279c7b0e05amr2455450ljp.148.1673042324089; 
 Fri, 06 Jan 2023 13:58:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvT4ikis5A3kJhllWOQYOsE7zSlHy2YtQhug7ptLDNia01fzorwI3RfvyMUrkZ3z5TxHa3GmeEWb6AOgEJ2+hI=
X-Received: by 2002:a2e:b8cc:0:b0:279:c7b0:e05a with SMTP id
 s12-20020a2eb8cc000000b00279c7b0e05amr2455443ljp.148.1673042323872; Fri, 06
 Jan 2023 13:58:43 -0800 (PST)
MIME-Version: 1.0
References: <20221209164743.70836-1-philmd@linaro.org>
In-Reply-To: <20221209164743.70836-1-philmd@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 6 Jan 2023 16:58:31 -0500
Message-ID: <CAFn=p-bhUTnD=FenS4Ldei-khGKmuTMfV+MeEjjUGq7UYEZDhQ@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] tests/vm: Update get_default_jobs() to work on
 non-x86_64 non-KVM hosts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Dec 9, 2022 at 11:47 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On non-x86_64 host, if KVM is not available we get:
>
>   Traceback (most recent call last):
>     File "tests/vm/basevm.py", line 634, in main
>       vm =3D vmcls(args, config=3Dconfig)
>     File "tests/vm/basevm.py", line 104, in __init__
>       mem =3D max(4, args.jobs)
>   TypeError: '>' not supported between instances of 'NoneType' and 'int'
>
> Fix by always returning a -- not ideal but safe -- '1' value.
>
> Fixes: b09539444a ("tests/vm: allow us to take advantage of MTTCG")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: John Snow <jsnow@redhat.com>


> ---
>  tests/vm/basevm.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 2276364c42..23229e23d1 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -569,8 +569,7 @@ def get_default_jobs():
>                  # more cores. but only up to a reasonable limit. User
>                  # can always override these limits with --jobs.
>                  return min(multiprocessing.cpu_count() // 2, 8)
> -        else:
> -            return 1
> +        return 1
>
>      parser =3D argparse.ArgumentParser(
>          formatter_class=3Dargparse.ArgumentDefaultsHelpFormatter,
> --
> 2.38.1
>


