Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC074CFB9F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:41:11 +0100 (CET)
Received: from localhost ([::1]:37802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAnd-0001jN-9b
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:41:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRAJE-000633-43
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:09:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRAJC-0003kO-5G
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h94YJ078OvF2Ndrs5ulE4jRXt88p14sMypZ/LvPMhr4=;
 b=CMYF7vzQNL6/I07efipYdaBhveX8ap0FXiE5Yf+7rF6HUdanSQOa0uOf8nHnJAmarIVlKL
 3/xoqIFR1k2GLJIEf2OUyHxcyuOwSuSF0jzRh0xjlggt291UaMLstHQHIcXPo8Epo0KcwN
 7om24/vZK1XgLKTH2JuEj6B5dIT5Z0w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-5kGe8fV5NA2kos8eaHLC0A-1; Mon, 07 Mar 2022 05:09:40 -0500
X-MC-Unique: 5kGe8fV5NA2kos8eaHLC0A-1
Received: by mail-wm1-f70.google.com with SMTP id
 f24-20020a1c6a18000000b00388874b17a8so5148665wmc.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h94YJ078OvF2Ndrs5ulE4jRXt88p14sMypZ/LvPMhr4=;
 b=dcKcweeZfk+cb2KJ/3Hisiqrg3pNqsabODOjb5VVSXhQgfpim+dT10FPJ8GvGXzJhB
 jM3fMeyid3Zt7jwboEPu0MBDOVA6mt2JyIpi83a/qFBXcbDx60lg0Y9joGcSXxzptJDE
 aAjLKRgxdUp664HuIUvChR/P0DeDwTyeIk9C5+c86okoAzyoPx9WgrYNFwMHRzW6t+Fd
 KyorOvUIVuW8L1FgejFDcAzYj6ur6Railyp2PviSAqgrwb4UHMD9JgdSNIAZ1W55sVYz
 7cyZyhnOXQf2nEclMGdtTplvjnN09MzK8/httpZajMX2m8Rb1y/gMwZk2T2xjxQkV7Cy
 dYUA==
X-Gm-Message-State: AOAM531zgCtytI+DdOvIrbBIyV3hJbXkM7dzRBQffbZBKg7CNhUQlo2S
 u0wcwumkpSqCM6y2abRZptSj0OF2Ndj9Rrc5s+W06mnO2NSWFMIrpQDTMR+jZ6QuKSZrcqaaHjb
 T+/ylcwzvFvnIyLU=
X-Received: by 2002:a5d:6d0f:0:b0:1f0:469d:42bb with SMTP id
 e15-20020a5d6d0f000000b001f0469d42bbmr7692099wrq.257.1646647779174; 
 Mon, 07 Mar 2022 02:09:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVy5VikD7t+RciOc5n0CzNlvIt9cGS13OCSHj4HoWfkS9jVisUQYck8vN61ueWR1QZw5rIRg==
X-Received: by 2002:a5d:6d0f:0:b0:1f0:469d:42bb with SMTP id
 e15-20020a5d6d0f000000b001f0469d42bbmr7692076wrq.257.1646647778970; 
 Mon, 07 Mar 2022 02:09:38 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1c741a000000b00389ab9a53c8sm1612231wmc.36.2022.03.07.02.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:09:38 -0800 (PST)
Message-ID: <57b8b146-a197-2f46-bf56-6ab80122e9bd@redhat.com>
Date: Mon, 7 Mar 2022 11:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 04/18] tests: print newline after QMP response in qtest
 logs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
 <20220302174932.2692378-5-berrange@redhat.com> <YiWra21XaVV9Fdv/@xz-m1.local>
 <YiXZLzqenrNT/uKg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YiXZLzqenrNT/uKg@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2022 11.06, Daniel P. Berrangé wrote:
> On Mon, Mar 07, 2022 at 02:51:23PM +0800, Peter Xu wrote:
>> On Wed, Mar 02, 2022 at 05:49:18PM +0000, Daniel P. Berrangé wrote:
>>> The QMP commands have a trailing newline, but the response does not.
>>> This makes the qtest logs hard to follow as the next QMP command
>>> appears in the same line as the previous QMP response.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> ---
>>>   tests/qtest/libqtest.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>>> index a85f8a6d05..79c3edcf4b 100644
>>> --- a/tests/qtest/libqtest.c
>>> +++ b/tests/qtest/libqtest.c
>>> @@ -629,6 +629,9 @@ QDict *qmp_fd_receive(int fd)
>>>           }
>>>           json_message_parser_feed(&qmp.parser, &c, 1);
>>>       }
>>> +    if (log) {
>>> +        g_assert(write(2, "\n", 1) == 1);
>>> +    }
>>
>> Drop the g_assert() to remove side effect of G_DISABLE_ASSERT?
> 
> You need to check the return value of write() otherwise you'll get a
> compile failure due to a warn_unused_result attribute annotation.
> 
> I don't think G_DISABLE_ASSERT is a problem as we're not defining
> that in our code.

You could use g_assert_true() - that's not affected by G_DISABLE_ASSERT.

Anyway:

Reviewed-by: Thomas Huth <thuth@redhat.com>


