Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADC544BEC0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:33:46 +0100 (CET)
Received: from localhost ([::1]:56958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkkvK-0000kF-1N
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:33:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mkkoP-0006oi-2H
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:26:42 -0500
Received: from [2a00:1450:4864:20::42c] (port=43948
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mkkoN-0005bt-MU
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:26:36 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t30so3068273wra.10
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 02:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MsSnlA+U6AkGpQyyBOMbHQvtp1Y2Ep7dFySuRimypmw=;
 b=uQWQoPdoG3kYi3Vfiq+5ERkqaB/pYq1/jJRJSAQCeTSAjzTEmjR99NFm5onA2wiQpp
 xoRy/qzLzTalSRm1ILth0U+cuYjSUkVGgBwgBwdKqaCBRVJG/8ADRf5gfxeVoOMI3rlS
 tPtoBT6x4Wj6nhURM+bzbELfSjb7PB6wwkNANFydXcK/KZzv0vFaXV9Erp8UTTGV3cjx
 9BSQsDVRQSRmWXpr1Q3M3wNGlB1jKMMfJXVYcuRclEjTQIZ0tcTVFt+J6zo+KaiuCp0S
 35XpokyrjQKuaFzQL6Lc3AWcrGqUvDf77wRtD1B8OPZoM0V77LfX5byVw24E8+tnGD8P
 0Mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MsSnlA+U6AkGpQyyBOMbHQvtp1Y2Ep7dFySuRimypmw=;
 b=a2phvBenldOOWgRhfgNQj4F/fNsHiDRwkSf9kcHQlSdvXHOje6azeS8RA9jvDb6BkD
 We8u0XdXW4GEgngw+b8nNjb5brJ6X1o7jbH6h+LCp1IZT7BNavqAyOKUAtXz6auUxKvG
 yybHalk1yUHqg/VqQryy0NQGd5QjW9YeKU42qQ8L2JX0f/Zdl0v3Q3a053Dl33NUK1NM
 uRaWHALqKZs6V+UcJvY1rYWcSji4iA+fvWm02G4a534PpH9Il7RXl6gIFP2W3sfImjCh
 Pe9zvXrHbWNJbBRekrrX4iWJr4oZpzR+oiyc5iGqCE0wJtLqa9K736SSGwMXVq47xMmA
 NVbQ==
X-Gm-Message-State: AOAM532B4utJ7oLpNFVgYHB/Vf+g27GqtnWg/sYD036GvEzNnkDN6oPB
 HMMg0lnhxiffe5jWTuJSEDnbCo3sySTf6g==
X-Google-Smtp-Source: ABdhPJxINC1lQ+TE+MHvvkIyCK+5LcSFr6fo2BHOuSYFKuBQay1TFZIvyVDkextWZqx1vDnv4T6CKg==
X-Received: by 2002:a5d:6508:: with SMTP id x8mr18187865wru.388.1636539993087; 
 Wed, 10 Nov 2021 02:26:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q26sm22368453wrc.39.2021.11.10.02.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 02:26:32 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 56FF81FF96;
 Wed, 10 Nov 2021 10:26:31 +0000 (GMT)
References: <20211110092454.30916-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: remove useless libdl test
Date: Wed, 10 Nov 2021 10:26:24 +0000
In-reply-to: <20211110092454.30916-1-pbonzini@redhat.com>
Message-ID: <87bl2sjoh4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

> dlopen is never used after it is sought via cc.find_library, because
> plugins use gmodule instead; remove the test.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Queued to for-6.2/misc-fixes, thanks.

--=20
Alex Benn=C3=A9e

