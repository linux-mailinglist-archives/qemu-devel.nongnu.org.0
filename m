Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBAF258F09
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 15:26:57 +0200 (CEST)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD6JM-00076N-NM
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 09:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kD6IT-0006X3-3x
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:26:01 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kD6IR-0006T3-DT
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:26:00 -0400
Received: by mail-wr1-x441.google.com with SMTP id w5so1524074wrp.8
 for <qemu-devel@nongnu.org>; Tue, 01 Sep 2020 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=36dp1IX9hHrJTO/6/mLOaEhV1CqLW6tPe8G/3YRRGok=;
 b=yyUOPgRirRMAPNjP9TtAjnZliZxEtPe/X6TwxPZezHMN85c/sGlsloVED+IiKqSH42
 iF2+4yETe9Hs7WVdcstJca06S1gdta9WyyOyxkIufXvg16PkjtVIWzhrt1fgYM1P9ZOC
 C/LRTrwe13np5xwaS8WFojslIbgeeVpu580NayeWRaYiCIRURMXHadtlm6EuTmMt4idd
 tCVFfKfsyaygYfpVzSiDG3TohLAcKuupujO2WTVeP/ox56cIcuItJ7Yp4OWeUt/mhL1A
 cvbZQtXP0UAO6AcpE4Wzn1as3HXVFbUB+foFr0z8SttjBIoqIbFRVP4pdO0yzC6R/XI7
 kWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=36dp1IX9hHrJTO/6/mLOaEhV1CqLW6tPe8G/3YRRGok=;
 b=E0xVnhJXm5af0aafX3f91QlSy1zU6zsOS8ke17j1CrdZGlgx+TFCk/Jy0gGcIRrRnQ
 zs9HBzE8rH4p8FTI9ZoI01v+WnzUVmFjZI54Uvt98MCToCTJDDFnvvlM0Iv6Uapq6maA
 InP+sjql/lEI0PdVVOVyKAMu8u9GOeKkXSTSFRnpx0eB7voSNTe3hNRaHHKY2rLRjc/8
 jtk0vICQM0V7IIl+UutniZJso74BKR5tiW5cn9G42Hn8N/z83H4c+1mkXIUOwNPjVs/W
 4AYX++fIYJat7A1RWICUgGNMfGI6CmKd18LQsnsthF8Dae0h6WxFZC9nn6GyEeucDPjC
 OjMw==
X-Gm-Message-State: AOAM532w3a3LMzq0al0CB7IFgEpwjnRmlx29eVZL6N1Ihg14RSsEWg7W
 0vBIgqwcdHUh/jqj/gVUxsJQjg==
X-Google-Smtp-Source: ABdhPJx6FXFI0ntki6bEgJtcITPACVSoLSSKAAUG6SNHJu7hblj25tGYwXJDol00t+eYdik/dR3T7g==
X-Received: by 2002:adf:80e3:: with SMTP id 90mr2090661wrl.342.1598966757084; 
 Tue, 01 Sep 2020 06:25:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 189sm1934870wmb.3.2020.09.01.06.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 06:25:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1BDF51FF7E;
 Tue,  1 Sep 2020 14:25:55 +0100 (BST)
References: <20200828132716.279782-1-berrange@redhat.com>
 <20200828132716.279782-2-berrange@redhat.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/2] crypto: fix build without gcrypt and gnutls
In-reply-to: <20200828132716.279782-2-berrange@redhat.com>
Date: Tue, 01 Sep 2020 14:25:55 +0100
Message-ID: <87blip6330.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> If nettle is disabled and gcrypt enabled, the compiler and linker flags
> needed for gcrypt are not passed.
>
> Gnutls was also not added as a dependancy wen gcrypt is enabled.

nit: when

--=20
Alex Benn=C3=A9e

