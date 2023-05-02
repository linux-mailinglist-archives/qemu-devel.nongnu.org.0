Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2D16F49A8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:24:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptufh-000411-Hr; Tue, 02 May 2023 14:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptufc-00040n-8q
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:24:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptufa-0004oe-N1
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683051849;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=adU8+NW9eFDtAAiMqZiA3HB/nxpMEIopkM3ejAZcguM=;
 b=KctO9r4pJJfMt5SlWqmEfKJX0P99JxebCiZsrU1+0zBqzZisekxIFtolt3mlzbDnRBuu3K
 UY1VAsvENvD7fAZoo4u5lnIPvZt4tCz36uyKrtPm3br/q3jLLuvsdIeESsAmLaY8OQtigu
 pfKYCYAAOmBruDEftxiWAURZ4nW6u9w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-E6204DiVOESdjX74cuV4Hw-1; Tue, 02 May 2023 14:24:08 -0400
X-MC-Unique: E6204DiVOESdjX74cuV4Hw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-301110f1756so1243769f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 11:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683051847; x=1685643847;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=adU8+NW9eFDtAAiMqZiA3HB/nxpMEIopkM3ejAZcguM=;
 b=ZPQCDM61FZ2Q1GkkkFaXStBQ2V9tT1YXlml53BdkvbVZzDIaT7UVQJiVH6mZsTo+7/
 2x/Rp9fba1vQqs0imLjUbMa3//E3eVrEbbQN3Cr/7AzYwWgnJ2GBUuaPg+9jUdgOnj1b
 MqY4MITCMmp3jI5n7Cj5ti2mAuz6T0qflgFr8FBilHs7ffRL6tUywao6K2aj9nqI1+7U
 zxRJO4SZBIZ6+TExj2ioz6JJowmKKj3YbxKuESvdvuV97sAGCoa/gz4m/Py75MBKp07w
 ZGXWDtCr5jOCyIafMfhPjN++6NJUaI5t3LDl3LhF5qqCviIYcL9BOy4P+aiuNWnc2Z/M
 dIvw==
X-Gm-Message-State: AC+VfDwCKDysGgNRxkk3j/88bglaE1QvKZl8JLJp/X6KLsRkVxQ+5wun
 L1K8YZtw9eZDa6M9OjO1QKfvz2qqPgnhxoONrXPiVynoprXa8ngDmG1/ase3R77Ja8dG+PpFNKD
 1T12HZV8DHIN9dqQ=
X-Received: by 2002:a05:6000:11c5:b0:2f5:83a8:a9a9 with SMTP id
 i5-20020a05600011c500b002f583a8a9a9mr12263055wrx.16.1683051847110; 
 Tue, 02 May 2023 11:24:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7771kjFYgm3Wj2+ZZdTRWuk2JP/B4PC2dKJN6XC+TWKLKH2ueD3FwN4yBM8IPq0+Z7dTYoog==
X-Received: by 2002:a05:6000:11c5:b0:2f5:83a8:a9a9 with SMTP id
 i5-20020a05600011c500b002f583a8a9a9mr12263047wrx.16.1683051846784; 
 Tue, 02 May 2023 11:24:06 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 z1-20020a5d44c1000000b00304a876c3c1sm16093559wrr.5.2023.05.02.11.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 11:24:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  lukasstraub2@web.de,  chen.zhang@intel.com,
 Hailiang Zhang <zhanghailiang@xfusion.com>,  Peter Xu
 <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 02/10] colo: make colo_checkpoint_notify static and
 provide simpler API
In-Reply-To: <20230428194928.1426370-3-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 28 Apr 2023 22:49:20 +0300")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-3-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 02 May 2023 20:24:05 +0200
Message-ID: <87wn1qsibe.fsf@secure.mitica>
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> colo_checkpoint_notify() is mostly used in colo.c. Outside we use it
> once when x-checkpoint-delay migration parameter is set. So, let's
> simplify the external API to only that function - notify COLO that
> parameter was set. This make external API more robust and hides
> implementation details from external callers. Also this helps us to
> make COLO module optional in further patch (i.e. we are going to add
> possibility not build the COLO module).
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Juan Quintela <quintela@redhat.com>


