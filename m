Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 819506F1DE5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:19:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSfG-0007Aa-7n; Fri, 28 Apr 2023 14:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSfE-0007AD-6k
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSfC-0000n2-Bc
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682705864;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=zMTZaP9xEkOaeFQCxir8ovtk43hcoRmZ20XluLV+bXA=;
 b=MJzDdNSusNqdlaeMBiq08GZUQNydEJ6kzjup2mrjxOXp5JQ1xruVNg1JtL1BVfyMMzNhD6
 rIgtYlGFQqaleCdvMqf7ZbjbgC5nKJcsmdbcC6X5NZh5Xbvv+dk2ue6Rd4am7poZR0JGE9
 bLyVJu/Q3WbaODtXMAa7Fs91VZIZjAs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-bbpigpeBNNOlzG0siJO0Jg-1; Fri, 28 Apr 2023 14:17:43 -0400
X-MC-Unique: bbpigpeBNNOlzG0siJO0Jg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1912ed0daso34434695e9.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682705862; x=1685297862;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMTZaP9xEkOaeFQCxir8ovtk43hcoRmZ20XluLV+bXA=;
 b=kBtoMGkI5SYJgI9caIC6T1rKGcclFsMUW615Q0DLY2Br84gQPW7mWCM5/NVroKl9tT
 Aox8sqM0vcVbQUfE+FVFT0oLxEyMjn0ATqLGtvEfVJFDWqoDz1CE375AD/UaW9glb30v
 3hnYgE13NHYkiRfq3cP6KGPoTin7T8ewGKiRuV7ZUsXhGa15E1n0YPvgYBKYQ7pp5TYu
 nAa2R6bW1Cqx6SjmXF0crwolI8HKHKPITcmZKnV1QdEtg0SjD2SuvyEY1OuZm0Y+Hqex
 IgThnrpxQiE7k68LCwImoyGsbpOfbjuDUqjhngM1M5jjAVI3Af/k2MSfetVyCuv2Jc0Y
 y6XA==
X-Gm-Message-State: AC+VfDxetRi5+sHrSKz5L/2lT343dGdeKbU9FErcWmiCeYVvs9YvTFL8
 72y4MB29gfCTleMy04HfnVRF+y/dS8tpOXXnvSfNc2iTjZXxiy3nTTQ7zErh3kf6C+U1t8LDcSk
 6yMflcUUYH8G3s1o=
X-Received: by 2002:a7b:c398:0:b0:3f1:738f:d3d1 with SMTP id
 s24-20020a7bc398000000b003f1738fd3d1mr4581250wmj.4.1682705862168; 
 Fri, 28 Apr 2023 11:17:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Yr83omBWTEUkB9bSmkst3DXbDvJVRm5eCu17CNf1R4E4h1nOSNFHEsQE+a29DEyQe58VUag==
X-Received: by 2002:a7b:c398:0:b0:3f1:738f:d3d1 with SMTP id
 s24-20020a7bc398000000b003f1738fd3d1mr4581232wmj.4.1682705861921; 
 Fri, 28 Apr 2023 11:17:41 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 he13-20020a05600c540d00b003f198b9eac5sm19480565wmb.6.2023.04.28.11.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:17:41 -0700 (PDT)
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
Subject: Re: [PATCH 15/17] docs/devel/qapi-code-gen: Update doc comment
 conventions
In-Reply-To: <20230428105429.1687850-16-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:27 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-16-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:17:40 +0200
Message-ID: <875y9f7tx7.fsf@secure.mitica>
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
> The commit before previous relaxed the indentation rules to let us
> improve the doc comment conventions.  This commit changes the written
> conventions.  The next commits will update QAPI schemas to conform to
> them.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


