Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED33A7D1D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:27:15 +0200 (CEST)
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7Du-0005hq-3g
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt7Ce-0004KG-2Y
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:25:56 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt7Cc-0002Tq-6v
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:25:55 -0400
Received: by mail-wr1-x430.google.com with SMTP id a20so17953863wrc.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 04:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=ng4HCA9o1AYMx8GINwx4NZT3s1PEHxsHWdo8g51EPlQ=;
 b=NnbV88k8VXpVZ7J1LQBsRwHPuA/8uS6VgXQIRV21iI1TUV2DtxpPpEPdxWsb/778/H
 JXzlQwza4aFiufgxrfIWYN8PpXS03EVU0DlMY6czqE0WIWp4fdqS5b2ROHnvCDnm2yOq
 h/nqyUrVLT1Uos+b7u+I+SlB7z7mN8CuuxGcC1JHYZ9ccBQBx0cDlXITTCmU4A85XyNU
 H7djQ6J2ii6b/fdHqdS92nMcp+P6kXukNMmp9f+0mTRjBWL3svZLmF0eSzrrkYtg0765
 Z6Sjx8IrfTy2Czpwck1XTZzbu3Ud6zFIXpzVkMMhD6lSGIzVqzMMj1fP52g5OdzR6Ny0
 aS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=ng4HCA9o1AYMx8GINwx4NZT3s1PEHxsHWdo8g51EPlQ=;
 b=KheECR49sdPq+Lg7G27gDgEqxxYqQiBtjR85yUHIPU2g32SST1Qy9jIhQYPdglJh85
 rLGDAtYmcZ96Afb50EDbV/xd7eU6auK9zGMPs7pi4efiFWdM3Kwc+Z6EztDMaeTKj4kv
 qABSsJvpN+eDpJIfIf1GscYy99eJ6RXABAk9ERxt0//7jSUVLoXTq+xxujrplvAcO7sZ
 HytPPBVkKUKSJWU/edfTcv0lkjCikQtlt05OGlnm0EXIK0a3qn2T55W2nE59ngFjz7Uk
 kfx223hQWInn20qHFO44f0oZZ8Om+IksjUaCLYZ9+nQTTQOfBXrVkKT/a8BvXjhQfklw
 VYag==
X-Gm-Message-State: AOAM533Ae1C+eNcDbBIdELklcIkVvqkrlhlsi4U1fl098twiZNKm5XgP
 xmjZcEPTCPSN2hDo1spgN42Vwg==
X-Google-Smtp-Source: ABdhPJxOiru90w8wNXyJaZ/ObGNZR6SfbggoZexFFJdtuKzioVspyWmaN4bFGWnoaS91tgp1JJrvMw==
X-Received: by 2002:a5d:6747:: with SMTP id l7mr24135633wrw.220.1623756352459; 
 Tue, 15 Jun 2021 04:25:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l9sm15339996wme.21.2021.06.15.04.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 04:25:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B47591FF7E;
 Tue, 15 Jun 2021 12:25:50 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 6/8] include/qemu/lockable: Use _Generic instead of
 QEMU_GENERIC
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-7-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 12:25:50 +0100
In-Reply-To: <20210614233143.1221879-7-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 16:31:41 -0700")
Message-ID: <87tulzgyip.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> This is both more and less complicated than our expansion
> using __builtin_choose_expr and __builtin_types_compatible_p.
>
> The expansion through QEMU_MAKE_LOCKABLE_ doesn't work because
> we're not emumerating all of the types within the same _Generic,
> which results in errors about unhandled cases.  We must also
> handle void* explicitly, so that the NULL constant can be used.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

and I checked that sync-profile was still working so:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

