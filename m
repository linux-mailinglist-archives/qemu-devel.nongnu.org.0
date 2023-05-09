Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2906FC302
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:43:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJrj-0001Pz-Gt; Tue, 09 May 2023 05:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJri-0001PK-4q
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:42:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwJrg-0003yJ-MD
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:42:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683625356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzyzsRyc9yht/HJanfsUPJ0wkeEzXXSIdJZxKgl9dkA=;
 b=So2hkLd+thyYq9+dd3dFnaxJPfmX2UYKsbqITkovGV2K7qC/dKpZmfcujDZjqNN8TrOdgG
 qc2XrgHJI6DHonqSixsNUgD7Tm/RsvfzWVlTdJ7drDFiSxNM/HxxZfaHHnRfTdynfHep6k
 PkWEJ9n5AHOcBMoASZMgSfC5Lh6Ytcg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-Lw1CPnKyNPeL-KZVKgpjDQ-1; Tue, 09 May 2023 05:42:34 -0400
X-MC-Unique: Lw1CPnKyNPeL-KZVKgpjDQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a341ee4fcso700070366b.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 02:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683625353; x=1686217353;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pzyzsRyc9yht/HJanfsUPJ0wkeEzXXSIdJZxKgl9dkA=;
 b=UT1oKqhQ6i06PjyJO+OAPzcK9CMmcDOLwfF1kz2H0BzLad3PMkFZcDjIr2yJQq7hr7
 k3LOcOLMyWgh1IW8S9sraCydfQxWzZgYMfCbX2wVltohduCYiQ3kuXH0IpPEDF0XGSOS
 0oiz6nf8X/vrVm0sgzZ526z3E7sVjwHrHoMYt5/LwIUoKHrXUuVCVkroTaprZ4C4AK9t
 ZNX/Xt/iVnupRz9HUHnWFHwU86BydFwUIj3/PwdNqgXuwPw3gPKi9n8dt2mkYtBLZCXi
 KZsFDXPvSvi2kjahuUPP1p9138yz8CeBWWOEBWarKRXdxFV/cGlSMsUj2RgXEg7nLEZI
 9FjQ==
X-Gm-Message-State: AC+VfDzZYlroJ+sgOak6wAMqDxLbLeaEJSmBHUXt7qHtIlpyTkqYXSfl
 jcuZHvxZ6CXVfvLDM3xANlam3LNczz5+xWmEC/qPysxa3vEXOAVEzucxQr0UUnftRBjCYQcHZDq
 9vWCMgAZhKiU3er4=
X-Received: by 2002:a17:907:7d8e:b0:94f:19b5:bafd with SMTP id
 oz14-20020a1709077d8e00b0094f19b5bafdmr12929614ejc.42.1683625353687; 
 Tue, 09 May 2023 02:42:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4kvN4wIUwFWzeAMy75kdILN4njpJmeQFZ4B4MvOg2pwbbbXEXnIhSF3By2Aucp5dSqB4u49Q==
X-Received: by 2002:a17:907:7d8e:b0:94f:19b5:bafd with SMTP id
 oz14-20020a1709077d8e00b0094f19b5bafdmr12929573ejc.42.1683625353292; 
 Tue, 09 May 2023 02:42:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a17090665c600b00968382ebf40sm1100404ejn.40.2023.05.09.02.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 02:42:32 -0700 (PDT)
Message-ID: <c4545a92-8e37-a916-9f1e-ef537dcb1e06@redhat.com>
Date: Tue, 9 May 2023 11:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
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
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA91kfdgP3GD8OzgpePX6yXxsLZgARfsNhjY8WyEtKwUuA@mail.gmail.com>
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

On 5/9/23 11:27, Peter Maydell wrote:
> On Mon, 8 May 2023 at 23:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> --without-default-devices is not about choosing to not build
>> some devices; it is about making non-selected devices opt-in
>> rather than opt-out.
> 
> Hmm, so it's basically "the person doing the configuration needs
> to know what they're doing, the Kconfig system will give them
> no hints about what devices might or might not be needed to
> make machine type M functional" ?

It depends on what you mean by functional.  I would say you do get what 
is needed to have a functional machine, but not what is needed to have a 
useful machine.

But typically the latter is the easier of the two, because you should 
have an idea of what -devices are useful *to you*.

Paolo


