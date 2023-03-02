Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF66A7C06
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 08:49:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXdfd-0003Nr-Je; Thu, 02 Mar 2023 02:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXdfE-0003Jm-Uf
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 02:47:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXdfD-0007ez-Iw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 02:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677743262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hY9kfBFX+szOPrTnPxsOyMLjV32vPXnZakCCmyo9/jQ=;
 b=J2EnH4OwgygFdtF3m/WLXXmTykSS1OLnbuJT332z7CRABFbxccizOfEUkDSOR+SfJDrYuj
 zx61uUq7bYdyynxxqC82AHJHWg5sIQ1RVkQ1ZWi1q9Ca9fiKG0kcGcd3h6vP8oX4pJe4IY
 qP7/dRShb1QeDaDZZZuFCHVPV213XgQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-qjlX5NaEPLSwZFfeK2u0-Q-1; Thu, 02 Mar 2023 02:47:41 -0500
X-MC-Unique: qjlX5NaEPLSwZFfeK2u0-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so886240wml.2
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 23:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hY9kfBFX+szOPrTnPxsOyMLjV32vPXnZakCCmyo9/jQ=;
 b=Rgw3eMHan7+rQaoQBQkBwsboBAlmkSdCrWec839grEILNQcHeF0OJ1WKlhdn3X0RFr
 g3FPYDB7aPRcJAF43h1Er76vwzjim+sG+xTSxX84Hebz4/H6M9hYbs+EqoGKGfIp4CCN
 t9V+RizMi49P1xAbMgVv0eeBJJH8n8qB9FgJFJg8ftuUOuKtUaxDfSnFdBFP8kde9Pbz
 tRdIkxLPPSdJp3MgdS25Nr7wLZdnv1q+c3hYa0fQ3NXOLvSJ5rTmjbcnUtGHEwKQ9ZFl
 AATnACcFS8iKTSjxV6Z03a+hBWq71obFW7pZET7AcK/jOOxaGg790oFFVNwA4Ajr5PMj
 EYUA==
X-Gm-Message-State: AO0yUKWZPOcb531GDV7MgvtIeU/1KrI2I7jSRVb7bMGta6KNWesPe8ZS
 Nn1lXJpZNspHT9YpxZLFd61r3i9nARB+bxxjOKxzgBd/oicmAywRa2udcVZRbvLm1Jb1paKn5qB
 vu3ccP/aKiMUAF9jXTbKXlDCNxO8MPHuiYYQMeGF6l6A5DmFTIi6F67OWflBxamEG+scL86I=
X-Received: by 2002:a05:600c:3506:b0:3ea:e5fc:a5a4 with SMTP id
 h6-20020a05600c350600b003eae5fca5a4mr7329013wmq.1.1677743260719; 
 Wed, 01 Mar 2023 23:47:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9qUNrzWvIohgcrV8WZSWUlMV0GuW+sxU45kucldl0xd7AJGQCTGhjefV8TZDM37GFlXdfHAw==
X-Received: by 2002:a05:600c:3506:b0:3ea:e5fc:a5a4 with SMTP id
 h6-20020a05600c350600b003eae5fca5a4mr7328996wmq.1.1677743260406; 
 Wed, 01 Mar 2023 23:47:40 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-83.web.vodafone.de.
 [109.43.179.83]) by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcde8000000b003dc521f336esm2032991wmj.14.2023.03.01.23.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 23:47:39 -0800 (PST)
Message-ID: <928a8552-ab62-9e6c-a492-d6453e338b9d@redhat.com>
Date: Thu, 2 Mar 2023 08:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Bug in master branch:
 IbmPrep40pMachine.test_factory_firmware_and_netbsd broken
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


  Hi all,

seems like we've got another bug that sneaked in during the CI minutes 
blackout: The avocado test 
IbmPrep40pMachine.test_factory_firmware_and_netbsd is now broken reliably, see:

  https://gitlab.com/qemu-project/qemu/-/jobs/3858833617#L300
  https://gitlab.com/thuth/qemu/-/jobs/3858727901#L300
  https://gitlab.com/thuth/qemu/-/jobs/3857804517#L300

Is anybody already looking into this?

  Thomas


