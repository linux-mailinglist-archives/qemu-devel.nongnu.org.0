Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D831E6EF071
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 10:49:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1praqB-00079H-DC; Wed, 26 Apr 2023 04:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1praq9-00078m-NR; Wed, 26 Apr 2023 04:49:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1praq7-0007KA-Fk; Wed, 26 Apr 2023 04:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QzaTlj7aaKqMOtoDFQwtRqe+WfbslHGv7qaI4vH121Q=; b=f/hhWTNGPhi/SkTcWy/9HrrfCc
 Umevjt1l0MUeGra4lN7B2fpA+PfbvilSy/NDRBvbyar/gjd90LNBZp8qmZRuRJXGK6piMG41ZrLbH
 ZkCK5crdL+chheMwekDpac2vZyoUsEap+KpxHT2ZDTvSIdGFbJBsGWvozczbVKKUspvTyGNIvrSYb
 cpFbyuzMHmlvj2dvAyB344GarAAKem0Pq9GenxX0WCr9vCkWenkWPOdK+8gIVWrL25kkKAY9ZHAEa
 ytHWnV/bijeAzUrGvLp515mC/Ch50k3tUfwGfR8Ct2sEBXNIsVZkw3py42XgUSnrbViuHr4+BHqZH
 i0qxh+2BLcxyL8t5bS1g2VFMBnOuhRi4ecHWHpux3u8Aqj3z/yf4mxfFUdl0cfZ9asVOfYq7BAdCI
 QhLPkLJhjNou49JRzo+g6hQPsyZOxbVnVi6ZpI/YbMUghjLKjd68dDkgBizYjRSsdIDW9Rjw6V0rp
 GWVR/EXmlmwEgGDeA2YhAOIKYyW2XFEDTIP4Dn7GQBoJqw0o5FrKuQ7RBESQ8luvGFjbvNtmookUb
 OQWvEuBHEOLMbrMZLUGNBTaLM3/mMyP2rxDoKqtL1DfO31PGpex8g8o0W6NEXdR0ExjZi1IMV9oMF
 LlY0f0ccoRsg+9BQ7pI7XOp/govtsbqlsDZBuiU6A=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1praof-0000p5-Sf; Wed, 26 Apr 2023 09:48:01 +0100
Message-ID: <495a50b5-e8fe-a3b6-1f25-c8b7e94f658c@ilande.co.uk>
Date: Wed, 26 Apr 2023 09:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
 <20230424092249.58552-18-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230424092249.58552-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 17/18] docs/devel: mention the spacing requirement for QOM
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 24/04/2023 10:22, Alex Bennée wrote:

> We have a more complete document on QOM but we should at least mention
> the style requirements in the style guide.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Message-Id: <20230420155723.1711048-9-alex.bennee@linaro.org>
> 
> ---
> vppr:
>    - use Mark's formulation, briefly mention property separation.
> ---
>   docs/devel/qom.rst   |  2 ++
>   docs/devel/style.rst | 40 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)
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
> index 5bc6f2f095..e9fce0fc69 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -628,6 +628,46 @@ are still some caveats to beware of
>   QEMU Specific Idioms
>   ********************
>   
> +QEMU Object Model Declarations
> +==============================
> +
> +QEMU Object Model Declarations
> +==============================

Accidental repetition here :)

> +The QEMU Object Model (QOM) provides a framework for handling objects
> +in the base C language. The first declaration of a storage or class
> +structure should always be the parent and leave a visual space between
> +that declaration and the new code. It is also useful to separate
> +backing for properties (options driven by the user) and internal state
> +to make navigation easier.
> +
> +For a storage structure the first declaration should always be called
> +"parent_obj" and for a class structure the first member should always
> +be called "parent_class" as below:
> +
> +.. code-block:: c
> +
> +    struct MyDeviceState {
> +        DeviceState parent_obj;
> +
> +        /* Properties */
> +        int prop_a;
> +        char *prop_b;
> +        /* Other stuff */
> +        int internal_state;
> +    };
> +
> +    struct MyDeviceClass {
> +        DeviceClass parent_class;
> +
> +        void (*new_fn1)(void);
> +        bool (*new_fn2)(CPUState *);
> +    };
> +
> +Note that there is no need to provide typedefs for QOM structures
> +since these are generated automatically by the QOM declaration macros.
> +See :ref:`qom` for more details.
> +
>   Error handling and reporting
>   ============================

Otherwise:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

