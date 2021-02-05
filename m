Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCBE311028
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:43:52 +0100 (CET)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8659-0007bg-Ef
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l85DD-0002e0-3Q
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:48:07 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l85DB-0006zD-Cd
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:48:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a1so8620606wrq.6
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FLISrImw2UpqYoTDc/q3ab0CfIlyZQwYNhJxYZTwZho=;
 b=kUlQfd6ZT2jR+OT3tqw9RLQbK1693nrv3ZOwDO8YcI6kHlXtfRqxiwjo2SKu3bLNVH
 xbSwjOWxVVucd5R/fxv5Dcb5yh4xRJwIofWjmkVeLlQRRkW0vPY3aE3fKzKqGhLaa2c+
 YYkFEp9dP3RiLXEnGe3vq1kqjgNxVy/30hOpFCA6F1ArwsV6pRA0yPx06hU66KLZpIu/
 SWw5GmUObAHFfYIooLIgAiB3DgG2SI5xrnrFF8tNoPKUgky+FibZZEolFJbqzfuUCFVD
 4X2xnalYII7dyW3KS0j2VNJnyyF9dOZD55fvZzWQwFc/6lBaK8UZFfB7QuAUpPOFJfY7
 aL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FLISrImw2UpqYoTDc/q3ab0CfIlyZQwYNhJxYZTwZho=;
 b=iISQwJ0k9iTbiddv1cdPiGSU8qMSZplupY+jAvF9RA8Kt/VwfZ+1HRY/kvlYQW/53R
 jDwt5YlYifSI6aw2uCWnYB3IpXRQPTVfnhQFuJ4pUGmyv8pnK+3/GwOG39G/vQV2V8oH
 5CBlQAcLXcQ68wxhtnODqyqMT6VGP6P9S8uD9ohxBWldbte2S3hXM1YopgaoMcmeyuNW
 +hrzmufWf4G3W2VnQteDxQfplOvARDiMAyDTeglaCKaRXEXSUsD7YbXuP3iZEJMCpB48
 IEiwXf1mohVblX2BOlLCtt5SbdXvI2TKuIzYQolHVlGr2yegzvc2WeJkdXb2IY8b3eBr
 V/5Q==
X-Gm-Message-State: AOAM531m//PFy5rfLC75isJeGLb7wXC4IPF+MMrFIGOgTin84B8YQvJX
 Gozx8HipwdeYnHvSB7h3V9abDBXgUlF3IvWj
X-Google-Smtp-Source: ABdhPJxR0P6/FWAoKqqJG5BLjkJWwZAAMuaB+yaqs2gGSFIMhlYlnsFMrh5NjKpkWss98bmGe0hdlw==
X-Received: by 2002:adf:c413:: with SMTP id v19mr6291145wrf.158.1612547282812; 
 Fri, 05 Feb 2021 09:48:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w25sm9680239wmc.42.2021.02.05.09.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:48:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18C5C1FF7E;
 Fri,  5 Feb 2021 17:48:01 +0000 (GMT)
References: <20210205091857.845389-1-thuth@redhat.com>
 <20210205091857.845389-6-thuth@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 5/5] travis.yml: Move the -fsanitize=thread testing
 to the gitlab-CI
Date: Fri, 05 Feb 2021 17:47:55 +0000
In-reply-to: <20210205091857.845389-6-thuth@redhat.com>
Message-ID: <878s82o17y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Use clang-10, so we can also use the --enable-tsan configure
> option instead of only passing the flag via --extra-cflags.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

