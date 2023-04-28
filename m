Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553986F1DD3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:12:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSZJ-0004Dr-DL; Fri, 28 Apr 2023 14:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSZE-0004DB-8D
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSZC-0008Hy-Uc
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682705493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kuZOUXZclaf8oIB+RHDVRGOVJc1whAcQ4LyNhDOjMbk=;
 b=UBklZ2tYdOe6BBD4M+Iq1ISXp9WtfIiznC+o5ADFiBYZJFQxmxSeVB4F7Lx6m8dzNjNMFg
 Ss0l2uA39d3rwcVk/nYXFmdd/lDxcilgrnocyibFOKFIh2bBfGVeVy9TL+Qk9D86jkFU9F
 Q8plRBd2CCf6D0H2ueHcAL6gQ0OGzfk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-60-hZ3dSPNe3bNrjUKmN6Q-1; Fri, 28 Apr 2023 14:11:31 -0400
X-MC-Unique: 60-hZ3dSPNe3bNrjUKmN6Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f446161e5aso23245f8f.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682705490; x=1685297490;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuZOUXZclaf8oIB+RHDVRGOVJc1whAcQ4LyNhDOjMbk=;
 b=KtT6BHcgQ5IuzRBlljm8SlX82WivSgDcZ9mdIjnD3JVyxDlT7OsN1/fryyPtmHddC0
 qMkogjYM5dyBDUJO1K7AmrDoq/O5xuAku8J8RY6bG0+BSf7XbLR+DhcD3Oztjf+dvmCJ
 jBSNgHRcf8ZL5BI1TC4YlxQ1jLuZVSUbphntz+mH1yAV0YGMue0LAZgLOzOt4W1sfkcX
 km3gvQNHbNZK94jKtSgoZ2yAWQ4GXZ8cAYabnwsF0wU8MMA39MUrwYrwYfK7ikAAL8Qo
 Ls7guXxYc26brffIZz+WmLN5eqg5E5JBRSyl0hn9RKlJMYJI3qeyVe5SbqtnNt5hr/z1
 euEA==
X-Gm-Message-State: AC+VfDwOsZo7+3HUCTat0/NmrkVoof1Sg24LJdhdVco/jHRTEBZq+5yD
 BFC+mQwpCe6sVZaAmaR+0/bHYVV2ew6V5kzf77xzKeaMURIbuedYcYu359/NeSWSXGCQmYyRASk
 13uQHcQGHvz48JR8=
X-Received: by 2002:a5d:480e:0:b0:2ff:7311:6e74 with SMTP id
 l14-20020a5d480e000000b002ff73116e74mr4333047wrq.26.1682705490353; 
 Fri, 28 Apr 2023 11:11:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6nxh5w4Pzr/bISxcTSz6bVwLQNwwlschesjo1SoZMroDzlUno1lVto6AZG0zxjmQaformKPg==
X-Received: by 2002:a5d:480e:0:b0:2ff:7311:6e74 with SMTP id
 l14-20020a5d480e000000b002ff73116e74mr4333010wrq.26.1682705490061; 
 Fri, 28 Apr 2023 11:11:30 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d460c000000b002f6962ee703sm21680475wrq.61.2023.04.28.11.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:11:29 -0700 (PDT)
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
Subject: Re: [PATCH 11/17] qapi: Fix argument description indentation stripping
In-Reply-To: <20230428105429.1687850-12-armbru@redhat.com> (Markus
 Armbruster's message of "Fri, 28 Apr 2023 12:54:23 +0200")
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-12-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:11:28 +0200
Message-ID: <87a5yr7u7j.fsf@secure.mitica>
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
> When an argument's description starts on the line after the "#arg: "
> line, indentation is stripped only from the description's first line,
> as demonstrated by the previous commit.  Moreover, subsequent lines
> with less indentation are not rejected.
>
> Make the first line's indentation the expected indentation for the
> remainder of the description.  This fixes indentation stripping, and
> also requires at least that much indentation.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


