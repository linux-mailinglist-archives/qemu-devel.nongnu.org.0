Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CCB500FE8
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:22:23 +0200 (CEST)
Received: from localhost ([::1]:55946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0MY-0001gT-8c
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0J2-00076a-2m
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:18:44 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0J0-0001iF-Iz
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:18:43 -0400
Received: by mail-ej1-x633.google.com with SMTP id ks6so10382926ejb.1
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=uOMC2nC8u6DLRHiIipL7Qk53WMB9AH6GdsFw4zSJPJo=;
 b=vyLn8CLsmjn/um4+7m7i0J8ul0iVuMivM/nI3FPmx3ESkNu30/239f2T2dOTHoeN3x
 4nnwcBjkuqNyogI3eIXPNl40KaZ6It52ISbOazVlZmiLASXPaU1+e5HW0Eoe36X9DTZt
 acOqPQob46KeNbf9+FDMWAw/Xrn3niHE2P0YoCFkYHbn0Ik2odoyN8ELljxKnt0PmasW
 SwjyCbuBAjCh0F1WJBnTsGPTjahI0DLySb2ui9Z1AgkjCn0uE46ggHHIb7vEgHgjFLJ3
 i2zbqnogRH3pg99SeR8hXL4+kGYN+KNlJjtnGXmpevArNbgM6UnJAkq7q+qzP6lr1by6
 ooWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=uOMC2nC8u6DLRHiIipL7Qk53WMB9AH6GdsFw4zSJPJo=;
 b=B3kYEOvwEM3jJnEK8bWQ1/anxPfY2gpK5Cg9SZoZ1gy0opD3/iWalNiA1xoNhyWUbe
 tJw5Y7MrfP8zF4KyP85IEdL1NDU2z2e6yoYcV+gVSoAo0WWL+Sx5vJJKGJlhAXfHcKhj
 gPL5Ur+XocHUJLs+r/gqdy6YsoB9xoonOfYge8PCnQvf86rmO4/PfIEyatVND7GXx1ZB
 CMuOk9vsVu5Q2Fq+qEXfrkQBKLQg91g3/G5CqvCWgjAVNbpfZf5tf0zEpHBmjRmwhW8r
 MMXy1K2oKKEDF87N7O/wSd462c92FVsfIWifEVBuJiNy+VmTZ6TTyjZF8HtGpUZpI10a
 l6BA==
X-Gm-Message-State: AOAM53048n5F8GESmksrBYqgYd76fhJA1Pvtz6EvNvsiouXSi9uoSpbU
 PbZUdT5o05xZIMYDyIeMLief0w==
X-Google-Smtp-Source: ABdhPJx3ngR2mYTcl1VIKNdcSLw7hHdV/Mh3N44b7ux+iFYdJfUZYYYvk/E8y3KNUd4HHp+bNO0Kqg==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id
 o17-20020a170906775100b006ce0e3c81a6mr2370265ejn.278.1649945920821; 
 Thu, 14 Apr 2022 07:18:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 fy11-20020a1709069f0b00b006e8b68c92d8sm663765ejc.162.2022.04.14.07.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:18:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 34CBC1FFB7;
 Thu, 14 Apr 2022 15:18:39 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-27-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 18/39] util/log: Mark qemu_log_trylock as
 G_GNUC_WARN_UNUSED_RESULT
Date: Thu, 14 Apr 2022 15:18:34 +0100
In-reply-to: <20220326132534.543738-27-richard.henderson@linaro.org>
Message-ID: <87k0brwxxc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Now that all uses have been updated, consider a missing
> test of the result of qemu_log_trylock a bug and Werror.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

