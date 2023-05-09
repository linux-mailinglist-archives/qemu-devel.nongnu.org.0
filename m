Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6719B6FC44F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:53:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwKyB-0004lT-Bv; Tue, 09 May 2023 06:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwKy9-0004jr-L1
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwKy7-00009j-Nh
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683629599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5lilG6zaImp8647W11W+cB5+tLa4YVBSYeh8tGPN+g=;
 b=U0Q9znnaTbaPdlxTZkXwYlvhsxTiiZ4RfSrd6aRJ9pJ8Ou/hXVgwiptA2vIcGrfA0/lqYe
 0EVTpVilvo4nHO0VrAyj3OrBtuyDZktdTI3X15AUlpXD5yIlQ0ikj7zOYluLG6SqmvTC+w
 8LpN/MprN1GPbK4gw5PnhNZX/IHojEA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-jm1x-DwCNwKYXakMSv_L3A-1; Tue, 09 May 2023 06:53:18 -0400
X-MC-Unique: jm1x-DwCNwKYXakMSv_L3A-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-965f0c4ae32so416933366b.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 03:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683629591; x=1686221591;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5lilG6zaImp8647W11W+cB5+tLa4YVBSYeh8tGPN+g=;
 b=axzbuwpA8EgDdq7WLIDorPOlexp+In9sGHlQ53ZSbTg4+uqTJFv14Ahk7q0orZhRrd
 9aVoUxPf2KZKmg0GIA6cx3sHNcmIJevpA2uHf4z7LHBZjXRagF1TRVa3dseo1uGekHax
 jGOGl7xs1p2O+5vLpZ7a8stzIPm1NkOv3aCazVLZ3Cn8QuV5yVliNNl/U/EoFruXhmXh
 7kwRCfWbaiAigQ4c/BAqNceXoVuEI3AEArYGOFhR1V/HkKGu72EI3/EjoAzj92y7jyhV
 PKpgl8nqhpgqS+rb5TrSVdm7dBvZBZBIAzXK46HWxB4lWI9Estn0EBcYmuA6bj+sDjnq
 JwVQ==
X-Gm-Message-State: AC+VfDwclkXO+21/xijJQK/X2Eed81yOzELjEf6SZCYlo6Gq15KBwVKZ
 fQmp1kYT+Nd+FMdFeyE5nSwz+S70ogTscMuyQzph8iaqPIE5VEGi6KZ6Qo7Tk/lYMKdHRiqi6QU
 9Ia4W4t9KbtCWzDA=
X-Received: by 2002:a17:907:70d:b0:94b:d57e:9d4b with SMTP id
 xb13-20020a170907070d00b0094bd57e9d4bmr10854199ejb.2.1683629591577; 
 Tue, 09 May 2023 03:53:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ52eaPuEynkxwl1B2TpTh7ZEdTKB7jUWpWjO34Iz9wQySQMYNvASnhumxU8oZFy3JEteA0Osw==
X-Received: by 2002:a17:907:70d:b0:94b:d57e:9d4b with SMTP id
 xb13-20020a170907070d00b0094bd57e9d4bmr10854143ejb.2.1683629591229; 
 Tue, 09 May 2023 03:53:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 hb38-20020a170907162600b009661cf921b4sm1132839ejc.202.2023.05.09.03.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 03:53:10 -0700 (PDT)
Message-ID: <70da6b28-d731-7e3b-b5a6-7d9983389d57@redhat.com>
Date: Tue, 9 May 2023 12:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
 <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
 <CAFEAcA-Cfz8CkNeTQodoSitocBmm4ddk25Dq8x=5FiiGvaS34Q@mail.gmail.com>
 <e7185f74-f041-05b1-0f76-bab6d724e796@redhat.com> <878re4cl1u.fsf@suse.de>
 <CABgObfYYFfGk2X6M5MxbEbVqCYOp1Km53xkTNrfHwkK=aZOpyw@mail.gmail.com>
 <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
 <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
 <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA9h2JKPeMinDFqsJ_5wN1rtAfr6YSSbfyf6JK9ohdxXmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.802, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/9/23 12:00, Peter Maydell wrote:
> On Tue, 9 May 2023 at 10:42, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 5/9/23 11:27, Peter Maydell wrote:
>>> On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>> --without-default-devices is not about choosing to not build
>>>> some devices; it is about making non-selected devices opt-in
>>>> rather than opt-out.
>>>
>>> Hmm, so it's basically "the person doing the configuration needs
>>> to know what they're doing, the Kconfig system will give them
>>> no hints about what devices might or might not be needed to
>>> make machine type M functional" ?
>>
>> It depends on what you mean by functional.  I would say you do get what
>> is needed to have a functional machine, but not what is needed to have a
>> useful machine.
> 
> If you need to pass '-nodefaults' to get the thing to start up at
> all, that seems to be stretching the definition of "functional"
> to me.

Then, an accurate description that uses "functional" in that sense could 
be as follows:

The Kconfig system will include any devices and subsystems that are 
mandatory for a given machine type, and will flag any configuration 
conflicts. However, the person doing the configuration still needs to 
know which devices are needed (on top of the mandatory ones) to obtain a 
functional guest, and Kconfig will not provide any hints in this respect.

Paolo


