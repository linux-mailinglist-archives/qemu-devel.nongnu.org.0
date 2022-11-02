Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3DF615CB7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 08:08:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq7qg-0003Ac-Ud; Wed, 02 Nov 2022 03:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oq7qe-00039a-SZ
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oq7qc-0000mL-7h
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 03:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667372856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2XOLrO9OrZbAn4rs7xETqQg6c5A+D6X/zyaAfxQ/sqM=;
 b=Art2FfdCnnLQIBej3YrT7NJPmW32CvPQZ2Cdi3Y1SxBW7Mup15NxQY0/rh7dVIdXnbUnSy
 yHDWG/BU31yBw63IOiTPZ72TCEwuAHO8P1pCg4kUTq7Ce2mp+DFM08SW54B2l2u8e0QBOt
 pIVgYPxx2C8GlABxiBsQDzXKy9uIm6E=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-675-80afkzdTPxm_f3bBlzQTeQ-1; Wed, 02 Nov 2022 03:07:35 -0400
X-MC-Unique: 80afkzdTPxm_f3bBlzQTeQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 cp8-20020a05622a420800b003a4f4f7b621so11533672qtb.6
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 00:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2XOLrO9OrZbAn4rs7xETqQg6c5A+D6X/zyaAfxQ/sqM=;
 b=ljh+DekJm9UL7C5EjkcQ4lRzUZXCTQxcbkD9qTVALjcrx2Ehrk4U0DWH8rcb20P2SC
 qt1/JQNfYNnqkt/lTVoMbPyRxKbNPUCea74PMOwI4b9cbwGDAzX5PhOgLbfjieJ2iUka
 W5vq9q1dL1YdeGisjWz2NQTvcFcB0bXclQJEYIosav8ZS16afsTRNHopI9lbsnPG7Mwf
 4A0lDyDXkygCKzMDSbu2L4tPr/x+s6st51n7Vlm39r/P4cZKqCC1BQldsWJhBq6lw+S3
 4iiykDACvx1vc/jfwRhPorId3rjEjkZ2klXpCtQG/wjWWdESXU9mSOU1rYS9PLuFWoBK
 sbFg==
X-Gm-Message-State: ACrzQf1jJIEPQsUUbqd+rpcta4tLfycMsK3LFRcAMAb7Kcrh198nn7iv
 Sp0MEUmqvBNdJm1GfH5eRl87KysGr3GzyGDQlja2w9aRh699A6t8Lr0a7hhtOCxl+9thLOqrJ5M
 mhz3L7Zk3R5rmMIc=
X-Received: by 2002:a05:620a:440d:b0:6f6:18f4:2eb2 with SMTP id
 v13-20020a05620a440d00b006f618f42eb2mr16740478qkp.580.1667372855310; 
 Wed, 02 Nov 2022 00:07:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6uwRKLqceb+DQc468qroW6G7NkBe2SKrig2oG3ttOpXJjEbZniXs2I3uzOeqxsYSBxS90kuQ==
X-Received: by 2002:a05:620a:440d:b0:6f6:18f4:2eb2 with SMTP id
 v13-20020a05620a440d00b006f618f42eb2mr16740461qkp.580.1667372855125; 
 Wed, 02 Nov 2022 00:07:35 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-201.web.vodafone.de.
 [109.43.177.201]) by smtp.gmail.com with ESMTPSA id
 v18-20020a05620a441200b006bb82221013sm5246902qkp.0.2022.11.02.00.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 00:07:34 -0700 (PDT)
Message-ID: <f69b9599-cc3f-969d-96b8-e2a239b7593b@redhat.com>
Date: Wed, 2 Nov 2022 08:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 5/5] MAINTAINERS: Inherit from nanoMIPS
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Petar Jovanovic <mips32r2@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221101114458.25756-1-philmd@linaro.org>
 <20221101114458.25756-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221101114458.25756-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/11/2022 12.44, Philippe Mathieu-Daudé wrote:
> 6 months ago Stefan Pejic stepped in as nanoMIPS maintainer
> (see commit a 8e0e23445a "target/mips: Undeprecate nanoMIPS
> ISA support in QEMU"), however today his email is bouncing:
> 
>    ** Message blocked **
> 
>    Your message to stefan.pejic@syrmia.com has been blocked. See technical details below for more information.
> 
>    The response from the remote server was:
>    550 5.4.1 Recipient address rejected: Access denied. AS(201806281) [DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com]

I saw the same bounce message when I CC:-ed him recently, thus:

Tested-by: Thomas Huth <thuth@redhat.com>


