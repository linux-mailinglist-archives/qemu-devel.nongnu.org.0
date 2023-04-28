Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D68E6F1DEC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:21:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSic-00089J-SV; Fri, 28 Apr 2023 14:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSia-00088W-Tg
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:21:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSiZ-0001hU-2X
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682706074;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OREnveZ/b5GcsRuu3mnTgT/0ieDEK3gxMH4LxQ+wlrk=;
 b=HH29oC+2tJBFh1hjHYGU0bLE8PVNxqTfq6jY9a24JlVug35DswfesTGiuLu8DvLQdETxWe
 Z/pi96z3R6JFyqzHjZ/vUs6H1wvXqv4BIqj3CZwXMr7ha6KUCjS9qyZqRpDKomgL6SiqT0
 FRRUriskkCpotiYIeEVbSVK9yGzsDCM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-Yo6IXvEBMA-sMpNfTPZVaA-1; Fri, 28 Apr 2023 14:21:12 -0400
X-MC-Unique: Yo6IXvEBMA-sMpNfTPZVaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f080f534acso71295e9.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682706071; x=1685298071;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OREnveZ/b5GcsRuu3mnTgT/0ieDEK3gxMH4LxQ+wlrk=;
 b=cUYLabXDYM/R7dnwHQf1+Wdac7dG0POD/QykaJ8rfqs71C8k9+Iw9do+ipX6Ivd5ol
 O1XbcH1qWfXHh5aBn1gKRNUj09mD+danG/Uwgfg7OT1Fq1S/fLm/OrZ9PuEgG5736At/
 q3r9SgLo3VZcDYCXQ2EiEWYU7gaBzoh11Uhnn/+KMIU7ZV1OPiBzJxA0T9bEPn6B+it5
 noUz5qWYvNA/WP35CA8ojn5lBTgNHpgmQ5WxouPP9a59n9gq+N+4wYdRH9xbCxi1xw21
 AqGUh2TzFxcNurfLFoyKTkPYFN/612tY/pAiPsF5M6IWDTbsL9hL+nziGQ2E41i/lVTL
 LY6g==
X-Gm-Message-State: AC+VfDxokO0nT2G4rpMDBsVX511zRz/pqHRYt+qCthbfbhTsjPwuH1ki
 fs/HfzEaur28APb97n6faMspgTTKEkl4ZpoSsakB+RS1JKqXZl7EgNo0hQgX9dG962Xy/v0dvmC
 SMJc0dHFsLnJCGyA=
X-Received: by 2002:a05:600c:2941:b0:3f0:967e:2cfb with SMTP id
 n1-20020a05600c294100b003f0967e2cfbmr4952469wmd.36.1682706071087; 
 Fri, 28 Apr 2023 11:21:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4nE0KKGCFhfRcKY+eaf7bUcZKI9THePg2YFMVv1a45tX6/5u+WvT5EBUOrOhOUYzxbS+TAtg==
X-Received: by 2002:a05:600c:2941:b0:3f0:967e:2cfb with SMTP id
 n1-20020a05600c294100b003f0967e2cfbmr4952444wmd.36.1682706070781; 
 Fri, 28 Apr 2023 11:21:10 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003ef4cd057f5sm29144364wmp.4.2023.04.28.11.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:21:10 -0700 (PDT)
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
Subject: Re: [PATCH 16/17] qga/qapi-schema: Reformat doc comments to conform
 to current conventions
In-Reply-To: <20230428105429.1687850-17-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:28 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-17-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:21:09 +0200
Message-ID: <871qk37tre.fsf@secure.mitica>
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
> Change
>
>     # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>     #        do eiusmod tempor incididunt ut labore et dolore magna aliqua.
>
> to
>
>     # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>     #     do eiusmod tempor incididunt ut labore et dolore magna aliqua.
>
> See recent commit "qapi: Relax doc string @name: description
> indentation rules" for rationale.
>
> Reflow paragraphs to 70 columns width, and consistently use two spaces
> to separate sentences.
>
> To check the generated documentation does not change, I compared the
> generated HTML before and after this commit with "wdiff -3".  Finds no
> differences.  Comparing with diff is not useful, as the reflown
> paragraphs are visible there.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


