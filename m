Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD330C328
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:13:17 +0100 (CET)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xMi-0007QW-BJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wxe-0008LC-JG
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:47:23 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wxR-0003Vs-Ek
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:47:13 -0500
Received: by mail-ed1-x532.google.com with SMTP id d2so23227136edz.3
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l7gnJI2u7UQBh0yMSxKGhPpaXLuDAZ3+xXiodVd4Zoc=;
 b=MMxH0Q4a5cHGXQ7ToXpvb7ILVVCz+0Xl09hmCLZmHHFGdDfvybWeEWpeuTvOIecw5F
 RlF7++tmpMLAcWj1upZF9Ty7aSPVT44fAY3LTJac8KsFX2/xpBhIBwfMeC1sDmWqzhn6
 qnAJ1o2ZxmjxzEO6UAXPk29FmLIaFg8QOBYtDKohv7AtiqnOcTy77FE5XnOvmOpCCn/I
 Fm0S3mHUoWFk0gT8qcphyu6C4a7Bs4/T52Zm9WMdCbV3XorsWprtikcJIWB0pBmXItBv
 id2POZM8pdoZrEUI+crCDFKboPpZS2ZuIa8Xtb9jn2Y+IEvgnixVENjh8OJDdELDy2oN
 NhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l7gnJI2u7UQBh0yMSxKGhPpaXLuDAZ3+xXiodVd4Zoc=;
 b=Qx1sIvA9mu4Em8gHN4DUPA37SvRujk3waOKmkcI4LQPd6dswG8Hx1U0ejBb4B3p/R/
 kSG6Gfh6xeerSXn/Z+25D8THXvLjFRKp5cNYPLG24XYEg33lq+W4VvoRm4tHI5VVspOG
 eJGxo6wqQMxPtMV3orkyc+fm3JHcsCuTd44UI/4RzhixjK9K86v1KIL5bmtFa8k0yO2v
 V11fnLm6+DqPBim/1VFQF4wAhu/NXIejkLKjyHx/Se5eOTAxGHpbga4ics4b2lHC54BY
 wELPLzwxCfcogx5SreJgtWvnunBvww5l/JYTseaV3mJM/kHwoe40T7tfE3sRPAQDSGyN
 l3SA==
X-Gm-Message-State: AOAM532Oe/S2UBXeHfpgQ/88sE1OIEQQRkDD+rhmduA/1Cse+FJD7r5a
 /+Y/TYA26um4C+B6mVZPb9V7ctC/59giRXKHlIRPpQ==
X-Google-Smtp-Source: ABdhPJzrSprZPLm2UEEBjFeeOG9p4nq7lTqnF6OH5eaZYs0JQufd3pYy6iftNmAwPbSMHAQnbaIv/seqcWR/uPmLBEQ=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr23751781edd.52.1612277227985; 
 Tue, 02 Feb 2021 06:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-22-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:46:56 +0000
Message-ID: <CAFEAcA9wWVa163O49FbYdNae8MN4rhdpSbLdFNELpUHZDuTyrA@mail.gmail.com>
Subject: Re: [PATCH v4 21/23] target/arm: Add allocation tag storage for user
 mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the now-saved PAGE_ANON and PAGE_MTE bits,
> and the per-page saved data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

