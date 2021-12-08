Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E046CF98
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 09:58:05 +0100 (CET)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1musm4-000673-9m
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 03:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1musjT-00059x-Mq
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:55:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1musjR-00016M-Ns
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638953720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ScGZh5StPHY4zmw6LR3ZS0O32S9tAbW7HzVXcNIa65w=;
 b=hp8iX+hJXaoiZOM1djoXbzxkT/MAR5XGVUWsbSP28+EYnQsEqRROa+RyN5L8F7D/IbN1LV
 n/5sLddYb/EvOwOXzHXEi+A+Ok75GY4J/Ok3TFfUf94ZxqyYQlq/Sa7JQg+xpD9mz98NHr
 uk6zAN9SRbXyovbUvApbbqN+w4XrMtE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-7Hb_MqYyOFSMFn6TTJSDVA-1; Wed, 08 Dec 2021 03:55:18 -0500
X-MC-Unique: 7Hb_MqYyOFSMFn6TTJSDVA-1
Received: by mail-wm1-f71.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1086713wms.5
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 00:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ScGZh5StPHY4zmw6LR3ZS0O32S9tAbW7HzVXcNIa65w=;
 b=VqclrbeQM4lN7yqAxvHxsQSxf8CKJANfL5U7J5RW1v0bxq5KZv615LO/M3w211kjAH
 xre5cglBmHm6pUKzAyxYRITlEUHKkqo+AQ9nZ2JnXmfHUNP3feGr9sCmjVKLKrj90R9O
 fo45AEu1PgnQVTRJ9+1hl7In1A1AV5oBDK5M2bsG5+WfW43Z5zjssbxFq+TtuePUWZDz
 1MaC5+N8C07Y5u6eh7XoBZIQYmJ+qSMwHV8GLovfwYhv4yL3EjDZZqTmON9bLXBPrPkN
 1rVvh26+z9O8Vu9aHNn/n2/ZJ96Xo7uJcN+GtAWy3jzX40fElUR4c5e5W+AbPk7KiQ/t
 8KkA==
X-Gm-Message-State: AOAM532xqndcH31avftBbMFDlbdg4OjwfvocllzcLgTUHMnXZndu2hmO
 OuLhEhCxK1e9iI+7zZjOTZ2m9VPnMoMfxN3IMK0c2i0/uqfs6y8m3cwTZ65EVn/3Gjgld8Zd6j2
 PYEWDghf35VJh0NM=
X-Received: by 2002:adf:f04d:: with SMTP id t13mr58958932wro.324.1638953717617; 
 Wed, 08 Dec 2021 00:55:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhAJdlYhnIcv2BCj0IWvmSlNU3rjPT7atPaXOYsdkp5EFdMDQIJ0cCnJNwTg1V8Kp3uu8WxA==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr58958902wro.324.1638953717432; 
 Wed, 08 Dec 2021 00:55:17 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d6sm2088637wrx.60.2021.12.08.00.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 00:55:17 -0800 (PST)
Message-ID: <2b16784f-a2de-66dd-fe3b-b088269a37b5@redhat.com>
Date: Wed, 8 Dec 2021 09:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v7 2/4] tests/qtest: add some tests for virtio-net failover
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
References: <20211207172342.4058491-1-lvivier@redhat.com>
 <20211207172342.4058491-3-lvivier@redhat.com>
 <a54b31e2-0327-6134-517c-71147f3aa6fa@redhat.com>
 <0e6e8fd1-7858-bc6f-e586-04a3a4bc809c@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <0e6e8fd1-7858-bc6f-e586-04a3a4bc809c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2021 09.52, Laurent Vivier wrote:
> On 08/12/2021 09:39, Thomas Huth wrote:
>> On 07/12/2021 18.23, Laurent Vivier wrote:
>>> Add test cases to test several error cases that must be
>>> generated by invalid failover configuration.
>>>
>>> Add a combination of coldplug and hotplug test cases to be
>>> sure the primary is correctly managed according the
>>> presence or not of the STANDBY feature.
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>> [...]
>>> diff --git a/tests/qtest/virtio-net-failover.c 
>>> b/tests/qtest/virtio-net-failover.c
>>> new file mode 100644
>>> index 000000000000..7444d30d2900
>>> --- /dev/null
>>> +++ b/tests/qtest/virtio-net-failover.c
>> [...]
>>> +static char *get_mac(QTestState *qts, const char *name)
>>> +{
>>> +    QDict *resp;
>>> +    char *mac;
>>> +
>>> +    resp = qtest_qmp(qts, "{ 'execute': 'qom-get', "
>>> +                     "'arguments': { "
>>> +                     "'path': %s, "
>>> +                     "'property': 'mac' } }", name);
>>> +
>>> +    g_assert(qdict_haskey(resp, "return"));
>>> +
>>> +    mac = g_strdup( qdict_get_str(resp, "return"));
>>
>> FYI, check_patch.pl complains about the space after the "(" here.
>>
>> I'll fix it up locally, no need to resend just because of this.
>>
> 
> I don't know how I missed that as I have pre-commit git hook to run 
> checkpatch.pl

... but now I ran into another problem: Your new test fails the build with 
the sanitizer enabled:

https://gitlab.com/thuth/qemu/-/jobs/1861286254

Could you please have a look and resend after fixing it?

  Thanks,
   Thomas


