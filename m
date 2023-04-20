Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3002C6E8FF4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:20:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRP1-0002vF-6x; Thu, 20 Apr 2023 06:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppROy-0002tf-Ku
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:20:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppROx-0001iI-2O
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681986030;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+dDahGaLVhHN7i0bSLFxG0wpi06by6iuxHTJFj9WQzs=;
 b=FX6AZT41Oc/sX6OA78K1sZXgD28Y0pqRTQ4kr5FQBFNTfKv3Y9FMKkgV91RLxbWAE0hgEj
 XCzvEsfMBLWnOEZmynIz+R0kqRbeA+BvzUpVLcXcHj0AolEWx9rI4O1Nq+LMRTPe4J5Dhn
 I+I3aeUNZ0SAWadWtlPcyDFW4izmJuU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-a2_sRTUWNiKklTHUASNJYw-1; Thu, 20 Apr 2023 06:20:28 -0400
X-MC-Unique: a2_sRTUWNiKklTHUASNJYw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg8-20020a05600c3c8800b003f18d7dd3a0so188052wmb.6
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681986027; x=1684578027;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+dDahGaLVhHN7i0bSLFxG0wpi06by6iuxHTJFj9WQzs=;
 b=KFdZryCQ+Hg5chaCdiEpeNBHbrTxb32FCIm3oUli/jl5S2ysZdBHYKm7N/fW0B5eEF
 HmzNxyG6uhLOHeXEIHcDB0Wc6q01cIx9kdmSPB3xZs3Mkmen8NYNyJnITVdGiNV3haAL
 g9kgf9GbHNqrCpfFIoipEhEhHviUjG3MTGF/ahchH2ZFxA80ilaojuxKequHKfQe2Yw8
 nI2raMFn1cOsvC02+XpDQwRqf7qS6WuCVoh2GZuoaE/injJE2EmIqV2y+EwuA2HoaB0I
 5QI9UbtlN5Uf58HzBLdDvtIKeN+vwrBsnJuclO02TyJUsdCZOTzwD0JBRtKBc9B3B38s
 mCJg==
X-Gm-Message-State: AAQBX9fPLTDhpb4Jssa7FNb3d3bRCUE3nU921drmgtnwjW6Z5lgmTRXA
 86N9GIwgZi2G+jqaw9dUKe2mM9tNGIPvfIz9AYk7k74iX3ibW/3FzLqaq6+E/QGBU/WOs4yXuLI
 EyCyAD79jQKrR8+g=
X-Received: by 2002:a05:600c:329a:b0:3f1:7382:b59a with SMTP id
 t26-20020a05600c329a00b003f17382b59amr4908734wmp.15.1681986027580; 
 Thu, 20 Apr 2023 03:20:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350ayq3xDZkNQWom+37AYuY8JjDWI7ySD8b+oKmfrPMCLxebtTq3ZN4NgEZ4tN9RcWLQbKTu/HQ==
X-Received: by 2002:a05:600c:329a:b0:3f1:7382:b59a with SMTP id
 t26-20020a05600c329a00b003f17382b59amr4908715wmp.15.1681986027235; 
 Thu, 20 Apr 2023 03:20:27 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 iv18-20020a05600c549200b003f17b91c3adsm5078222wmb.28.2023.04.20.03.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:20:26 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 01/13] qtest/migration-test.c: Add postcopy tests
 with compress enabled
In-Reply-To: <01a063686e62ce97e7d0bc9fa935389f074ecb4b.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:47:53 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <01a063686e62ce97e7d0bc9fa935389f074ecb4b.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 12:20:25 +0200
Message-ID: <87cz3yzwgm.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Lukas Straub <lukasstraub2@web.de> wrote:
> Add postcopy tests with compress enabled to ensure nothing breaks
> with the refactoring in the next commits.
>
> preempt+compress is blocked, so no test needed for that case.
>
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>

And I wanted to removed the old compression code and it gets new users.  Sniff.

> ---
>  tests/qtest/migration-test.c | 83 +++++++++++++++++++++++-------------
>  1 file changed, 53 insertions(+), 30 deletions(-)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 1f2a019ce0..930cb4f29d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1127,6 +1127,36 @@ test_migrate_tls_x509_finish(QTestState *from,
>  #endif /* CONFIG_TASN1 */
>  #endif /* CONFIG_GNUTLS */
>
> +static void *
> +test_migrate_compress_start(QTestState *from,
> +                            QTestState *to)
> +{
> +    migrate_set_parameter_int(from, "compress-level", 1);
> +    migrate_set_parameter_int(from, "compress-threads", 4);
> +    migrate_set_parameter_bool(from, "compress-wait-thread", true);
> +    migrate_set_parameter_int(to, "decompress-threads", 4);
> +
> +    migrate_set_capability(from, "compress", true);
> +    migrate_set_capability(to, "compress", true);
> +
> +    return NULL;
> +}

Independently of this patch, we need to change this test to use 4
compression tests and 3 decompression or anything that is not the same
number in both sides.

I was complaining about this and when I arrived to the end of the path
found that this was code movement.

Later, Juan.


