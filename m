Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4C369DE3D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:53:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQGI-0005OX-1J; Tue, 21 Feb 2023 05:52:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQG1-0005M5-UN
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:52:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUQFx-00034W-Ux
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676976741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GApRhNe41h6tirvJspLZmtGBzWgKmH2tTukSXCVjVvc=;
 b=Ggv9Kh+zfPR1di0rI8baQMAjcAanVfet79JGOVs/PL+Om7NymLFU6qA/9Mqp5gcsYzn2ok
 KkwzOoCO/4S8L+c4BeuMiRauIw68pE8unjIoOnr0eF5YsMmys+OvUq1Z4Fd1RV6Di9jG4o
 sYO21yNUTSiJKLYFA1C710vGb7E04qM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-YWfUQxFXO2KgDWyPH9IX9Q-1; Tue, 21 Feb 2023 05:52:18 -0500
X-MC-Unique: YWfUQxFXO2KgDWyPH9IX9Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso5406196edb.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:52:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GApRhNe41h6tirvJspLZmtGBzWgKmH2tTukSXCVjVvc=;
 b=qPGX7vlKYizhKVz2NY+OzQfxjRdir9oRegz65adA1Id1z9vsCWzKcHcIuWyBHH83DK
 1OLTiWK97EoryxvmkozXy4/NFVEc4HvAX6mi1USNC6DNVyxTgmT3PJGao1xGwmywyb5F
 fS868hFLMhG/Y5LPxTBAJi2WixwYj2nIoxbwpbNoznNezIYxQIZEVso0jVQyjUa6R8VV
 YfhD2SKDHRNs3OCwMMy3YxIIpSBGSVZSqSOGyDRWnL60Ndj/n1w3jJ1ytLMyOW2mRvjq
 6VuV7jlI0eY1Vm3rKU1PTkhZHcKrPhNz3Rc/bhOSFzmUKuyhZf1tZfuOr6GSHtF4t82t
 SBFg==
X-Gm-Message-State: AO0yUKVE3deYm7hI0vDMoovWlRo9IiZwBLzBSGdt+91pi50flLKhsiHz
 Bn20p7nsHZsKvqpVSsGcRUckRboQT64jxDyVY6xebkG/xz9AawebOw7TuN1b/riz/wc2LU9D4gn
 uZOiyN4JjGVJkJy4=
X-Received: by 2002:a17:906:2358:b0:88d:d700:fe15 with SMTP id
 m24-20020a170906235800b0088dd700fe15mr10880763eja.0.1676976737069; 
 Tue, 21 Feb 2023 02:52:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/xwHStRJaoxJ0nSjE2hiMBthAgNsw+2tBONBfpbXkrROMOasOQHySuDu46yudTAYBSsxdgsw==
X-Received: by 2002:a17:906:2358:b0:88d:d700:fe15 with SMTP id
 m24-20020a170906235800b0088dd700fe15mr10880747eja.0.1676976736735; 
 Tue, 21 Feb 2023 02:52:16 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 m11-20020a50930b000000b004a27046b7a7sm3162687eda.73.2023.02.21.02.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:52:16 -0800 (PST)
Message-ID: <a06461a1-e7fe-69c1-5742-5e1f7bba379c@redhat.com>
Date: Tue, 21 Feb 2023 11:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
 <87r0ukbjfp.fsf@pond.sub.org>
 <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
 <55e488cf-0b5f-f1e9-0a15-5d3e8c155abe@redhat.com>
 <CAMxuvayAMEwR29fCs3SkHd8iOiOB+36QZBvEd7qG-sMhPdf2EQ@mail.gmail.com>
 <CAJ+F1CKJidDs41TV-NuvnVftXJsLkg7WHRuR2_4Xusde3sPfAA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAJ+F1CKJidDs41TV-NuvnVftXJsLkg7WHRuR2_4Xusde3sPfAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/21/23 11:40, Marc-André Lureau wrote:
>> Yes it likely can, the first SOCKET value starts at 92 in a simple
>> test. It looks like it may depend on the system number of opened
>> sockets.
>> 
>> I think the second big issue is that we have many places where we
>> assume a fd is a fd, and we simply call close() (which would result
>> in CloseHandle, but missing closesocket).
>> 
>> sigh, if the CRT would allow us to steal the handle back..
>> 
> I found an interesting option here, using HANDLE_FLAG_PROTECT_FROM_CLOSE: 
> https://github.com/ksmurph1/VulkanConfigurator/blob/986992a8b963a6b271785a77d5efd349b6e6ea4f/src/folly/src/net/detail/SocketFileDescriptorMap.cpp#L36
Wow, that's the ugliest thing ever but it seems to be made for this. :)

Paolo


