Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8732993AE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 18:23:18 +0100 (CET)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX6DF-00046B-1B
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 13:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX67O-0005qC-27
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:17:14 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX67I-0008Bb-Qp
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:17:12 -0400
Received: by mail-wr1-x443.google.com with SMTP id y12so13533639wrp.6
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=54gDcVuAT56XwNhs9nnw7oI93eoVaftg94YAOBBdE88=;
 b=gqPtOVjFS5UntBmWLOjJQoBN+zdoNMunXlL+HOlxILpbbJoEe9UzpwppwnUF17rulp
 AHRxoDfeu6y0EVF7SOmRjGasVMgFV8yRnk6d8lvD2OJpJFXmGYRMuVqQ8Ly20IpZQ0dT
 Hkf7h3zAy8c51LPzwunC83JOqx60fOhXZQvABS0NdNB6knW3JQBIjsFcPg95rpKk/Soy
 wrhQZAZaTQbZ8lRMP4uoFLsgJhG6gKQYNll3qYefd6NeyeWlKVDLs32DNatmefyaQVSh
 ypBGdN1s5Ac5IBO6EfXsLj9Asc+jiehoHt07Tnsnfyexs5LIWkyho0WmA3c7cGx0Zibv
 LidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=54gDcVuAT56XwNhs9nnw7oI93eoVaftg94YAOBBdE88=;
 b=hvK2Xb+x+d3LtcKdi53Z2d3Dd7y4mf+Jswt1owZYpdehq7arZpk9nFf1BPElaMLeZk
 TyQMfQgVqJRAaxHasPrU3mro7M8o/jGTmGWBtBIVQPP/oG+RPcAf91MytPG2Bdcv/Xm/
 Nt0mAXXumYPhurCnXsIraB4qW5FNs8tCCNp+qAFGnTYuCKhKdlG3VusG7ojWhAXHXLrC
 4glMb6tOL42I7QWarg51x6GRLYCvBWmKnqsvwWMoMgMmPIAJPjyZ2fy6cMvL4Uo/7841
 iW3Lp2Xc4GJZ3ALXlPftUed32CVVxhGUxShdZJuGKUfGz1/m5VVmHOhd+2si1WFzwF4c
 3+SA==
X-Gm-Message-State: AOAM531B0NM1sw4L8ExoxFmSWPA24hbDVRCNUdjkJcR53t8Tipb8H5A5
 9Ke9bw9DTX0XYjusqWCb9FKuEkpwXC3Abg==
X-Google-Smtp-Source: ABdhPJwk1yepklPDC0NnEc+kb+dbO0dO7Bif4BwX0Gf57usuZTFD7VTtAZRGh5HoIDsJ5NqY4U4e5g==
X-Received: by 2002:a5d:654d:: with SMTP id z13mr19063481wrv.6.1603732626645; 
 Mon, 26 Oct 2020 10:17:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v9sm21090610wmh.23.2020.10.26.10.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:17:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E61F1FF7E;
 Mon, 26 Oct 2020 17:17:04 +0000 (GMT)
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-8-pbonzini@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 07/15] m68k: remove bios_name
In-reply-to: <20201026143028.3034018-8-pbonzini@redhat.com>
Date: Mon, 26 Oct 2020 17:17:04 +0000
Message-ID: <87wnzcgb5b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Cc: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

