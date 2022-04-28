Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B1651331A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:58:56 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2nP-00028b-89
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk2VX-0007CI-My
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:40:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk2VU-0003zD-Ij
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651146020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=653i/426SD7Gqonr7ZF6fR7DGjjVW6aM+1Us7WKZdRY=;
 b=Hdqsfev1884QFLpR+aK7OPKbWyDBgaFJDAb3AeaeFlQ5iUHRhfUD0Y/o7SpRujhxbaJrzL
 VC4hZ80AOj+ZZA4fJgbpEA+t/1B4kBSA0lCQ7h2aLgXtCQCn386SH+ASThu/e+VqxXM3xi
 +j60/mcWFkXzMQrbEeolHtAAE+P52qk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-y6gP-YI0P0auGL-exG_IaQ-1; Thu, 28 Apr 2022 07:40:18 -0400
X-MC-Unique: y6gP-YI0P0auGL-exG_IaQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so1818566wrg.19
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 04:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=653i/426SD7Gqonr7ZF6fR7DGjjVW6aM+1Us7WKZdRY=;
 b=MQWV5RuPHl0LiQb8ttzG23io+wZDkCn8hqd02jup3Ld6REoHPxCnjK10roQFbzDjwN
 IfHHPTDuc7ltkpA/vgrkj/kjR8z8runNUWGjZ6B0vxjQaKYC0viia6bewMnE/uRd+HYL
 14NCtcypSyzLGEyLhX5VPk0yaHQCfsOdjEyvlXTQtnyzMRWz0mITWqYtgcSyXDfomuqL
 8N3HXSPWhiSz8baL1JrlcEb87O2+jNtbkzIWiHkXczgjztpr1OBRbJX7T33/IWQU6AT/
 ELFOR+ZuHGYE9efzAcQQeSPHa8XYZr4dyQVUOXT4ZwNX2d5I065btXiShMGTz1aCPeah
 SxcQ==
X-Gm-Message-State: AOAM533P7K/Iui98D6HVcTRxuh2IDdsAggDCceu1OL6E68+IvDOn1E1V
 JnADBgWz48A0QyUdyq3Jxp5ajbJl9c3bcrYOK2X/dfzQZ/QudRBEnJKJo4qpBP+BEVUxlApzgjQ
 zZokizK2Q6jHB1tA=
X-Received: by 2002:a5d:5885:0:b0:20a:e64c:8386 with SMTP id
 n5-20020a5d5885000000b0020ae64c8386mr10317733wrf.631.1651146017534; 
 Thu, 28 Apr 2022 04:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0CPJcBocdia3+hbnL0NxmOq3fFP7CE9bzlDRkAbbySgsG3sOGBErDRbmxDFX69FpkmBMuEQ==
X-Received: by 2002:a5d:5885:0:b0:20a:e64c:8386 with SMTP id
 n5-20020a5d5885000000b0020ae64c8386mr10317714wrf.631.1651146017316; 
 Thu, 28 Apr 2022 04:40:17 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h5-20020adfaa85000000b0020aeb9e5becsm4410746wrc.68.2022.04.28.04.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 04:40:16 -0700 (PDT)
Date: Thu, 28 Apr 2022 12:40:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 eblake@redhat.com
Subject: Re: [PATCH v3 0/9] tests: introduce testing coverage for TLS with
 migration
Message-ID: <Ymp9HlzP2cc3nTdp@work-vm>
References: <20220426160048.812266-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426160048.812266-1-berrange@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

I've queued:
tests: ensure migration status isn't reported as failed
tests: convert multifd migration tests to use common helper
tests: convert XBZRLE migration test to use common helper
tests: fix encoding of IP addresses in x509 certs

I'd appreciate some TLS people to review the other parts.

Dave


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
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


