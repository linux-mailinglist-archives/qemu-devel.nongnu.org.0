Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8196F1DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:06:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSTY-0001ls-37; Fri, 28 Apr 2023 14:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSTW-0001lJ-JR
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSTV-0006si-2y
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:05:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682705140;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Vnbe5O9AGt+3h6NK0ZA8GgsL1WbNM+i489/8KNHmq5I=;
 b=NYj37TpXdT1ASm8ZRi+gpMb3gTF7A5tZQ3Bi+o/hvyG2ol/oxmfmoF92z7ST9Aa08e9rNQ
 rqrn2FobWePzu35RGIRRvQIG+WNrHqHq8gmL9snXAy0G6IB8DzFveKOlusu9FnUWgiXjDZ
 85Rl1JPmQMvXBdTazUYpz3jfMFopmLw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-VJK4gqo9OL-i5MItZe7Ayw-1; Fri, 28 Apr 2023 14:05:39 -0400
X-MC-Unique: VJK4gqo9OL-i5MItZe7Ayw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f21e35dc08so28297835e9.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682705138; x=1685297138;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vnbe5O9AGt+3h6NK0ZA8GgsL1WbNM+i489/8KNHmq5I=;
 b=FXtbkCx4hudDUraFXLw+r/JR7aWxL8xx4vkZgsWpAvkpyeqfZPJKMV6cXa8LDIGnV0
 hCglSv0+r77x5dAwqW2kQ2enxevfn9PY33AFx100RGkyf7wPNJNw8SpkvXVYVU0+pZqY
 6VR6sCAX0ycrHOtK3qy4Lk0RqC/cid/fJyiCU4plci6ShB1N6QOK7h7Fh5jTPMSD5BNN
 7/u4Ke5O3chwVeKXON6RnDcB3KU5NPfTcfVfKs85f17qPHlwOHFctAVC5TwhJgNJHMjs
 A6uBamHMCUYe2ir8HgHCFoditaZs98azXCKfGS0JSMtjwMxpECFwhHQANkk9tkmhfE0x
 24hw==
X-Gm-Message-State: AC+VfDyhjoPWKJuaN1wK3H0SBRpDS+Yx6ffZWib9nbLIQuxVPF1/pXYB
 4RH+OzIjRUJiwSfpnmnML/jCez9giPLW/mZPZsC9POBw5DXcvkAcs5d98eSbB25F+cEiej9p3z7
 Y+8R8tKICYjs09ng=
X-Received: by 2002:a1c:740f:0:b0:3f2:5641:3d4 with SMTP id
 p15-20020a1c740f000000b003f2564103d4mr4708198wmc.33.1682705137800; 
 Fri, 28 Apr 2023 11:05:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71MzXFCAu44uD4OnhAoFJCCSA+0+L7zvtq+2KSnkkKXPygiCrit7UoTErslpHvrQTK9nI+Bg==
X-Received: by 2002:a1c:740f:0:b0:3f2:5641:3d4 with SMTP id
 p15-20020a1c740f000000b003f2564103d4mr4708168wmc.33.1682705137535; 
 Fri, 28 Apr 2023 11:05:37 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c444f00b003f09cda253esm28805139wmn.34.2023.04.28.11.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:05:36 -0700 (PDT)
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
Subject: Re: [PATCH 09/17] tests/qapi-schema/doc-good: Improve a comment
In-Reply-To: <20230428105429.1687850-10-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:21 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-10-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:05:35 +0200
Message-ID: <87ildf7uhc.fsf@secure.mitica>
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
> The QAPI generator doesn't reject undocumented members and
> features (yet).  doc-good.json covers this, with clear "is
> undocumented" notes to signal intent.
>
> Except for @Variant1 member @var1, where it's "(but no @var: line)".
> Less clear.  Replace by "@var1 is undocumented".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


