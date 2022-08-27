Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188BA5A34F2
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 07:58:58 +0200 (CEST)
Received: from localhost ([::1]:48856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRoqO-0001a0-Qs
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 01:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRokr-0006DA-E4
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRokp-0005Ib-EU
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 01:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661579590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUq5A6gsYbRl8qgRVks+GrZw1GoM8rV16V9AgIRjIsg=;
 b=iMKjqKiXLexkPwCqnf2j+22wQDtwDFSlLmpPGYoE5CAf1aphsCWzKYxlVMR973+L1/tX5S
 0CWKCTBrerNbGjLQ3+6bwMb6hl+Xy6BLzSxDj47Z+skkgfSmelrtjYGjAQYIFK/83BUt4n
 NYHz7NtLtFk8DQzz66VGGCqE69MhvJM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-6NA2yfwrP0OZrqrkKsHS8Q-1; Sat, 27 Aug 2022 01:53:09 -0400
X-MC-Unique: 6NA2yfwrP0OZrqrkKsHS8Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay21-20020a05600c1e1500b003a6271a9718so1840802wmb.0
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 22:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FUq5A6gsYbRl8qgRVks+GrZw1GoM8rV16V9AgIRjIsg=;
 b=MHP3cHnc2NdWUnplhwbyv/pidLUx1+L0xqcYgpZVeHZR6nC1oRqESlJimqkqkXvjSr
 C1AGgNFlR2jVuyDKmx2jntw0Ewx2sz/rurx8R/cz6g5PkBtx+LcvI+Pvj5K2kdXTEmXt
 wALjXOLy5wqC04BaNq2gHnNJB8zB3iA3OzwH4wBDAe7z1IROAMruXih2TpjiXJMhJgVy
 vW2vV5Q7pzkUUwTY1ZUVUHmJbUX8asO2QdroUxA3WNcsMqR3bya9F+qUA1xqkZUhk+RQ
 3UTW2bnUorjlR3MlpdcBaom6t0nGVY9+Nu2/mEFPis+U6k0/o50k5zMOiztMO3gC2X5L
 QxwA==
X-Gm-Message-State: ACgBeo0usMVhuEU3XPfZAAS80BIO/pS0mcHnisSzCkTL9nj4bnpt1pp0
 ZpupUs+XGY0NnkI5+8meWU8yh54JnQp62DuVfbKrtcqbwL7nfUyFLTb9tOTvRrMZ+nXEPQjbmsk
 DbcYCNihjd2M8nNM=
X-Received: by 2002:a5d:4988:0:b0:226:d424:4b28 with SMTP id
 r8-20020a5d4988000000b00226d4244b28mr5207wrq.443.1661579588135; 
 Fri, 26 Aug 2022 22:53:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5hjfo6fFcDLKzUwwBjYR4NCYvjKcWyuNOD6dcRnyaLtwD9BsszcresP8Do2o9R8KNKSopZ+g==
X-Received: by 2002:a5d:4988:0:b0:226:d424:4b28 with SMTP id
 r8-20020a5d4988000000b00226d4244b28mr5195wrq.443.1661579587931; 
 Fri, 26 Aug 2022 22:53:07 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 j6-20020a056000124600b002258956f373sm1417461wrx.95.2022.08.26.22.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 22:53:07 -0700 (PDT)
Message-ID: <b68c5c3c-a161-872b-96d8-bcc2a9f81928@redhat.com>
Date: Sat, 27 Aug 2022 07:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 24/25] tests/docker: remove the Debian base images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
 <20220826172128.353798-25-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220826172128.353798-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 26/08/2022 19.21, Alex Bennée wrote:
> We no longer use these in any of our images. Clean-up the remaining
> comments and documentation that reference them and remove from the
> build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/testing.rst                   |  2 +-
>   .gitlab-ci.d/container-core.yml          |  5 ----
>   .gitlab-ci.d/containers.yml              |  5 ----
>   tests/docker/Makefile.include            |  8 +----
>   tests/docker/dockerfiles/debian10.docker | 38 ------------------------
>   tests/docker/dockerfiles/debian11.docker | 18 -----------
>   6 files changed, 2 insertions(+), 74 deletions(-)
>   delete mode 100644 tests/docker/dockerfiles/debian10.docker
>   delete mode 100644 tests/docker/dockerfiles/debian11.docker

Thanks for doing this, I hope the removal of the staged containers will make 
the CI easier to maintain and understand in the future!

Reviewed-by: Thomas Huth <thuth@redhat.com>


