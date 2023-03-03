Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E0A6A980F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:59:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4zc-00083q-Tv; Fri, 03 Mar 2023 07:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY4zZ-0007zR-9N
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:58:34 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY4zX-0003Tv-UP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:58:33 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c18so1519430wmr.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+Uc7VcW1NGPlapvs/AzRA03UkEjPfoD2MLRxcBXKqs=;
 b=VWhvbDFjYEf5Bw9qPasxjESa88C7tTU2ucvugg03rUQVXa2Y8ifh8lc5bbxtkt4GxH
 0LIeC5GHRk0ke7a4l71xI0yRVdfOmc3FgB5GC6KKBIimfHUlpu6IV0K7K9N2tpk3Poot
 VrhX/9K94cmIUtGiqQBAbKeMhG+nMYVB8kSZua9NX7YN4D3n2dN8sCm6MyEZmeDjlD83
 jXsaqrT/wR07KnqSOfIhTLSDxNGjGWrYF3WIRrY72pAwzDf+F3XvGGolv/Wr/9oGiAuB
 eGKoHYz4ujdszkBa4GylClaItywYGcr8zzJ+KkVTl4Lv2sb93qpSwpNiZdaWVRFNepOM
 34sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=F+Uc7VcW1NGPlapvs/AzRA03UkEjPfoD2MLRxcBXKqs=;
 b=2oiSUsaXMR6neSLoXgHo+WjhAgGgWz5Y09lynn2RM9j38cSizYINsd0bQSVtZyU8Ng
 m8WtE0J8RWzpFXnnhqd+GxlVgOKZbkBUIZBAVuQCYWa9Dxnyh6HxLRepRfWVF/xcoeox
 0dLCZXJdU+omdB+AFYF/acMCpnRcGk+RFg1bMxGoeZoqDtkRLDfNtQIatv4CqOODvidR
 RhFIC7Tgiq51kzxU+N4YrdZohcZ69B6ZkThwMybZx3SFP4Ik9YIxwUCB1090MNJpaL3A
 QxIjklzF4GGbXhBws0UOk5NW6O0Y4QOt9Is0BZ3HSbclF9a9l2e6eFSkxLtE8M+aNj2C
 h/wA==
X-Gm-Message-State: AO0yUKVXD6mVssXq4MU1BI2e4RWCjpDJK8RsJvLksucYdFr4q8uAMG7R
 Xbw+2+TIrRsbkc+TUkDlJ1cMRg==
X-Google-Smtp-Source: AK7set8GLoXD4U2x+2JXdsVgt/yGlcAwKc89Rh/9TynFZZaEFpTRkvHm571QCmtB5RW4juO4yrJU1g==
X-Received: by 2002:a05:600c:548a:b0:3eb:5ab3:b6d0 with SMTP id
 iv10-20020a05600c548a00b003eb5ab3b6d0mr1589801wmb.6.1677848310243; 
 Fri, 03 Mar 2023 04:58:30 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc44a000000b003e21dcccf9fsm5703550wmi.16.2023.03.03.04.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:58:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D3B21FFB7;
 Fri,  3 Mar 2023 12:58:29 +0000 (GMT)
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-4-berrange@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 3/5] iotests: strip subdir path when listing tests
Date: Fri, 03 Mar 2023 12:58:24 +0000
In-reply-to: <20230302184606.418541-4-berrange@redhat.com>
Message-ID: <87y1oe800a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> When asking 'check' to list individual tests by invoking it in dry run
> mode, it prints the paths to the tests relative to the base of the
> I/O test directory.
>
> When asking 'check' to run an individual test, however, it mandates that
> only the unqualified test name is given, without any path prefix. This
> inconsistency makes it harder to ask for a list of tests and then invoke
> each one.
>
> Thus the test listing code is change to flatten the test names, by
> printing only the base name, which can be directly invoked.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

