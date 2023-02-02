Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE906884DE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNcrI-0003zN-NG; Thu, 02 Feb 2023 11:54:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNcrE-0003qS-5C
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNcrC-0007P1-L9
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675356881;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0xwTuK+ykJRopDQxJkqyLeUQwO4TzUxR3KFdmLdQqww=;
 b=ao+nmFFxPkej8Tbn08CYoVWL7averq1C+zzx4Dskd0Y4QrtsA/tpwj6VjRBF87SvESlvla
 jupAEM0Pe6Jbv2m9mK80SMGH/ElB9pE9LPc8g0+DlsERKFC4H8lfxuZevqjC+FBVzwRzh3
 ktmQry9rHDvO7XG2VxrXo3IYztLwCmw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-NcPOl_tfMsKGtyszAY6AyA-1; Thu, 02 Feb 2023 11:54:40 -0500
X-MC-Unique: NcPOl_tfMsKGtyszAY6AyA-1
Received: by mail-wr1-f71.google.com with SMTP id
 i9-20020a0560001ac900b002bfda39265aso345127wry.13
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 08:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xwTuK+ykJRopDQxJkqyLeUQwO4TzUxR3KFdmLdQqww=;
 b=Kby2mM3NDuErPATk2c7nWknqzrkJgKHLVbjL89KaWTNijqCiVpOXbgJRkV4pUpExDs
 M0le3pPkB5uksWz3u+9LSCggctU6qGah8E72p7fFGdjHHxqbjIO28FbgWxpk1K5EAGo7
 SVzWzhyjZxYV1IOHRB6ugTJwpr9d8jXQPz7Uc3DbILHqkvJlX/yC3FkVOLamUlgjP+VN
 03gEA69BU64h/w+GXSlJPtPayoRfWtV5rzWcwOQbvtWRZw5Brp6t5Juu00D1QDC1v2xI
 XfSIRvHvZ7zb8HkbOPViNwz2Tu3wPKcCDFEjRF6SkUFHv7oXGeW5Hn/uM/XM9BusSfnZ
 ZBQQ==
X-Gm-Message-State: AO0yUKXIU5DeFGuhEVZlj8R8pI6yT1FljH2TOSQa+1PycYVXr0jIpLo9
 W2+JBVeed6mqfSjeFHp/QwzLoXphOlp2x7vOt2vvuok7IQfhaTFevbZB8z1OI9hJFvfi5Aq7dl9
 LHkJVQ5CyGuqpg8s=
X-Received: by 2002:a05:600c:1ca2:b0:3dc:440f:8e9d with SMTP id
 k34-20020a05600c1ca200b003dc440f8e9dmr6555024wms.0.1675356879111; 
 Thu, 02 Feb 2023 08:54:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+Yr0aUSzkxzBz+NbTLePsHFROKlMCvB51U94HUAH14P1+u2BCDQ/hOnVLEcOQ3GfZpdaUGRQ==
X-Received: by 2002:a05:600c:1ca2:b0:3dc:440f:8e9d with SMTP id
 k34-20020a05600c1ca200b003dc440f8e9dmr6555010wms.0.1675356878912; 
 Thu, 02 Feb 2023 08:54:38 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003dc434b39c2sm5654636wmq.26.2023.02.02.08.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 08:54:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>,  mopsfelder@gmail.com
Subject: Re: [PATCH 1/2] tests/migration: add sysprof-capture-4 as
 dependency for stress binary
In-Reply-To: <20220809002451.91541-2-muriloo@linux.ibm.com> (Murilo Opsfelder
 Araujo's message of "Mon, 8 Aug 2022 21:24:50 -0300")
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
 <20220809002451.91541-2-muriloo@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 17:54:37 +0100
Message-ID: <87r0v8t3ci.fsf@secure.mitica>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Murilo Opsfelder Araujo <muriloo@linux.ibm.com> wrote:
> `make tests/migration/stress` fails with:
>
>     FAILED: tests/migration/stress
>     cc -m64 -mlittle-endian  -o tests/migration/stress tests/migration/stress.p/stress.c.o -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -fstack-protector-strong -static -pthread -Wl,--start-group -lgthread-2.0 -lglib-2.0 -Wl,--end-group
>     /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gutils.c.o): in function `.annobin_gutils.c':
>     (.text+0x3b4): warning: Using 'getpwuid' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
>     /usr/bin/ld: (.text+0x178): warning: Using 'getpwnam_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
>     /usr/bin/ld: (.text+0x1bc): warning: Using 'getpwuid_r' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
>     /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gthread.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
>     /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `.annobin_gtrace.c':
>     (.text+0x24): undefined reference to `sysprof_collector_mark_vprintf'
>     /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `g_trace_define_int64_counter':
>     (.text+0x8c): undefined reference to `sysprof_collector_request_counters'
>     /usr/bin/ld: (.text+0x108): undefined reference to `sysprof_collector_define_counters'
>     /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gtrace.c.o): in function `g_trace_set_int64_counter':
>     (.text+0x23c): undefined reference to `sysprof_collector_set_counters'
>     /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gspawn.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
>     /usr/bin/ld: /usr/lib/gcc/ppc64le-redhat-linux/11/../../../../lib64/libglib-2.0.a(gmain.c.o):(.toc+0x0): undefined reference to `sysprof_clock'
>     collect2: error: ld returned 1 exit status
>     ninja: build stopped: subcommand failed.
>     make: *** [Makefile:162: run-ninja] Error 1
>
> Add sysprof-capture-4 as dependency for stress binary.
>
> Tested on:
>   - CentOS Stream 9 ppc64le
>   - Fedora 36 x86_64
>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

If fixes the build for me also.


