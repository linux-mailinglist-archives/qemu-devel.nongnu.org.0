Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0B66E4DB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 18:26:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHphh-0000r6-K1; Tue, 17 Jan 2023 12:24:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pHphf-0000qc-1q
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:24:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pHphd-0006ol-BV
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 12:24:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673976291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDTu7CQxkfaF7irvw6M54eOdZn/V/UaMbotselrQ1io=;
 b=ZjrfIARGAx7a2asAXA8tV7XWkuoREj2k4FV+lJB2/dP0uFw2ohkEs0xVNr6iJZn+9QjO7/
 5EEjB7IkPbgbFF1HYo98UU0DVkRA9JGyZfwN2G+Xdr93zXEjDT/TPB9I2qxIC1KuFRboqs
 4TgUckIycUC/IpTl3v4/NzFnAXUUB5k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-RRqshONBNbW1PMEdHP8Y4A-1; Tue, 17 Jan 2023 12:24:49 -0500
X-MC-Unique: RRqshONBNbW1PMEdHP8Y4A-1
Received: by mail-qk1-f200.google.com with SMTP id
 ay34-20020a05620a17a200b00704bd9922c4so23133922qkb.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 09:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vDTu7CQxkfaF7irvw6M54eOdZn/V/UaMbotselrQ1io=;
 b=0QpGL3oxEtVEdQqk9upqQec50/LroC/PzqB0UOv7dex7kPYFvYXkZgB9uJ0dfOCiE2
 Foq0uzRFd4RG466422lhAgkpmVD6P8pmleNJ3BhDBbSk5Srt74WweCWNMwuvHaBSQLVv
 X+nvYL7lnaIP+8BAaeNrk4r3kStYIwztEkqRG3XpNhy4drtuPuid1B4CTU96IOEbiJrB
 EDLoEal8ojzZ8EBR091w2RVuIE+IaNYEJHnf1zHprpr1LNTDMYdoSZx3NgvcIY2ZhpLh
 N73Thbh3rKRur/rFYos5RuekEU04CeYULzBDAwDFrTvYYzJ41BoFowJdQU0qbR0rAJgh
 TLWg==
X-Gm-Message-State: AFqh2kpDdNKXatIXOfsLk9Df2nGwTomCK0SeFDI+3Pei183Shgy5LMo1
 BVuLGug78i29DEtWHVwT0pkxaKZvq05V19ovWJHoIqqDVZFsTzGfwEKZ0ZSUP0pDk+18HaFtxtG
 GqnSyoDW3Hm74Il4=
X-Received: by 2002:ac8:4b6d:0:b0:3b6:2b6f:fbef with SMTP id
 g13-20020ac84b6d000000b003b62b6ffbefmr12954743qts.48.1673976289029; 
 Tue, 17 Jan 2023 09:24:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsE3S8fcEkYMHGiHa2goLvtkqOb1Z/NRZP7l6a4j98qMXz6k6K3hXbW0BSdA6NyW9OODuzszA==
X-Received: by 2002:ac8:4b6d:0:b0:3b6:2b6f:fbef with SMTP id
 g13-20020ac84b6d000000b003b62b6ffbefmr12954726qts.48.1673976288771; 
 Tue, 17 Jan 2023 09:24:48 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 b24-20020ac86798000000b0039cc944ebdasm16277637qtp.54.2023.01.17.09.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 09:24:48 -0800 (PST)
Message-ID: <a7b29b75-2d7d-8146-c590-6d2dd7602476@redhat.com>
Date: Tue, 17 Jan 2023 18:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] tests/qtest: netdev: test stream and dgram backends
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20230117131506.1394552-1-lvivier@redhat.com>
 <5b67045b-d8d7-14ef-21ff-3fcadff9e5bf@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <5b67045b-d8d7-14ef-21ff-3fcadff9e5bf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 1/17/23 17:45, Thomas Huth wrote:
> On 17/01/2023 14.15, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> ---
>>
>> Notes:
>>      v6:
>>        - call socket_init() otherwise socket_check_protocol_support() fails
>>        - if socket_check_protocol_support() fails then calls g_abort() to
>>          report a problem.
> 
> Last problem fixed, next one occurring:

Thank you Thomas

> 
> 218/556 qemu:qtest+qtest-aarch64 / qtest-aarch64/netdev-socket                    
> ERROR           0.77s   exit status 3
> ------------------------------------- 8< -------------------------------------
> stderr:
> qemu-system-aarch64: -netdev 
> dgram,id=st0,remote.type=inet,remote.host=230.0.0.1,remote.port=1234: can't bind 
> ip=230.0.0.1 to socket: Unknown error
> Broken pipe

It seems to be the test_dgram_mcast() test.
Perhaps windows doesn't support multicast datagram?

> ../tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered 
> exit status 1 (expected 0)
> TAP parsing error: Too few tests run (expected 6, got 4)
> (test program exited with status code 3)
> ------------------------------------------------------------------------------
> 
> See: https://cirrus-ci.com/task/6491942456918016

I'm sorry I've not been able to find the cirrus-ci option in github, so I didn't test.

> 
> ... maybe it would be better to simply limit the test to
> CONFIG_POSIX in the meson.build file?

I agree but first I'd like to only disable the multicast test. If it fails, I'll limit the 
test to POSIX.

I'm sorry for the inconvenient.

Thanks,
Laurent


