Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3150378C89
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:03:51 +0200 (CEST)
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5Ze-0006G3-Ux
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg5YI-0004sH-ES
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:02:26 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg5YF-0007Fd-C9
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:02:26 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so8831695wmv.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 06:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bfSFOv2Jh60xPL7y7VCtDogHMdyZqX6JuR0cwDwVJQc=;
 b=D2VaszXBeqilROCUw90lpDMPN/oQH/WIPEKOPeujVPU0sWV2wShQCuLaZm8mo8SDNs
 BuuMVI7f83NdRK8Vw1XyH5o8vxKyIjlrwc/JypUJsH887h78kWkZd+UpeNtRGBhnmwwo
 1OOnnPjF2wc98El0WlN018w47tErodNd7ZZjXc9THoji+fTk0JyRBTDfKb9EIibF3vqh
 tF4rvV1126/SmegZfyPtbPRG1W+1htF5QNSugdj+XNFhyOI2jDE1si33a9B0gKArdOJ9
 wtobhrs19N1CrhUbsI8XKhd4eBCiWthr0kX2wqQzChHBHL5pfBkL3JdW8lWN6nmgHkfv
 0jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bfSFOv2Jh60xPL7y7VCtDogHMdyZqX6JuR0cwDwVJQc=;
 b=mYm+2LNsnwpS8ZtZzLVNgay0u4cZazZ4jfNYeY4lhk2pvd7gsHBskNqDHO+2kfPSQL
 W/HODN+abCGGEx8aZG+Lx6pv12PWrBkbcXvwAxVv8EThvM0y6WwQfw+zgFrlJhAHmwlk
 lhuO92WQINEU1WnN3nv3utQnAcqpLeYee0kbEbkC6SjyW6KWLS46EsKBZ/8cXbY2tdhd
 kw+6TAL10LfybxBO1+4nerQOqQlH4vXVy4MCgvnsHogF4o4sEGFexfIcSo6uJgWqWZul
 FVGBSNYthrtrItRN2VJag0eU8WsorgPAqwCUZY7N6zlB0DfnECjy0UA5uZLlEHJdMrbO
 +BmQ==
X-Gm-Message-State: AOAM532ZPX6NuXF5iqYQoCGQMwL1f0HB/onTneRiHqKPHqwfI0PPBLBv
 i+a/iQ0acBUfPQwWMJyjuzQK0A==
X-Google-Smtp-Source: ABdhPJxMAyLAOW26th6+8zZAn9Wvv3nawD2IWyg0XIFJj7ze0P8PdYvOiixL81XJq+rqqL0y293MQQ==
X-Received: by 2002:a1c:1d50:: with SMTP id d77mr38342278wmd.114.1620651742094; 
 Mon, 10 May 2021 06:02:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q10sm22093555wre.92.2021.05.10.06.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 06:02:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C8211FF7E;
 Mon, 10 May 2021 14:02:20 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/72] accel/tcg: Use add/sub overflow routines in
 tcg-runtime-gvec.c
Date: Mon, 10 May 2021 14:02:16 +0100
In-reply-to: <20210508014802.892561-5-richard.henderson@linaro.org>
Message-ID: <87h7jayc6b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Obvious uses of the new functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

