Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29E36F02B7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:41:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prxBp-0002oe-Cw; Thu, 27 Apr 2023 04:41:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prxBm-0002oF-VA
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:41:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prxBl-00042n-4y
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682584874;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mpclj9gesZVLh00CtJpOTkmEgZqYo1svl1gnIp97oxU=;
 b=bA6EfZ9WkAZXXTG/e9jLRGRvKWKdPu2nqUpyc2iCzKPQciT2gp6kJSuz7C8Ze0EHz22QfS
 YU3Yiu/hE7TtQxNzgMKoT9Mac8/xu79AOGoTqQMU0Xyic9Sxv2Z/l5zE8F5UQpqbN+w9Y3
 9pc6w/Q1Y5uHVgch2wIukxUEGkCKBL0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-Qtid3JJdN5a-5z00g9Q9PQ-1; Thu, 27 Apr 2023 04:41:13 -0400
X-MC-Unique: Qtid3JJdN5a-5z00g9Q9PQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1763fac8bso52162805e9.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682584872; x=1685176872;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mpclj9gesZVLh00CtJpOTkmEgZqYo1svl1gnIp97oxU=;
 b=PM7tnJNjoeKK+h6x8MU9DQS/tHfylJEeGaVxutX/U9whVOIhI/ahwpaCO906D5i08s
 82OWNG/TGgO1AvH91Ko9LmddTaPq1Z2jDPgIwvK9sxifXfiY/ErAJMoqFhcr73NG2FyM
 HWhaZBA5cwqBQz1U/urDVcM6xsX8/EedCi1ZQ6h5TFn1tcynKK+HH9T3ZPmNpOI3s2Sk
 K27eXIwXUE8oaO2cJJFZfM45W4BNQRk0Jj/mUborU03IctPuDmuCgglzvVWGqZGEtlk9
 eFcz0tDnsVMiMGp3j3YBwKtcqI31qAPEBxhQHqDS97rIlWUNg29zheD4hA7/Rx1fbupi
 fLRQ==
X-Gm-Message-State: AC+VfDwKx6jS4vijk6D4rwAGscEzIlvsTnmn0eoEWnR5I1i7716JtTrM
 zCsFCf62J5aJSbMTViDKHYNmegp7gEhShbitDo4r1PTxcU35isfwptPQm4dS9UeOmM22O7CzcsI
 E7zg31UgKlXs0OGVvDLM8ZprNK0etmBiA7i2MXe9AweY1O4WVJXF4Ggsouzw6x5Kp+URilLnwPf
 IkrLdD
X-Received: by 2002:a1c:7707:0:b0:3f1:78d0:fc3f with SMTP id
 t7-20020a1c7707000000b003f178d0fc3fmr871596wmi.14.1682584871828; 
 Thu, 27 Apr 2023 01:41:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5jWZip3CR9q5Yy6L2ngkN34XtY3Cw0PIjs/Ubyrm+FOq7Tp5OOKK0V6wv888lGa+JLFLJnhQ==
X-Received: by 2002:a1c:7707:0:b0:3f1:78d0:fc3f with SMTP id
 t7-20020a1c7707000000b003f178d0fc3fmr871577wmi.14.1682584871513; 
 Thu, 27 Apr 2023 01:41:11 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 v12-20020adfe28c000000b0030497b3224bsm4732356wri.64.2023.04.27.01.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 01:41:11 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 0/2] Migration: Make more ram_counters atomic
In-Reply-To: <20230426201002.15414-1-quintela@redhat.com> (Juan Quintela's
 message of "Wed, 26 Apr 2023 22:10:00 +0200")
References: <20230426201002.15414-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 27 Apr 2023 10:41:10 +0200
Message-ID: <87jzxxd8ex.fsf@secure.mitica>
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

Juan Quintela <quintela@redhat.com> wrote:

self-NACK

Working on top of paolo stat64_set() function.



> Hi
>
> In this v5:
>
> Not only change the type of the counters, also use the __nocheck()
> variants of the functions.
>
> Please, review.
>
> [v4]
> - Change aligned_uint64_t to size_t to make (some) 32bit hosts happy.
>
> Please review.
>
> [v3]
> - Addressed reviews
> - All counters are now atomic, either Stat64 or atomic.
> - Rename duplicated to zero_pages
> - Rename normal to zero_pages.
>
> Please review.
>
> [v2]
> - fix typos found by David Edmondson
> - Add review-by tags.
>
> Please review.
>
> [v1]
> On previous series we cerate ram_atomic_counters.  But we basically
> need that all counters are atomic.  So move back to only have
> ram_counters, just with a new type that allows the atomic counters.
>
> Once there, move update of stats out of RAM mutex.
> And make multifd_bytes atomic.
>
> Later, Juan.
>
> Juan Quintela (2):
>   migration: Make dirty_pages_rate atomic
>   migration: Make dirty_bytes_last_sync atomic
>
>  migration/migration.c | 9 ++++++---
>  migration/ram.c       | 7 ++++---
>  migration/ram.h       | 4 ++--
>  3 files changed, 12 insertions(+), 8 deletions(-)


