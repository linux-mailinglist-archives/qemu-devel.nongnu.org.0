Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F49C4199B4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:53:15 +0200 (CEST)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtsQ-00037n-KD
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtk0-0004q0-KS
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUtjy-0004S8-CB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632761069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POTM4n/1UmuBLziHF3tUXVo8I4AyVdg/u06Xn27+Xno=;
 b=IV/o6B6zvqS9g3RPQsOfARkMzxNa2iyQbKq11wD54WCpVhPv07DfCaoZ8Z2lIK2/Jewc0d
 EvSisSCXzLtAO9UfuqZxJWKqkRRoKmxGwzvqgxwKjtQDSoXgYbhEqzKAOBNv/G9YaDscFX
 if3m0Yxkm0EQCX5nDyPBDWuNDp+Vsm4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-CXPNNN2FMlGKcnkaHQ9dKQ-1; Mon, 27 Sep 2021 12:44:28 -0400
X-MC-Unique: CXPNNN2FMlGKcnkaHQ9dKQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 70-20020a1c0149000000b0030b7dd84d81so484310wmb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 09:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=POTM4n/1UmuBLziHF3tUXVo8I4AyVdg/u06Xn27+Xno=;
 b=XD6KoHG+081cBf7blE48W6asiOQSr1vQNEmgBPf1PMIuLiMiw01dopEttwnByNijqV
 oNN5ir/pHFLza3pqxe+DrPA0DzMWEI1y320h/vj4nfCiUppqeqNVxRWYzVIX1AMk/jcU
 BlqN0fPnHQCyTDjs9/R7O+ZIgGeye1n8TeJdmZPy16LYFzwxsncbWmBXjnGO/2rP5Vqp
 W4dXso4AoxDccqQIG3JwqeZ+TY29/3Ael244mGxow8LCvRqRprCfdtBuLMZ8595UI/SQ
 5WyHrkp6L5dROp8e38XR078k2UwWWwKorAeLMuiHl+gSRJdGkpVDlIN2CTmkP2aRjNsi
 xxMg==
X-Gm-Message-State: AOAM5312z0M8vp1dZsX/3JgP9BX+PAxLvZ0EE617uQO9wqWsajR6aHCf
 Nc/XPH7d8XQy3LNRqbH+bzC5apcvBYNP0qcwD4dX+b5i0RwcUeSeZxwQCwlPZxS22SLDdJWB2KK
 clcapIUpHhZv7crM=
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr970738wri.131.1632761066908; 
 Mon, 27 Sep 2021 09:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0A82DklmzyH33g906L5yz9MzUkUagmgSfj4Zv9BmhZHivNAU1x4UsV9Ij0THveNU7ge+A+A==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr970719wri.131.1632761066789; 
 Mon, 27 Sep 2021 09:44:26 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s13sm7798wmc.47.2021.09.27.09.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 09:44:26 -0700 (PDT)
Message-ID: <c4ba52a1-46f9-0e74-92b3-c57e617f6f08@redhat.com>
Date: Mon, 27 Sep 2021 18:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/7] qemu: Split machine_ppc.py acceptance tests
To: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-2-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210927044808.73391-2-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: peter.maydell@linaro.org, dbarboza@redhat.com, aik@ozlabs.ru,
 mark.cave-ayland@ilande.co.uk, groug@kaod.org, wainersm@redhat.com,
 hpoussin@reactos.org, clg@kaod.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 9/27/21 06:48, David Gibson wrote:
> machine_ppc.py contains tests for 3 different ppc based machine types.  It
> is listed in MAINTAINERS along with the PPC TCG cpu code.  That's not
> really accurate though, since it's really more about testing those machines
> than the CPUs.
> 
> Therefore, split it up into separate files for the separate machine types,
> and list those along with their machine types in MAINTAINERS.
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  MAINTAINERS                          |  4 +-
>  tests/acceptance/machine_ppc.py      | 69 ----------------------------
>  tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
>  tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
>  tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
>  5 files changed, 104 insertions(+), 70 deletions(-)
>  delete mode 100644 tests/acceptance/machine_ppc.py
>  create mode 100644 tests/acceptance/ppc_mpc8544ds.py
>  create mode 100644 tests/acceptance/ppc_pseries.py
>  create mode 100644 tests/acceptance/ppc_virtex_ml507.py

Since I'm preparing an integration-testing pull request,
I'll queue this single patch directly, to avoid future
merge conflicts.


