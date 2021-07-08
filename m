Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC023C189E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:48:22 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Y8L-0000mB-9O
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Xfg-0003ZQ-4Z
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:18:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Xfd-0003Ri-CV
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:18:43 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso4297423pjb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oV0GrvajjQXWkBU6MBQMc/6Cu/5RWaTwX9AlzXYfZ5o=;
 b=aeFAI9P14Sd9tu7UTMgJLAWTGYMaWzLF79Jvxp/Yn2Fwaf23I4MNt7D4WULbJE/ZXb
 7vM8Ut5fJs1OU0X8L4nc0xQpmBQ+27UPWBwGizLbgB6Fmr8hUCIXl65cRi5PuicQWveH
 wqEek7d96iFZ1jZwX18NlAY9IsBs74SJbAR77srDJl2pQxDNyFsEVSKGqpaQQoDNkMWV
 3W4LeqpJpGKMaYOOpQ5CxW5VZtzuJ3osg7KLhRD/tcbDlsYoA0bYpnlqIPwdy/XZzjMV
 nfEE2qglOFT3xkxyC88+/6VYK4k5SKqHSVbQz+I1HvAb89LYtH3ROhvbIY2xoPBL9j4p
 dAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oV0GrvajjQXWkBU6MBQMc/6Cu/5RWaTwX9AlzXYfZ5o=;
 b=Ouom/p6+pZrA8sg4IoTCtfww7Y03Dt2VO4pIbxw0ZlWpYgisl0n1eoOcQ7v4dreAua
 67BKoaiAGSL9iMpZJL9k1sfj0+iQaUx/udmyaeGxNEwfe0J/HGDDfLPE/91XWsqSY5hT
 FVMqt00IVJmwb2NorY1lVkIigag+9LKZ3ixbYmEoaZlzGQ5h/j3twfrU66QhNWAgb2W0
 ZRapZleaRapWcQVdA1eiwVrNb7zSMD9OfekO3sNEmtmLHVe/c02eSbYN+L8vmJVKXSAE
 kUqWwe56Mz87y0kgCs9cH2Oj5Ku0ZWD+mBVxg910W8THDiIc0rIQXTTeL28IKhTcjVko
 UzzQ==
X-Gm-Message-State: AOAM5304J9XuM4WPqh+EBViP8wME7bugV0dBVdyOB/p7AmPkbfb74cGu
 HG8LdN9ReT3YObQ8tN+IvwLQ7A==
X-Google-Smtp-Source: ABdhPJxL09bPgbmzChKmwJzdse3WV935Ky5o/+o/zXD2X2FZ9Pdn6sP8SFJGctosGv01T31Qub3feg==
X-Received: by 2002:a17:902:864c:b029:10d:8c9e:5f56 with SMTP id
 y12-20020a170902864cb029010d8c9e5f56mr26960431plt.8.1625764719993; 
 Thu, 08 Jul 2021 10:18:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b62sm3625383pfb.149.2021.07.08.10.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:18:39 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] tests/tcg: Test that compare-and-trap raises SIGFPE
To: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org
References: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
 <20210707134231.1835-3-jonathan.albrecht@linux.vnet.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17326e08-3530-a140-aca5-1c4f8308b67f@linaro.org>
Date: Thu, 8 Jul 2021 10:18:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707134231.1835-3-jonathan.albrecht@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: ruixin.bao@ibm.com, iii@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 6:42 AM, Jonathan Albrecht wrote:
> Signed-off-by: Jonathan Albrecht<jonathan.albrecht@linux.vnet.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target |   1 +
>   tests/tcg/s390x/trap.c          | 102 ++++++++++++++++++++++++++++++++
>   2 files changed, 103 insertions(+)
>   create mode 100644 tests/tcg/s390x/trap.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

