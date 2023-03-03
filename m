Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B519D6A9810
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:59:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY503-0000RB-4J; Fri, 03 Mar 2023 07:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY4zu-000063-CJ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:58:54 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pY4zp-0003cw-Tb
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:58:52 -0500
Received: by mail-wr1-x436.google.com with SMTP id f11so2154278wrv.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oLdEqABSryxZpGN/SUtPppUdsDXkr6RQXNU6fDJsXXA=;
 b=WPGQdy4YIsyMby6bPTys7WcmS5P3LoGgs6ziBgIsOMSLY3xnJFf0qXivdS95XSjUBP
 jEjZkF4w0NfcO37NvIrc9SxR/MIZaydPFOQFI0OH8u9huj3a9jKgueFfPTvN6sE9Xu3X
 DpZ5tfUMi0Qv9X7DXWdZE1sCpgAecV4n3g8/f+SO6w4xFj12D9PZ4T2WXOnpqgl4SP2K
 iiJ2LMdDwfslaOw9WNKTeDFMB5eNsOdUnKu41Najzv11DaaEy9Gh+VQj7Vz7zgDJmE0j
 RIUjCipnt08+XUkdKq6IHW5fyI7YMldAm3GDGjgHq0XxhJ1PtIz3I4Y4TYHNsKB/SmAp
 EuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oLdEqABSryxZpGN/SUtPppUdsDXkr6RQXNU6fDJsXXA=;
 b=PrxEqWW63dCZMyMZzW2firsmL1ciWVwzsRmqdw942tZU4Pdza5cZ7r8KIpf3oqLo0R
 nNTlSwyw9s/qIFPSYm9Hifl8ksZIHvJhnf1CDUEvwO7ZCrsaBIfRopGJmr6X8pKSwLMS
 MsA12+ubIv14I9e0AnImrE9wtmmrNt3Gs0RfllOEQDrjtQc2ziuRwyniRDNf3NbTAHpO
 QS+uzLp00TjBslWc5ewE8VWctBTvGsJzM1UxQKFUQBvjHtCUQDzOqO63+TaRpQeFh+fD
 eZtuzQ+UANh5g8nKyjkJShJJUTE3OVuENVKCKYs1EX5ZLFj/A8eeQ4jtBdhkjS34OrqV
 dOWg==
X-Gm-Message-State: AO0yUKVnRqC1WOjxiNGJN8ww0ahIT6iFJAkVqOajs9oF35nHT20rBT6M
 6MVbgI7sLKDSKiP5SHfESdLV3A==
X-Google-Smtp-Source: AK7set9Yg1XMCF5UoEAVS89j073bl4qQ3RKP8I1LwD1EMcioDgwjDlNOAgXfBTkxY0UI2D0ksxnstQ==
X-Received: by 2002:a5d:58c1:0:b0:2c7:b51:65ce with SMTP id
 o1-20020a5d58c1000000b002c70b5165cemr1262796wrf.12.1677848324794; 
 Fri, 03 Mar 2023 04:58:44 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a5d6e5d000000b002c59f18674asm2151604wrz.22.2023.03.03.04.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:58:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 378851FFB7;
 Fri,  3 Mar 2023 12:58:44 +0000 (GMT)
References: <20230302184606.418541-1-berrange@redhat.com>
 <20230302184606.418541-5-berrange@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 4/5] iotests: print TAP protocol version when reporting
 tests
Date: Fri, 03 Mar 2023 12:58:40 +0000
In-reply-to: <20230302184606.418541-5-berrange@redhat.com>
Message-ID: <87ttz27zzv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

> Recently meson started complaining that TAP test reports don't include
> the TAP protocol version. While this warning is bogus and has since been
> removed from Meson, it looks like good practice to include this header
> going forward. The GLib library test harness has started unconditionally
> printing the version, so this brings the I/O tests into line.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

