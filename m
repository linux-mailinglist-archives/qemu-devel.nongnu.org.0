Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECFF4E9CAF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 18:47:11 +0200 (CEST)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYsWM-0000tH-PL
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 12:47:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYsUc-0007rD-DS
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:45:25 -0400
Received: from [2a00:1450:4864:20::62b] (port=37678
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nYsUY-0005nc-Bo
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 12:45:21 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bg10so29910379ejb.4
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 09:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AXbyYdXP9bE13GOya0q/0LeFMAZ4w4jljUkUSf4KYts=;
 b=ClVC6dH20FQeE6MvGW+2c3eS/w1mNZ5rZoa2wh7DGkSb9KhDB2yMNh2oL7cHOMH/nv
 UkdstQRM64hPvSNreK96+3NyKKFFuuVy00ZdUQKQV/cBi0bou0l9NNfGvaobFrPKws2v
 826RqwDopZxkr3OQgMvyyv98kT08BUoUqVSlGl2x6Zxp4JSPO8qw5BoR4Yv4biC8gYsX
 68jLeYHA8l+Ck932mgqEi+sMB25VzVDpxnq5XWUVtZDQXugAEP3hO3uVMA1e2rIJ/4N0
 Mftpsgjb/Tl6nePT6UsnxANGbEj93LIWFRyLBE7IwDghK8TiYFOhdJTeb0sz6EqUjNSu
 3OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AXbyYdXP9bE13GOya0q/0LeFMAZ4w4jljUkUSf4KYts=;
 b=RWNqvr9YmDVYoeV1aoX0zVybryw0pSnjFwzqnlzrg0JcZyl8d/1XbFrsMdsXyOGhUk
 BCmck0zWnRwSFYk9y046gYuw7w4/oTsGs2GbDxC43CFs1+tVXar+YdpXEP7mS9Jv+v8r
 HIFtHcquGBGjFvt6kPe12UhJi3ZX0j0m2XW6sHDHzIw6DekaWlii9ko86gsDhXdok1zi
 FMNy0NZyiDIr3Aw2KpCTF1SkdNVJ5DETd0ir2uvvRNg6s170uqqw4LTQkj+MEEMi0ttI
 Wq9xDutGfIccR9KclKOtP2Es2Z3sLvX29Ixm8iAp29WHU6YcoKFTr/TP5SpNRUpvUjJI
 wjyA==
X-Gm-Message-State: AOAM530EeK+42C4EO8MI7uSjW4XLA1oGNdSq5Hw2SBGU9Osegj2T35+v
 F0t5awdayByX0Cd7xCW6z06IIFyF4yCuxw==
X-Google-Smtp-Source: ABdhPJxjVSnx4CyGZNvTlGac78mKjFPphjT6R0sLNkWxXo/4MGAcoZXA8YJp+qe9KNPD9I8wglizOw==
X-Received: by 2002:a17:907:62a1:b0:6da:7952:d4d2 with SMTP id
 nd33-20020a17090762a100b006da7952d4d2mr28767387ejc.260.1648485916412; 
 Mon, 28 Mar 2022 09:45:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 nb6-20020a1709071c8600b006e02910f818sm6134242ejc.157.2022.03.28.09.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 09:45:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 87F861FFB7;
 Mon, 28 Mar 2022 17:45:14 +0100 (BST)
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-4-pbonzini@redhat.com>
User-agent: mu4e 1.7.11; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/15] tests/docker: remove dead variable
Date: Mon, 28 Mar 2022 17:45:11 +0100
In-reply-to: <20220328140240.40798-4-pbonzini@redhat.com>
Message-ID: <878rsuxbz9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

