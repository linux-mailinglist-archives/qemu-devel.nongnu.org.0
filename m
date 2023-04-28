Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1BB6F1DC9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:04:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSR3-0007eg-8I; Fri, 28 Apr 2023 14:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSR1-0007eA-94
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:03:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSQz-0006Dm-I4
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682704984;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ElgraQ7ngBut5uMgNqY7gjOsfkoFt/5f4dzBMKGFr7c=;
 b=Ic04+GOem0jsrCluIOtsXbXypvTG+jKIsxxrtg6rHwXL+zuDLLvI8ShTo7Dy5aYvjw51or
 1AYLM5IHE2sSC9BNJPdOFvVuA2PS5AfMADJxpH7pmEe9AfWvSGDI9EBgR0SmeLY5xeC6jp
 erc+vD7oQDGTfoXOos/mLuYlJdD+kKo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-6VcZsABDO5WYNL4bOlWi9g-1; Fri, 28 Apr 2023 14:03:03 -0400
X-MC-Unique: 6VcZsABDO5WYNL4bOlWi9g-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f6d4e7faabso5314f8f.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682704982; x=1685296982;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ElgraQ7ngBut5uMgNqY7gjOsfkoFt/5f4dzBMKGFr7c=;
 b=WEou0cMMx/2zdt7ACeXRMaxYh07LD0Tp9xJgGi83tS+HYAS9yDZ+qi4R1xz4NXJhfM
 lG1usicI4vsEvKEHDa54jS0fVHxTn4lCyuH66pDRuJe5+w+Mk1mxVGCq9jU/YMXs7mMT
 VQBf9NQVFiAFVhHhm8bNcLJIpHAd2FKmodswyLXiZV+LZMpMQ1TdICDUtbYxcZ5kd26B
 aEdo3AkWskgR+SbQML0xUGBhJ9guhCakMs3ZC2iBKkBbfWltIJNuTJG5GFT45p0Z6psI
 2CK5euY/nZeXbJjCGnJwzvKGpYkwhY+GeMHRFccV3+vRipbpq+M0NhN/WLxJKrEkgZUW
 PJ3w==
X-Gm-Message-State: AC+VfDyZtN/evCqROxt9R69dpC0J3ErOyN2nSMmffr6FF7Ja0UgF+vTD
 A36e9cpftDMaOEt0JAGj8hARQ2MMrSrnym6pVUsf08vDLPf6FjB9WSZ2vy4kYzmEIXC/YVdlbEc
 I8ubp6TvLJYUg2F0=
X-Received: by 2002:a5d:468a:0:b0:304:6762:2490 with SMTP id
 u10-20020a5d468a000000b0030467622490mr4775197wrq.3.1682704981897; 
 Fri, 28 Apr 2023 11:03:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gGHCSE27T4vj5XG6tZLExHMrB+QY029XDlK4OZEp9lhNLrTKzesAiFJ+8uaC6mrgvddI1iA==
X-Received: by 2002:a5d:468a:0:b0:304:6762:2490 with SMTP id
 u10-20020a5d468a000000b0030467622490mr4775150wrq.3.1682704981594; 
 Fri, 28 Apr 2023 11:03:01 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm21631567wrw.12.2023.04.28.11.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:03:00 -0700 (PDT)
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
Subject: Re: [PATCH 07/17] qapi: Tidy up a slightly awkward TODO comment
In-Reply-To: <20230428105429.1687850-8-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 28 Apr 2023 12:54:19 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-8-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:02:59 +0200
Message-ID: <87sfcj7ulo.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> MigrateSetParameters has a TODO comment sitting right behind its doc
> comment.  I wrote it this way to keep it out of the manual, but that
> reason is not obvious.
>
> The previous commit (sphinx/qapidoc: Do not emit TODO sections into
> user manuals) lets me move it into the doc comment as a TODO section.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> ---
>  qapi/migration.json | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 82000adce4..11c09800c2 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -945,10 +945,11 @@
>  # Features:
>  # @unstable: Member @x-checkpoint-delay is experimental.
>  #
> +# TODO: either fuse back into MigrationParameters, or make
> +#       MigrationParameters members mandatory
> +#
>  # Since: 2.4

2.4 was released in 2015-08-11
There is no hope for something that has been experimental since then.


