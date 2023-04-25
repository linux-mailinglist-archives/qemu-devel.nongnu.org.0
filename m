Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F56EDC58
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:18:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCvc-0006w1-2T; Tue, 25 Apr 2023 03:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prCva-0006vq-2Y
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:17:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prCvY-0002IL-7a
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682407046;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1FjfdrhHSjValSbBh2U4oA6nvS8JTpo+lp6hDhUmFWk=;
 b=EO1y9IFMEXed+OPjKT2D0aSF8LtK8bctXVDqYRoYIiVhtr0kJCCIg81mkAvrOltjSWrB70
 4LC1RLaq9Z9o5rJfuhfRIcMNMXv+u2qfd/GBsZpkxfzCAdQlzYLXdPjfFj5XKHlQ2lJoF4
 SopVqDZ+bpw8j+1q1U6F3p5Ij4lfT74=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-GMq2baOKP_2YYnobY39FWA-1; Tue, 25 Apr 2023 03:17:25 -0400
X-MC-Unique: GMq2baOKP_2YYnobY39FWA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f080f9ea3eso20150185e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682407044; x=1684999044;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1FjfdrhHSjValSbBh2U4oA6nvS8JTpo+lp6hDhUmFWk=;
 b=fVwbc0AwKwuWBjM4howgxsZQyv33xU8PoSueLpDM8TB3p5HwxzlCYVYuVfnkszRTjw
 gYkSOXdbJmtqLlsZK9IR3oznaRhGmVX8EqyhcZ7/2zgLmgJTxJEX+WZOePZnwLwljSzn
 MpvsKBX56ZBujkXrmtQRZhkVYuXcq5K7Gj3KVYq/bxkL1BPMvI22wLfVo+vvhLWlhwyr
 8VZczZViROSXhKCH4aaxZIgqmL1+m9uT5lgF4rK6jLPPDyE47djvxA0Scs8rJWmH+7Xr
 FOk0Gp+Kl0xD/34ty/cHquk/RAzPtoarLW13lm/QUTXMBaKZUDaXubzzaFlh3IPmtkWe
 Ugow==
X-Gm-Message-State: AAQBX9cfRpUq0n7SVC072jSzZNaNECNIDb0PKD54e0Ff89L0hjLXAl9R
 YhY2xcYNoxehXRjSWHvu9oRC+e9ICR0lAiyIiL5tbrT7Ay7pdM4PSLch1aFLUWVQmLxBAmuGclq
 TnbFhAxtekJ+qbRI=
X-Received: by 2002:a7b:ca59:0:b0:3f1:81c6:f59a with SMTP id
 m25-20020a7bca59000000b003f181c6f59amr8476325wml.4.1682407043977; 
 Tue, 25 Apr 2023 00:17:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350a73UQhxw/CywxHBdCWUt3csjohQPLnmKVMynGg9j0AGUtrubRH+jtm2Mmu4B+cIwwIV2BEzw==
X-Received: by 2002:a7b:ca59:0:b0:3f1:81c6:f59a with SMTP id
 m25-20020a7bca59000000b003f181c6f59amr8476286wml.4.1682407043580; 
 Tue, 25 Apr 2023 00:17:23 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c215300b003ee20b4b2dasm14101104wml.46.2023.04.25.00.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:17:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  eblake@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  vsementsov@yandex-team.ru,
 eduardo@habkost.net,  marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  marcandre.lureau@gmail.com,  david@redhat.com
Subject: Re: [PATCH v2 03/16] qapi: Fix misspelled references
In-Reply-To: <20230425064223.820979-4-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 25 Apr 2023 08:42:10 +0200")
References: <20230425064223.820979-1-armbru@redhat.com>
 <20230425064223.820979-4-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 25 Apr 2023 09:17:21 +0200
Message-ID: <878regtoqm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
> query-cpu-definitions returns a list of CpuDefinitionInfo, but
> documentation claims CpuDefInfo, which doesn't exist.
>
> query-migrate-capabilities returns a list of
> MigrationCapabilityStatus, but documentation claims
> MigrationCapabilitiesStatus, which doesn't exist.
>
> balloon and query-balloon can fail with KVMMissingCap, but
> documentation claims KvmMissingCap, which doesn't exist.
>
> Fix the documentation.
>
> Fixes: e4e31c6324af (qapi: add query-cpu-definitions command (v2))
> Fixes: bbf6da32b5bd (Add migration capabilities)
> Fixes: d72f326431e2 (qapi: Convert balloon)
> Fixes: 96637bcdf9e0 (qapi: Convert query-balloon)
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


