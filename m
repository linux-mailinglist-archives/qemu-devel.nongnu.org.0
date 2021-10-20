Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8043434C39
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:38:29 +0200 (CEST)
Received: from localhost ([::1]:58348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdBnY-00084x-Tq
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdBki-00068l-OX
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mdBkd-0005U9-FA
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634736925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iLGCXiI5YVNqIF8c2pZOMlTM6ud6NAfRiLFszeSsWXs=;
 b=EcjNpcOv72y7eq6/bAmRU7TNM4bR5FHtrRfmGbquDDaENioVbEXnFbSk8SeIgtKvs/vUky
 tELmIB6I2saRRbHxB2ryZwdcNFb0JXXfu/AEjgZ5EMc64rerrFZpw4z/XOSJrQbbfQNtED
 yBwnArat2rafgC2At9cgOep41goB0es=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-MdDEcs_nNieFgxESvVlLMQ-1; Wed, 20 Oct 2021 09:35:21 -0400
X-MC-Unique: MdDEcs_nNieFgxESvVlLMQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so21015807edq.6
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 06:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iLGCXiI5YVNqIF8c2pZOMlTM6ud6NAfRiLFszeSsWXs=;
 b=FqSZE9Mxzr6P7NYrTioFLM1OlKEcdpsyggMLXCzWpJUR8YRH+rwkOKTj3fbJivnGBk
 w9frbplGB9PDAjpYchuNVYCFXc0CFm5CSglybyFdp+wRlwouyLbYW5GIGbfa8hdgCCR9
 zhAvPxztHIed3UNCJ7C/ieNqFJ8ri/8vjK3rwGnBIWhvjKxzLmwDCMt1f16V9FVOSZE4
 pRqu3Fa2jJnkQkVqXSTOhBXqqvggmm+IRB+hIpiLU4Ey4UZFUphf0Rkoqxkuc6CrD5VC
 cf7iASUX0NQpsmjCnSOK5uX0/kP1LM1k5fQRr3xPs1w/lRvjRW1zYR2VuAQsfM1pq8uT
 LY8A==
X-Gm-Message-State: AOAM531agZXDeKd7TJlJIOZLee07U/HCjwD1FRpcEhSdDAyGv5Xr6toh
 bKfsnvLsIoTeO5x1kkp9N6zq4Hkc60TYr6BG9pfA/3CHVFrIc9Gh7wgm7YgjWSP+yXthvPJeFUv
 SWPPEkoSTo610Fc8=
X-Received: by 2002:a17:907:e9f:: with SMTP id
 ho31mr8005895ejc.156.1634736920042; 
 Wed, 20 Oct 2021 06:35:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyeNU+fsbeACCF3ihtL1bxhLx0eQJy6hLREiCCppDvqpW3LP1U8sZ69gI8le5SThquLir7wg==
X-Received: by 2002:a17:907:e9f:: with SMTP id
 ho31mr8005842ejc.156.1634736919646; 
 Wed, 20 Oct 2021 06:35:19 -0700 (PDT)
Received: from thuth.remote.csb (tmo-097-184.customers.d1-online.com.
 [80.187.97.184])
 by smtp.gmail.com with ESMTPSA id l19sm1330997edb.65.2021.10.20.06.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:35:18 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
 <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
 <939f2d12-38f6-4ab0-b688-384136d1d9c@eik.bme.hu>
 <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <03d047aa-6d73-8697-ac43-29ab56563567@redhat.com>
Date: Wed, 20 Oct 2021 15:35:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 14.43, Cédric Le Goater wrote:

> The 405 machine are still close to deprecation I think. We are still
> struggling to boot one with mainline Linux, using uboot provided by
> Thomas which skips SDRAM init. It is not clear to me if u-boot is
> strictly necessary. It depends if Linux relies on it to do some
> pre-initialization of HW. I guess once we find a good DTS for it, or
> not, we can take a decision.

FWIW, seems like this tarball contains a dts for a "taihushui" 405ep board:

https://dev.archive.openwrt.org/raw-attachment/ticket/4153/kolsch.tranzeo.openwrt.bsp.tar.bz2

... I wonder whether that's the same board as the "taihu" board in QEMU?

  Thomas


