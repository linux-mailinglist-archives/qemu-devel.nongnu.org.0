Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131AF67CE1F
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 15:28:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3Eo-0004Ld-5k; Thu, 26 Jan 2023 09:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL3El-0004LO-J4
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:28:23 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL3Ek-0002rV-3Z
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 09:28:23 -0500
Received: by mail-pj1-x1035.google.com with SMTP id o13so1685091pjg.2
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 06:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FqI5rDjgB5TUkSUzLu7vy8jRLijY4TsYtVUr7Ekl3DY=;
 b=X7GbCWt0dHDB15BqIWGpmVKhB3/CgACC1ojZqR3U54F+dns+UY6IZaSD1FvRSJlNRs
 ciWimGIr2dzoq7+fwXFldCs47MTNG2gUmocH750nsRUelAc9pdWwO7Jubc0ghbhKxUlQ
 gLnUNOu53OFvgboy8aLLDy+LCwPDnlkrSBQKJoKVrmJmLul+0y9ubtOsa7czgJQSWofF
 5CCHdGN0H/8jIAv9XrjWHMNq6sumMaSX5W6E7p6j0RaM1vM4R8FLnioztDlKN7GSejC1
 Px4PYikhWH+Spsjg6+l1JrhZBs8JBe7PDKBYkNIukpw3ONMpODS9+tq4O2Qxnmr52jWi
 jksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FqI5rDjgB5TUkSUzLu7vy8jRLijY4TsYtVUr7Ekl3DY=;
 b=SOBla6WrL5dujIhWjO0n50nhe67ux3RjH9bizYY3ae0lLA2tOZ8txzlf/dU2NboSqR
 zG7AyicmX//AlFHIedT9v/b52RIHxjwAfTXSsEZEDJGTvbu8E9NhBoylOTk56aefhuB1
 rrCJORUaiujHdJQzD2R55nrJgYZTzv4M5QU9BIMSx6CGoZv+bZ4czxA1KziQja/Yw/rq
 /f9tobOZUtJDCaiQgInKTsyw1R8UCev7P2/lgycERQj440cCsXZZNJFatEmXPGGWXvIf
 RSVcZ+yCjEn5xAjqPCdZG4kJC+4SzeO0732VYBcg7o6nrO5Km5qSMXyzGg4to5gbu8aL
 rLYw==
X-Gm-Message-State: AO0yUKUDo74iGBTIEhkpHnvp2GezPylFd4d5NSA0TJ/x2GJkx3PVVJjz
 KNUGf8s/ZwtkhJa4jLHzGR2lc3UrQ32/e7ng76tYW/svc/twzQ==
X-Google-Smtp-Source: AK7set/p/ljSrM6nVKQPauhQN6J9vhWaE/L7Y6bEwPohglbOzDzNUZZhf05hMJqeFIby4ld03WYjQvl1rp27V3frscY=
X-Received: by 2002:a17:90a:71c6:b0:22c:dfb:a9da with SMTP id
 m6-20020a17090a71c600b0022c0dfba9damr1054689pjs.115.1674743300644; Thu, 26
 Jan 2023 06:28:20 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <CAJSP0QXC3z-UyP5HoVTOmAfyz_vV6cpZJvnTYazWq9=52bndpA@mail.gmail.com>
In-Reply-To: <CAJSP0QXC3z-UyP5HoVTOmAfyz_vV6cpZJvnTYazWq9=52bndpA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2023 14:28:09 +0000
Message-ID: <CAFEAcA_CJ3VjHx1GhjBJjCY=+twBZM3UnR_g0sZLJhvVLcY=GQ@mail.gmail.com>
Subject: Re: no more pullreq processing til February
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 26 Jan 2023 at 14:25, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> Are you batching pull requests? I used that approach last release
> cycle. CI takes so long to run that I didn't want to run it for every
> pull request. Batching worked well overall.

No, I just do one test per pullreq. IME the CI is flaky
enough that I don't really want to batch it up, and it
isn't so slow that I build up a backlog of unprocessed
requests.

-- PMM

