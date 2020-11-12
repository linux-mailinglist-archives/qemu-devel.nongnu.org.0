Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D452B0CCD
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:37:48 +0100 (CET)
Received: from localhost ([::1]:39128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHTf-0001X6-F7
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHO6-0003iz-2X
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:32:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHO3-0004AL-PI
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:32:01 -0500
Received: by mail-wr1-x42c.google.com with SMTP id p1so7038462wrf.12
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=lqiOFvPDlEg0ff3gicodcKqA5692JtQ/80g/I7VqCco=;
 b=AZ1rq7Qe1FeeYJSPlrBimXSGI8h5TUWRDufBIxpZQIB66W6F6g1Q1KMV5d/t1+xrIx
 LkPr2vYjUJKHiK1n4xQIHYsmKyXJR6lmXwYVEXNAejX/BKdBfJJbpGoGlR9Fc1qX0+bU
 BCpSh3GMFReWMD4Mvlo/hJrhaI/yFlxIJbZ73ZAJfGUa6Fa297wDO/eXhTbqmz5tKSCY
 hXgeXAjOl9SoioNHu31auTQPYBgAcl3eRuVK/Zy/q4VJegTLq+qQACGbqIxcLpfjT0fh
 Dx1EVGpConiGxPUq7QNn0MnKX14D3mJGOlTd5kuyEBKHzryr/xLZt8gLIUTTlpbQmRrG
 RUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=lqiOFvPDlEg0ff3gicodcKqA5692JtQ/80g/I7VqCco=;
 b=TJ3I9Hveuqvadjl4G+Tq1/mypG70ayccJbGfAbodsQ7a7wzAlMHVF2k80PHcSp6I5v
 uK4xi85sqUI/QkrtazkcODtNvEkgaxyb2S/DpAUhDqu4M1rLFgqDqtUD0OtZKZWTMkIb
 ksl+Jr8JNIw4VClATB+H5Xq8Ww5Db5qQh3Qf8kHIAsph61hxDq7S75kn4GPD2fMyY8I3
 fTYe6oAW1QSMa7pLvglCe4Gd1/CR/hHQf0wPIYxbrVnaT04gBkavmI6rql4KOvIIfuuR
 e0ef1A1HBpKfzynWyz4kAh8VHCz+dDawfztsEfQSBoPvPxhkeNtbMnPhJxgk06Xp+thy
 qnnQ==
X-Gm-Message-State: AOAM5318HdWnizFJzMgmQMAr3CFG2+tyL5GCMG/DH+KHz9oQwruK5Hui
 BCHEwXQON/LbrcPuqAniRtnjxA==
X-Google-Smtp-Source: ABdhPJwTsHOYrXR3naBe9Vxv2sjIqpTrqacZjFwVQ2/bQbUE6kyDxkp32o2HYxZD3h+juWSnqwOOPw==
X-Received: by 2002:adf:f607:: with SMTP id t7mr934394wrp.169.1605205916926;
 Thu, 12 Nov 2020 10:31:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm8463226wrg.16.2020.11.12.10.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:31:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 449541FF7E;
 Thu, 12 Nov 2020 18:31:55 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-8-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 7/9] docs: Move pr-manager.rst into the system manual
In-reply-to: <20201112144041.32278-8-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:31:55 +0000
Message-ID: <87pn4i5sv8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Move the pr-manager documentation into the system manual.
> Some of it (the documentation of the pr-manager-helper tool)
> should be in tools, but we will split it up after moving it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

