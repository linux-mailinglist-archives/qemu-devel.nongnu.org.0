Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E9C41996D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:43:43 +0200 (CEST)
Received: from localhost ([::1]:39292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtjC-0000bg-Iz
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtdY-0002TK-MN
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:37:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtdS-0007LT-AR
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632760661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kps2siuCQf0ZqaaJQscxoChq6W+2akrOqnBKYXH1bSQ=;
 b=E19mtHarJUASaFA5b4LW5XKnOO9+Gojf9aqXkm+9gDGDbz42CFsmBVTc6x0kmnr3Zf3Ldh
 U2WpgoUCY1POk05QTbc5n7unR1XCFdjC1hqm+HgAQW9fa+Fl5gwGlli+Ms5DWFwi1+sr3c
 YiZ8ngI85ArxVmWX/rZh9mLQCtS/Vco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-Y_hUC_MDNHqOL5b_rV2sbA-1; Mon, 27 Sep 2021 12:37:39 -0400
X-MC-Unique: Y_hUC_MDNHqOL5b_rV2sbA-1
Received: by mail-wm1-f70.google.com with SMTP id
 d12-20020a1c730c000000b0030b4e0ecf5dso144734wmb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kps2siuCQf0ZqaaJQscxoChq6W+2akrOqnBKYXH1bSQ=;
 b=c7zhOB0M64bCnjuJVT5eQnnQsl1YOoeu1VF985f5lsF57qtSf/Eh3Lo3BUveOYwoOb
 n/VeOTi17e9EMwbbgw1pvqiCT3ib64TrmLaJb4RreCN9g/k7cWIEcUkV25YeGCM+Qa5R
 GUTLqTxT54ER4FJ5Z1iAbGnM/+byalodB+vkxOV8JkLszjMUPQb8Tda2ToWH2+b/CqS5
 vudCTBhyofcRAqxMKcl3ExOMiB8xrXYrgGusd8TaRlSyHaW8bm7UsPUwxe/O1C/7FP+i
 LhPDrckp/mjtyg56BCYmwkkhY20KYVYGCrrp6ra7vyAUUhpVxzguFJMRGtegrQgqanrh
 Q06g==
X-Gm-Message-State: AOAM53358FXAp/1HjWc5AeDi6fZs/fJ5uqedTvnebR+bR5mf3qxJQ5oL
 uc2ozUoO+k4QLOvJp0JlXAnl1AvA/4eWwRTo6kG5hH3KQOpQL51SeZfjgZDLXOhxrhP/A04qE/N
 QZL7kN3M4BS2r3Oo=
X-Received: by 2002:a05:600c:4ca2:: with SMTP id
 g34mr844274wmp.193.1632760658569; 
 Mon, 27 Sep 2021 09:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9fOVSpQ5FHYPPLixwY4x40B67/M7pFctbEeUy9P8FKUG/kh1iPV+z+55F6qHf24BANz4C4Q==
X-Received: by 2002:a05:600c:4ca2:: with SMTP id
 g34mr844243wmp.193.1632760658364; 
 Mon, 27 Sep 2021 09:37:38 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id h1sm28608wmb.7.2021.09.27.09.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 09:37:37 -0700 (PDT)
Message-ID: <98dadfbf-589a-c088-dddb-bbbe33436f2c@redhat.com>
Date: Mon, 27 Sep 2021 18:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 0/5] More record/replay acceptance tests
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <162737551207.1735673.5022919664900932604.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <162737551207.1735673.5022919664900932604.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, wrampazz@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/21 10:45, Pavel Dovgalyuk wrote:
> The following series adds new record/replay tests to the acceptance group.
> 
> The provided tests perform kernel boot and disk image boot scenarios.
> For all of them recording and replaying phases are executed.
> Tests were borrowed from existing boot_linux*.py tests.
> 
> New tests include kernel boot for s390x, alpha, nios2, and openrisc,
> and Linux boot with cloudinit image for x86_64.
> 
> v3 changes:
>  - rebased
>  - removed duplicate ppc64 test
> v2 changes:
>  - moved ppc64 test to the right script
> 
> ---
> 
> Pavel Dovgaluk (1):
>       tests/acceptance: Linux boot test for record/replay
> 
> Pavel Dovgalyuk (4):
>       tests/acceptance: add replay kernel test for s390
>       tests/acceptance: add replay kernel test for openrisc
>       tests/acceptance: add replay kernel test for nios2
>       tests/acceptance: add replay kernel test for alpha

Thanks Pavel, I apologize for the delay, and have now applied
your series to my integration-testing tree.


