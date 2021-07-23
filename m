Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B33D4301
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 00:37:18 +0200 (CEST)
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m73nB-0006kw-Iu
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 18:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73m6-0005V7-Ft
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73m4-0005aw-ER
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627079767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zF8KGU2KcEOALTdw4g+yy8TcTXSCzVJkHdbCzel++g0=;
 b=ODXB0NAILL1gX0gkXeNfKXYHNQvHB24dJtof7Eq8ys/z6CLqf9undFRx/dlPRpqdIUQaD3
 vJ6Wc5V4/i/wZ3L/RVV+iv4Z5A5zZtVdGMOA5MxiNJZkuFepMn1CjJ8A4XX7W414jcs8uD
 F3UazqvCnQh2Qwgszwfv3bkgFeSPuLQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-Do_UbJ7CPGKDmp6HQ1-pVg-1; Fri, 23 Jul 2021 18:36:05 -0400
X-MC-Unique: Do_UbJ7CPGKDmp6HQ1-pVg-1
Received: by mail-qk1-f197.google.com with SMTP id
 w26-20020a05620a129ab02903b9eeb8b45dso2082722qki.8
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 15:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zF8KGU2KcEOALTdw4g+yy8TcTXSCzVJkHdbCzel++g0=;
 b=YvzyG6g4xoQUvi0b7jXd9D1sF6NRTRskCz2dtq+Bvtr4T/ePUkFKckFO+exVIKBk41
 R5kRmkxCwio1Nxlfby34p4/OdEKtgEuWeVusYJFLwgHLlIg+HPI1vBqDQTC9nsQVrkU0
 SuPZjyhTTaJP6j3yARm2CYrLLgXH//xMUi566+T+sUSoT/iFxDyUpDdPzZZu30ig9Meh
 ctAJdnT5gv7MICdadHvKRwhEAuRB6v8FUAudGOKyImM8NuRLPVacn2EjrOjwmRppb03P
 oMKyuro1OVd9rVsV6J4HPrQ6Fm0lPXXDtkbzTx4Oat0AhaIMd18RjZvmXSae6U92LFhA
 eiSQ==
X-Gm-Message-State: AOAM530QP2Da/d8nduHTZwiBWE2dnYYzwo2oIp3DZORV1+f4vKSBHEIO
 f6qD+mTtLia/xaLzekt8U0vOU6TrAPVfI9JzuLSHyBaISV5hwe3jmyV4gAus7/5z3D0yTB8Mvcm
 CU6RV/dGMXfdqvUF7rF3agupyeJ93FvTeT3Zqm+WNTE+pIiGveGwgzgk96S63sZrS
X-Received: by 2002:a05:620a:c9b:: with SMTP id
 q27mr6665851qki.131.1627079764907; 
 Fri, 23 Jul 2021 15:36:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkdVHkY/f3E3L4gtYGOzJEiRSqXXDHM7VvBiOb3mnQQ5BuEtjaaVGEhrRcJtybK8sh+TgyZA==
X-Received: by 2002:a05:620a:c9b:: with SMTP id
 q27mr6665835qki.131.1627079764678; 
 Fri, 23 Jul 2021 15:36:04 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id x21sm15410769qkn.0.2021.07.23.15.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:36:04 -0700 (PDT)
Date: Fri, 23 Jul 2021 18:36:02 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/9] memory: Sanity checks memory transaction when
 releasing BQL
Message-ID: <YPtEUon+qEn3eX2W@t490s>
References: <20210723193444.133412-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723193444.133412-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 03:34:35PM -0400, Peter Xu wrote:
> This is v2 of the series.  It was actually got forgotten for months until it
> was used to identify another potential issue of bql usage here (besides it
> could still be helpful when debugging a previous kvm dirty ring issue in that
> series):
> 
> https://lore.kernel.org/qemu-devel/CH0PR02MB7898BBD73D0F3F7D5003BB178BE19@CH0PR02MB7898.namprd02.prod.outlook.com/
> 
> So I figured maybe it's still worth to have it, hence a repost.
> 
> There're some changes against v1:
> 
>   - patch "cpus: Introduce qemu_cond_timedwait_iothread()" is dropped because
>     it's introduced in another commit already (b0c3cf9407e64).
> 
>   - two more patches to move do_run_on_cpu() into softmmu/ to fix a linux-user
>     compliation issue.
> 
> Please review, thanks.
> 
> === Original Cover letter ===
> 
> This is a continuous work of previous discussion on memory transactions [1].
> It should be helpful to fail QEMU far earlier if there's misuse of BQL against
> the QEMU memory model.
> 
> One example is run_on_cpu() during memory commit.  That'll work previously, but
> it'll fail with very strange errors (like KVM ioctl failure due to memslot
> already existed, and it's not guaranteed to trigger constantly).  Now it'll
> directly fail when run_on_cpu() is called.
> 
> Please have a look, thanks.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03205.html

CC Phil too.

-- 
Peter Xu


