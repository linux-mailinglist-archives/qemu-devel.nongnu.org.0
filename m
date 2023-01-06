Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD863660939
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 23:05:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDupE-0006dQ-TR; Fri, 06 Jan 2023 17:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDupB-0006ct-T9
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:04:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDup9-0000JZ-NT
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:04:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673042666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2jgsJfG9tWVJckR+RqRd7iwaFLf29MkgtBmxM1MTe5w=;
 b=NmbhEp+Zq3i40ClEQAlGDuZNHQV7FAIISeaMw4ua1Wtpoeh/XcmZtwzcOmxJybKiG4+ZXN
 vdANrVZ0rC5W4lJXwvrrpCLDm7qcpRAE7x1eLuxyOxy/fA6557oRCpDF1kJF3ozoOryBoe
 h/pR9gAibAy9r8V0/ekeskaG1yQ/9Zs=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-5CveSRD6Poaab4Ldai-LkA-1; Fri, 06 Jan 2023 17:04:25 -0500
X-MC-Unique: 5CveSRD6Poaab4Ldai-LkA-1
Received: by mail-lj1-f200.google.com with SMTP id
 y19-20020a05651c221300b00279958f353fso818017ljq.1
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 14:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2jgsJfG9tWVJckR+RqRd7iwaFLf29MkgtBmxM1MTe5w=;
 b=VkrqUWlJiIldREv3uIVqTPXyVZRhFYxDYw0nBWIOVYv8CupCLYrbMB1aZ+8GHmBtSq
 iCL/nMPz7dhTwm4+BFlB+Jd4o7WPdlW4ufpDkXid9Hw4Caj/hkefTXLQhUyMwQxCw5ST
 MrivCV4PnhMipn6WwVJZIIn5ESkTOEz+e5QTtFdmN8tW1TLXydkeG5mULPFDjcsfJgz1
 Id9PjqXs3njM6eDPJRzrYIr73wKjYdndMfvoJw4azldrnyYfH75AioJ5LYpLdlnpCJ8k
 eV4NSwJIX1afVh1zh++yZnM5agV9LCdO2uT0HaGzCYckt8UBXsy5/wLpVIk5hcx0sW67
 M+Aw==
X-Gm-Message-State: AFqh2kqTXVV9z4u3MxPB86jPd3DfKwvCTTBimH7FKj+WYFjFI9oLMqGF
 NiNguJx8FA84wYsYc5NXGEI3oTtCQZRfmoeqvcRiVl+CgCpW2LPavjJ48nBczd2kX18iw12cgi0
 XSTLvOdDQ7L1Q1GmG0RudGCDxkZti37I=
X-Received: by 2002:ac2:5e78:0:b0:4b4:c06b:243b with SMTP id
 a24-20020ac25e78000000b004b4c06b243bmr2764063lfr.280.1673042664080; 
 Fri, 06 Jan 2023 14:04:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtGYWZIda1cGxx2JG7JYc04xkLgs8yaS1Wz3O827ceVPcmM/XY0TAzqSyskMVR0EvNKo2lPrNQEu+uLCUa5oXU=
X-Received: by 2002:ac2:5e78:0:b0:4b4:c06b:243b with SMTP id
 a24-20020ac25e78000000b004b4c06b243bmr2764041lfr.280.1673042663813; Fri, 06
 Jan 2023 14:04:23 -0800 (PST)
MIME-Version: 1.0
References: <20221207182825.84380-1-davydov-max@yandex-team.ru>
 <20221207182825.84380-3-davydov-max@yandex-team.ru>
In-Reply-To: <20221207182825.84380-3-davydov-max@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Fri, 6 Jan 2023 17:04:12 -0500
Message-ID: <CAFn=p-aGch6W_uCv78jg2jOD85-6eDS9SaFfnA4oGqMz2deKRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] python/qmp: increase read buffer size
To: Maksim Davydov <davydov-max@yandex-team.ru>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, vsementsov@yandex-team.ru, 
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, crosa@redhat.com, bleal@redhat.com, eblake@redhat.com, 
 armbru@redhat.com, pbonzini@redhat.com, berrange@redhat.com, alxndr@bu.edu, 
 bsd@redhat.com, stefanha@redhat.com, thuth@redhat.com, 
 darren.kenny@oracle.com, Qiuhao.Li@outlook.com, lvivier@redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Dec 7, 2022 at 1:29 PM Maksim Davydov
<davydov-max@yandex-team.ru> wrote:
>
> Current 256KB is not enough for some real cases. As a possible solution
> limit can be chosen to be the same as libvirt (10MB)
>
> Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>

This matches the patch accepted here:
https://gitlab.com/qemu-project/python-qemu-qmp/-/commit/37803de5dcf8569e6b3d6702e74f1663c7dd1281

so:

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>  python/qemu/qmp/qmp_client.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
> index 5dcda04a75..b5772e7f32 100644
> --- a/python/qemu/qmp/qmp_client.py
> +++ b/python/qemu/qmp/qmp_client.py
> @@ -197,8 +197,8 @@ async def run(self, address='/tmp/qemu.socket'):
>      #: Logger object used for debugging messages.
>      logger = logging.getLogger(__name__)
>
> -    # Read buffer limit; large enough to accept query-qmp-schema
> -    _limit = (256 * 1024)
> +    # Read buffer limit; 10MB like libvirt default
> +    _limit = (10 * 1024 * 1024)
>
>      # Type alias for pending execute() result items
>      _PendingT = Union[Message, ExecInterruptedError]
> --
> 2.25.1
>


