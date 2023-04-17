Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076A76E4341
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 11:07:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poKow-0005gP-26; Mon, 17 Apr 2023 05:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1poKos-0005g6-VE
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 05:06:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1poKor-000884-3g
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 05:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681722399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwGozr6hacIqT46ZsBvIKi2/F6Fy0+iFr5Oz6Awc+RU=;
 b=OBUxLXBho36ZuqsgUHS1X+n0A3k+BUCk3vMFmUUdA/BORinpBT08WQ/q808opuCqfdERZZ
 V1yMNvSQ6XyBZDwkZQWDOm8vMPtcb7JjXFa5rh/E8t6VmV3Q9fnEnkpO4Qcx3l1GSG6Xhs
 DUrZ2tWjyAKW/bOJgCeGfi/iPv9AGVY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-_6E2dY_nO5qHRRZizRXORw-1; Mon, 17 Apr 2023 05:06:38 -0400
X-MC-Unique: _6E2dY_nO5qHRRZizRXORw-1
Received: by mail-qk1-f197.google.com with SMTP id
 127-20020a370485000000b0074ac40d9171so5855827qke.14
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 02:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681722397; x=1684314397;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XwGozr6hacIqT46ZsBvIKi2/F6Fy0+iFr5Oz6Awc+RU=;
 b=LN5oY2VziIyXNB8RrnI6Ipc3hJuM+dJ7uYNXSfAk2t0ctnDXlEVX1RfwgDOesJcDUW
 y9D29TWVUSTyvrmnsmLYoyPDFGQZ+lxZYxci0yAp/FltILhJEl236v9ttv3cpf1fgnzU
 Vc64VuOhG16huYdp/k4mDI0kc12OprwJ+7+FXYl3YTWrClDAyYzm8n1IrQxkQdjyyEvm
 3RiN2zDUUODHLUMcddZ2wOb7dJNQITx4Ew1WyBkP2pZO2ULAWbT3PFqxPaLlmPAlE0lW
 ruat3M5lbwOFyK2CAiqvDRYRuRPFqxFEwTalaj5SJMvScCs0vbYuzkdNwftDA3k2fzrq
 PWVg==
X-Gm-Message-State: AAQBX9cciWBR4+gJHijHhxXBbGHAeNJC7xx2fPJ0LDHCTp16mtHJV1EN
 vMX+InevuWgR8l2kXWjtRQ4O1VvAfO+lW3AAnJXBHKS3QXkMKmp/qC3qu0CIJLPNWNyIelcjSGz
 mOtPslRaRLrWIe8mag+tXNQE=
X-Received: by 2002:a05:622a:15d0:b0:3eb:9b03:b5ba with SMTP id
 d16-20020a05622a15d000b003eb9b03b5bamr13747624qty.37.1681722397155; 
 Mon, 17 Apr 2023 02:06:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZKeu6bX0ltIIs3iHxcGVg7dQoXrB7YvePg6fd6WWui2MTZ++g+NFJpQtX7zlI5NtHmY4xKew==
X-Received: by 2002:a05:622a:15d0:b0:3eb:9b03:b5ba with SMTP id
 d16-20020a05622a15d000b003eb9b03b5bamr13747606qty.37.1681722396856; 
 Mon, 17 Apr 2023 02:06:36 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 jr1-20020a05622a800100b003eeff94e2f8sm1031712qtb.0.2023.04.17.02.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 02:06:36 -0700 (PDT)
Message-ID: <dda6039e-2826-c32f-b0ec-d5988808a1a1@redhat.com>
Date: Mon, 17 Apr 2023 11:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: netdev-socket test hang (s390 host, mips64el guest, backtrace)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8gecpvfUj9uz+HBRspskZsxJTdD2Yz3M3uOKcFJbpv-Q@mail.gmail.com>
 <CAFEAcA-PMX4M9BkaDp9Kd2N_3ffMAW8iM8Ub2e9EtkVteth1hQ@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <CAFEAcA-PMX4M9BkaDp9Kd2N_3ffMAW8iM8Ub2e9EtkVteth1hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.976, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Peter,

On 4/13/23 14:05, Peter Maydell wrote:
> On Thu, 13 Apr 2023 at 11:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> I just found a hung netdev-socket test on our s390 CI runner.
>> Looks like a deadlock, no processes using CPU.
>> Here's the backtrace; looks like both QEMU processes are sat
>> idle but the test process is sat waiting forever for something
>> in test_stream_inet_reconnect(). Any ideas?
> 
> May well not be related, but I think there's a race condition
> in this test's inet_get_free_port() code. The code tries
> to find a free port number by creating a socket, looking
> at what port it is bound to, and then closing the socket.
> If there are several copies of this test running at once
> (as is plausible in a 'make -j8' setup), then you can
> get an interleaving:
> 
>   test 1                       test 2
>     find a port number
>     close the socket
>                                find a port number
>                                (get the same number as test 1)
>                                close the socket
>     use port number for test
>                                use port number for test
>                                (fail because of test 1)
> 

I don't see an easy way to avoid to race, but perhaps we can change the test to use unix 
socket rather than inet one? In this case we can use an unique name.

Thanks,
Laurent


