Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189C3C7FE8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 10:19:02 +0200 (CEST)
Received: from localhost ([::1]:40890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3a6f-0006F0-2s
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 04:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3a5s-0005a7-9q
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:18:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m3a5p-0001Vm-Em
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626250688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7eyrpShwCbYK9fm/36rNde8qVQCFOou9/k+mYtXB54E=;
 b=Tj1UiruP0VjI35i81MS+tjTslnKd567loeC7zHXAycKBJcArOf3kELXotxUGCdwZldcCNh
 IyDcndrNH8L0klKDNxNphppenH0kiaXoh5ChJd/OPA9/XKeqq9WZpK8jodKmSJIHIBnfrF
 9oodpQkok31H4REfavAX+wIlO1wn6S4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-I3gyzQwtNuaTKEIu5agU8w-1; Wed, 14 Jul 2021 04:18:03 -0400
X-MC-Unique: I3gyzQwtNuaTKEIu5agU8w-1
Received: by mail-wm1-f70.google.com with SMTP id
 k8-20020a05600c1c88b02901b7134fb829so207122wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 01:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7eyrpShwCbYK9fm/36rNde8qVQCFOou9/k+mYtXB54E=;
 b=i+PC81Uzgrzed+3iXS6jbH286W3+WZ15/DFRXZBQWHHSUDQpg9OhdqLDILJMVoSxwS
 GrEtxNbJ9tWxF4inNm/HQwcS6umwt/Izh8He/CoC/fkoYJOz+hj0xsxsExY/ngN30j2V
 BfO7T8yuDO6yHvq57wup7cqvhA0WgPYO8qXGtSsuQkOmubvSGrYs/tg/SrixppVDIzLl
 nVeOMBkFsOIE+Hm6Gms40pAopL6n3inbw0WJphmR1ZE0cflJxSNYHL/3Rwv63E2OyKCS
 S2SCDE6MukIFHRRLIJ4bEZT4vZ1kV0cBrXQ7Bt5K0+jgoWYBxSOcNaNDkhy++oai+wg0
 BPRw==
X-Gm-Message-State: AOAM530hXLyuEtb+i9PjRxMMEAoUXc587H3EQjvw0J+4LRyANMPncSlJ
 +1R8VX6gBVujdxsqPNq4rtqYUFcogJStIiM42XD2A/BkgJhYfbYA/RlteBultqSAkz6slmb0slB
 Irh5gaH32F2EqNYo=
X-Received: by 2002:a1c:4c18:: with SMTP id z24mr2724306wmf.168.1626250682652; 
 Wed, 14 Jul 2021 01:18:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaLgTEFuheag76eeK44quO35Ss/VPQrBxRlmOJfv1mBmmqLvs9piPgIYq/CrNn3dUtEjenjQ==
X-Received: by 2002:a1c:4c18:: with SMTP id z24mr2724288wmf.168.1626250682441; 
 Wed, 14 Jul 2021 01:18:02 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id o11sm4777836wmc.2.2021.07.14.01.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 01:18:01 -0700 (PDT)
Date: Wed, 14 Jul 2021 09:17:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: migration test, random hang, x86-64 host
Message-ID: <YO6dtzkNR32cLHkV@work-vm>
References: <CAFEAcA-9cLv8OJnMqRRaXBvCcPp7Qh-xjVjMWMvuKXsT8sZTTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-9cLv8OJnMqRRaXBvCcPp7Qh-xjVjMWMvuKXsT8sZTTA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> Random hang in 'make check' for x86-64 host, clang build,
> qemu-system-i386 target. I think I've seen this occasionally
> in the past.


Thanks; if you see it again, can you confirm it's the same subtest:

#3  0x0000557a3da1806a in test_multifd_tcp_cancel () at
../../tests/qtest/migration-test.c:1375

Juan: Looks like multifd ism - I wonder if we should wait for the
state change from the cancel?

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


