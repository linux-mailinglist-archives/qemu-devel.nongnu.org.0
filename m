Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849C3439ACB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 17:49:36 +0200 (CEST)
Received: from localhost ([::1]:46682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf2EB-00074U-3j
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 11:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf2CO-0005nH-2i
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 11:47:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mf2CJ-0004NJ-4h
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 11:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635176857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OllWm8tBhSCHCLDATZBw+EdX2LqIkuJejncPaP6xydA=;
 b=YkRe/GhVaFBn1heJX/siI9c/LyXq106ybX62yHO179MCPaej1UIOpjunJ+ovJl4x9p8OW2
 lbG5g3ljUwb5Rp5vD4sFtUY8zH4WyOo/mLFyyuOMeN2yv7/EeVGkox+fWw36HPVer8HjZn
 Bn6oxrZ8UQOMBUScgehUs6JkJ5SEWrA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-SpbDfxbnNq-qGRrrKTuiBQ-1; Mon, 25 Oct 2021 11:47:35 -0400
X-MC-Unique: SpbDfxbnNq-qGRrrKTuiBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 205-20020a1c01d6000000b0032ca8044e20so2534837wmb.6
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 08:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OllWm8tBhSCHCLDATZBw+EdX2LqIkuJejncPaP6xydA=;
 b=pGxef4MdR1vuquYA4ec4rR0Xs8daipMiHVjn1eFMvA2MJMJrpHeC/Isl1gogWmef1U
 xi81TAY/Gh3jRCdEMJcTtDXkLWESp39bCTr9a2whBezbn5hoLHAUf3MVJiFjZqv/+Hgu
 WmtHse7IqNF8xHOGtVf1G3Smae9rd2ohMJx7dFvrsKCaoEVppFkEdqliNincKZFW2eSc
 VaUC3Be80Zl7Q4aoLP3kyO3ZnkuFLvJ5vETgAPwEgRv6ru+/0sjQrDNLmQj9LEaC2HDG
 INCCtaVSQmCHb+D8PAEvWRg9hx7nfzwTSGM2gAyjQ2c9X6v0Xpf1sSNHZ1KnvhlMQaFk
 4d0g==
X-Gm-Message-State: AOAM531jyQxolaWfsbA1JM0L75rGbc9ojxOEgYNEQhA6JxL7Zuy8CZCT
 5Tr/QwSwlwqgDHj1JJxqAqkO0CDBjdVc8f0G+2Y7AJVKYjjcTfbHXZUxRPe/qFQlBW5JRQm9P3h
 DMK7tkZQGQw9CLuI=
X-Received: by 2002:a7b:c359:: with SMTP id l25mr49991194wmj.84.1635176854442; 
 Mon, 25 Oct 2021 08:47:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLB/niOatd+Vxlku98xG6EfRzTYqPuEkwn0XuG51PJkV6IH3roZQg5o6T0Y/QXDE0lMxEbSQ==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr49991157wmj.84.1635176854118; 
 Mon, 25 Oct 2021 08:47:34 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m31sm1790394wms.25.2021.10.25.08.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 08:47:33 -0700 (PDT)
Message-ID: <3b78f982-74e6-fc04-edab-aa77bdb8f4c9@redhat.com>
Date: Mon, 25 Oct 2021 17:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 02/17] qemu/int128: addition of a few 128-bit operations
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211025122818.168890-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211025122818.168890-3-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025122818.168890-3-frederic.petrot@univ-grenoble-alpes.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: richard.henderson@linaro.org, bin.meng@windriver.com,
 alistair.francis@wdc.com, palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 14:28, Frédéric Pétrot wrote:
> Addition of not, xor, div and rem on 128-bit integers, used in particular
> within div/rem and csr helpers for computations on 128-bit registers in
> the 128-bit riscv target.
> 
> Signed-off-by: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
> ---
>  include/qemu/int128.h |  26 +++++
>  util/int128.c         | 218 ++++++++++++++++++++++++++++++++++++++++++
>  util/meson.build      |   1 +
>  3 files changed, 245 insertions(+)
>  create mode 100644 util/int128.c

If you ever have to respin, please split the logical operations in
one patch and the div/rem in another.


