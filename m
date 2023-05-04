Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00926F655C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 08:57:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puStT-0007R7-I1; Thu, 04 May 2023 02:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puStA-0007QX-EM
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:56:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puSt8-00051y-Oy
 for qemu-devel@nongnu.org; Thu, 04 May 2023 02:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683183385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSEdqS53iXoaCZxhq7JVYfhIWJEheAVKjupkF6jDTGU=;
 b=jMpVeRy2eUNHKftsmqJTJ+JRC9LY4g1NyMpZi5CpQIW3oCJVoeoQRTPwozLYrCtFsDMvy7
 h851/tPz7Jwy8AECLGEmUyhcovMEFfc2s7QFzOsuSjeb0MqnIioAJeYkJ43L5SRe+peSK+
 6I/1UmrGVCxDz0viWbvAIInHm+a7OU4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256---0qNhdTNqKPspQdRA3ehg-1; Thu, 04 May 2023 02:56:24 -0400
X-MC-Unique: --0qNhdTNqKPspQdRA3ehg-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50bcc3ee913so62780a12.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 23:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683183383; x=1685775383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSEdqS53iXoaCZxhq7JVYfhIWJEheAVKjupkF6jDTGU=;
 b=OkNagKbJC4VJsEV2kUnj/qOESSy8piXOxh3GbN/dZgyLlTg0w5AH1wcC2IazhFRlTR
 jMj6XRKXWZWRCGtwN4EcRyms7yYfJ6nJKCSOMeN5qnXK2ZuPLkusFDtWPD8VDWMNpxyi
 8Opk5OXN86D2oAhkpXj5Xhqm3q5gvFHKA/s7rBU8RFwq32tUeaevAFwSTIcLGJiQZv30
 JuotNBM/kdZ/FtWwNwCOFDxREAvkiW0JVt7lABzYMvasT+Mja/UtehsKE+9HL4+HqTcP
 nU1Luxdogy5Ice40nWXqJ5G4GUVbnMXoawkGbeqNyumgrjN288P/nODv72M0fXp6/8Qg
 ufMA==
X-Gm-Message-State: AC+VfDyOLwD4hbGwXpbjU2rKqtQjiMNjvUDsMbaiZucq1THn2vDYQsmg
 DUUCt1lhVaa15zZBVRXG+P+cZiFelrKse5GEvA2rch4nZjXXwsqo25C7EnD2xrsHihFAfv6c5AR
 YZJnqB0s4T2iVhB8=
X-Received: by 2002:a17:907:3e22:b0:94e:c40a:cca9 with SMTP id
 hp34-20020a1709073e2200b0094ec40acca9mr6169901ejc.35.1683183383111; 
 Wed, 03 May 2023 23:56:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7YkcqjHzqdEL2nev6EBG98vm/gPxC7wihnukirUprBdof67RAkDWUy9I90mcx+DyWxDLjMoQ==
X-Received: by 2002:a17:907:3e22:b0:94e:c40a:cca9 with SMTP id
 hp34-20020a1709073e2200b0094ec40acca9mr6169878ejc.35.1683183382781; 
 Wed, 03 May 2023 23:56:22 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 re21-20020a170906d8d500b0094ea48e9052sm18269263ejb.32.2023.05.03.23.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 23:56:22 -0700 (PDT)
Message-ID: <6ed176f9-be38-b4ea-ac90-906cc62c24c4@redhat.com>
Date: Thu, 4 May 2023 08:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/05/2023 20.32, Peter Maydell wrote:
> On Wed, 3 May 2023 at 18:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 5/3/23 17:35, Alex Bennée wrote:
>>>> You should select a device only if you cannot even start
>>>> the machine without --nodefaults.
>>>
>>> Which is the case here right? We could skip tests that explicitly
>>> instantiate a device but these are tests failing with default devices
>>> the machine tries to instantiate.
>>
>> I'm sorry, I meant "select" directives are needed if you cannot even
>> start the machine *with* --nodefaults.
>>
>> Devices that are added *without* --nodefaults should use "imply"
>> directives instead, as is already the case.
> 
> Do we really want to build a QEMU that then barfs unless
> you pass -nodefaults, though ? That doesn't seem very useful.
> Something somewhere ought to be saying "if you want the
> virt board then you almost certainly want these". Or
> alternatively we should fall back to "don't create a
> network device we don't have", maybe ?

I think we should do the latter. If you compiled without certain devices 
that are used only in the default mode, the board should not try to 
instantiate such devices (since it is also working fine without them). Just 
my 0.02 €.

  Thomas


