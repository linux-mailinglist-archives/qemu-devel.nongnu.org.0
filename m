Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D46E4927
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:03:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poOVR-0004N7-U0; Mon, 17 Apr 2023 09:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1poOVO-0004Do-CP
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1poOVL-0005dC-NS
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:02:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681736566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XnkDtLXKDfY2IBAGWL6Z6RuZFKa709Dkg4gNWM+4GYA=;
 b=RqV8qYiRcxt0sYU0RIwW1F9lMgqwyEkY+G/YTkEhas5bECYT0FaNh9EuuM27jj2dzSLFno
 8qbR+0eB01OZx3oH6XSD5RXG1LzWS+zirc3qK07EhLiSChEO6JYjtH88kM1peYQvxy4LF1
 KM7yNiVuIZ9uyrJ/a6t3LfQV2wHqt9o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-J9Wu-SgTNU6Woxgqqs0Abw-1; Mon, 17 Apr 2023 09:02:43 -0400
X-MC-Unique: J9Wu-SgTNU6Woxgqqs0Abw-1
Received: by mail-wm1-f70.google.com with SMTP id
 q19-20020a05600c46d300b003ef69894934so11581759wmo.6
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681736562; x=1684328562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XnkDtLXKDfY2IBAGWL6Z6RuZFKa709Dkg4gNWM+4GYA=;
 b=HvUMnNP5nzZjzdfWhhwmeB7VfLF9183Ouf3FKRTUwGWmQJupcpl8qIlQO2MdbhXNiP
 pPruUuMS5eU1B01GBUXvcOI9jRnOqVMFFFxhNoidRSU1YDspXmfrfuyR7sAA/tyk651e
 V/lJJPzMyNfv3a3j2ZgoNapMe1JzLnt4fnUTo/QhnbbPtJkSxilAYXbH1GrCvWoD7lk8
 toAZ9Beb/yqCIMHClgfZhpwkmsnadwaGxJqVpptOW4znTyidDONdMzr62Yvph8W50Z2k
 XfEi79xs3fkd09toA9S+xuA0kqV6xZ2WefXFIaszvTBc9Wqa0Uy7tYcLATlbhA0FqB5W
 o1bg==
X-Gm-Message-State: AAQBX9fRr1lpagBGEGY4trUn2uOcMwFjBdUpof+bOaWM5bErfKHLXqcS
 AU1983wuNIQBZGDznisVK1IxCxxC4RColbftRe1Qt9rwv22dCxrnJFHjnM0eeJ+ZaP2B7ayd/3k
 zgStKF0suUjpv8wE=
X-Received: by 2002:a1c:4b04:0:b0:3ee:282d:1016 with SMTP id
 y4-20020a1c4b04000000b003ee282d1016mr10746087wma.25.1681736562143; 
 Mon, 17 Apr 2023 06:02:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350bJp/NlPkMVRsoUorN7dvKC2EoQcXlVl17bA6g0kI4ariGYAYEiiP0dk1WGGdkDiM0aL+cRYA==
X-Received: by 2002:a1c:4b04:0:b0:3ee:282d:1016 with SMTP id
 y4-20020a1c4b04000000b003ee282d1016mr10746071wma.25.1681736561829; 
 Mon, 17 Apr 2023 06:02:41 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c1c0f00b003f173be2ccfsm3157407wms.2.2023.04.17.06.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 06:02:41 -0700 (PDT)
Message-ID: <5cebae8d-480b-cbed-9b5d-bf3ffaddf404@redhat.com>
Date: Mon, 17 Apr 2023 15:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: netdev-socket test hang (s390 host, mips64el guest, backtrace)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <CAFEAcA8gecpvfUj9uz+HBRspskZsxJTdD2Yz3M3uOKcFJbpv-Q@mail.gmail.com>
 <CAFEAcA-PMX4M9BkaDp9Kd2N_3ffMAW8iM8Ub2e9EtkVteth1hQ@mail.gmail.com>
 <dda6039e-2826-c32f-b0ec-d5988808a1a1@redhat.com> <87cz4295j1.fsf@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87cz4295j1.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/17/23 12:16, Alex Bennée wrote:
> 
> Laurent Vivier <lvivier@redhat.com> writes:
> 
>> Hi Peter,
>>
>> On 4/13/23 14:05, Peter Maydell wrote:
>>> On Thu, 13 Apr 2023 at 11:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>
>>>> I just found a hung netdev-socket test on our s390 CI runner.
>>>> Looks like a deadlock, no processes using CPU.
>>>> Here's the backtrace; looks like both QEMU processes are sat
>>>> idle but the test process is sat waiting forever for something
>>>> in test_stream_inet_reconnect(). Any ideas?
>>> May well not be related, but I think there's a race condition
>>> in this test's inet_get_free_port() code. The code tries
>>> to find a free port number by creating a socket, looking
>>> at what port it is bound to, and then closing the socket.
>>> If there are several copies of this test running at once
>>> (as is plausible in a 'make -j8' setup), then you can
>>> get an interleaving:
>>>    test 1                       test 2
>>>      find a port number
>>>      close the socket
>>>                                 find a port number
>>>                                 (get the same number as test 1)
>>>                                 close the socket
>>>      use port number for test
>>>                                 use port number for test
>>>                                 (fail because of test 1)
>>>
>>
>> I don't see an easy way to avoid to race, but perhaps we can change
>> the test to use unix socket rather than inet one? In this case we can
>> use an unique name.
> 
> We could use a lock file that would stop the test clashing with itself
> (although another process on the machine could still race for the
> socket). The unix socket would be easier but wouldn't we loose test
> coverage or do we not care about the exact details for this test?

According to the backtrace, the problem happens with the reconnect test because we launch 
twice the server side to test the client reconnection. I think this test can be moved to 
an unix socket without any issue. For the other inet tests, there can be a race but the 
window is much more shorter, and we want to test inet, not unix. Even with a lock file, 
the port can be taken by another process.

Thanks,
Laurent



