Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F16A97E6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:58:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4yf-0004HH-JO; Fri, 03 Mar 2023 07:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY4y8-0003zL-25
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:57:04 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY4y6-000222-H3
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:57:03 -0500
Received: by mail-wm1-x334.google.com with SMTP id k37so1556009wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XAk/sDdX8LyPjbOykITfpOM51d7JOalxrJLJT7HAKqs=;
 b=Rwuc5Dj0suh0HaotUf9bpYAtD3hXIuQYlXEG8fBaNG52vh4S9EsAo5QyFUH7zqrBXC
 TfO2/Owihrdnji4m0ulrBcKEiM9AliTdgWGEufeSGaur1o46qtnnDBapkdmk32Imb9sW
 F6jor69gXF+qNWIeGOnCqfmrvFPuwhEoNru+bes7UiHCF0L4ihLMOhQKPPRJ379Rlu1C
 sctkurh1QGAfv4M99PnaHSBH4WArTCTlPJ+5EXUDBj9HEBHRviRXjHzXtEV6uF5gXCJs
 5gBnvy8Al4lAC/rB7ktL57PW1gXVljOFGgqH+EhZZi0DHHqNwcorYdaIMIR790D9cEo6
 J8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XAk/sDdX8LyPjbOykITfpOM51d7JOalxrJLJT7HAKqs=;
 b=xC4GfZSbiUF3joOiFDW1OcJUtM118fqhh2eg87NFLrJpDDE0IHjyyOAUBzT9ja0Rdz
 U6u8preZOQYTkW5JrdgmmsqNXPl7zvzN3G8RItC5qMa5I0YZs+e0zZHyOEwAi6NiJ9oK
 0dGGkM0aSETo1ocAwFjzDhbHTeGolaxb8rM40TYA5g2ifrNrohDlh0yLMKg+z3PXxl/N
 9YSojxjbzai+WkmYNlqlWq4W3/vFIgIOaOg1rArAnXDVQgjqPbxPufLD+pqbi9squv9P
 3J5uA7FsgqXvhPsoPJKj4mlqiXBBR6nKxBVvwf2JBh4Kc1PcDr9gGu7zE6x54ki+qSF6
 cMJw==
X-Gm-Message-State: AO0yUKXHylFrAMD8JB+eX3gVFXvmbko6DCxxzEBHud+MYyNjV9JvS8Th
 NDwxbVuONY9yN61GaCQjsozVwg==
X-Google-Smtp-Source: AK7set/UXxsTRPSjnkz7P+eCBop2DG5LvnEn2/Ti++Qj9u2y9QY6H3/JXJs2sCoJLRRYvRzwT1Vqgg==
X-Received: by 2002:a05:600c:4448:b0:3dc:18de:b20d with SMTP id
 v8-20020a05600c444800b003dc18deb20dmr1533462wmn.33.1677848220653; 
 Fri, 03 Mar 2023 04:57:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc015000000b003e214803343sm5892975wmb.46.2023.03.03.04.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 113651FFB7;
 Fri,  3 Mar 2023 12:57:00 +0000 (GMT)
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-3-berrange@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/5] iotests: allow test discovery before building
Date: Fri, 03 Mar 2023 12:56:55 +0000
In-reply-to: <20230302184606.418541-3-berrange@redhat.com>
Message-ID: <87356m9en7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

> The 'check' script can be invoked in "dry run" mode, in which case it
> merely does test discovery and prints out all their names. Despite only
> doing test discovery it still validates that the various QEMU binaries
> can be found. This makes it impossible todo test discovery prior to
> building QEMU. This is a desirable feature to support, because it will
> let meson discover tests.
>
> Fortunately the code in the TestEnv constructor is ordered in a way
> that makes this fairly trivial to achieve. We can just short circuit
> the constructor after the basic directory paths have been set.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

