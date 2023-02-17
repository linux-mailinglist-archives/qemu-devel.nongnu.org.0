Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D94569ABC7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 13:45:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT06Y-00087s-CZ; Fri, 17 Feb 2023 07:44:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pT06V-00087c-Rm
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 07:44:43 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pT06U-0002Au-0t
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 07:44:43 -0500
Received: by mail-qt1-x82c.google.com with SMTP id bc7so553781qtb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 04:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZpRbRPHkbBBFGl7EB+SkPjgbFim4v3tp7EoMTyn9mM4=;
 b=5tgUnq9yjzSbi4DbcF2EwXMr0xwh9VdnXUc62N2mO7P7sOwsk/5lCNeHst77H5BpLp
 OsoBVlEaUC6ZYuxtaHehHkROpUXlYbSCIEnE0RDbWBKUIlfcQGTHalB4XV2/Upwi8pX1
 mbgUPvB6BN08HSq+WOQ517AYb94KjrBm06mROmLj6+ob2873AZgh+gTcxx6VX1qD7yIv
 ud5mYvBcz+NqSm3WSj7JcGZ/VFD/g/fi+E7wdzbwUHdtJmtCv+0OWTYWjqgxOwaBWqlH
 Sq+tsqLzorA4BxQACm/BZiXTM9eyRECC0Kb4bKXeuidGF7L5WTzuMHO0Yb1HSNlFO7zp
 Xx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpRbRPHkbBBFGl7EB+SkPjgbFim4v3tp7EoMTyn9mM4=;
 b=H0Pc4Aw/CqB1WDqZnsDasnEtupyofhJf4TtjrnlpDgYzORYx3cLgCc57UCxJVI6yvB
 tuUyREgFuOwi0Abp5yQum/gPIbLhyuGBsQDKSWiTkFTrPGYKwv0dNO5gmh38Z5v2Ulyx
 T19cdAllnJ9t9X1BEtQaxxVKffr1OJQTlT2Ynl50OksjfMhTiEi1rxPTwFZlzOkUpbXl
 71DbWyL7goztUau5+twOowGzSb24tgLGzJgoAIxasw1AtItEkAnBzF3qPiYHJIZsJYsn
 t5MHW6n/+0XLWEHgWf2Xj+2bVTOSInuXQIewtyZwCmCBARacVnvjdwMWApwXrEJ/iKwr
 ul7w==
X-Gm-Message-State: AO0yUKW9ZwzuQaHfCxXxln1nNg/sOKWIPHsGPRqmQN+bRlLYDV5oE47x
 lcgjmsD2RLWz/TT7Z65yQwyR1nrFQ/O8a6weg2I=
X-Google-Smtp-Source: AK7set9vmmpQFF6N7C+Fgi1Qx/e0GvMYMv9uXv38PhdMELpdgVpyk5vfdu60/v+m7LqPsLZUzJoCOQ==
X-Received: by 2002:a05:622a:103:b0:3b8:5a02:eb43 with SMTP id
 u3-20020a05622a010300b003b85a02eb43mr2018311qtw.64.1676637880412; 
 Fri, 17 Feb 2023 04:44:40 -0800 (PST)
Received: from localhost (pool-100-2-99-22.nycmny.fios.verizon.net.
 [100.2.99.22]) by smtp.gmail.com with ESMTPSA id
 m1-20020a37bc01000000b0073baa94943bsm1023534qkf.105.2023.02.17.04.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 04:44:40 -0800 (PST)
Date: Fri, 17 Feb 2023 07:44:38 -0500
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/2] fix for #285
Message-ID: <Y+92tpDQVytnfvnd@cota-l14>
References: <20230205163758.416992-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205163758.416992-1-cota@braap.org>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::82c;
 envelope-from=cota@braap.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

Ping.

This fixes a bug (admittedly with a big hammer) that affects
users with heavily multi-threaded user-mode workloads.

Thanks,
		Emilio

On Sun, Feb 05, 2023 at 11:37:56 -0500, Emilio Cota wrote:
> Changes since v1:
> 
> - Add configure check to only use QTree if Glib still implements gslice.
>   If Glib doesn't, then we call Glib directly with inline functions.
> - Add TODO's so that in the future (i.e. when the minimum version of
>   Glib that we use doesn't implement gslice) we remove QTree.
> - Add comment to the top of qtree.h.
> - Make qtree-bench results more robust by running longer or more times.
> - Drop deprecated API calls (they're unused in QEMU).
> - Drop API calls that are too recent (they're unused in QEMU).
> - Drop macro benchmark results from the TCG patch since they're too noisy.
> - Add test program to the commit log so that we don't lose it in the future
>   even if the bug tracker goes away.
> 
> Thanks,
> 		Emilio
> 
> 

