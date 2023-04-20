Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6436E9C7D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 21:33:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppa1T-0004Bg-Ar; Thu, 20 Apr 2023 15:32:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppa1S-00047T-6G
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 15:32:50 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppa1Q-00008x-Sc
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 15:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nziPSwxD9P1PC8koEnW5tokodVBC4Pkl7La1gSC2lpM=; b=eug9Ml5ntHnxKF9P9KGBOzZ7pc
 Z9yxwQKStfpTJQXBjwBVMDeN39fmnh9OS+ldZ4TCazK2nI7ekvplH3RLqN1WEsuYcVh5ZuheGYSEV
 MaTF29h2yVFyFvT6wfgg6W5dYg/5SNINn4rLXmnJhEYkQTRMEOCE0qOdAUhbczmGL6qEKcConzoem
 wJRN0Es9RMq88QSInnJ+yaU4sGEYVAYJLK8ZJz9Edj//7O27jQ2dk0K0NIuDVFUr+YHi19oiPf3IS
 M42t6CB6ivZxUUZ8rlYmrLA/72U0jKW62QNjEcauuD96UpXzpxMDfJwkCqSkTFvcAzo/mUPAaMy+w
 EvsFTp6ocqRqj0w3c8lbpEISenN1bZkfr+o2NGzGGqxcmszSXx77WcW7nrPPX6PpSh5aoYjoOUnhD
 L9gDQxm0gEThvZ1h7Bm7rpRM1xPQaI2vUyStgyl8liUJeGJ3yo8M46ACHQe9CFeAwGnoIz5RR5M5a
 3wFCreaY3WIoer2B0y8wpBj/yDBeBPZRJoapnw91k9LpAKoUR2WDMGkRHsD6ogvgpG+tVISNX1Yks
 mvbkKSEcNNgYNn9Y9mLB82Q64qsY86vTqP7KEeR5hVGMYRwjYJFHaXXDiW84jZNnLKB7ODrDqY6n5
 up27ZPLF2MmI+jEC9Y9/3WN/2yOA24g/OOylqZIb0=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppa0P-00024J-Sz; Thu, 20 Apr 2023 20:31:49 +0100
Message-ID: <6dcae2f9-9b0e-06a8-40fb-e4fec583e54e@ilande.co.uk>
Date: Thu, 20 Apr 2023 20:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-9-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230420155723.1711048-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 8/9] docs/devel: mention the spacing requirement for QOM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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

On 20/04/2023 16:57, Alex Bennée wrote:

> We have a more complete document on QOM but we should at least mention
> the style requirements in the style guide.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   docs/devel/qom.rst   |  2 ++
>   docs/devel/style.rst | 29 +++++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)
> 
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index 3e34b07c98..c9237950d0 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -1,3 +1,5 @@
> +.. _qom:
> +
>   ===========================
>   The QEMU Object Model (QOM)
>   ===========================
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 5bc6f2f095..0bd01f3fca 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -628,6 +628,35 @@ are still some caveats to beware of
>   QEMU Specific Idioms
>   ********************
>   
> +QEMU Object Model Declarations
> +==============================
> +
> +The QEMU Object Model (QOM) provides a framework for handling objects
> +in the base C language. The first declaration of a storage or class
> +structure should always be the parent and leave a visual space between
> +that declaration and the new code.
> +
> +.. code-block:: c
> +
> +    typedef struct MyDeviceState {
> +        DeviceState parent_obj;
> +
> +        /* Properties */
> +        int prop_a;
> +        char *prob_b;
> +        /* Other stuff */
> +        int internal_state;
> +    } MyDeviceState;
> +
> +    typedef struct MyDeviceClass {
> +        ObjectClass parent_class;

This one should be DeviceClass in this particular example.

> +        void (*new_fn1)(void);
> +        bool (*new_fn2)(CPUState *);
> +   } MyDeviceClass;
> +
> +See :ref:`qom` for more details.

A couple of points:

1) It is probably worth removing the typedefs given that they are handled by the 
various QOM macros

2) There should be mention of the fixed names "parent_obj" and "parent_class" for
the first declaration.

How about something like this:


QEMU Object Model Declarations
==============================

The QEMU Object Model (QOM) provides a framework for handling objects
in the base C language. The first declaration of a storage or class
structure should always be the parent and leave a visual space between
that declaration and the new code.

For a storage structure the first declaration should always be called
"parent_obj" and for a class structure the first member should always
be called "parent_class" as below:

.. code-block:: c

     struct MyDeviceState {
         DeviceState parent_obj;

         /* Properties */
         int prop_a;
         char *prob_b;
         /* Other stuff */
         int internal_state;
     };

     struct MyDeviceClass {
         DeviceClass parent_class;

         void (*new_fn1)(void);
         bool (*new_fn2)(CPUState *);
     };

Note that there is no need to provide typedefs for QOM structures since these are 
generated automatically by the QOM declaration macros. See :ref:`qom` for more details.


ATB,

Mark.

