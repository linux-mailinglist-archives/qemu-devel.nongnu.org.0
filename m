Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6FA5EBFC5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:30:35 +0200 (CEST)
Received: from localhost ([::1]:44280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7rG-0000Lt-CI
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:30:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od7o9-0002t9-Kj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od7o6-0005CX-Un
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664274437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3hkc62ZXqLZkJnALVEEOikzKfq1frnuXP2nbePrf1M=;
 b=RsuIsep1uoZ8TLXYtsdg9gKXrGO93CrFwI9+/QQwrjRXIRiigfoaxQBmqWteSsXskde572
 1EBUcnBI6OmQWbJ7cVAP9fVIMDTXTfmz6tFTdLm5lwc0TancVo4fQNqD8Ie6avG/owdtHZ
 hmncXyfLurtWIKbMFsf23PfF+mJmqJU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136--65mxseqPCaucE7dg2ViCg-1; Tue, 27 Sep 2022 06:27:16 -0400
X-MC-Unique: -65mxseqPCaucE7dg2ViCg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v22-20020adf8b56000000b0022af189148bso2014989wra.22
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=H3hkc62ZXqLZkJnALVEEOikzKfq1frnuXP2nbePrf1M=;
 b=Hn27T5uxURKF0wMqMd3RWzZTY//ZA45N87hwvu9uHJfb7bw0G9XtOvqkemWVVyOBa1
 srNUEuL5dMOr1ebPNquWEaUqzp5taG7ykCcn4724FGhUd2UHp9nXTJjQsa3vpQs6diew
 j+rdI3eSUBtFLb8GyJxAfQ/sQ33vaUNmfrOm0mSOWKmS7qLl1roYvl40fuzwjqgRAl/o
 YAcf6d/rV/3TKPXI0zNtVWhAjffE6wlKt9jFnZ/znsilAMKZOlwZg85jGVeDSrx30dQz
 HytJK7wfWhwIxS219srEzm4ggwmfUFL5VhI8uAZoA2oSBtVL+l+oXGl8wYl64+zdweiP
 DU9Q==
X-Gm-Message-State: ACrzQf1hzgf5MK43a19JyV8WdYIGp2lxxxA56429H/gvA6jHz7Vvr8ut
 jC9wy1W26YVh3NS6CcC2EfBe/Z3sxS85ohR1oOtPUSLwOsyoQv7nj2VYdSIWiE6bSWe/0iR0q9h
 DDjrkKPB1mGztwKw=
X-Received: by 2002:a05:6000:1845:b0:22a:4b7a:6f55 with SMTP id
 c5-20020a056000184500b0022a4b7a6f55mr16182558wri.288.1664274435435; 
 Tue, 27 Sep 2022 03:27:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GmJt6/R3jzSvTtW51fJjT5uiyBdvxY14Stb6LtVirt4ZYZnQJHvaqpf5m2GdXzVDCU/mJZw==
X-Received: by 2002:a05:6000:1845:b0:22a:4b7a:6f55 with SMTP id
 c5-20020a056000184500b0022a4b7a6f55mr16182546wri.288.1664274435205; 
 Tue, 27 Sep 2022 03:27:15 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 t15-20020a5d42cf000000b00228c483128dsm1667654wrr.90.2022.09.27.03.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 03:27:14 -0700 (PDT)
Message-ID: <cf5fcd36-528a-1234-9a05-e4f1ba2f91ba@redhat.com>
Date: Tue, 27 Sep 2022 12:27:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/7] tests/x86: Move common code to function in
 device-plug-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
 <20220920104842.605530-2-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220920104842.605530-2-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/09/2022 12.48, Michael Labiuk wrote:
> Move common code for device removing to function.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/device-plug-test.c | 42 ++++++++++++++--------------------
>   1 file changed, 17 insertions(+), 25 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


