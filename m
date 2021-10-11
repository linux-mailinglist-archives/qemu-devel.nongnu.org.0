Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97955428865
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 10:12:42 +0200 (CEST)
Received: from localhost ([::1]:55082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZqQJ-0003NH-0N
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 04:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZqOW-0002QI-Lg
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 04:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mZqOQ-00072u-DU
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 04:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633939840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIrJiVtO0/GExLFQ12cnmQf4WH6fvtGWL9ypMqAKhfs=;
 b=h8GEvtglpJVHZc7cnkVqv5KOIiKAuxass6r49BwFRLd8BaaU8cmVFCe3BiBlMbX7Zx4JGP
 ZmkM6VGAx0BO+kCFkvloy/G5Q08VgXkTSeZzumJYzdOoZVik2j7vDRhl96D1grvcopPzsz
 h0/xZk5oSf9BWChJsbuy0Ya2WrncfpA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-NMuOwuijNX-ftmDFwcIapg-1; Mon, 11 Oct 2021 04:10:39 -0400
X-MC-Unique: NMuOwuijNX-ftmDFwcIapg-1
Received: by mail-wr1-f71.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so12601490wrg.10
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 01:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RIrJiVtO0/GExLFQ12cnmQf4WH6fvtGWL9ypMqAKhfs=;
 b=2oCLRrHy4xJjlIsrOHQuUOVCqz+m98o92RJB4RK4nFTTnSZFEanCZ6ebxPjAToXCrE
 /a4MZs0vtyMkGNHK8JfQTiWE8EYde92N9gmWh/OOfwaum+g7A9IEMavBjl5lWVwlBk9R
 Y76rLCCIzGabpKGKu0duQ9KkZ8zT0SuJKvS5fQxLDyH156KrFN9udQaqxfwAYElDHtny
 WRLbgVTtDOMNyHjiyxtgJTwdd+F81IhUMG41TDZakJGBswdLT1XVp6Bi1Nu7GL1OcetW
 hsklLDPhR1qwZ2RdZrJU3SQxNa3Man3N7OitrUWwy0TRI9N5TWBO1mheKqOjSpAWuKSS
 tnjg==
X-Gm-Message-State: AOAM532mxAbc/W2LhQFsLPfodMHAnNIUUKNBynLijm39Hws+pgh3RJJH
 WWTNrRaetPC+KUuWGeEydyDm6ReKFfWM7ZeCsbshkh8uTeeMV3X7sZEPXgTa4LgtaFoqkTbu8Wn
 kmhy/YpWrUTRATzg=
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr18768585wmc.165.1633939838425; 
 Mon, 11 Oct 2021 01:10:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0p8v2oV5PV6TbACerjeiH6mVK2VBV0Z4Ndqo5mKypU9uKoGtqzyE6N3MwzwVPOU2vn99zFQ==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr18768547wmc.165.1633939838051; 
 Mon, 11 Oct 2021 01:10:38 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d24sm6842606wmb.35.2021.10.11.01.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 01:10:37 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU?
From: Thomas Huth <thuth@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
Message-ID: <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com>
Date: Mon, 11 Oct 2021 10:10:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/10/2021 09.25, Thomas Huth wrote:
> On 05/10/2021 23.53, BALATON Zoltan wrote:
> [...]
>> Maybe these 405 boards in QEMU ran with modified firmware where the memory 
>> detection was patched out but it seems to detect the RAM so I wonder where 
>> it gets that from. Maybe by reading the SDRAM controller DCRs 
>> ppc4xx_sdram_init() sets up. Then I'm not sure what it needs the SPD for, 
>> I forgot how this worked on sam460ex. Maybe for the speed calibration, so 
>> could be it detects ram by reading DCRs then tries to get SPD data and 
>> that's where it stops as i2c is not emulated on taihu. This could be 
>> confirmed by checking what it pokes with -d guest_errors that shows 
>> accesses to missing devices but don't know where 405 has the i2c 
>> controller and if it's the same as newer SoCs. If so that could be reused 
>> and an i2c bus could be added with the SPD data like in sam460ex to make 
>> u-boot happy or you could skip this in u-boot.
> 
> FWIW, I've just tried the latter (skipping the sdram init in u-boot), and 
> indeed, I can get to the u-boot prompt now.
[...]> I've also attached the patch with my modifications to u-boot.

FYI, the changes can now be found on this branch here:

  https://gitlab.com/huth/u-boot/-/commits/taihu

I also added a gitlab-CI file, so you can now download the u-boot.bin as an 
artifact from the corresponding pipeline, e.g.:

  https://gitlab.com/huth/u-boot/-/jobs/1667201028

  Thomas


