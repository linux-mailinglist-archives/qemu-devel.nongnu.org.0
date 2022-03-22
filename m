Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B30B4E3ADC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:41:34 +0100 (CET)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWa57-0007I7-6I
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:41:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWa0o-00051D-UY
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:37:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWa0n-0004Hn-E2
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647938224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5D0OYG1THuZQECXxvjEJwD9mjgQ2dQzrlORgqv+nuI=;
 b=Q3qu8yIPURPXQ5PWHnblPEyhiMuLBko/fmPIu9A6U9hkR+oeuDbDb2nbomo1SegFTgzBB1
 PqmqZ7xpEvVfGQun/ZVAODHfPhZVmc3MsdXbxf78O6LF1yD5xpbX4per7T3P5Mpi2onxph
 157oaAJHtGBihvwU/x+1DG3nXGUnXUs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-EQdH_bsRODisQMsxP5iQdw-1; Tue, 22 Mar 2022 04:37:03 -0400
X-MC-Unique: EQdH_bsRODisQMsxP5iQdw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so840714wmr.0
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=F5D0OYG1THuZQECXxvjEJwD9mjgQ2dQzrlORgqv+nuI=;
 b=ax/TeWYxWVj9IfDcRVYErIuWEWfjsmShAA1K2lt+3oMLTuJ50d6HosOgIdAus1Pdms
 wG/17Vz8ewY0wPW6HOWalAEBncBnz9KQuhnvsS3EPLgfNNLkp/JYdqnZ6Jth/FC5a5Ym
 ClZKoYqIRRvsCgSTmIeLnSfGKwql8HNfc37uhfla6JSTViS8r3UkaD+/mnIRfbeN9M8t
 LS2Fb5XKv5R6aqi3Rg2HpeDuJJpV2U67IA2Vf3zc+OvViFB/J+JC+FaTjBq1vKxA0fGm
 ea8gIlu91yaRYY2XCmCL3887VpDOhkZNf8E7UH8KHlmzxwDBoZUa3aWn3YZnyihoiVxH
 fWHg==
X-Gm-Message-State: AOAM530Nviyx4bfKwgo7Cy0DP2tBV/2RF77wSLM4v70IbxhEqmoPfZmh
 3kqV0muH4fcauCbMKF2REglHbMTQcSWvB+slUyUrUtF2/1QAjUkUYEEGt4XaeMXfLCOEDifj5YN
 xihgV8aB4ruNr9xA=
X-Received: by 2002:a05:600c:4ec9:b0:38c:9146:563 with SMTP id
 g9-20020a05600c4ec900b0038c91460563mr2649474wmq.198.1647938222493; 
 Tue, 22 Mar 2022 01:37:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmG4I6fauWUBscRPvY8oTc+CkKmNAY8BM8CBxG7o8IvjrIu+Uo2OPOILh2TM8aT3DD68DasA==
X-Received: by 2002:a05:600c:4ec9:b0:38c:9146:563 with SMTP id
 g9-20020a05600c4ec900b0038c91460563mr2649460wmq.198.1647938222318; 
 Tue, 22 Mar 2022 01:37:02 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a1ca102000000b0038c78fdd59asm1352439wme.39.2022.03.22.01.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:37:01 -0700 (PDT)
Message-ID: <8bf5cb89-34c8-f1f2-31f2-beea5336ba35@redhat.com>
Date: Tue, 22 Mar 2022 09:37:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: Memory leak in via_isa_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
 <067ebb15-593b-4b9e-26d6-a4d98db4fd5c@kaod.org>
 <CAFEAcA-hQt7fGU7Lm=N+jkXunsekJy15s=xVWBBnoEuDDM30yg@mail.gmail.com>
 <4bd52c83-a4c8-ead6-1210-a5e464c32196@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4bd52c83-a4c8-ead6-1210-a5e464c32196@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2022 09.23, Mark Cave-Ayland wrote:
[...]
> but the main blocker for me was not being able to test all the different PPC 
> machine configurations.

I think the best you can do is to run the avocado tests:

  make check-venv
  ./tests/venv/bin/avocado run -t arch:ppc64 tests/avocado/
  ./tests/venv/bin/avocado run -t arch:ppc tests/avocado/

That tests at least that the machines mpc8544ds, prep, virtex-ml507, bamboo, 
ref405ep, ppce500, powernv, g3beige and mac99 are basically still working, 
which is IMHO a good set already.

> Out of curiosity does anyone know how to test the KVM in-kernel OpenPIC 
> implementation in hw/intc/openpic_kvm.c? It seems to be used for e500 only.

I guess you need some old real e500 silicon to test this...?

  Thomas


