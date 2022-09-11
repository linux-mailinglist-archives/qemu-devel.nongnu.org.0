Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57B5B5037
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 19:17:47 +0200 (CEST)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXQaX-0001iC-SP
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 13:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXQXn-0008Ti-Dl; Sun, 11 Sep 2022 13:14:55 -0400
Received: from mout.gmx.net ([212.227.17.22]:39953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oXQXl-00029n-KJ; Sun, 11 Sep 2022 13:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662916487;
 bh=sGIkN2uJw1fRY3SQ/frt0dmBwysZtmT4DJA0rQwJ5Es=;
 h=X-UI-Sender-Class:Date:From:Subject:To:Cc:References:In-Reply-To;
 b=c8X3gRVyfsU65kGqkt78WSSnblI0CTmMHBAhOzE6CGW2J/7AhadcUqqaLtlCpKiEm
 K4OSEWnviKad4sQVrq7KOYlEs4rXiNf/Jt85sRYNR494YnrBsHqN+uDwiwsTElWI9K
 aYjZnkoHxl38Rmkpl0J0IWG5Rr1qZjZD2WvzDEU0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([178.8.103.147]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK0X-1pOhgU1aPh-00rKw0; Sun, 11
 Sep 2022 19:14:47 +0200
Message-ID: <1bd4abdc-e0db-1fa6-99ba-84b729e5cb22@gmx.de>
Date: Sun, 11 Sep 2022 19:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arwed Meyer <arwed.meyer@gmx.de>
Subject: Re: [PATCH v2 1/5] msmouse: Handle mouse reset
Content-Language: de-DE
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-2-arwed.meyer@gmx.de>
 <CAFEAcA_F+ETYHT-HSs3wHwjqP4CEe2LtdfCf8B_P2Ted4xvk+w@mail.gmail.com>
In-Reply-To: <CAFEAcA_F+ETYHT-HSs3wHwjqP4CEe2LtdfCf8B_P2Ted4xvk+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1GKxZ34+czQnlB67oZY2PH+9Z5M3pGqWe7+zow2Ec84oIrUvIAP
 0EgJGzYODukXo+bXycTcNKKqa+LY7bmweqGSliAkVuU8vmJkv7l8zxuE/Un+TwaY5H1nEO9
 mCg22RIgZdxhcI/N2xdOsKQeAs+yA9KHazwif8C/ZlxoigXuxB6j2zH8r/3Qf0XTRGU1oTL
 5/wgcuJ0WfHysFynflBzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JuTPDHCQmiE=:RWg9Is2iznQI39FH2QzT6w
 7dmofhEM5FwfmAtwPDMbJl/MWG5F0uNCC4autoH1vlEu7ymyUhNE3jSzaE7AE7LeZGk0kbe+p
 QVr5LIauasnk6F4gKH0q2URPcUAgBRpwhLHRIBhWr4WORqf5RWvTACW+H7xRPKVF8+YFd0lR/
 40SCtMH/CI/4KVm5j3/5SsfkJTCUh4a24hEeXqGIAZzzZBZziExbFaJM15MpDGIRAUx3aHM5r
 jec3rhq4GgpqBbI/vHpDbpNzRTCrspjm1ILG100EZNp6+HLD2KtaI7ukN+6boopMHa1Jzefn2
 iNBxaFhqq5XwRX/YfTVoMSq1vu3IZb74LFYlam8rSa/fd4u6vQ/Bb7IDXwMf5mUiKRKEeaYeL
 YGokJFqy58BjV2qox7w9wyI2I2gVy85jFQGvI87BfSw0sUYtlmxVxZDE69Jny1kppG+dEQmqc
 RBY2Br+mGoFaVMeFq+X0nHX9ngEorrfntzmv/wfK1fJDdY1m+Jz+TJgXGS8j6qRba/VA3ba2H
 XX6Os1pKp9Xlb4MohGH3DARiY5lTX/+KxTHCjJsUoGe/5G0bQ7JZGXaKrOafb9hnvV1+/oRkt
 4OthATf9c4pvw6jLSEsK3AIUpyqEZcSEPpxqEQ+qKqJwCORK/6Yl7i0WkRc3kj3U4cqD9L5uk
 MyXjjHVN0Vg0wKQ9cE3bJReAhMcDQhuGx/2L37k/SpdlPxE+qpgqy7GHCnpw41H0HFQH6M0nj
 4J6vRyOb28ttDXv0WH4xMrarayDwUJoK7VtINZXhUitOsU0+TDw8JjIc6kcW/uknUarBvvmTo
 wcegNPCS73I+WVURHtGU+s/XOgV0C7NxEt1E2KS674MWHW5+Y8r0BC0RlAv3OLn4CHC5LGz9R
 JtPhd3HhJCVbZ0H9Zf07zWiIbMZkZOJ7OF5uhz9RUFggUF/4Gn8bHZzlWgN4Vo4TRMUs0lLdY
 m0c6WzTVj9Y++6getc2drux26iJBW6TLhPRmlmtRhfgOB1nlo3HwmroC+tncAo0bVzKIWyZbm
 ZFkT5oln3gySUyTZUSkzSh+JIt7uT9sJFmiVHS8WN7RaGEeC9/8EpIIYES0yUvCPlyeQEeofo
 qZS/bqsKUflRyHov7juRRKkw9wWqwGBzerhJqoRM85IpEb97HhAJG6Q69zOm4x/cvIAIRAuSE
 Dj3yF4CiQgh1qqP6P2mSEVibgH
Received-SPF: pass client-ip=212.227.17.22; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.101,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.09.22 um 23:11 schrieb Peter Maydell:
> On Thu, 8 Sept 2022 at 18:43, Arwed Meyer <arwed.meyer@gmx.de> wrote:
>>
>> Detect mouse reset via RTS or DTR line:
>> Don't send or process anything while in reset.
>> When coming out of reset, send ID sequence first thing.
>> This allows msmouse to be detected by common mouse drivers.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
>> Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de>
>
> How does this work across migration? There doesn't seem
> to be anything that handles migration of the existing
> state inside the MouseChardev either, though...
>
> -- PMM
Hi,

can you please explain in more detail what you don't understand and what
you mean by "migration"?

