Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8565A41ECEC
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 14:07:26 +0200 (CEST)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWHK1-00050D-15
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 08:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWHHd-0003wj-A5
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:04:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mWHHZ-0008P0-Ne
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633089892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYRYt8/CZg+0MPT/TUOTqSvKft31dVtxFPy95NLE0Ok=;
 b=f1AeMbtDtWA9Mf5CPOdg6efRrWl2u/J+cwPZKKIJuFiJB2gBWm5JdptPstrIPCCkS3kZEh
 q2HI2I4z0Bq0Zz/R4daDYXTMcAscQb5g3xwVT7e6IhjYnUwwPiECkBO0K9VEd3MPTd28RT
 XJvtbA+pSpuBoP3SZDtyvrU7kyQ+GG4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-iPUvubn_OcyCxtwszWBGLg-1; Fri, 01 Oct 2021 08:04:51 -0400
X-MC-Unique: iPUvubn_OcyCxtwszWBGLg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so5892146wmq.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 05:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FYRYt8/CZg+0MPT/TUOTqSvKft31dVtxFPy95NLE0Ok=;
 b=3RDov568n3Z3JB5iX5rkiNB0wh3eFaucNzqKBy7ZwkEX5Kp2RkWs5Tu0wRmfFoWBL2
 GpcIl5YyFUmcL0u1xc0Vorms5aR2nKX7QYdzHLnJ7eYhsEaUAl7U9QS9XT43/NXl5gGX
 2FHNbC6OgZBm9BDjlHHbeT4TTe4RKPR8HrmcOtZgw3TurQtJelc78hqVVprwfxG8tLcN
 C4tltB3knP/F/xVMvomfq0pzaCPQzAUDeQ/1aMgMhqogUQx29gT3Be/Ym2aCGVvWmkRJ
 cvkdYgYDBTpKG7t10HzfNo5H80g78YiUAcpUOAeRZzoIGJG5DzQiEIEFvkq4cWET+x1P
 ZxEQ==
X-Gm-Message-State: AOAM530tHc/8R5Sg7edobgfDDHL0uk9SXE+TJTLSsLMJqbA9y4CbaaFP
 2DeEdd+L5n/rKO3xjc71mbkbqaTzwPUYOOUX0dNmeBIy/UXd1/1yj3QMadmQochRL49nz2uUlwk
 bouGocmRoP9OQpEs=
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr11696270wro.189.1633089890636; 
 Fri, 01 Oct 2021 05:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZI+zU/oX6w1mrZVVInWyMzuK1oz40rt5WL2Sm9zxAxgNWI9tGZwOIFQVij/FH6VDbaz1yQw==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr11696233wro.189.1633089890450; 
 Fri, 01 Oct 2021 05:04:50 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-75.customers.d1-online.com.
 [80.187.97.75])
 by smtp.gmail.com with ESMTPSA id o1sm6003104wmq.26.2021.10.01.05.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 05:04:49 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
Date: Fri, 1 Oct 2021 14:04:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.127, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/10/2021 13.12, Peter Maydell wrote:
> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>> Nevertheless, as long as nobody has a hint where to find that
>> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as far as I
>> can see, they do not work without the bios at all, so it's also not possible
>> to use a Linux image with the "-kernel" CLI option directly).
> 
> It is at least in theory possible to run bare-metal code on
> either board, by passing either a pflash or a bios argument.

True. I did some more research, and seems like there was once support for 
those boards in u-boot, but it got removed there a couple of years ago already:

https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf

https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b

https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37

> But I agree that there seem to be no signs of anybody actually
> successfully using these boards for anything, so we should
> deprecate-and-delete them.

Yes, let's mark them as deprecated now ... if someone still uses them and 
speaks up, we can still revert the deprecation again.

  Thomas


