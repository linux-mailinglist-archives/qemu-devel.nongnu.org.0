Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16CF419C5F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:26:58 +0200 (CEST)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuP3-0004yo-Ne
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUuGj-0002D4-TD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUuGg-0006sh-AM
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:18:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632763095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zm1pnFJEoqdx4LpDCuNPiBBniJ2Em8a/NWJQbvnWC9g=;
 b=YViGFz+hWA3enLqvUB8O6F5pGe39eoz4SpnEGWZETa9EP7eqIVGtVbQgsIFz2s7oyBoS6f
 4MFbV3OtF227LrI+G1CqRtYw288azeP/5BWVgwo0wpKCv32YXmWu/8HP3Pqzpr66Gc7ObQ
 nTo8hpV4HvIf7vrou+OAugsCSlDl4Zo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-v2TyafSrPQ-flLvDZvouhg-1; Mon, 27 Sep 2021 13:18:13 -0400
X-MC-Unique: v2TyafSrPQ-flLvDZvouhg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r5-20020adfb1c5000000b0015cddb7216fso14363787wra.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zm1pnFJEoqdx4LpDCuNPiBBniJ2Em8a/NWJQbvnWC9g=;
 b=mId5e5i0cAaUzv5cbE2lwFzbZ53QDCr9hKuZjpIjfcrg0nfUGfssENmGZ3w0m2BEdq
 YgqGg75wMM/ZgAWsnukOOsLEX0NYfVMgS//xjopXdIuUa2HnGnGA61CyTMAFimDneqnC
 1syvYbuQABYh2dDVeggamQkJgo28gPHxu9vf4g85N6mriivlwEyfUPLfy7QZrnRC04m4
 XWYqZbLN/pc8xTtBN0hr9OVl34Rjy+ZSrARo0t79ltmoc1adTlZHsBsEJ3n7y3gWyy/A
 4UMQq1yIfZRdrHyT7Wy8X8lEtcOKW1K9GS9aCWRD1swI+Qra4sKkLgXoJWJVtAgruyzk
 Jz6g==
X-Gm-Message-State: AOAM533D1V3M14n2VYQvPr5ZdobKAjjJVHfZ4zoz3817LeUdebMRX7Wv
 ZmlRP3BWAXRQYY09lpdzWaONRr0rKC2WrHk3PIiFnofpXdl21LdclPmM+3oRWQBWBByUj1Y9Zog
 7+PeVRjmtIfMwuTk=
X-Received: by 2002:a1c:4407:: with SMTP id r7mr241241wma.8.1632763092131;
 Mon, 27 Sep 2021 10:18:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB/lfm9HZD9RyDWo2YDEh0+tAdNrh086IaXeYJshoLoBRfqTQMBy1p20yddKP1feOtY1XOsg==
X-Received: by 2002:a1c:4407:: with SMTP id r7mr241201wma.8.1632763091862;
 Mon, 27 Sep 2021 10:18:11 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id u1sm97054wmc.29.2021.09.27.10.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 10:18:11 -0700 (PDT)
Message-ID: <df818ad8-76d3-1648-3406-e66d3dcdbfb4@redhat.com>
Date: Mon, 27 Sep 2021 19:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 1/7] qemu: Split machine_ppc.py acceptance tests
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-2-david@gibson.dropbear.id.au>
 <c4ba52a1-46f9-0e74-92b3-c57e617f6f08@redhat.com>
 <d3050737-d5bf-bfc3-8e3b-fa2e62ee4407@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <d3050737-d5bf-bfc3-8e3b-fa2e62ee4407@kaod.org>
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
 hpoussin@reactos.org, crosa@redhat.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 18:53, Cédric Le Goater wrote:
> On 9/27/21 18:44, Philippe Mathieu-Daudé wrote:
>> Hi David,
>>
>> On 9/27/21 06:48, David Gibson wrote:
>>> machine_ppc.py contains tests for 3 different ppc based machine
>>> types.  It
>>> is listed in MAINTAINERS along with the PPC TCG cpu code.  That's not
>>> really accurate though, since it's really more about testing those
>>> machines
>>> than the CPUs.
>>>
>>> Therefore, split it up into separate files for the separate machine
>>> types,
>>> and list those along with their machine types in MAINTAINERS.
>>>
>>> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>> ---
>>>   MAINTAINERS                          |  4 +-
>>>   tests/acceptance/machine_ppc.py      | 69 ----------------------------
>>>   tests/acceptance/ppc_mpc8544ds.py    | 32 +++++++++++++
>>>   tests/acceptance/ppc_pseries.py      | 35 ++++++++++++++
>>>   tests/acceptance/ppc_virtex_ml507.py | 34 ++++++++++++++
>>>   5 files changed, 104 insertions(+), 70 deletions(-)
>>>   delete mode 100644 tests/acceptance/machine_ppc.py
>>>   create mode 100644 tests/acceptance/ppc_mpc8544ds.py
>>>   create mode 100644 tests/acceptance/ppc_pseries.py
>>>   create mode 100644 tests/acceptance/ppc_virtex_ml507.py
>>
>> Since I'm preparing an integration-testing pull request,
>> I'll queue this single patch directly, to avoid future
>> merge conflicts.
>>
> 
> Should I resend this patch ?
> 
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210817093036.1288791-1-clg@kaod.org/

Doh, I scanned the list for patches unattended during the last 8 months
but apparently missed it. No need to resend.


