Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54851FF2E
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:13:17 +0200 (CEST)
Received: from localhost ([::1]:52330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no48S-0002tI-A6
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no46u-0001et-JZ
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:11:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no46s-0008Uv-66
 for qemu-devel@nongnu.org; Mon, 09 May 2022 10:11:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652105497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4oAUMnKXaS86bCTaoOFw35lwtq2Pb94e6x0tzBPYMM=;
 b=A+Tx2N/4/KaaaaEeTlh5/BmXazUPj+R+bTvu7p3Tr2UNlQCBP8Xfn+snQPPWJGBfIXDmeA
 IDm3jN0Huvee8gVYYUZw2ZncZ8/fet8HsBolz5BWqcNexY+9VALtKv1X/VBppLnqvvavVA
 24bGaTOR9cXQiqywNNCYOjKHruSnD/s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-jtn8LoY1O9CfjmvSZ0HwWw-1; Mon, 09 May 2022 10:11:36 -0400
X-MC-Unique: jtn8LoY1O9CfjmvSZ0HwWw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so34997wmn.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 07:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=M4oAUMnKXaS86bCTaoOFw35lwtq2Pb94e6x0tzBPYMM=;
 b=SWm9WA1/xU7qQs6rR7DlC2Q7cRbg0XKVlXbEs2HsM/GL4+yf9Q03YYL6AFPGi9iALi
 YMY4s36Nj4OtcLNJYSXd3zWDo65RJOSe6naVsIuZJ6wiCPKpCJclC4JBcE/6LRl3tO02
 Rm77m/skR2+147DKs5RiMAnHAmD53HvoA7dCvZ7JQKjZFQfSIrGqT8gakfFb51tbt1gL
 V4JTl/Ijc44xeJTaSl7Saoyiq3Y9Oxu/jnJNU9irSnfeyIqh/llixaMS98JTYgiShFYL
 cgX/yVWKSP7ZAQx749N+L6sjEPLVRlXd+CKt2HH6h7HIPCq0oTmLxW5UT+LhRMR3SQ+h
 XPsw==
X-Gm-Message-State: AOAM5321yNce/rFewNLTqQQyUBU/LR3HY7WLyMOUmrEWqZu007MXd/pM
 BekexSU9+5CFg2CvublLqxjkFagtVNMDz0jJ8Ece4b9Dy+TKmdlH3f7rEJlOXpc/8/epiuhfigW
 Ahbd3uFFnqSfXLLc=
X-Received: by 2002:a05:600c:19cc:b0:394:8dc2:a23b with SMTP id
 u12-20020a05600c19cc00b003948dc2a23bmr6531576wmq.182.1652105494624; 
 Mon, 09 May 2022 07:11:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyneHw0udx/e/SwDhX06KICLT1G4MCcQugMisSUp16HbVlqRbBB+fkml/KtgBO2UlxeeRqPXg==
X-Received: by 2002:a05:600c:19cc:b0:394:8dc2:a23b with SMTP id
 u12-20020a05600c19cc00b003948dc2a23bmr6531550wmq.182.1652105494402; 
 Mon, 09 May 2022 07:11:34 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e20-20020adf9bd4000000b0020c61af5e1fsm11736888wrc.51.2022.05.09.07.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:11:33 -0700 (PDT)
Date: Mon, 9 May 2022 15:11:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3 0/9] tests: introduce testing coverage for TLS with
 migration
Message-ID: <YnkhE9KgB2RwmOUD@work-vm>
References: <20220426160048.812266-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426160048.812266-1-berrange@redhat.com>
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

Full set now queued again

> Changed in v3:
> 
>   - Trivial rebase dropping already merged patches
> 
> Changed in v2:
> 
>   - Use structs to pass around most parameters
>   - Hide expected errors from stderr
> 
> Daniel P. Berrangé (9):
>   tests: fix encoding of IP addresses in x509 certs
>   tests: add more helper macros for creating TLS x509 certs
>   tests: add migration tests of TLS with PSK credentials
>   tests: add migration tests of TLS with x509 credentials
>   tests: convert XBZRLE migration test to use common helper
>   tests: convert multifd migration tests to use common helper
>   tests: add multifd migration tests of TLS with PSK credentials
>   tests: add multifd migration tests of TLS with x509 credentials
>   tests: ensure migration status isn't reported as failed
> 
>  meson.build                          |   1 +
>  tests/qtest/meson.build              |  12 +-
>  tests/qtest/migration-helpers.c      |  13 +
>  tests/qtest/migration-helpers.h      |   1 +
>  tests/qtest/migration-test.c         | 866 ++++++++++++++++++++++++---
>  tests/unit/crypto-tls-psk-helpers.c  |  18 +-
>  tests/unit/crypto-tls-psk-helpers.h  |   1 +
>  tests/unit/crypto-tls-x509-helpers.c |  16 +-
>  tests/unit/crypto-tls-x509-helpers.h |  53 ++
>  tests/unit/test-crypto-tlssession.c  |  11 +-
>  10 files changed, 897 insertions(+), 95 deletions(-)
> 
> -- 
> 2.35.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


