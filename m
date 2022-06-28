Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E7A55DABE
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:23:44 +0200 (CEST)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6BBu-0008SS-8l
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6B8H-0002Qz-UE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6B8E-0001L2-Le
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656422394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xoXm0yruUF3abWYy5pjKC/++omBmufTIhjfj255/hTg=;
 b=WI2BSXghXSlQBzHroWw55MiXw1F5Eyn7xQnLe2C2TDK6gvFz+XZRbB8M3tt7vr8uTPC+Yf
 aZJWlkM1T+ZtnEr25LudvmIoL1ysFEvAbaJ8cT00XZnrl2BQDxTnB9DziIX4K5NsZmRxiv
 CM58JdnfJ1M7MXms62LBEJPURFX3JT8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-E6hILOpWN_GROKVYKgiaMA-1; Tue, 28 Jun 2022 09:19:52 -0400
X-MC-Unique: E6hILOpWN_GROKVYKgiaMA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c185-20020a1c35c2000000b0039db3e56c39so8870491wma.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 06:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xoXm0yruUF3abWYy5pjKC/++omBmufTIhjfj255/hTg=;
 b=GjV/sEJSpdLAdh/aFi9mYVq6XQe9tWhedm8BTi0irRnh8tywgA3hVxyuCF28E1mdxe
 QQjJVm7h+mbagBU/AoCHq3Up3aWpm+X82dxClv32XavriENkvwgqW+lnLwDvvDnV/Y6O
 zZSg/BTITqmFgnFyDX5K3gERMvvICPmY3k9yb32Vj2rHzbaFGrwf97l8+2FEq/IBypnE
 l6JipUkQV1NLg3/bg5S8wHLbES/1jaoScdFzmXbvF3fc12FFkfPnNMTxQsCrBcw2w7kc
 OvMxYqWhVA9erPMXSXkb6PQPxfST52qieM59Ld7V4L4P4N+dXLx+R+7E12UqL3RHqxeQ
 E34g==
X-Gm-Message-State: AJIora9iSlWKf34Rqx4+X27sPPz1Sh7SOpNUf7W041pys+07NsLdXHry
 sHATtmurViPfAcBke2g+7XPBBUt+fImrC4Mlfh4DEo1qN1lfESTpMg5iuYhMB9mpEdWKE9ufiVG
 bStiUr/67Z7nHpZc=
X-Received: by 2002:a05:600c:1d25:b0:3a0:4cc8:f644 with SMTP id
 l37-20020a05600c1d2500b003a04cc8f644mr9355309wms.121.1656422391119; 
 Tue, 28 Jun 2022 06:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v4HJA8G42WEq39b+0qH7hWxOenpIZLloZJk1DGhFj2WJfgs1aQQqSe123+fWJ18u/THm0afw==
X-Received: by 2002:a05:600c:1d25:b0:3a0:4cc8:f644 with SMTP id
 l37-20020a05600c1d2500b003a04cc8f644mr9355272wms.121.1656422390788; 
 Tue, 28 Jun 2022 06:19:50 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a1c7712000000b0039749b01ea7sm20628653wmi.32.2022.06.28.06.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 06:19:50 -0700 (PDT)
Message-ID: <0042456a-693c-ad14-794c-acda81870616@redhat.com>
Date: Tue, 28 Jun 2022 15:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/5] tests: improve reliability of migration test
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220628105434.295905-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/06/2022 12.54, Daniel P. Berrangé wrote:
> Since the TLS tests were added a few people have reported seeing
> hangs in some of the TLS test cases for migration. Debugging
> has revealed that in all cases the test was waiting for a STOP
> event that never arrived.
> 
> The problem is that TLS performance is highly dependant on the
> crypto impl. Some people have been running tests on machines
> which are highly efficient at running the guest dirtying workload
> but relatively slow at TLS. This has prevented convergance from
> being reliably achieved in the configured max downtime.
> 
> Since this test design has been long standing I suspect the
> lack of convergance is a likely cause of previous hangs we've
> seen in various scenarios that resulted in us disabling the test
> on s390 TCG, ppc TCG and ppc KVM-PR.
> 
> Thus I have suggested we drop this skip conditions, though I would
> note that I've not had the ability to actually test the effect that
> this has.
> 
> Daniel P. Berrangé (5):
>    tests: wait max 120 seconds for migration test status changes
>    tests: wait for migration completion before looking for STOP event
>    tests: increase migration test converge downtime to 30 seconds
>    tests: use consistent bandwidth/downtime limits in migration tests
>    tests: stop skipping migration test on s390x/ppc64
> 
>   tests/qtest/migration-helpers.c | 14 ++++++
>   tests/qtest/migration-test.c    | 80 ++++++++++-----------------------
>   2 files changed, 38 insertions(+), 56 deletions(-)

FYI, this is fixing the issue with the hang that I saw with the 
precopy/unix/tls/x509/override-host test on my RHEL8 s390x host.

Tested-by: Thomas Huth <thuth@redhat.com>


