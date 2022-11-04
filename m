Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBDF6197C2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 14:25:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwgS-0007yT-D9; Fri, 04 Nov 2022 09:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oqwgQ-0007y1-SX
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oqwgP-0000DC-Fu
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667568268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk/ifTJkhJAzvieBWOWq8UDxTpagaKE/jrnBt/XaafA=;
 b=YAMGx6ollDnKo+LI3UUjqKhj2JLUZ8sZDv74ZoZhQN59LLJ95FNCwkT4I5Xp/S4ZygXqtQ
 7+WLw91SCNNq4j3KUZFrWNHiA+E8mtw522QKoR42PI7kysc5CdH0k96okRuceBPCPHhV68
 lLKasdOqmGbedjfaYwHFhxgbw0caHGs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-HbvmU7YLNXO2LXN1U50wUg-1; Fri, 04 Nov 2022 09:24:27 -0400
X-MC-Unique: HbvmU7YLNXO2LXN1U50wUg-1
Received: by mail-wr1-f70.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so1238521wrg.21
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 06:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uk/ifTJkhJAzvieBWOWq8UDxTpagaKE/jrnBt/XaafA=;
 b=6dBL6OECSbCQTgDXWZOB0bAEam/lwW093qAGk2sxKxZZxIukmvY8sLMCuQpF7uElOk
 olEdfjGgj5L7t8wLWx09hOqI88R80HapCZblHaoqJPn40uYrq1dYayyKdFF7u7A/OUlD
 Soy6xmInM5ueOQOkSYg+wWqJ922fG1SB7qrWn1KzX06z+DMkJ6dV7q2AYC89vM4fmiid
 IJXaloNUq+spQdkTUgzBrVwHYDavj5PBKcRxS+o6OKoZXYJjKmp1DgyipJop7s3oYTWq
 7Te9fSOudJDfFepd0mHk41JD53mkBzgQjRjl/aVSz6vDKn+T2lDZji1FVyhVxc+gH9FV
 xIcg==
X-Gm-Message-State: ACrzQf0hRZ8WUwNLSz6Q0i1wCQSb73IPVasQLGNZjMk1i3+O8FAnm0zf
 THaHslmVqzz/g+eOsd4zO0Ll33W6BtT6c+11YyM4zJ9QJFresTJprLHSoxIUkW8LZL/WU0zGL7D
 R3F+q0JNbfhkVxJg=
X-Received: by 2002:a05:6000:1109:b0:236:5d1f:5198 with SMTP id
 z9-20020a056000110900b002365d1f5198mr21907148wrw.22.1667568266734; 
 Fri, 04 Nov 2022 06:24:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41NIkLw1AirG7kr8r3W7QkkohUTwG8LylD2Xig96YCyZRYbGXwAnXvV9M83dIeWTe6nPJ2tQ==
X-Received: by 2002:a05:6000:1109:b0:236:5d1f:5198 with SMTP id
 z9-20020a056000110900b002365d1f5198mr21907135wrw.22.1667568266480; 
 Fri, 04 Nov 2022 06:24:26 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c510d00b003cf54b77bfesm3091455wms.28.2022.11.04.06.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 06:24:25 -0700 (PDT)
Message-ID: <c678e2f5-1be9-347d-92cb-bd53127b4cac@redhat.com>
Date: Fri, 4 Nov 2022 14:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221104092236.184792-1-lvivier@redhat.com>
 <Y2TeNFBUnwW9XZBk@redhat.com>
 <680deee3-ccf7-b32c-2dfe-189ab02463d4@redhat.com>
 <20221104081513-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20221104081513-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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

On 11/4/22 13:15, Michael S. Tsirkin wrote:
> On Fri, Nov 04, 2022 at 11:58:29AM +0100, Laurent Vivier wrote:
>> On 11/4/22 10:41, Daniel P. Berrangé wrote:
>> ...
>>>> +static void test_stream_unix(void)
>>>> +{
>>>> +    QTestState *qts0, *qts1;
>>>> +    char *expect;
>>>> +    gchar *path;
>>>> +    int ret;
>>>> +
>>>> +    ret = g_file_open_tmp("netdev-XXXXXX", &path, NULL);
>>>> +    g_assert_true(ret >= 0);
>>>> +    close(ret);
>>>
>>> This is creating a zero length plain file, and then paassing
>>> that as a path for the UNIX socket.
>>>
>>> This is pretty dubious and only works because the code will
>>> be doing 'unlink' on the path. Just delete this as there's
>>> no reason to pre-create anything on disk for UNIX sockets.
>>>
>>
>> The idea here is to generate a path for the socket and to be sure this path
>> is actually not already in use.
> 
> if you unlink before use then it's racy though.

I agree, I'm going to replace this by a directory as proposed by Daniel.

Thanks,
Laurent


