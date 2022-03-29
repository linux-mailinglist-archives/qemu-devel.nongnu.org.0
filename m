Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43F4EAD10
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:22:31 +0200 (CEST)
Received: from localhost ([::1]:39322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZArm-0008PK-Fs
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:22:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZAoN-0004uU-De
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:19:00 -0400
Received: from [2607:f8b0:4864:20::22a] (port=46041
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZAoL-0001Hv-Rd
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:18:59 -0400
Received: by mail-oi1-x22a.google.com with SMTP id 12so18798306oix.12
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sUUZz9BIJssYk3im4uvhrU+3PfjQ5Eu20pmuKEzx2WI=;
 b=KpX4GVTyh08m1hi4pizkuhF95xw+hXRgAcjXmY0wM5J85xM0k2yDhgKe6v9owtd6co
 WIrjGzy/9phLB9Lb6zmcCBjNtP9sqKNzJEBhv7YvbOjZqzdtNTM5WtPH4yq7vViglzGq
 1wdgeMvffI8IQd2C9lZVn5ogrX6l8v6BicqESOwc2Z1kczT00q91XcyqrS4n6aTD6Zgv
 7q2MTtqrL6EkURL22MRQvKYnsYAho3IARMqZ682DvbTV17EM+9IRK2NLLnri8xfbHJ0Z
 RuGyqe9GVGLIWuM+SQqF4IpAHbgxOCvbE7i5/lWGmvIR8M4hyyfcjA8YAKvgKPHZElGv
 kEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sUUZz9BIJssYk3im4uvhrU+3PfjQ5Eu20pmuKEzx2WI=;
 b=cvNVX1MPD9TIwH7pLlOFCJ5OrvQ3Rc9BWULwN6qmoc4o9QJl5LhS3M3h8YB4Dz17O1
 Tkz+0jfh60dncsIrXBu4bNcDbGqOtxFYBd/36IEcPIc5Z+4ZeapD2C2AcU7FwpWbNeXX
 FdaF0hGrzmyTGghkU6wDE5KVD+GpnXi6HdxA7k4mD0xnpDpgvllX9owENsDXKpVuPL/s
 YkwpidDMu5D0JCsQ8gVmpRhglXwsDKBFFrdGmnzzOUpb/rK/Ov0OevmqTlKYFtBACYOS
 s66gGbufixr0Pd4xMIiH7/Kh0ibVDisT8n2f+F+T4xUsEUUJxeJ+hmtenh1w1bk3Tnfi
 gIfw==
X-Gm-Message-State: AOAM531Gea/xm4/vf+/vTGbN/sSFamiUfh9E9cMcNyWNznrlIFgwe++w
 lcLWvhDd72nfdIVDpGlgDs19Cg==
X-Google-Smtp-Source: ABdhPJyCVitN8YGT2BQelBYfH85QDcdAg/7+ODizXlvTmFnAPGMJCuekIbNRBnOXnhsSShujtwb3MQ==
X-Received: by 2002:aca:f286:0:b0:2da:58ba:c578 with SMTP id
 q128-20020acaf286000000b002da58bac578mr1098157oih.127.1648556332792; 
 Tue, 29 Mar 2022 05:18:52 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 g25-20020a544f99000000b002da70c710b8sm8899329oiy.54.2022.03.29.05.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 05:18:51 -0700 (PDT)
Message-ID: <88d450a1-01a7-b02b-a207-9ac3f16547f3@linaro.org>
Date: Tue, 29 Mar 2022 06:18:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 6/6] target/ppc: implement xscvqp[su]qz
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
 <20220328201442.175206-7-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328201442.175206-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 14:14, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> xscvqpsqz: VSX Scalar Convert with round to zero Quad-Precision to
>             Signed Quadword
> xscvqpuqz: VSX Scalar Convert with round to zero Quad-Precision to
>             Unsigned Quadword
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 23 +++++++++++++++++++++++
>   target/ppc/helper.h                 |  2 ++
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/translate/vsx-impl.c.inc |  2 ++
>   4 files changed, 29 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

