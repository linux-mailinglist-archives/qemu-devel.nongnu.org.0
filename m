Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5623B94B8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 18:35:42 +0200 (CEST)
Received: from localhost ([::1]:60194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyzfB-0006Oc-CD
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 12:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzdU-0005fN-KV
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:33:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzdT-00022x-4I
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:33:56 -0400
Received: by mail-wr1-x431.google.com with SMTP id f14so8659747wrs.6
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nV0PVvJR8oWMXItaKOmxnZzKn5xH2TNH3IDX0L0NPfY=;
 b=Ywf27eztTzEqHCaLvn1WtEpA5o4KaRNBjy5LSdRZ9KFt0oGSb8d8jmH4Jb/QxxB2++
 6Gws5cWewCAJ0xs1BEKJIxiDI3xJ13ShjF9d4ZglvkNOatX6jYGxBYqkexe6vgnGhHfj
 aId5WGxLznVYCL2pjpqJRlL3wagafaWKE5MFd/RuQ0d9SHR6RcKJ44Qti8aRMp7Xuo4b
 SUBi8UKF7CZPzOLqipeFKkPDzCQPd+lC2VCuoj/X1g48KhbZckHFIpq90EnNxckKznFQ
 /t2ujGff7prfx+4QBJ24rWf4zD+yh5N6F/xhqFP4+B2saLPk2k7PbtQxze8AusAlXmbe
 YKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nV0PVvJR8oWMXItaKOmxnZzKn5xH2TNH3IDX0L0NPfY=;
 b=Y3Ow149GnAxoTjEFPhaj8HWR7H6YFQCMLsVTIx5MjvaBCta7slaYre5rTD/7079loD
 dKZrCT6ZolMVxYs2/1UdHJgW9zTWCNw+gZ/G4ZC2rQwyFDFlmCQGIkYUzg/1/Ey8pphp
 kbRfj2+z9Oel9bftr80ZQhDNKJDGg/vjpTGLmfXrLnX4fE9ghC80mFz+v30ZUIDJPZAh
 anpoCb63uasEPnZWerJ6Lmf8L0cDLf9tvCycnQdo5NFeDk+pSKnJ/+t1LMinWLTYOlCa
 KPDgzxD9D7z7lb711wkE99KIsC9MxliaOGc8tLFhmai8Bszh4O5d4NLm9fmV53pdCG0p
 +y8Q==
X-Gm-Message-State: AOAM532v0tlTPDIa7slgXKQ7K21YDvGzEZy67X/QPza+uTSONkUP6mHd
 nf9JmR2aMFINsmNagboRJ/o=
X-Google-Smtp-Source: ABdhPJzl6Xbw3jlwxlR6LAfsMh7OjZodo+qtuYRUGxqZ542RRZYMKDOFvRoLkLIav1EH3hGsHrnXzQ==
X-Received: by 2002:adf:e101:: with SMTP id t1mr636323wrz.215.1625157232280;
 Thu, 01 Jul 2021 09:33:52 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id e8sm500448wrx.26.2021.07.01.09.33.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 09:33:51 -0700 (PDT)
Subject: Re: [PATCH 02/17] accel/tcg: Move helper_lookup_tb_ptr to cpu-exec.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
 <20210701152537.3330420-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f82d0539-ba0b-c2e6-d459-308695f6b6b8@amsat.org>
Date: Thu, 1 Jul 2021 18:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701152537.3330420-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 5:25 PM, Richard Henderson wrote:
> This will allow additional code sharing.
> No functional change.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c    | 30 ++++++++++++++++++++++++++++++
>  accel/tcg/tcg-runtime.c | 22 ----------------------
>  2 files changed, 30 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

