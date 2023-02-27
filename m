Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B04F6A4661
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 16:47:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfhv-0006IN-CL; Mon, 27 Feb 2023 10:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWfht-0006G3-3K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:46:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWfhr-0003rC-IB
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677512786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mn/LHOq8s7IzGNnqW6n5CyaHeKYRybGfXLHTkVLu9jU=;
 b=CXJP7MO/fpZCaA8qkcfzKybHq1LGXLV2mnJEpyGsz4CrIBEJo0m8jq8XPMSxzTTuWTvfAB
 l1G94Cf2IiP7aPpoF/h+o2cqMJfTyygZifDwrPBdrTn1/im5Jf9DiCuyDtJQH7Ul1yZMgu
 GuogP8hXxNOxAMDAxwcWu64m06VptAg=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-VmuYavO5PTm0tvbXphTKkQ-1; Mon, 27 Feb 2023 10:46:24 -0500
X-MC-Unique: VmuYavO5PTm0tvbXphTKkQ-1
Received: by mail-il1-f197.google.com with SMTP id
 k2-20020a056e0205a200b0031703f4bcabso4062323ils.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 07:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mn/LHOq8s7IzGNnqW6n5CyaHeKYRybGfXLHTkVLu9jU=;
 b=kpdFBJd9LuiqaqrtpDEcgj4oVSXsba3YPkzXMJt5jah99taLvTl7Eezv149MUIPgm/
 JaqYEgOEPEjFqLeaav/QggJRE/fj2LAeChzBcyYl3Yp1coMEhMOit3XzfG77TSakN+hQ
 hPIhpkMhssH2Oq54agepktpo9Jnt/oJGH1+uv/os1L6F9Cg5w/HZxHIOaR0WYpTxoXYY
 PM8R/SAWdaQS4JcFWFu6BJMCLQZ/RiblaEnZlYczhc+BDoDUPeulhdxKfkygjOPMWYEB
 Mv68/7eejkP0ryPpqm22wL1h++BnBwZRv5lzmRNuJI+h085lMGqiqr7Ar5GiVjWQGHT1
 bp6w==
X-Gm-Message-State: AO0yUKU6bJgUJqOhXKuliB+mhumCoPnudRw7yNXI4HAZsoGm3Rs0d6uS
 JMsAhPLRzpHoVO9xCAI8sKDDOD47rzmRyupqEmc7vFtu5zi/lLUriu+WeM1S+v0KWC3nODNnmF2
 zFv6LiRb6wgxOIg0=
X-Received: by 2002:a5e:a612:0:b0:74c:d689:64bd with SMTP id
 q18-20020a5ea612000000b0074cd68964bdmr4226821ioi.19.1677512783756; 
 Mon, 27 Feb 2023 07:46:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9FxnRBD8qRwCUZXTIAzflBnNzfmNxYAc+Ta63tc+1jVjouIf8gwms5uLhDBkQFYVNgxumOLg==
X-Received: by 2002:a5e:a612:0:b0:74c:d689:64bd with SMTP id
 q18-20020a5ea612000000b0074cd68964bdmr4226808ioi.19.1677512783468; 
 Mon, 27 Feb 2023 07:46:23 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 h6-20020a0566380f0600b0039e5786d7b7sm2199852jas.18.2023.02.27.07.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 07:46:22 -0800 (PST)
Date: Mon, 27 Feb 2023 08:46:21 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
Message-ID: <20230227084621.15cab9da.alex.williamson@redhat.com>
In-Reply-To: <20230227103258.13295-2-philmd@linaro.org>
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Mon, 27 Feb 2023 11:32:57 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Empty commit logs are a pet peeve of mine, there must be some sort of
motivation for the change, something that changed to make this
possible, or perhaps why this was never necessary.  Thanks,

Alex

> ---
>  hw/vfio/migration.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index a2c3d9bade..f9ac074c63 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -24,7 +24,6 @@
>  #include "migration/misc.h"
>  #include "qapi/error.h"
>  #include "exec/ramlist.h"
> -#include "exec/ram_addr.h"
>  #include "pci.h"
>  #include "trace.h"
>  #include "hw/hw.h"


