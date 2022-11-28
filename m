Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823EC63A2F0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 09:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozZTG-0003Fk-9m; Mon, 28 Nov 2022 03:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZTD-0003EJ-J3
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:26:31 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozZTC-0003d4-0u
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 03:26:31 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bx10so3404300wrb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 00:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+MWuNsw73u5IPvIKkH7JG6VqrqczB9G9yEKJmIL6CuA=;
 b=rimhMc51OaOKYL79hOZF7qcAT+aCPRMS3MBSBMMuiA03Z985EKD4CHGfHmp1IZoNG/
 yJ9NXH7JlQlthS7znDfT2kQtIBKDiumfXV5AVkZdkQbKs/Jc8s9hXoekxqAOFDLsz9B5
 SYPM3uffvXJbHC+/1f+MeELK/c241oqVUms0Fw3/JGZaQr4m1Y90gij9rRtz39aqdIDc
 MH11n2lE/jVss7JluAGkq8yyhKHT8KeYbQgWuJUhoHU52LPiFOt9Gpau0iYnwCdUO1k5
 6MRO7iGezsrbqXj7Vzg1z6fLMJJdtuAXTEvgu2W7DCtgPYu60TjHcaVowTlOUIzrUZHR
 F2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+MWuNsw73u5IPvIKkH7JG6VqrqczB9G9yEKJmIL6CuA=;
 b=hEPOONUfx31lsBOaSQZQEcVpBRfskvtUl9LpqnzFr4StVZYUryJ9RSK+af3SbTf9Iq
 KyPWBJOUsoLWTGgLg8GN4GZv+gwUnzzZVSM628q7jcMhuEZ23ohPl1IJIqr8saig1eoL
 txTX6eF5QyaU/8vRh0a++Rnl9mm2+8D002j9aj3y9ipxfU5bx/vAymKMDmjEn9z50SH/
 9Y8dZswPHTkOqsvkPKFn6h5QINIqRkAqtZZYNw6HRYaKdJ58ugKJkePqF44Dr9G5RwYd
 CB2F1V+tqX6F2mP3wQJbBr5ntBPPDlKSayfBnAvZlq+02HLvOouVQZtb23/u51oZLsEb
 5UMw==
X-Gm-Message-State: ANoB5pkZnaXO+5W1i50+G+KWvpn7nXtWc46tBlBMWW26Z4TXXX7ODHPy
 TsI3jjo95zhqxNXmQ0JzMAU9HA==
X-Google-Smtp-Source: AA0mqf7IQktVs/wNUM6edGuW/PBqC8x5kpA+AazUYBfRAdDVf4to+EBwysQ/95BiMpewLAE3NSdRvg==
X-Received: by 2002:adf:e2ca:0:b0:22e:4ac2:aaa5 with SMTP id
 d10-20020adfe2ca000000b0022e4ac2aaa5mr30157520wrj.455.1669623988578; 
 Mon, 28 Nov 2022 00:26:28 -0800 (PST)
Received: from [192.168.1.175] (49.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.49]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c3b8300b003cfa81e2eb4sm15763460wms.38.2022.11.28.00.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 00:26:28 -0800 (PST)
Message-ID: <5d7f3bb7-cac0-1537-0ba2-e1214be0458a@linaro.org>
Date: Mon, 28 Nov 2022 09:26:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 05/12] pci: Build hw/pci/pci-hmp-cmds.c only when
 CONFIG_PCI
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-6-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221128080202.2570543-6-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/11/22 09:01, Markus Armbruster wrote:
> We compile pci-hmp-cmds.c always, but pci-qmp-cmds.c only when
> CONFIG_PCI.  hw/pci/pci-stub.c keeps the linker happy when
> !CONFIG_PCI.  Build pci-hmp-cmds.c that way, too.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/pci/pci-stub.c  | 5 +++++
>   hw/pci/meson.build | 2 +-
>   2 files changed, 6 insertions(+), 1 deletion(-)

Squash with patch #3?

