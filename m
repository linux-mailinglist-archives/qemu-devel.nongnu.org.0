Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC91D314021
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:16:20 +0100 (CET)
Received: from localhost ([::1]:55348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CxH-0003jU-MX
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:16:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96wk-0004hw-OQ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:51:23 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:34078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96wO-0008Ji-Bq
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:51:13 -0500
Received: by mail-ed1-x52e.google.com with SMTP id df22so18190785edb.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVDqkMFjX3DZafZntChvxhRXcB2jgfScmAOqtURtVjY=;
 b=dAGzjaAsDVfpoa7PhS6UsOB6/nge5p3BrLs/e+hKCjyb30nH1SGhVZNbqkzXAJr7nx
 4ZgxeCUuvTOfO5Pajhuk0mnsvxvY3iEC3NgMgNPXzpRtDWQRYHLqYgoRo1C/foe/KCp/
 Ak7m+RsP37c7JDkguuQMal4ZikTv14FRJPcwcadFF60hUR+N94AiYJovtwlogVbMqWwz
 byFkYzDqBP2DmV+KBSYaTea5SkHOnfaUh7H/IMukxPQPH6UUxzEZbR12K8SBJfb/ju+a
 mya4OSVHinpBvjOBdImCscE9eHOOMGv8LTVajggHib52ab+KzBZcpyxSrKZ8eKOogasW
 YjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVDqkMFjX3DZafZntChvxhRXcB2jgfScmAOqtURtVjY=;
 b=GuhaxKgvERNgJdR8saGTeHF6u4EZU9OGdZcDnIMEXX2egU+epVTF0Rd5MTIJB3bAyQ
 2JxnoZov3d/J69TMX3whxJwkIoumvFmRJYdcnY3fvN4k+UZuTsequKOZ0+Qm5PrOnr6g
 Ug3yMrLvbKzVclmkb1oeBPumVU21nHMNimaAe+2XoXjjhzdIW5Sf5qe3JNWC01RKeJE+
 U8WFG4pm8MJpy7N2tVwCv9mUNPubmVDxjAAbtNt7JzwCrAdhP5Qc0wYH6oI0eySJSQ3v
 8DcGTCj0V2nHlVPs0PymiduXDHvt19X2FBBbKJ5q6DdR2TzoGPb2tjz+r8BAK+VPEf4w
 9tLQ==
X-Gm-Message-State: AOAM533QTSbF/ujq8v1jbaQ+1u0fBZCQVnGzvB3jI7NtGtXbgDz8pFFU
 YljEU0ir60E/pxuap4l5qVSFgfKbnYCFNXc72HukNw==
X-Google-Smtp-Source: ABdhPJxO1RBU8OJAO2UwvBfUumLU2ybJAG/Ut6mL7WSqqZ7Oj24ElUEeSCENH/c8jSFCKY1JZ6AHpZvOx6984SqCyew=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr16907978edn.251.1612792252304; 
 Mon, 08 Feb 2021 05:50:52 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-18-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:50:41 +0000
Message-ID: <CAFEAcA-gjcEqLBw0UuOb9Q8Z=0nJHsWxTgHRYbYND4DueiiDvA@mail.gmail.com>
Subject: Re: [PATCH v5 17/31] linux-user: Move lock_user et al out of line
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are not small, except for unlock_user
> without debugging enabled.  Move them out of line, and
> add missing braces on the way.
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

