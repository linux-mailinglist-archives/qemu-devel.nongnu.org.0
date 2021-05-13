Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A518237F57A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:18:20 +0200 (CEST)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8Q7-0004bL-Ng
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8Ad-00024A-Jo
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:02:19 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8AX-0001tr-Nc
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:02:15 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so4384476wmb.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=yVXnsr+G25vRHDuRtoQ9SmhRp1sOIUdmIioPX/wX9U0=;
 b=MWqyOE6+b9+MN9ALiRrO2TAxVaEiP5c6Wk57QZmqXGXM7as+pISI1+XPoetmDtVPzQ
 1kebQoql90ZN9cSqHJKyrjolT8woQNCH/qTz69zMWUt+NEQ5YvFZgJRqM6yKDnOK6kLk
 8UCOizNnzVGbVTsTUTo2Y3+MDQCvfr/Qe+F+sqNIqzqPPFoGsfq6M8LWp0VM36FWddD/
 s/2pPTFwDWM23hjZC3gaKBo25qkD3pdIJuW7AzBGq6km/L666iDpQBr58s0SRE+1XhkO
 x5XU3VTxXFsMG0m32xi8zqa/74yKluAJJP1PhwYKmBKeS6ODv3Ea20VyRi7uEJjXWStz
 M9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=yVXnsr+G25vRHDuRtoQ9SmhRp1sOIUdmIioPX/wX9U0=;
 b=JNo5PTpYyP97Mtl0oEowuDuyKT8qWU8+EBSKh9fZ7KzhouGrNIP9QQnKUK/MS1id55
 Y67oJB1I4JJc5BXXeImECoKdDGnFRaKlXGI1dxl69XmqgR2QaAukXWOriOwsuZZt2tPY
 wci63aSszHPlX2Rv+q/eIK2jAO4SDdD2pi3rYghuT6ZKbi6tawWesCpBSwBDU2z9l7Se
 mawpX82E0FPOm6RsaScGnClGFSCE4Vy0n4ZwdJfY1uKy77/ls/vtLuLO1uvzHRjaB3oO
 sE3qC74+dYaBzNFTZjghrJUes8npP2+pQduxhyzb5Yb4ESEj+ylaB21gEFAFj631fF1k
 vlgg==
X-Gm-Message-State: AOAM531ywL+kKJuDeOsGN3VXJZFtgpfAETy+SbAVxIYJeBYhmAYpQ1Ek
 ON6UV0PDzyO2QicQFnM5Qk7uSA==
X-Google-Smtp-Source: ABdhPJweDKLEDZIqotLIb1cucb2upbKO6tK9uAnzSuCH7yrb9JS7JWlrhCNWEJOMARcbT8AI1kCFyg==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr3015177wmh.185.1620900131732; 
 Thu, 13 May 2021 03:02:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b62sm1854877wmc.39.2021.05.13.03.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:02:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BBBF81FF7E;
 Thu, 13 May 2021 11:02:09 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-34-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 33/72] softfloat: Use uadd64_carry, usub64_borrow in
 softfloat-macros.h
Date: Thu, 13 May 2021 11:00:42 +0100
In-reply-to: <20210508014802.892561-34-richard.henderson@linaro.org>
Message-ID: <87r1ibdk9q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

> Use compiler support for carry arithmetic.

Didn't we have a series that attempted to take advantage of compiler
support for Int128? Is the compiler end up smart enough to use 128 bit
wide ops if it can?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

