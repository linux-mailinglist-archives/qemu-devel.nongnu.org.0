Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56258551117
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:13:32 +0200 (CEST)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3BbH-0006Rb-DQ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3BYf-0004l6-6c
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:10:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o3BYX-0007Xu-B4
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655709037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuIBePAIZVrsmPqUFnAzXgMzT/84qWitRLhhiVeTIh0=;
 b=UnDAJrkS52tfhME8FJ8XTFOMNa0nWCoR6fBUFuJtwq73gfsqubidXOYYQe/DhMvXYD5yzl
 3nIG5JUvRN24uyFzBUlLPyZ1IHeHEinBd4Xbu1QMGhdfhOAXiwAIV3NQEYojuEgEI0r42R
 ZBg5EorHzCoX6Avvc9jKCUyzaGJecIM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-QlcvmSjhPteWKjdQa0BJMg-1; Mon, 20 Jun 2022 03:10:28 -0400
X-MC-Unique: QlcvmSjhPteWKjdQa0BJMg-1
Received: by mail-wr1-f71.google.com with SMTP id
 bv8-20020a0560001f0800b002183c5d5c26so2152400wrb.20
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 00:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=LuIBePAIZVrsmPqUFnAzXgMzT/84qWitRLhhiVeTIh0=;
 b=xYz43/U4na8tGefzsReVAkJ9g6g95Jha2ejJs/vY3M4X5IjQ2yADyyfwP2M2XdvcIs
 g82NQTD903v/cBp7eMIOKIMIlqHMAQYvDJD45zqZGAx8i8x+2On0fwYWdDfXxioHF+2F
 977bqnaaIoDCvLIVeDq6ta64vQz47UhyQ72fkGn0Nb0klefxux7pfZxvvy8E4z1iPUXx
 DFFpsvuFPse1oYCxL+MIPtefuoITltbB1iqcegor95af1WNw3Krv6VAmcYAeH05UWHJC
 xLTCFsdsuRnsILJnDbngWpT1zpQntxG6nDUq2ZXGGOWdYmR37yUsXgy6h5Iw+wU1Uriw
 IJAQ==
X-Gm-Message-State: AJIora/3GHTUUQrsBIMxCmRqrgzxoJIVaW8ls3/aSwGhCCMBZt4Vt13J
 zwqwUh6JBOVR+LgERjDKDwX+SuN+ismUssuvA4zgnamYlvwwaz/BBjfewuFfC4JncJlINux9w5x
 k3LEv87aRCq9ATOc=
X-Received: by 2002:a05:6000:990:b0:21b:90e6:42ad with SMTP id
 by16-20020a056000099000b0021b90e642admr2454210wrb.491.1655709026889; 
 Mon, 20 Jun 2022 00:10:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uM7qr5/r+/iejKoom7ZNT3p15ebWd2Oi4svlgrtf4MPPTn7v9Bov1t5VEII7YNj1d0rKHMWA==
X-Received: by 2002:a05:6000:990:b0:21b:90e6:42ad with SMTP id
 by16-20020a056000099000b0021b90e642admr2454195wrb.491.1655709026697; 
 Mon, 20 Jun 2022 00:10:26 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-241.web.vodafone.de.
 [109.43.178.241]) by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b0039c747a1e8fsm19288820wmi.7.2022.06.20.00.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 00:10:26 -0700 (PDT)
Message-ID: <89d6b974-667e-d331-7f55-0ab71a117e13@redhat.com>
Date: Mon, 20 Jun 2022 09:10:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: TCG development tools?
Content-Language: en-US
To: Kenneth Adam Miller <kennethadammiller@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAK7rcp8M=B0PmvZ4FnXNAnSh5TuvxNA4aKXJ8+JF06XogMmsEg@mail.gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAK7rcp8M=B0PmvZ4FnXNAnSh5TuvxNA4aKXJ8+JF06XogMmsEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 19/06/2022 05.34, Kenneth Adam Miller wrote:
> Hello all,
> 
> Suppose I am wanting to implement and test for the TCG. Is there any set of 
> interactive binaries or other things that I could use to work with it? Could 
> I open a shell to it?  Perhaps feed it specific byte sequences for tests to 
> ensure correct operation? Are there a canonical set of unit tests that 
> exercise the TCG that each architecture implements?

We've got a bunch of TCG-related tests in the tests/tcg/ , so I suggest you 
start with these.

  HTH,
   Thomas


