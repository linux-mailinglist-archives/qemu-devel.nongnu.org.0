Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017646F41E6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:40:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnPo-0003aS-6N; Tue, 02 May 2023 06:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptnPl-0003Zy-Vy
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ptnPh-0001wa-LK
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683023956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fiJhvTul+L3aEDJlXaSqIfzc4mlwYvGaq7Vd581VtdY=;
 b=QNxhbhoJFpfUb3DWyLhu7sRXRYYQpYKNMLI49lhNl5xrXBUPA7LKVDE1e1xwikjCbZDe+h
 tW/UKk7uUp0ndMiFS6G//4Vn7ekahZri/ns3YFj59SpqexbxKSTvnFShWUKJLupz+r4cGe
 v9h/tJrI6NbxdjwyTfXHb1bXO2hBA4I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-UzdO4BsAO6S2XNCLX7VPow-1; Tue, 02 May 2023 06:39:15 -0400
X-MC-Unique: UzdO4BsAO6S2XNCLX7VPow-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30479b764f9so953209f8f.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683023954; x=1685615954;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fiJhvTul+L3aEDJlXaSqIfzc4mlwYvGaq7Vd581VtdY=;
 b=G5rLTEKRQxvgs9IYgqb9uX6osevf+ry+B3L94YiKetSMURAtJkQhYsQfos8aA5tzIN
 T7uI04TZrs7Rex4skajyxFlYzbP3FYSsMe3wCwtFqhrynTaCGhKaPMUQ8J8HZcExvqIj
 Z4nNwl6EqkE/aqiPLOx2fhzXbwTu0oYNEw/Eanq8kvAXbDQlydIIQbGCmYn0BkXH0l3Y
 ulWsSYQ1liKDx1A2fZPea+UCl/QN/+AJsw4qMP5kY+GZGH1110YNwHvPEptpdCa3N4mD
 /lTFEW7u+2I/x//iphvfz7fr3PngoUwa7BPLt1FYtuio1YW3xhq/mLeENGU6yyGrg2IO
 XkMQ==
X-Gm-Message-State: AC+VfDzZoRqFvvCa/imJL5UW+j6r104I/wotHY5pl6j5h9bU53K8rCTy
 GY97iZqWmi2Z12BJtzSWFRZcIPMIFrZUDfJZxLTY0x3ZZUcGOm3pIunGAb6PTPx6i4cN2xL5iqL
 YSTdf/T5dEswP9nyucyaaj2IQaKGg
X-Received: by 2002:a05:6000:1051:b0:306:2b40:1258 with SMTP id
 c17-20020a056000105100b003062b401258mr5009893wrx.21.1683023954208; 
 Tue, 02 May 2023 03:39:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52I5+sxf7d9bhT7vD/K31Q17JYnrXXDK1UKT1bLuSvpSYwwgsjJVzdoZjjBrcgClueNH78/Q==
X-Received: by 2002:a05:6000:1051:b0:306:2b40:1258 with SMTP id
 c17-20020a056000105100b003062b401258mr5009876wrx.21.1683023953887; 
 Tue, 02 May 2023 03:39:13 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b0030630de6fbdsm3777270wru.13.2023.05.02.03.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 03:39:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>, Lukas Straub
 <lukasstraub2@web.de>
Subject: Re: [PULL 00/21] Migration 20230428 patches
In-Reply-To: <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org> (Richard
 Henderson's message of "Sat, 29 Apr 2023 19:45:07 +0100")
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 02 May 2023 12:39:12 +0200
Message-ID: <87jzxrt3u7.fsf@secure.mitica>
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

Richard Henderson <richard.henderson@linaro.org> wrote:
> On 4/28/23 20:11, Juan Quintela wrote:
>> The following changes since commit 05d50ba2d4668d43a835c5a502efdec9b92646e6:
>>    Merge tag 'migration-20230427-pull-request' of
>> https://gitlab.com/juan.quintela/qemu into staging (2023-04-28
>> 08:35:06 +0100)
>> are available in the Git repository at:
>>    https://gitlab.com/juan.quintela/qemu.git
>> tags/migration-20230428-pull-request
>> for you to fetch changes up to
>> 05ecac612ec6a4bdb358e68554b4406ac2c8e25a:
>>    migration: Initialize and cleanup decompression in migration.c
>> (2023-04-28 20:54:53 +0200)
>> ----------------------------------------------------------------
>> Migration Pull request (20230429 vintage)
>> Hi
>> In this series:
>> - compression code cleanup (lukas)
>>    nice, nice, nice.
>> - drop useless parameters from migration_tls* (juan)
>> - first part of remove QEMUFileHooks series (juan)
>> Please apply.
>> ----------------------------------------------------------------
>> Juan Quintela (8):
>>    multifd: We already account for this packet on the multifd thread
>>    migration: Move ram_stats to its own file migration-stats.[ch]
>>    migration: Rename ram_counters to mig_stats
>>    migration: Rename RAMStats to MigrationAtomicStats
>>    migration/rdma: Split the zero page case from acct_update_position
>>    migration/rdma: Unfold last user of acct_update_position()
>>    migration: Drop unused parameter for migration_tls_get_creds()
>>    migration: Drop unused parameter for migration_tls_client_create()
>> Lukas Straub (13):
>>    qtest/migration-test.c: Add tests with compress enabled
>>    qtest/migration-test.c: Add postcopy tests with compress enabled
>>    ram.c: Let the compress threads return a CompressResult enum
>>    ram.c: Dont change param->block in the compress thread
>>    ram.c: Reset result after sending queued data
>>    ram.c: Do not call save_page_header() from compress threads
>>    ram.c: Call update_compress_thread_counts from
>>      compress_send_queued_data
>>    ram.c: Remove last ram.c dependency from the core compress code
>>    ram.c: Move core compression code into its own file
>>    ram.c: Move core decompression code into its own file
>>    ram compress: Assert that the file buffer matches the result
>>    ram-compress.c: Make target independent
>>    migration: Initialize and cleanup decompression in migration.c
>
> There are a bunch of migration failures in CI:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4201998343#L375

cfi-x86_64

> https://gitlab.com/qemu-project/qemu/-/jobs/4201998342#L428

opensuse aarch64?

> https://gitlab.com/qemu-project/qemu/-/jobs/4201998340#L459

debian i386

> https://gitlab.com/qemu-project/qemu/-/jobs/4201998336#L4883

x86_64 and aarch64 on a s390x host?

Dunno really what is going on here.

It works here: fedora 37 x86_64 host and both:

qemu-system-x86_64 (native kvm)
qemu-system-aarch64 (emulated)

my patches are only code movement and cleanups, so Lukas any clue?

Lukas, I am going to drop the compress code for now and pass the other
patches.  In the meanwhile, I am going to try to setup some machine
where I can run the upstream tests and see if I can reproduce there.
BTW, I would be happy if you double check that I did the rebase
correctly, they didn't apply correctly, but as said, the tests have been
running for two/three days on all my daily testing, so I thought that I
did the things correctly.

Richard, once that we are here, one of the problem that we are having is
that the test is exiting with an abort, so we have no clue what is
happening.  Is there a way to get a backtrace, or at least the number

Later, Juan.


