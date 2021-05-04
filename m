Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702CC372E42
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:50:32 +0200 (CEST)
Received: from localhost ([::1]:42352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldyFj-0002PC-I3
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldy6a-0005Sw-Gz
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:41:05 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldy6U-0000FQ-Bv
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:41:02 -0400
Received: by mail-pf1-x430.google.com with SMTP id x188so6140730pfd.7
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u2FxJE8ye/dR5kEM6RF7oMZvhqKRBp5k4mTytWTqdIo=;
 b=t9MjxS0zVrucfbXSLGEhOaSKBuS8B7d+5lCQIwbLitL8Ele2NxXRI2O8y47mdjVPhJ
 bkbZ6hzlKRYg9IDJmTfYJzCyrPseoDK4YPqwI8u+6PNvbt2NUTYuQ3shy5Py1tbWZj21
 rSrqyIx2aDwEN9/MNTkRJNG+uIOUYWokOEkfpfzRJv2r02t7W8IZBkS8bwOvSGlv20Fl
 CO8Sb6z3p6zYRTXiRYOq84QEzWIxnVtY++lw7hbMDtCI21AOoPPr4AAoEffz2cYPXGwL
 gmmXyIfcpmoq1gvcMtPFUDc81h+mLa2LDxuyZ4hi2hxwdsGTwAhNmHQPDUabUN84LksR
 8FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u2FxJE8ye/dR5kEM6RF7oMZvhqKRBp5k4mTytWTqdIo=;
 b=N34Q9XwyIy+DT/6+T1uY3YODPtRZhCTGyJq7l/Dfhi15YRB7I/b+EVR0ojKQA9EAXJ
 mlucMh2tEc/Gce4i+W9xFJ6SCfI1KUYBi6LxjoujyqgJlneXHHxXLkKvgso7DAz3yJVs
 9M/FQaT7MBhljPGWMBo4Nf9Y2qtwWglW0rZNCiiyRAD9FnRmwKhGlpiOf1FmpWJP0bzy
 mEVc2iOFm3RcU2WW2D6WCcxOdGaxhVd/lvExbejizailNhFY83t5+rAvHKuOnA1lKxZu
 BOkwABtystOOPnq4LAMpPYEzXEupIHDu6tjTnJxa54Qdz8Acl1hosT8MzeD4iCHgi4SH
 /SIQ==
X-Gm-Message-State: AOAM530KsBfMPIDqfWRzcpl5RqZM1lokKX/6pQGR+OnOmZ1Tvqis4Y7T
 RYrT55hC38pAp0HJoWPwxs33hw==
X-Google-Smtp-Source: ABdhPJw94MDsRphkefqL/hTQ2uV1Or7pImGtSLZ282g5coYQ60su5+VrPojG1F2c7n1fVpj/3c6aUA==
X-Received: by 2002:a63:1d19:: with SMTP id d25mr23796855pgd.169.1620146456531; 
 Tue, 04 May 2021 09:40:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 23sm4168915pgm.9.2021.05.04.09.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 09:40:56 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] target/ppc: turned SPR R/W callbacks not static
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
 <20210504140157.76066-5-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aaa34fa2-e598-9a2e-5f4e-051abe7730fe@linaro.org>
Date: Tue, 4 May 2021 09:40:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210504140157.76066-5-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 7:01 AM, Bruno Larsen (billionai) wrote:
> To be able to compile translate_init.c.inc as a standalone file,
> we have to make the callbacks accessible outside of translate.c;
> This patch does exactly that
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/spr_tcg.h   | 134 ++++++++++++++++++++++++++
>   target/ppc/translate.c | 210 ++++++++++++++++++++---------------------
>   2 files changed, 237 insertions(+), 107 deletions(-)
>   create mode 100644 target/ppc/spr_tcg.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

