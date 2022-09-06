Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90AA5AF659
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 22:50:46 +0200 (CEST)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVfWv-0008FE-SI
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 16:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oVfSt-0005JN-PJ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:46:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oVfSm-0000zJ-M9
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662497186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cp1YDboguSmDCKb1tgmEN87xqbwvRY/3vhrYiiA5ITc=;
 b=ZuXnjR/ca/fz44fgGbeV+APA04koxXlw6wAb+QKTE/QqeyC2pAJ5P/JRl1vWjQ9TYiZOLM
 p9kpQX0wfU8ckVVdnovkK0vlsUHJrviGkhRg35YsyDAybftGHcM4iidCFlhbYKz3gTH2Qh
 Kb9wQlmE2UE6QrxusWkol4JlIn642sE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-A30hmo57PUSHlyLAoYGl_A-1; Tue, 06 Sep 2022 16:46:25 -0400
X-MC-Unique: A30hmo57PUSHlyLAoYGl_A-1
Received: by mail-qv1-f72.google.com with SMTP id
 y16-20020a0cec10000000b004a5df9e16c6so4527140qvo.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 13:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Cp1YDboguSmDCKb1tgmEN87xqbwvRY/3vhrYiiA5ITc=;
 b=q2IB5TiCkKgW9vfpPTR7DIjKBA2Eq9vaxiUb6ugoDDqYejFSKNNM9aJ/2RCMK4JcRY
 ATwPW7qlejcZ9vo5IFXodggOViFAOIi6yLrvHLU6w1DwIBBr60qXaU2MeLYjDTxXp8af
 cpAPlWZZcIOD+MUfvUMUY8fvi5qY5KIIhhaed83hwPSotI39KGQ8j/dJGUVv7UtOkg0o
 x6cn6yXfgR+TR22bLQs7u5ehWkUcF2kw5Qg3CYX54d6ZpgBK5tbQ9S5kWsbmdOrF0Hvn
 oCi+0YhojlBKfvRSpKshjwaBwha/KRn6NnZ81fOKljwWIvMgFre3/F+AyNKCwZrfokUn
 Kj1g==
X-Gm-Message-State: ACgBeo24bDzfXAqd01CuHCJ5TYodLBpxiAb+qrHi8P6FIsCpP1QcQfpV
 BkSQ8HcGcvSnfetP9Oj149fbw+cYfjNsRQlVFdKj/L20bTG5VXzVvRZyOoUlu37sGX3hPPS+F3d
 57Qe3LlLL+TQBswY=
X-Received: by 2002:a05:620a:a98:b0:6bb:b6d7:da35 with SMTP id
 v24-20020a05620a0a9800b006bbb6d7da35mr346454qkg.769.1662497184631; 
 Tue, 06 Sep 2022 13:46:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6kbYTffLzyN6409iO1DKJgu4XSFIS6Vu2xeoniK48JnR9tIosQWM7e3OtdUtInX0dkO2u9Pg==
X-Received: by 2002:a05:620a:a98:b0:6bb:b6d7:da35 with SMTP id
 v24-20020a05620a0a9800b006bbb6d7da35mr346433qkg.769.1662497184370; 
 Tue, 06 Sep 2022 13:46:24 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 g19-20020ac84813000000b003051ea4e7f6sm10133105qtq.48.2022.09.06.13.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 13:46:23 -0700 (PDT)
Date: Tue, 6 Sep 2022 16:46:20 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 0/8] migration: introduce dirtylimit capability
Message-ID: <YxexnENbRsHlcMgt@xz-m1.local>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1662052189.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Fri, Sep 02, 2022 at 01:22:28AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v1:
> - make parameter vcpu-dirty-limit experimental 
> - switch dirty limit off when cancel migrate
> - add cancel logic in migration test 
> 
> Please review, thanks,
> 
> Yong 
> 
> Abstract
> ========
> 
> This series added a new migration capability called "dirtylimit".  It can
> be enabled when dirty ring is enabled, and it'll improve the vCPU performance
> during the process of migration. It is based on the previous patchset:
> https://lore.kernel.org/qemu-devel/cover.1656177590.git.huangy81@chinatelecom.cn/
> 
> As mentioned in patchset "support dirty restraint on vCPU", dirtylimit way of
> migration can make the read-process not be penalized. This series wires up the
> vcpu dirty limit and wrappers as dirtylimit capability of migration. I introduce
> two parameters vcpu-dirtylimit-period and vcpu-dirtylimit to implement the setup 
> of dirtylimit during live migration.
> 
> To validate the implementation, i tested a 32 vCPU vm live migration with such 
> model:
> Only dirty vcpu0, vcpu1 with heavy memory workoad and leave the rest vcpus
> untouched, running unixbench on the vpcu8-vcpu15 by setup the cpu affinity as
> the following command:
> taskset -c 8-15 ./Run -i 2 -c 8 {unixbench test item}
> 
> The following are results:
> 
> host cpu: Intel(R) Xeon(R) Platinum 8378A
> host interface speed: 1000Mb/s
>   |---------------------+--------+------------+---------------|
>   | UnixBench test item | Normal | Dirtylimit | Auto-converge |
>   |---------------------+--------+------------+---------------|
>   | dhry2reg            | 32800  | 32786      | 25292         |
>   | whetstone-double    | 10326  | 10315      | 9847          |
>   | pipe                | 15442  | 15271      | 14506         |
>   | context1            | 7260   | 6235       | 4514          |
>   | spawn               | 3663   | 3317       | 3249          |
>   | syscall             | 4669   | 4667       | 3841          |
>   |---------------------+--------+------------+---------------|
> From the data above we can draw a conclusion that vcpus that do not dirty memory
> in vm are almost unaffected during the dirtylimit migration, but the auto converge
> way does. 
> 
> I also tested the total time of dirtylimit migration with variable dirty memory
> size in vm.
> 
> senario 1:
> host cpu: Intel(R) Xeon(R) Platinum 8378A
> host interface speed: 1000Mb/s
>   |-----------------------+----------------+-------------------|
>   | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>   |-----------------------+----------------+-------------------|
>   | 60                    | 2014           | 2131              |
>   | 70                    | 5381           | 12590             |
>   | 90                    | 6037           | 33545             |
>   | 110                   | 7660           | [*]               |
>   |-----------------------+----------------+-------------------|
>   [*]: This case means migration is not convergent. 
> 
> senario 2:
> host cpu: Intel(R) Xeon(R) CPU E5-2650
> host interface speed: 10000Mb/s
>   |-----------------------+----------------+-------------------|
>   | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>   |-----------------------+----------------+-------------------|
>   | 1600                  | 15842          | 27548             |
>   | 2000                  | 19026          | 38447             |
>   | 2400                  | 19897          | 46381             |
>   | 2800                  | 22338          | 57149             |
>   |-----------------------+----------------+-------------------|
> Above data shows that dirtylimit way of migration can also reduce the total
> time of migration and it achieves convergence more easily in some case.
> 
> In addition to implement dirtylimit capability itself, this series
> add 3 tests for migration, aiming at playing around for developer simply: 
>  1. qtest for dirty limit migration
>  2. support dirty ring way of migration for guestperf tool
>  3. support dirty limit migration for guestperf tool

Yong,

I should have asked even earlier - just curious whether you have started
using this in production systems?  It's definitely not required for any
patchset to be merged, but it'll be very useful (and supportive)
information to have if there's proper testing beds applied already.

Thanks,

-- 
Peter Xu


