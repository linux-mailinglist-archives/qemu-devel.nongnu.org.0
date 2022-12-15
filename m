Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8064DCBC
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5oyE-0007wI-Ft; Thu, 15 Dec 2022 09:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5oyD-0007w5-5g
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:12:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5oyA-00046w-QO
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671113537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=saNicXExAmRcEecL+5w8gtXujo6ZrVdGXgoy5yAbmjc=;
 b=gj9WkRYz0GbN+/poaYAiGJOqAcDMGGl8OLNae2QDPB6t/NutHP3myDcPlwT/sx6v7Kjc6c
 NGUWQs3C4bygVrtif54/IkD+t7+XM28C8JM036rV1S82MgV7+oPkQdOMhnS2CJb8pKeBYk
 a0xujeLWG7xnsqO74qdfqdHekFm1EvY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-4lWWmJgKP6-QPXTcm8ezRw-1; Thu, 15 Dec 2022 09:12:13 -0500
X-MC-Unique: 4lWWmJgKP6-QPXTcm8ezRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso7938449wmh.2
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:12:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=saNicXExAmRcEecL+5w8gtXujo6ZrVdGXgoy5yAbmjc=;
 b=Vj59ESX2bMr0WEcaeMGEu3fhw1CWiYSUnLYqzG1I2hT2HrWkPoO6KZUnlroG0PoUip
 oGL7CYP/XkXij4KvyZEbLBQEzlP/ozDa+de/nUsycTajIUNE16nk7L7dYfB7GrFfe/im
 yMFndABWXlEf9heD1ff92vNGM7ubQUm5Y8WCgOJgmmpjAyB2662/xf8Pef3itazDaZBo
 USCAZNN5qLQinlLEhiL7Ierhq750ZFN0o4bSutZLTpy44pyfptvkbn6jR5GpblcIIOvh
 OQTWnA5nOtJqXac+DJu2fTqCo+ztPT/nc+Qpg6FxOO6VgKGKg3E+2wkMgvZW7T35rvVt
 L0Ag==
X-Gm-Message-State: ANoB5pmG+hpGbFX1Z0k4vIF2TpKr3H7OzJl0oNIj3jofmncOi85WsENT
 uZalucJuP9wdKKNpz0ZAxRFMAwzktxEyY0yVkTCAzKxXj9NOwcHpbE7GwapW+sO0qK2anof1ag3
 fyaTmSYkiEXgHUiY=
X-Received: by 2002:adf:9b09:0:b0:248:ab8a:5144 with SMTP id
 b9-20020adf9b09000000b00248ab8a5144mr16401522wrc.63.1671113529000; 
 Thu, 15 Dec 2022 06:12:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5IQNCOnT3tG9rwXWnn9MB5nAMxeHQpu9VvB96RAeIhjcVCX1z+RB0TrhqtG/X+j4rlpjruPQ==
X-Received: by 2002:adf:9b09:0:b0:248:ab8a:5144 with SMTP id
 b9-20020adf9b09000000b00248ab8a5144mr16401511wrc.63.1671113528784; 
 Thu, 15 Dec 2022 06:12:08 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m24-20020a056000025800b00241fab5a296sm5917991wrz.40.2022.12.15.06.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 06:12:08 -0800 (PST)
Message-ID: <2c88fd8e-a1f7-2cf1-ec90-46c71421af73@redhat.com>
Date: Thu, 15 Dec 2022 15:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/qom-test: Do not print tested properties by
 default
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20221215140152.284180-1-thuth@redhat.com>
 <CAFEAcA9JKHV+TNCFjgHsLkoMQ1eVz6d_hbre6OqZVasawdn=2A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA9JKHV+TNCFjgHsLkoMQ1eVz6d_hbre6OqZVasawdn=2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 15/12/2022 15.04, Peter Maydell wrote:
> On Thu, 15 Dec 2022 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>>
>> We're still running into the problem that some logs are cut in the
>> gitlab-CI since they got too big. The biggest part of the log is
>> still the output of the qom-test. Let's stop printing the properties
>> by default to get to a saner size here. The full output can still
>> be enabled by setting V=2 (or higher) in the environment.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
>> @@ -103,6 +107,12 @@ static void add_machine_test_case(const char *mname)
>>
>>   int main(int argc, char **argv)
>>   {
>> +    char *v_env = getenv("V");
>> +
>> +    if (v_env && *v_env >= '2') {
>> +        verbose = true;
>> +    }
> 
> This is a bit cheesy -- I think we should parse the string
> to a number properly rather than accepting '2', '23',
> '2.89237', '2e45' '2fast2furious' etc :-)

Ok, true, it's a little bit weird that it's verbose for V=9 but not for V=10 
... I'll rework the patch and send a patch for hmp-test.c, too (where I've 
copied the code from).

  Thomas



