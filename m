Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9711B30F5E2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:12:57 +0100 (CET)
Received: from localhost ([::1]:45766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gJU-0005Of-IZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gGm-0003V7-J7
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:10:08 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gGl-0005ck-3k
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:10:08 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c4so3880877wru.9
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/S7gaPtg+TrGAXlHWQqKrwqJOUhtZGeJhiO+m+SVMVg=;
 b=zWeKFWagFcGjkLpOBwFJ6iUDEiL2luWjpGQS2qkcuWZiMdWTa+xJtEQbC36bVTC6B/
 3Ilia6wTiy8eYsSa+QCY1VGTTzm+ZqOo02VIklbW87p8EQ8xuJS+Cn8LhHy9qtuyBVXF
 /ONPuxL/9Jsr6dewrngOyW+KQPt/0hW8fGhhwVU1LsEwNNA6L2OfqPvW2TguI/M6TMe8
 IcBnaCXbJHgt/0x6Rufg92AYq1WBYCqQKAvfBNygYcYY/mB3uwV58AoN98YwDRVOWrBc
 VrUy0vJLfBXFbscrM+8sbxB7mqdod6OtnJTtMlCyvSWzS/KMBh37S72FaC7PCRfFjT9h
 969A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/S7gaPtg+TrGAXlHWQqKrwqJOUhtZGeJhiO+m+SVMVg=;
 b=rZRh4ZT4W53PvPbBIO0TUZ46umRkRThNksR1GzTd+4cYiFABUwjnML+jS2LDoELkhw
 qFrlgXMwTupqE2gI4qkBJBvhNNkT8y7it6SThi+UJl9XMenCyXUDztr7qFbIQ0SgRmjn
 +03SHWmskcmJA70Wii9DNiTLpx6eNE8R8VzmZoma26B6c1rHqBiaaxXj9Yznp+H4CiLO
 uyVplZz56jNkwgQI1Bv/lU6kgqJ2Eh0SKU9rcQgTIawNi/0XhGncK9cLV+AXr+/36Ip7
 F7fxR585D7FhxS2Sh4H87KJcQIp64bynFr8HLeSHPvHTsC99hSKSmojEc1dfJe8kZbOs
 qZ/A==
X-Gm-Message-State: AOAM531U50w6Jp9T4AQoZOQkEhC8O7jFIFuEwP3iV60soa/fkm0vxvRM
 KbpXB1eh+UptnT20iP7gteem7w==
X-Google-Smtp-Source: ABdhPJyYJe2aYlJvUsp7U7Eq2dkd6DuCXobsjZpqaXxI2NZ/k4jmCEHl7ipN4aV5xI2A5jUeUY5uig==
X-Received: by 2002:a05:6000:1245:: with SMTP id
 j5mr9864090wrx.333.1612451400277; 
 Thu, 04 Feb 2021 07:10:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m16sm5700793wmq.36.2021.02.04.07.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:09:58 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C2411FF7E;
 Thu,  4 Feb 2021 15:09:58 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-28-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 27/93] tcg/tci: Fix TCG_REG_R4 misusage
Date: Thu, 04 Feb 2021 15:09:52 +0000
In-reply-to: <20210204014509.882821-28-richard.henderson@linaro.org>
Message-ID: <87lfc3q37d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This was removed from tcg_target_reg_alloc_order and
> tcg_target_call_iarg_regs on the assumption that it
> was the stack.  This was incorrectly copied from i386.
> For tci, the stack is R15.
>
> By adding R4 back to tcg_target_call_iarg_regs, adjust the other
> entries so that 6 (or 12) entries are still present in the array,
> and adjust the numbers in the interpreter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

