Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2B6FCDFC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 20:47:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSME-0004Mh-1A; Tue, 09 May 2023 14:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSM8-0004MV-F3
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSM5-0000h8-Nk
 for qemu-devel@nongnu.org; Tue, 09 May 2023 14:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683657992;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bcBQIIImDD7h3UWPCeM73L7qas7rok7j+8x+I2jp0pA=;
 b=Cru6JPFdBoUKeQ/+hglKgy/evi5iuIrifRIl70Yno6xv3AUgH0o9+UIFGGFQ9A/nXgN4C1
 JUU8CgxgifkAcw5xNV14LUDTDUvgdicJZ+bztXwfLoUNc1hfCTMAs7d2JqRdUdoHF1aBJf
 j+dlR4nKkbL3JBe/6LVZ2F8uyWLLUUE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-T38RmAFGPheKEMANlkdmZw-1; Tue, 09 May 2023 14:46:31 -0400
X-MC-Unique: T38RmAFGPheKEMANlkdmZw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3063394ae41so2179789f8f.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 11:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683657990; x=1686249990;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcBQIIImDD7h3UWPCeM73L7qas7rok7j+8x+I2jp0pA=;
 b=fjEBq0iUxpuJUJGzEv2YFaJTUJHMozf4DQfBRvrO+rosOLZrOMepiwtwS+9sFvkiYS
 I/N60ehCod2CMlR3S8QG1bEuzbbEld8k0OjjvXrZNsnkyMwHZnlD0OZEdlUUATrV5fMQ
 +xFGKgmuAYgGwJTOKLGFnJ6iJY65ZMBgRryTQlJNg0m8NOCVdjpoyz5BvLnvNjPXgqrd
 hT3LPe7zW9UoEVcVJtFFpzfNQEgK/scikHbre4gRlHMKwQPsuIjcrZq+Q258dMTxn1rF
 B8zipqvj1GwiaGPTd22dS9RgLoAVJiFNlgoSx85+AHFBjJ+PQx7NO5TPbFb3OD4kcsJB
 3F/A==
X-Gm-Message-State: AC+VfDwdQVWIK1LfcxU3UycWwWc17dd5ADMIXb/cXd/jC9EN2BAvSUJh
 KUfHiFMMqBQi0S24jELENEWZLgGIsbbDyt5qg3AnDGr0M8ITBZ6z9HwHmZ6wE+BoFV8WbPCqGfJ
 KcCjmXzyviQ5ekpg=
X-Received: by 2002:a5d:58e9:0:b0:306:340c:4737 with SMTP id
 f9-20020a5d58e9000000b00306340c4737mr9827402wrd.67.1683657990202; 
 Tue, 09 May 2023 11:46:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40GXTF+EwEpYvnplzfquqRC8GAWNna7tQr46fh3KfOS8d74b9u0jGxmZ3b5Bh5XYaeMDYbzA==
X-Received: by 2002:a5d:58e9:0:b0:306:340c:4737 with SMTP id
 f9-20020a5d58e9000000b00306340c4737mr9827384wrd.67.1683657989933; 
 Tue, 09 May 2023 11:46:29 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 f16-20020a5d6650000000b003062c0ef959sm15057324wrw.69.2023.05.09.11.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 11:46:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  lukasstraub2@web.de,  chen.zhang@intel.com,
 Peter Xu <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 09/10] migration: disallow change capabilities in
 COLO state
In-Reply-To: <20230428194928.1426370-10-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 28 Apr 2023 22:49:27 +0300")
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-10-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 09 May 2023 20:46:28 +0200
Message-ID: <87ild1bawr.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> COLO is not listed as running state in migrate_is_running(), so, it's
> theoretically possible to disable colo capability in COLO state and the
> unexpected error in migration_iteration_finish() is reachable.
>
> Let's disallow that in qmp_migrate_set_capabilities. Than the error
> becomes absolutely unreachable: we can get into COLO state only with
> enabled capability and can't disable it while we are in COLO state. So
> substitute the error by simple assertion.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: Juan Quintela <quintela@redhat.com>


