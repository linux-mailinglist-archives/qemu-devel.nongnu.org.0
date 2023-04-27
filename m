Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3FA6F0254
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:09:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwgK-0003nF-BM; Thu, 27 Apr 2023 04:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prwgI-0003m2-6W
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:08:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prwgG-0006IT-9X
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682582923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5La+inFjev9sb/HVfdXkMAcCJMT8COrL8KUCROo2QX4=;
 b=K90RwfGWad9Y1js/mKG1IsOUUCarYD6wpZtLGuabR6tqZUo/B8WZVYknQRYJsbJz3jIbk1
 UDQcYz4RA0gBnd+3C3W8JOwsFhbcZ+17uKoB/z0UGsP9zA+v1Cu0aCrmmuATmiftvUpBne
 tC6qhrgXWzOLQBoYJFd9MOqXAbn5BiQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-DJdywvfmPfeuyHPSKAGfXg-1; Thu, 27 Apr 2023 04:08:40 -0400
X-MC-Unique: DJdywvfmPfeuyHPSKAGfXg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e32aso3011897f8f.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682582919; x=1685174919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5La+inFjev9sb/HVfdXkMAcCJMT8COrL8KUCROo2QX4=;
 b=f0TWcD+ksmKwsEUA6tXSiF58xXl9aJx0uwREx5/SzrbYH0+PqBlbG/WcMsEUjYCVdi
 X9Zch+sjvg2GYG1x2KguxdJLP2P6PHEJa3sYDx5SCaxFpOENuz9qPm77fvlWNp5iFqsb
 2PJ6Ca2H10esGAAHSGTnJPvkArOYgvBHz+1ZQ8Tz/JfkqnpEN210XdxCXCwfP11AHBD0
 Kf/W4uCcdxCETOKshbETH/mx7uzd3x+dvLOde59z70LD4fEGNmWWQGDfCeqbCktvQWyn
 mSs/YOrWTDtWLBAHnO50+6oZjH9pjX3q2maZ2QHccgU9tUt76IThF/w/kMtLh9MRktLr
 KvHg==
X-Gm-Message-State: AC+VfDw9lyGBG/v+p2aSyiD+F9E5at3Zpkc4XJrtavvniFWN4eYMV5Se
 +WLgYxJiV3E4xyVpuXpag4RCalsp9edLDJmXZJsHDYAbuUiIDpYdDPMFPeeQLBry49cXP+cZVKd
 fnTQzhIK8og8PUOA=
X-Received: by 2002:adf:f7cc:0:b0:2f5:9800:8d3e with SMTP id
 a12-20020adff7cc000000b002f598008d3emr627278wrq.47.1682582919420; 
 Thu, 27 Apr 2023 01:08:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7a3YdMquzS5V+AMBIl8V6vxpdYPIFVQfWUqCuU21nsLIYoQEfb4RsiuTchVhN6jc8YSByKUg==
X-Received: by 2002:adf:f7cc:0:b0:2f5:9800:8d3e with SMTP id
 a12-20020adff7cc000000b002f598008d3emr627258wrq.47.1682582919164; 
 Thu, 27 Apr 2023 01:08:39 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 he13-20020a05600c540d00b003f198b9eac5sm14812023wmb.6.2023.04.27.01.08.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:08:38 -0700 (PDT)
Message-ID: <25062cf1-107a-2492-02df-91b66d2854e8@redhat.com>
Date: Thu, 27 Apr 2023 10:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v11 06/13] tests/qtest: Adjust and document
 query-cpu-model-expansion test for arm
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-7-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230426180013.14814-7-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 26/04/2023 20.00, Fabiano Rosas wrote:
> We're about to move the 32-bit CPUs under CONFIG_TCG, so adjust the
> query-cpu-model-expansion test to check against the cortex-a7, which
> is already under CONFIG_TCG. That allows the next patch to contain
> only code movement.
> 
> While here add comments clarifying what we're testing.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/arm-cpu-features.c | 20 +++++++++++++++++---
>   1 file changed, 17 insertions(+), 3 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>


