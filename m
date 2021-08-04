Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE23DFED7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 12:03:48 +0200 (CEST)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDkZ-0004W5-DZ
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 06:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBDX1-0002Ui-IV
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:49:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mBDWz-0006Gu-J1
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 05:49:46 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b13so1539671wrs.3
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 02:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dCx0MEe6GqPCCnkzYRlUUiFLClXOn6kpqr9SOKYHlRE=;
 b=WV7gKB/ct9ewMBItdp3nQ9oPpFWx965k6o6zlZ7NiVh8CzqpyNrVuEPZ8jUQJba+QC
 VRihxFnA05zfiIc67legsHVLKrW9nydDspqM+tPLq/DLgWFmYHfzuBOH5U0JwDdyCnDE
 7x644+cp5l05Kb5aDzP7p+IyrS2XI3ZXxc5Kcl2+4iMXYblTBJlZRRjxBvQlqjbevPoU
 t3bTBbf/z5IPyB3wboQ08P98hHugoknCmhVmuCsi85lgXiMgV7t8tkuVeIcFQsi2I495
 Y77IOmBf0T/1D7/XKkgRfL0XP26XxIxQzIHfSxOeQL1Avu8aPsf2l84VmWRH+VA+2Aw2
 P85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dCx0MEe6GqPCCnkzYRlUUiFLClXOn6kpqr9SOKYHlRE=;
 b=RmjvkNxaMCFfVwlNTV3bQiD1GppRetkJK5V8z8jaXAkiMTMKVEYU/xm7TXPZ5QPik6
 udXm9aGbVcM4F+iovqc2qGg7KCJBzLxqdiyVK9S+gAsR21lR6ftvyRXTBTRm5D0k5pyq
 hcNhNK3k7jbIZQ1s1fkFXGKgeBAtS2KW8q/8cxsZjdHuiWsnL5SEkUrLHG3hK+KBFTQ5
 CROuJyNVGYXn1utfTKM6izYNU9QP8gHevD7MkaM8A5DG3Be2NM96xom+0DrL1cApwtpb
 xfArJSKnrXcLOeVgqCLeIn68voBfNso/N6mY4i3i6+S4tVHfS/hnPzCaSscRVDGURliD
 9gbw==
X-Gm-Message-State: AOAM533yNe7En2Gx1DidA53If+A8VbuiXsbO2pyNZ4nEAPFegezGSVmQ
 y1BEaq2M8SaVyt3IU4DUNmY=
X-Google-Smtp-Source: ABdhPJynFz44vtGncvDx+RsbxhNcBwJfRu8eKatXaQG+8vmerGXYHkfjY90s7MT0rR/mW5Mf29U+aQ==
X-Received: by 2002:a5d:4fd2:: with SMTP id h18mr26950147wrw.202.1628070583202; 
 Wed, 04 Aug 2021 02:49:43 -0700 (PDT)
Received: from [192.168.43.238] (106.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.106])
 by smtp.gmail.com with ESMTPSA id o24sm4041769wmm.37.2021.08.04.02.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 02:49:42 -0700 (PDT)
Subject: Re: [PATCH] linux-user/elfload: byteswap i386 registers when dumping
 core
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>
References: <20210803172013.148446-1-iii@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <626ebbf3-b4d9-4d96-0ea3-378b23b469c7@amsat.org>
Date: Wed, 4 Aug 2021 11:49:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803172013.148446-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 7:20 PM, Ilya Leoshkevich wrote:
> Core dumps from emulating x86_64 on big-endian hosts contain incorrect
> register values.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  linux-user/elfload.c | 88 ++++++++++++++++++++++----------------------
>  1 file changed, 44 insertions(+), 44 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

