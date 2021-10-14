Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712F942D64B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:41:55 +0200 (CEST)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxFK-0000Ia-IZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maxC9-00060V-1D
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:38:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maxC7-0000n6-Fb
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:38:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id r7so17478207wrc.10
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=V1Qnr+R+pO2BZTSJxQ04Yud4Mdw6poSVdZ8Puz33pMI=;
 b=IPsA9kvridRh5CKlCObgFJQkQkKtyfiSzTaJd7jXI9HQllFiNHwyWzYn79tcPOUD1h
 nC6JY4+bRTAn5a7sDmaqVrnMXtSFJYhMDSk9hS3fyM25sD1vPe3NPXfL3xhXffNY2omD
 XQijcrbW421IHVNe+ew9C9zL1m22O6guTU81mkXVbv4S9lbOjHyAhIlROfKNYpWVW1jN
 6nCeHsdSHSnm/uz1nynuVrf4oQUrlMwCGmUDvsytSKBSC8kLXinvSGzax4E/3+rf8+dg
 Y8zG0Fp3S+9lWHyakdW5Cx1iHjR8Ty/Lj0iSjazHLQlqlgGgflOzs3CKSq35CBabxK2b
 dSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=V1Qnr+R+pO2BZTSJxQ04Yud4Mdw6poSVdZ8Puz33pMI=;
 b=KCmSYZiMjijKKeWGfcP/vbq0D3uqFj1InRxYsS/I9wYpSSGIGevkZl8HxBRKHbMIFL
 +pJ6UZ3BgspzqCoWOwUNtUzFicMXZJL3U4VWf1AuN3kxSXvJ4uGKtixeqnF+WCKBbsnF
 0D9v3onE0vBMY0+Wu01rypbygW0PuSS6qLrW1EYJ6pqy7wGU6yR887Z171twYxM7ionJ
 I5SFqwBB+yoU7ysWkImTaj09WhXzo7L2KCe4bVVzvgpb/xTbpNFP3PwE57HG2CNa16EY
 zTfTvTSr+COeYNJ8wRqUD7dIjpglNcEAfEtvNjN3lohTkdwcTvgNbaLB6PWGGw9q9gzL
 8+Zw==
X-Gm-Message-State: AOAM530MLjlGvbtrtwdcrUXmAQ2La17MgLs1K5QIT5gqbMvUgpBuMSBA
 maPFYeSsLszA1j50gLJR40VL1g==
X-Google-Smtp-Source: ABdhPJwbBQwJ8dV5N4Z9Rkp518mSl3SgnSvHdKa5h4fS9/lBjkMaCGhrUrUU5GhZJv1YxqKap2Hm5w==
X-Received: by 2002:a1c:9857:: with SMTP id a84mr17854821wme.28.1634204313629; 
 Thu, 14 Oct 2021 02:38:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j1sm2203354wrb.56.2021.10.14.02.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 02:38:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 14B211FF96;
 Thu, 14 Oct 2021 10:38:32 +0100 (BST)
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-5-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/2] tests/docker: Fix fedora-i386-cross
Date: Thu, 14 Oct 2021 10:38:27 +0100
In-reply-to: <20211001153347.1736014-5-richard.henderson@linaro.org>
Message-ID: <87ee8ouesn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: marex@denx.de, =?utf-8?Q?Daniel_P=20?= =?utf-8?Q?=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "Richard W . M . Jones" <rjones@redhat.com>,
 crwulff@gmail.com, qemu-devel@nongnu.org, laurent@vivier.eu,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> By using PKG_CONFIG_PATH instead of PKG_CONFIG_LIBDIR,
> we were still including the 64-bit packages.  Install
> pcre-devel.i686 to fill a missing glib2 dependency.
>
> By using --extra-cflags instead of --cpu, we incorrectly
> use the wrong probing during meson.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

