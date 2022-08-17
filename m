Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1C596FE3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:30:53 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJ8F-0008Jl-Vs
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOJ65-0005vn-HV
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:28:37 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOJ64-0007LP-2v
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:28:37 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 o15-20020a9d718f000000b00638c1348012so4362182otj.2
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=wjySvxhM5OvzrLZNjn+FnuaylMENAqCXjyPvTcJMxtE=;
 b=yy+YXG/uGOfw3lhJ0fWVX64tQT28zXNDkvmTjiRS1ZteS3V6NmH6fJypyZeMajU9iq
 zIkSqkhB0ClPcH48gpF7RHXPOh61lBKlezMh8fUvpU6bi1VKPvTtM+c4i86nEEjKreon
 ezEtRMsZAgTB14HAhHDYsWehVG5T5gzZotgBUseZ6tKkENLZ7C5azAyHLrWCgfLA4H+j
 zcvobyXrKujzHWB/8HvStFz1gb+0Y6HcNwhFxrPPKtrumCLkSNdqQcqriL9B5I1xFkO7
 Dal0YDtTIAAoTZ82b4ilZXkXDkD2+ZcK7YHS9hK0AUiSFzo+jCMYLxEreS1ki6vojtRm
 DcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=wjySvxhM5OvzrLZNjn+FnuaylMENAqCXjyPvTcJMxtE=;
 b=5GSv/XV/xYrQgRTqatZH2vhtG5SpdO1zqCBiJIfjqXHN0HvAV/kkaax8XYtJP6dHx1
 ZQtkW8X1buR8sBVELd+akWkyjhJ3x9vK3qmCNPpuoCfCmLwPA6NXg/ANOpn6UX4x5ffv
 MOC8j+tVRFHGVCWBVHB9TACpP6Gsr5j4LkA1hp1wzwxQa8NEAgDYqqGdNBS2FTAf5ORX
 TJd+AEZKLDb9cOOeTwG3KYgS8QsN+R4WieeZVhQjTg6ccjhWtQFauo4MBGczi4IB/KxQ
 C6HgOSiABOyik1h4tQf0WFuky//kkhSrdVSnh3qvoopGTQlSXcDPIMgO+3NfPEp/1Ngr
 /nAg==
X-Gm-Message-State: ACgBeo2hhgm0AFGsWLt+5sJmb1+4cRq+Cpx+5sTGQ/OFmcFVQP5puczI
 E1JH/ysrBJg7y8KHtr7nDlwZcw==
X-Google-Smtp-Source: AA6agR6/oC/dUjIgFuf0EfoibsmZQ/OyE0GyRNyOyALZHhgxihrobF7X3CGHajw7IbbiA7lhOKnnOQ==
X-Received: by 2002:a05:6830:2787:b0:636:a7e9:fb13 with SMTP id
 x7-20020a056830278700b00636a7e9fb13mr9185588otu.252.1660742913554; 
 Wed, 17 Aug 2022 06:28:33 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f2:9412:75e8:df77:dd33:d368?
 ([2605:ef80:80f2:9412:75e8:df77:dd33:d368])
 by smtp.gmail.com with ESMTPSA id
 r32-20020a05687017a000b0010200e2828fsm2827260oae.30.2022.08.17.06.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 06:28:33 -0700 (PDT)
Message-ID: <4e571375-228d-5abc-1d62-ac07ec8dbb5c@linaro.org>
Date: Wed, 17 Aug 2022 08:28:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] linux-user/s390x: Save/restore fpc when handling a signal
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
References: <20220817123902.585623-1-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220817123902.585623-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/17/22 07:39, Ilya Leoshkevich wrote:
> Linux kernel does this in fpregs_store() and fpregs_load(), so
> qemu-user should do this as well.
> 
> Found by running valgrind's none/tests/s390x/test_sig.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

