Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547575A10D9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 14:43:27 +0200 (CEST)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRCCk-0002B1-Dm
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 08:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRC9M-0005wK-20
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:39:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRC9K-0000Je-55
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 08:39:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661431193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MbvZznwL3VUTfHiFdrGnFu4jS9f3M37sdarK/SDOwsg=;
 b=SuErzmvFrVVUaBB4ebBNua3X7UIz7ubl7/MjxYDKO2bTAjC/YMfe8hC+EdWGJd6yq1i/fj
 XRc0FHiH360bE0ckA2of8Azc/JLZSB133+dVmnpvegn3t+EVc6uM6N1bNA1ek6EScbnPIi
 S9Y67kWpyz8UcxYWENT308YglE97RfQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-vlKqZfsbM9a7z3zMSiIShA-1; Thu, 25 Aug 2022 08:39:51 -0400
X-MC-Unique: vlKqZfsbM9a7z3zMSiIShA-1
Received: by mail-wr1-f69.google.com with SMTP id
 s20-20020adfbc14000000b002252dae05f7so3382219wrg.20
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 05:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=MbvZznwL3VUTfHiFdrGnFu4jS9f3M37sdarK/SDOwsg=;
 b=J+oDBOoeJszAvYKnRDr/aWizEK8eEaLcjWYXjYmX/RrAbLOBmAPmVs87K7vftzB7ID
 tbWJtuKMjWWSChJx/Nb382VqwLWRY6W80cBQqcjp9GW6UtCd7Z5rXjYqXRIocPL/rcFF
 0PxIQKGj2E2FhTiGujQUyMHMn3op6BdNoM/y02ljtBRmXUywpXf7cipsIexz9ZOVS/B8
 RnEIqTB/7c1rRsTXOKfrzs7fsGB1H5rSntf/xW4aXkx4aHsOF2WvJaEwwiWrQFb8xVRR
 ri5ZwufRpcE6rEdJrLRfEVmXu4JF7lHDHWdOybXqeDx2Y5QylIQQVOTl1SeY9bdt4Oxh
 vjAg==
X-Gm-Message-State: ACgBeo0PwdMzXDNei5F4aqiTT7cW+rzXYY0SqjcALfb45yWWYvOatSM3
 3WFZwodEKcGvjSEvBe7xbqUTmNI9NS3npPuTo6aAAEIBzvHKw/EI+QdfnyV/bCDCaADeH6Doe5V
 JhIIGEsYrFH2CUNo=
X-Received: by 2002:a1c:4c11:0:b0:3a5:4d01:54be with SMTP id
 z17-20020a1c4c11000000b003a54d0154bemr8436087wmf.32.1661431190864; 
 Thu, 25 Aug 2022 05:39:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4az0nYy4ZK2j0lUsO10LW0GD11ByWlVN/am4iCwoRUZgy7j/24VriQ9dA8UieSVU1nNE+Eig==
X-Received: by 2002:a1c:4c11:0:b0:3a5:4d01:54be with SMTP id
 z17-20020a1c4c11000000b003a54d0154bemr8436078wmf.32.1661431190650; 
 Thu, 25 Aug 2022 05:39:50 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b003a4f1385f0asm6024821wmq.24.2022.08.25.05.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:39:50 -0700 (PDT)
Message-ID: <af6b390d-ef14-bec1-0bbf-04a7111741a2@redhat.com>
Date: Thu, 25 Aug 2022 14:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 18/51] tests/qtest: Build cases that use
 memory-backend-file for posix only
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-19-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-19-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> As backends/meson.build tells us, hostmem-file.c is only supported on
> POSIX platforms, hence any test case that utilizes the memory backend
> file should be guarded by CONFIG_POSIX too.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/bios-tables-test.c | 10 ++++++++++
>   tests/qtest/cxl-test.c         |  4 ++++
>   tests/qtest/meson.build        |  3 ++-
>   3 files changed, 16 insertions(+), 1 deletion(-)

Acked-by: Thomas Huth <thuth@redhat.com>


