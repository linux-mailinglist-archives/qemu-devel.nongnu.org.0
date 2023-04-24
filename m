Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE0B6EC8D7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:28:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsUH-0002l0-1H; Mon, 24 Apr 2023 05:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqsUF-0002kd-2c
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:27:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqsUB-0006HO-1r
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682328470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uG465fo/o8k8hxcXOndRNy7GyIKVuwkFwjt16CHDyR0=;
 b=KjlFaMhSlJx3hsc19PpGIwL18NkCpGhLtuzC2PuL4NUYyxHXDrjNODr9nCMmFOIw6B9l6O
 lhFlC8qW7JT96Fyx8VLvnMeywjYDrlK2DIs6y3ca9L255So/My/OG/DlkvXJ54Yk5WHh/e
 SINiQsb7n/c1xhxFZJy4q9+fCyk+zqE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-sODGb931NfaTH5OJzAWpeg-1; Mon, 24 Apr 2023 05:27:47 -0400
X-MC-Unique: sODGb931NfaTH5OJzAWpeg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f187a7a626so13852065e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328466; x=1684920466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uG465fo/o8k8hxcXOndRNy7GyIKVuwkFwjt16CHDyR0=;
 b=OdkLQZS8zEkPTAWqApkwhor5gTpJskFcUdhiUG+lS5UWTSaDUeaNUooRbz5PPmA9VR
 Nlq3B9cjTzHFRdi4wup2y8FT4tn2k+JIkV+quSw1kCXYG5PlvKaOoVbVd+qPY63U9mkH
 Miuc/3roGOlzdQ85pWrc9Idr+Q3NOMVJD++lkPPeDpHa8Z316qF0Pdz+1bMFxaoXeahN
 MJ7rln5EaeWIewK8HXC+dI3sMVzAwmt15C4kZBGNwCXWJwEGavNqcIvvkAA/gIsT9ZpH
 PdF7ZwM7V0OyNzl1PECgb8Cw9AYjwobsDBaDNYm7QmOoJxgnyJ0QgKMzisMWsI000wmQ
 PSsw==
X-Gm-Message-State: AAQBX9cTUp0glLptPP7POSYPI5nMMRWM8NhhN+3o2vGy96UzK6I6m8rg
 HLyATHU5nq7Twbfy9fQwOBXIqbK2/qSXtw7hSpMAQoRFasu47LDBZyluhB2MqHj8nHL5G+25qad
 sMPUVbLLIHi9oMWM=
X-Received: by 2002:a7b:c4c1:0:b0:3f1:7ee3:bdd8 with SMTP id
 g1-20020a7bc4c1000000b003f17ee3bdd8mr7649250wmk.18.1682328466185; 
 Mon, 24 Apr 2023 02:27:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350aRmRHIAd77KsMyjbpyb9Uo38CvW4FVood5pcIrHnQigo794xZmLEnQXBtqOAGk5L7rlNdwYA==
X-Received: by 2002:a7b:c4c1:0:b0:3f1:7ee3:bdd8 with SMTP id
 g1-20020a7bc4c1000000b003f17ee3bdd8mr7649229wmk.18.1682328465936; 
 Mon, 24 Apr 2023 02:27:45 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm11592517wmk.20.2023.04.24.02.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 02:27:45 -0700 (PDT)
Message-ID: <4795c4ff-3db1-3947-ec2b-2823f57ab1ba@redhat.com>
Date: Mon, 24 Apr 2023 11:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/18] tests/avocado: use the new snapshots for testing
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
 <20230424092249.58552-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424092249.58552-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.143, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/04/2023 11.22, Alex Bennée wrote:
> The tuxboot images now have a stable snapshot URL so we can enable the
> checksums and remove the avocado warnings. We will have to update as
> old snapshots retire but that won't be too frequent.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/tuxrun_baselines.py | 170 +++++++++++++++++++++++++-----
>   1 file changed, 144 insertions(+), 26 deletions(-)

FWIW,
Acked-by: Thomas Huth <thuth@redhat.com>



