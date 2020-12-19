Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D962DF0C6
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 18:53:22 +0100 (CET)
Received: from localhost ([::1]:46054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqgPw-0002ZP-Ux
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 12:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqgPC-00027s-Am
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 12:52:34 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kqgPA-0005Os-O8
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 12:52:34 -0500
Received: by mail-wr1-x432.google.com with SMTP id r7so6462137wrc.5
 for <qemu-devel@nongnu.org>; Sat, 19 Dec 2020 09:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2VF4wf7l5/A2yMJnA33RXfS91XZYyNiVwfj98mynfgo=;
 b=j2uyQaFxOXAxaAgzcu510FILu4tz5B25XSWqH8SttdrTF8cLMXGv1sFrn4zLP7jGZh
 d7lX7eD/vTU52qvz2Gf7DSzPEsM8lh5NccZ5qit58GW69eqa3zi6nwWTCzDb2EYkPbyL
 NzS5U6D0cLQIRqj6tMV1DYrFA0pO/r41duf0MCmfC15nXy1Drny8cSE9UsHPA0jpP1R+
 SKr3Szs3XZOVBDRsH400iSXA0ThhdD0bjepYlXBr6dKOlA8ZbxsjbfqW+hohFuwmEtTc
 Y6CQmPEet4QgQuZAaPWTy63jPP79iUEKUIkHfltUpkBoavpHAXZUPH5UVfXwRP6JBkfC
 +lQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2VF4wf7l5/A2yMJnA33RXfS91XZYyNiVwfj98mynfgo=;
 b=rHEtWnrLslRf5Rraqu5AnnP01nbX3HdcxsguWmRiqLSezptVw9cpPC8Gxpq3LX3sW1
 48wEkBS+kocljR+UVxb56tjmMOTn1COgOmmIMqTsTn90nNlik3QGXA7r//GTOj1ml2Hb
 sOjMvXQdX3IXHH0GfTkJkO31sdhxnLK++SenRQ3kzlwaMD+68Hf5IkNOudBqh9L+39QX
 zXk8EyLz2K8NoS+OEgxoQemXKIaiVf9Orr2nVIqibNDJsXVK9CsYIgwUg89IasvGtKWj
 StWeJLLLSNXdp85bLhfv7wjfXhm+5vgJ9Bonly8JDoK7NzYsof5xxPIw+eoSCy6jLql7
 0wGg==
X-Gm-Message-State: AOAM532UpLmr3FeTq2xDtRdPe4C87HU36NVLk8lMe/OCmAs0/4PLlaSW
 yeIlW7K5LhizU7uZJRTP4RU=
X-Google-Smtp-Source: ABdhPJxmNiE4o2GPPpGiIgZpkUmrZc7JPZk2kjGz1vir6GEOXt5/3EbLDtf8vVNsqYb5MQ/HDBjb5A==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr10487030wrn.296.1608400350261; 
 Sat, 19 Dec 2020 09:52:30 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id k18sm21292560wrd.45.2020.12.19.09.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Dec 2020 09:52:28 -0800 (PST)
Subject: Re: [PATCH v2 2/8] hw/mips/fuloong2e: Relpace fault links
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219071235.35040-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <835addc0-6973-9e17-2ac5-79a159fb72d2@amsat.org>
Date: Sat, 19 Dec 2020 18:52:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201219071235.35040-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/20 8:12 AM, Jiaxun Yang wrote:
> Websites are downing, but GitHub may last forever.
> Loongson even doesn't recogonize 2E as their products nowadays..
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/fuloong2e.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

