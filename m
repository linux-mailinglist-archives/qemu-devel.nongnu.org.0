Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 204146D1DDB
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 12:21:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piBsN-0001D0-IZ; Fri, 31 Mar 2023 06:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1piBsK-0001CU-IX
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1piBsJ-0007VR-5p
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 06:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680258050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYUlUoQlfLZxNSf1SRZO8JrPe/O+c5Lngo8k2Veo+oY=;
 b=BvWlYNfdPmiru/TjMTHsVhaTyIuZfld/8S0fiB3AyiPErcaxS5J89gd8u9LY0Bh1FdUhoR
 uZVK1pwGcFsXh09W/vJYkgZpRpRaRlweXONSoYv3aaoKzfjQcnVM38a3KWP41rpHnoMgPe
 xxmDEQ8+qwF5g4lo8n2hWeR00o6dD8E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-gT0nbYTiPRGtgl6jonx7Tw-1; Fri, 31 Mar 2023 06:20:48 -0400
X-MC-Unique: gT0nbYTiPRGtgl6jonx7Tw-1
Received: by mail-wm1-f71.google.com with SMTP id
 d11-20020a05600c34cb00b003ee89ce8cc3so10858017wmq.7
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 03:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680258047;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HYUlUoQlfLZxNSf1SRZO8JrPe/O+c5Lngo8k2Veo+oY=;
 b=pdobD/r4Kde1flzUT/TRfkjMJ/jcUyatD8yyAZG3m+Y/85DdJd9KtKHzuG+oke08Tr
 RvByFrQkrcKO+oqPMpDL7oMQq0pQRCpv1vrq3t3w9Evj90KVYldGICEIgdHlc/PZ2YWP
 p5nW4LEplmD8fQQKunL6US+vDDMlalBLAo/PorQICIXsqE0kW8Jsdn5CkV1U/f9bq1AF
 bqzg89hoHHsU7qJB19kPg6+zbPhmOdidCh0YWUrFbCHOFmVLHT6TqwT4Mu+VAmmzSR0V
 P5Tc2Q/zfCi8YpItEH9gJKE3DFQQYBuTNp+WSpW5PkOnVoTuHRGqftHIKYgI5SLFg5fj
 RavQ==
X-Gm-Message-State: AAQBX9cHy2W5UHyveM/tcWadUjR6LdQRoG+An88RKtmWQBrav9sPQXkK
 Uq2N4pOEzHqsWQV+6p3+xqP3i4Iwy5EQihgbYnN3ewnrlJV6hLGIvzMSxOfv1dB0G6pZE+A9kNe
 gL140YSywkqDYKxbVLaGsQkizhQ==
X-Received: by 2002:a5d:46c9:0:b0:2c7:e5f:e0e0 with SMTP id
 g9-20020a5d46c9000000b002c70e5fe0e0mr21625746wrs.65.1680258047181; 
 Fri, 31 Mar 2023 03:20:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350bosl8GN2gOuO28hcSz6NU1dlxFsVdLvOIxPsu+beKc1mqpx7itoalta7sLHIjCBBw9gr67XQ==
X-Received: by 2002:a5d:46c9:0:b0:2c7:e5f:e0e0 with SMTP id
 g9-20020a5d46c9000000b002c70e5fe0e0mr21625730wrs.65.1680258046896; 
 Fri, 31 Mar 2023 03:20:46 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-12.web.vodafone.de.
 [109.43.177.12]) by smtp.gmail.com with ESMTPSA id
 m3-20020a056000180300b002e5f3d81c06sm1288644wrh.89.2023.03.31.03.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 03:20:46 -0700 (PDT)
Message-ID: <fcbd60cc-81af-9854-60ab-ce30c170e831@redhat.com>
Date: Fri, 31 Mar 2023 12:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/3] qtest: Add functions for accessing devices on
 Aspeed I2C controller
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, clg@kaod.org, ninad@linux.ibm.com,
 joel@jms.id.au, andrew@aj.id.au
References: <20230328171958.3677734-1-stefanb@linux.ibm.com>
 <20230328171958.3677734-2-stefanb@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230328171958.3677734-2-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/03/2023 19.19, Stefan Berger wrote:
> Add read and write functions for accessing registers of I2C devices
> connected to the Aspeed I2C controller.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>   include/hw/i2c/aspeed_i2c.h |   7 +++
>   tests/qtest/qtest_aspeed.c  | 117 ++++++++++++++++++++++++++++++++++++
>   tests/qtest/qtest_aspeed.h  |  41 +++++++++++++
>   3 files changed, 165 insertions(+)
>   create mode 100644 tests/qtest/qtest_aspeed.c
>   create mode 100644 tests/qtest/qtest_aspeed.h

Acked-by: Thomas Huth <thuth@redhat.com>


