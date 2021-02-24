Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3845323599
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 03:18:58 +0100 (CET)
Received: from localhost ([::1]:41508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEjlR-0003Ez-81
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 21:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEjj3-0002mq-Af
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 21:16:31 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEjj1-0007ww-Ib
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 21:16:28 -0500
Received: by mail-pf1-x432.google.com with SMTP id c11so283542pfp.10
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 18:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Meti7PjnPG0WCBShhm9S6txLr9Iu6JfO4AEV55Rx58=;
 b=OxhY/c2+kJO3LGMIpj3eRpuK5+tjrXtq2twAed0ToLAeM/KF6ZbVd22EXO+/MUIp8X
 ak0zilE/3L2ND2HbwcmGh1hpxm1CEzNCjm1vGHZba3WMaVryhswW0xRnDCPyRCpksCeK
 /o0eEeecYSuqgfzFnzFZYXMncYfegNFZ4hpB09m9gqIaPIJLiNMlMvJ7fclbmIO97fDF
 OYgn1MP4TN7Ab4NiTlcObgpiod9v51ytcL6qqfZVYQR4N6TThJAvgjwoSgYB/IDz0ec9
 1DuUTdazEY2kq1r8dy0vki+WH4t4w4d+yalx4Oif8J3ebltSkr3xx2QOZf8sIoDneb9U
 iopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Meti7PjnPG0WCBShhm9S6txLr9Iu6JfO4AEV55Rx58=;
 b=V6PlX2b/JhR73Q9C7qdUfW0fIsM5gv+107R2YfhU0UKKrI/vBPdRNapBAzasF/lSgW
 N3XVqH1N4ArvWohLhWUJsn1gpB7p2blBwWHtxLUIS7h8ZKmQNBpw7Li+Avn7aAIYkfgp
 dcoeXax+CnpQCM4IDZdGUFv2G+N69UxxhoElzNLxsxX0PKRh2gI4Mu+obppl6iGez3Wu
 4wOavXx/8wk/srfwVrnrKvAalMVvSUd6RxeXo+BgBrwnU1uGLJ0+BzjYM0xr1VLDkgjF
 UrJVh+yhOLzPcuY2gAYpCTo+EWmFaSzRAnZJZQYVaTTBAkmiMV0nzULtFsBSMQMU2UVJ
 tlhA==
X-Gm-Message-State: AOAM532o6GkCWz7lxvwRojrM9FAsinkY07C2KNiGl9PRVSmOMAmZd76P
 IceS+41RFDhQw+O+Si9BSp1M6A==
X-Google-Smtp-Source: ABdhPJwZmvGLThHGKA31gvfLxaTkqjFxXN5uL9r9AEAb2pT+RJYBAsxUsRdYmjCW2eSIU6em/PidqQ==
X-Received: by 2002:a65:6688:: with SMTP id b8mr26962774pgw.158.1614132982041; 
 Tue, 23 Feb 2021 18:16:22 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b207sm490219pfb.68.2021.02.23.18.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 18:16:21 -0800 (PST)
Subject: Re: [PATCH v3 10/10] target/mips: Extract MXU code to new
 mxu_translate.c file
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222223901.2792336-1-f4bug@amsat.org>
 <20210222223901.2792336-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6e0825e5-2a40-b7c8-b33a-44cadff8cd04@linaro.org>
Date: Tue, 23 Feb 2021 18:16:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222223901.2792336-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:39 PM, Philippe Mathieu-Daudé wrote:
> Extract 1600+ lines from the big translate.c into a new file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mxu_translate.c | 1625 +++++++++++++++++++++++++++++++++++
>  target/mips/translate.c     | 1613 ----------------------------------
>  target/mips/meson.build     |    1 +
>  3 files changed, 1626 insertions(+), 1613 deletions(-)
>  create mode 100644 target/mips/mxu_translate.c


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


