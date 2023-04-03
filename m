Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC476D3E18
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:29:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEcu-0006QQ-Jt; Mon, 03 Apr 2023 03:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEcp-0006Q4-9o
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:29:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEcm-0003qw-VE
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:29:10 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 d11-20020a05600c3acb00b003ef6e6754c5so13683699wms.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680506947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GnD4Cbt6omNzPP26N3fFu8F/vUyndOpr3zJqRQaUgdQ=;
 b=HgxkmWLVAibjMLzt0njUVrqCdgwSEGqp9h2tj6FomzqM8ljj0cZIkGeYSv0zooNXXX
 2RBtONJ2zURdcq2YGnC203nqTG9q8BUtg0+EaN63tcN/QFmy97UYQbKz6e3aWtQOt7RT
 dPtU/PCMmQpXvVFJQXELEe/inG7sVimV9MVOKOjMX8xcFH9SFjGSi25oY8tpgKLKJHLb
 VswSYYX7zDaSrgQQmgUo0uwae5ijOon0BlmJO5eJ1yDrx6vtH9sULiDHIdlnbq/EzCGh
 0tYh6NfDFvqCNtYjAJK2HkpDvkSeKOTDxUaaLSBUQRYOWxI5SVJi3owoTlpT47hl4DkA
 N0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680506947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GnD4Cbt6omNzPP26N3fFu8F/vUyndOpr3zJqRQaUgdQ=;
 b=0kX2o0LlXDiHU2mClSurL6fqz71ezlj8fijZghrZ5412LD8R0DNf6Dxh/iY/G1GeZb
 ujhrtxcO1w9S4QGITPycSlLRXUUXZgB5BjeedHlqLZnQf2pdlt3ll1X3iPsq5f3FDX0y
 NLkzIg+cgzBPKLw/rdPDvcRRtNVRzOWN+WgKhSogLuXm0hbVYOcj2of5p1FKz/EsMkdA
 WCV1GuVh7tJQ1FOaLt+/zQUC5AUxA5he3k9SGkUInZHyXCHiIFH7e5FMUJTpv5aAHk8c
 B5pmi4MCoNOcf+DvSGZNnz3n9ZmlrN+h/JFgL2XZxNh+KZHJ/sUWAIZCcReXzffJMOOH
 0Ppg==
X-Gm-Message-State: AAQBX9ftBILilR75FfJY1jHxVa9IlmTs7SsMDWfGbQQ0FnZS/kDrPcwF
 XOJuw9bnwFqGPZoEYMQVVTyzVg==
X-Google-Smtp-Source: AKy350b/kWYF2XJ340+6mvKDAY0EuWSWuR75zSrwasjln7Ase98uA13rZv2mvl3qRBRJ+IzkxypWOw==
X-Received: by 2002:a05:600c:ad6:b0:3ef:76dc:4b80 with SMTP id
 c22-20020a05600c0ad600b003ef76dc4b80mr16711040wmr.9.1680506946958; 
 Mon, 03 Apr 2023 00:29:06 -0700 (PDT)
Received: from [192.168.127.175] (246.red-95-127-42.staticip.rima-tde.net.
 [95.127.42.246]) by smtp.gmail.com with ESMTPSA id
 y5-20020a05600c364500b003ee0d191539sm11285961wmq.10.2023.04.03.00.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:29:06 -0700 (PDT)
Message-ID: <6f9b8965-a4ad-c8ca-025e-dc12000d6adb@linaro.org>
Date: Mon, 3 Apr 2023 09:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 13/14] ram-compress.c: Make target independent
Content-Language: en-US
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
References: <cover.1680457764.git.lukasstraub2@web.de>
 <8c89bab01953f658b44cd67df2c75657ccbff5a4.1680457764.git.lukasstraub2@web.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8c89bab01953f658b44cd67df2c75657ccbff5a4.1680457764.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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

On 2/4/23 19:56, Lukas Straub wrote:
> Make ram-compress.c target independent.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   migration/meson.build    |  2 +-
>   migration/ram-compress.c | 16 +++++++++-------
>   2 files changed, 10 insertions(+), 8 deletions(-)

\o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


