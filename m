Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9FB671D2D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 14:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI8CN-0005Dw-GI; Wed, 18 Jan 2023 08:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI8C8-0005BE-Bv
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 08:09:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI8C6-0004Zn-Ko
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 08:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674047373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WILQ+DVk1t2ZFpD36BbQV4/QLtmlkx7mnlHic1o1Vac=;
 b=huvpIs/lmuf2MPfNmRh3tsVpeb59SQaPT4WLlGhaX864l8rq0Rh+jvzH2SJVYTjts6Pvjs
 /wI6mPrpehO4BQDG+ZzBS1/k9gnLwyijhFY75byo2u/BDl6UFB0hNbHMeQW26pw2/Lu1pr
 KqOYiGzVlMTVr40WJwNwy4cGOH1gHZA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-EO73U69vPgqCujWMYtv6Ww-1; Wed, 18 Jan 2023 08:09:24 -0500
X-MC-Unique: EO73U69vPgqCujWMYtv6Ww-1
Received: by mail-yb1-f199.google.com with SMTP id
 p18-20020a25bd52000000b007c8919c86efso19840175ybm.13
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 05:09:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WILQ+DVk1t2ZFpD36BbQV4/QLtmlkx7mnlHic1o1Vac=;
 b=Ax0BtLbgPwQrx8aXKKjCoN55Sl/hVG2BzZJ/+irTdDMfO+zj2NZIEd5kFQTPrSGDaw
 1frNdtzqnFsBIXn5UTGttKDUaoOxqL9hcSmr2UkLauhxZmMDhogdMrQjY9yLgAMB/Vp7
 tvzChwv8lqA8eavys9dP7LWOu2Da8YX3+GghBhD3pJR9S4pXtvJm58gq1V2tgORdAIFc
 tzEFD8GgsOdWR7SVUHgjFsuZELLo5w2A72kpzpwA65VlB2tRGA6Zph14W5IA4AUi9oEP
 I/iiS0ht/0zd8nZmtgZM9PVAxXLYmKcsyNUf6X4dV6ZF5mA7cLEO+ey7VeLElZADOLUP
 JLmQ==
X-Gm-Message-State: AFqh2kpaCXnZTDGjfmu3OhYhn056NRWqxa7sfvaCd95VxYZMPEqi/+bC
 BXzXjh84RalQHBGgny/HQIUDDENTtqO8JiwsL/1ybxbqJXSKJm/tNqSDLuVVTWBeEbIxVteu2YB
 ASXCXJyso2fLa+XQ=
X-Received: by 2002:a81:25d0:0:b0:4cc:4d3e:b312 with SMTP id
 l199-20020a8125d0000000b004cc4d3eb312mr21524945ywl.46.1674047363795; 
 Wed, 18 Jan 2023 05:09:23 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsrUqceJTIr+FpfN6eSd0L9lbwQRAYuu18tXWq2Ick/tTGtkj2z4UHa9MmFecZTJZPdGEoNmQ==
X-Received: by 2002:a81:25d0:0:b0:4cc:4d3e:b312 with SMTP id
 l199-20020a8125d0000000b004cc4d3eb312mr21524925ywl.46.1674047363578; 
 Wed, 18 Jan 2023 05:09:23 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-5.customers.d1-online.com.
 [80.187.99.5]) by smtp.gmail.com with ESMTPSA id
 ay19-20020a05620a179300b006b929a56a2bsm22319605qkb.3.2023.01.18.05.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 05:09:22 -0800 (PST)
Message-ID: <e4fb93c6-a28d-b45c-5a7d-48d0ae33b994@redhat.com>
Date: Wed, 18 Jan 2023 14:09:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: float tests are too verbose (was: [PATCH v2] tests/qtest/qom-test: Do
 not print tested properties by default)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20221215153036.422362-1-thuth@redhat.com>
 <CAFEAcA_EUNGFzLh8d9631WZR+-bR8oVynBs6=FV_kmLWNx2bSg@mail.gmail.com>
 <CAFEAcA80=+dXd5uDfSd8-sAPwbrYMqaPKhLGt7w8vh3MiQwLCQ@mail.gmail.com>
 <43415e4f-c6bf-31c6-3a2e-cea86c511223@redhat.com>
 <Y8Z8CJoFyxB9uHqU@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y8Z8CJoFyxB9uHqU@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 17/01/2023 11.44, Daniel P. Berrangé wrote:
...
> And what i think is test float being overly verbose
> 
>    >> Testing f16_le_quiet
> 
>    46464 tests total.
> 
>      10000
>      20000
>      30000
>      40000
>    46464 tests performed.
> 
> Could be written as
> 
>    >> Testing f16_le_quiet: 46464 tests total .... OK
> 
> (one '.' for each 10,000 tests run, before final 'OK' is printed)

Unfortunately, the float tests are included via a git submodule, so the 
source code is not under our direct control here ... has anybody a good idea 
how to get this tackled best?

  Thomas


