Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC796F499E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:21:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptubN-0002Ot-2n; Tue, 02 May 2023 14:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptubK-0002Ob-T2
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptubJ-0003GJ-99
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683051584;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YEJc4Tq1KlQbHNyuVw5VlyLHjMZgeCM+wJcc8IjR+74=;
 b=KgAWXwn4x2pVkoplj6r6HwVKhP4+hbAJswYwofuJNDEYnGy6jefSby44ccypL/gA8/+GKG
 lKZlXAMPJzZOFEwHYiISKKJTF0UucuXbK0OhpXJvOjihSg8thhqvqW6Esw74xJDymkqFPW
 V4kOjHe0NvLGSiKkTq5hfrlP+pFDOzY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-NnXY0ChBPxaXlzpvYyOdgQ-1; Tue, 02 May 2023 14:19:41 -0400
X-MC-Unique: NnXY0ChBPxaXlzpvYyOdgQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30635d18e55so505012f8f.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 11:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683051579; x=1685643579;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YEJc4Tq1KlQbHNyuVw5VlyLHjMZgeCM+wJcc8IjR+74=;
 b=dediwZeV24kopK1qEznx9Lz9O1zcZ/l4q/G+2GWRpuOOAEHylCQJQFg1BvvbnqTR+I
 Nzv3xDbvgOysSf0IqsASs4WFZT/XJmzHCIGlYqh6d7TejU0p6eDt0npIKHP9xDOYE+Ky
 lTnUfPExoRsctCkJYMQ3OtUhZBZeh4NQaxz0pzSqzdcS2E0B+n3cS6VlcK9qXncYpZcW
 N1WuItA1tdzZazjvmVy/YiKij+ZWculKTWRDKKNdI0hn5dPPE0OI/CYJQZ8i4P6vy/LS
 VU3lig2xU330rlRzQB+6oJRLOzFxI8nHyEJO8n5GcMaZju/0y/zpW/8udV6H0VGAFqWB
 pbhg==
X-Gm-Message-State: AC+VfDxk4zU5kDxbMTZld7aLgBVrXsoVfXgk7jiEWpIFP6UA5QxzwLcR
 NnVDvtTVE5bj02T2z2rbubYmoZJqSZJxMmVBnoJooFh37GWsWgq9UfYfcC5svX298d0+51mbeF0
 zCpXFBa3QQxUtim0=
X-Received: by 2002:a5d:6b90:0:b0:2fc:7b62:f459 with SMTP id
 n16-20020a5d6b90000000b002fc7b62f459mr13557543wrx.32.1683051579405; 
 Tue, 02 May 2023 11:19:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5khlMFZGUYx2mKmu7agQsYEwCCZiFyv2VEvSlQIJQE44jWKrtDejJTNJPWt59qKLvo+Ky2GA==
X-Received: by 2002:a5d:6b90:0:b0:2fc:7b62:f459 with SMTP id
 n16-20020a5d6b90000000b002fc7b62f459mr13557532wrx.32.1683051579065; 
 Tue, 02 May 2023 11:19:39 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 z10-20020a5d654a000000b002f22c44e974sm31604011wrv.102.2023.05.02.11.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 11:19:38 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  lukasstraub2@web.de,  chen.zhang@intel.com,
 Peter Xu <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 05/10] migration: drop colo_incoming_thread from
 MigrationIncomingState
In-Reply-To: <20230428194928.1426370-6-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 28 Apr 2023 22:49:23 +0300")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-6-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 02 May 2023 20:19:35 +0200
Message-ID: <877ctqtx3c.fsf@secure.mitica>
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
> have_colo_incoming_thread variable is unused. colo_incoming_thread can
> be local.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Juan Quintela <quintela@redhat.com>


