Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574F509F1E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:56:41 +0200 (CEST)
Received: from localhost ([::1]:46548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVQO-00068L-3C
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhUwD-0004RM-RK
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhUwC-0004kx-3s
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650540327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QtmuF8/EZhuBeP3Pxr4+6Tun1g/dqqCu1TkIaYj+3mk=;
 b=ic2j+opeIOd4ai7r334nyMLYylzmlMvFQfANbdqbrwHLeOiuzv9FdC3rQsghdL+xWBBy/b
 ddZdg/8OTqwFF10kSUUR3/dk6VUEH+n1YWWq9+GKfBZJ7OChAjz79n0H6Cduj5GojLhcOD
 JvIUhRDmOM5+xWtG/CexpsW6yx6tyEg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-pa8o45C0PrmFBEdXKKYcAw-1; Thu, 21 Apr 2022 07:25:26 -0400
X-MC-Unique: pa8o45C0PrmFBEdXKKYcAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n37-20020a05600c502500b0038fdc1394c6so2240727wmr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=QtmuF8/EZhuBeP3Pxr4+6Tun1g/dqqCu1TkIaYj+3mk=;
 b=lNRUTbF0mKlqVHAph6evF3qT4tuF1eqw3SXg5dFe+dMQhWwKqyg7OBGSBi9SNZC025
 LINyXFhcJ3vs5ZCYwfrPGZ8hUkGsK07kzfPAnBbwOKWLKtxagIjdpXJft8vAqT7wmi0z
 c70l/8UdUZu1mGJAgQT9ioVvcRrSfjVmb9B/NurfR8WCX8U3b0+6rV9f6P42er/5MWnn
 o89q1P+65oOVXcHPzEpigXtBOwxmoB8opsIThmhEOGSGlcUtSu0P+3w6/NMcJXfhEvvi
 UhvrL/cyv1CCrSdlA5eJ6F4XX89BsL/WAaQnXXV9CUdFTi+BGiONy4kopPTdwp2pMq6a
 Hefg==
X-Gm-Message-State: AOAM533ESr8ZxKz3dEidScz/V+pZsNUSnbkw+fwnK8CIYtRXMDwo4jV9
 wqj4HX2ANoqum/L1DvNopma89WuO4yLCwdfbpk8XtreuM2XsF3yMD05ayRo8BSL7S6hFGLe7B7P
 kPQTQAz9Jk+yT0qg=
X-Received: by 2002:a5d:4842:0:b0:207:c6ad:4a48 with SMTP id
 n2-20020a5d4842000000b00207c6ad4a48mr18673923wrs.149.1650540324965; 
 Thu, 21 Apr 2022 04:25:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8zJNrlGOvDrE3z6r+t3Bpf5Ghres+dQivz31e/r13+EcYhS/NwDcQ63AGcpaN2/m4v2gxcQ==
X-Received: by 2002:a5d:4842:0:b0:207:c6ad:4a48 with SMTP id
 n2-20020a5d4842000000b00207c6ad4a48mr18673907wrs.149.1650540324752; 
 Thu, 21 Apr 2022 04:25:24 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 100-20020adf806d000000b00205ba671b25sm2065376wrk.56.2022.04.21.04.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:25:24 -0700 (PDT)
Date: Thu, 21 Apr 2022 12:25:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 00/18] tests: introduce testing coverage for TLS with
 migration
Message-ID: <YmE/ImN+9nIFPM2W@work-vm>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> This significantly expands the migration test suite to cover testing
> with TLS over TCP and UNIX sockets, with both PSK (pre shared keys)
> and x509 credentials, and for both single and multifd scenarios.
> 
> It identified one bug in handling PSK credentials with UNIX sockets,
> but other than that everything was operating as expected.
> 
> To minimize the impact on code duplication alopt of refactoring is
> done of the migration tests to introduce a common helper for running
> the migration process. The various tests mostly just have to provide
> a callback to set a few parameters/capabilities before migration
> starts, and sometimes a callback to cleanup or validate after
> completion/failure.
> 
> There is one functional bugfix in patch 6, I would like to see
> in 7.0. The rest is all test suite additions, and I don't mind
> if they are in 7.0 or 7.1

I've queued:
tests: expand the migration precopy helper to support failures
tests: switch migration FD passing test to use common precopy helper
tests: introduce ability to provide hooks for migration precopy test
tests: merge code for UNIX and TCP migration pre-copy tests
tests: switch MigrateStart struct to be stack allocated
migration: fix use of TLS PSK credentials with a UNIX socket
tests: print newline after QMP response in qtest logs
tests: support QTEST_TRACE env variable
tests: improve error message when saving TLS PSK file fails

> Changed in v2:
> 
>   - Use structs to pass around most parameters
>   - Hide expected errors from stderr
> 
> Daniel P. Berrangé (18):
>   tests: fix encoding of IP addresses in x509 certs
>   tests: improve error message when saving TLS PSK file fails
>   tests: support QTEST_TRACE env variable
>   tests: print newline after QMP response in qtest logs
>   tests: add more helper macros for creating TLS x509 certs
>   migration: fix use of TLS PSK credentials with a UNIX socket
>   tests: switch MigrateStart struct to be stack allocated
>   tests: merge code for UNIX and TCP migration pre-copy tests
>   tests: introduce ability to provide hooks for migration precopy test
>   tests: switch migration FD passing test to use common precopy helper
>   tests: expand the migration precopy helper to support failures
>   tests: add migration tests of TLS with PSK credentials
>   tests: add migration tests of TLS with x509 credentials
>   tests: convert XBZRLE migration test to use common helper
>   tests: convert multifd migration tests to use common helper
>   tests: add multifd migration tests of TLS with PSK credentials
>   tests: add multifd migration tests of TLS with x509 credentials
>   tests: ensure migration status isn't reported as failed
> 
>  meson.build                          |    1 +
>  migration/tls.c                      |    4 -
>  tests/qtest/libqtest.c               |   13 +-
>  tests/qtest/meson.build              |   12 +-
>  tests/qtest/migration-helpers.c      |   13 +
>  tests/qtest/migration-helpers.h      |    1 +
>  tests/qtest/migration-test.c         | 1208 +++++++++++++++++++++-----
>  tests/unit/crypto-tls-psk-helpers.c  |   20 +-
>  tests/unit/crypto-tls-psk-helpers.h  |    1 +
>  tests/unit/crypto-tls-x509-helpers.c |   16 +-
>  tests/unit/crypto-tls-x509-helpers.h |   53 ++
>  tests/unit/test-crypto-tlssession.c  |   11 +-
>  12 files changed, 1096 insertions(+), 257 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


