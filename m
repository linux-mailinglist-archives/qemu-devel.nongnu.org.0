Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB938FFCA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:13:07 +0200 (CEST)
Received: from localhost ([::1]:38198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUzi-0006Kq-Mz
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUyF-0004QY-EJ
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:11:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUyC-0002j1-37
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:11:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r12so31772679wrp.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nB1hX1vbvYqksI05hE71g4wwozuxEmv4b0MMnowbH5c=;
 b=zoOwiJgRDZdutesH1IKsiK6s5oPkO357IAcy0pvNOjOtrom2qIi72GuREKWbQAryhu
 tsm1mp0h2PY7Zb4lE6WN4mjmHSOfyrxQfWu2d1hivp2op/U84t193LW6kde84eoSVmGT
 uQmFTWgTi3YtxkJzFc3CQMu4hiLMdXOBSy9dTU0PzjXcz2cqRSxCRPgBCZaVphwpdTQf
 dG4EguyXcCOPGc2729Fw+pYTtlnBW0eQfYNhlcgHEQYhHRpz8oHZwwdIQit1G6S5khLb
 ORmbGpYs38wJ4/hJ40IAyCdqntPPFOdiIKkb/qzdtWOhqqowoggxi2eXkFI1RdVe5n+o
 GFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nB1hX1vbvYqksI05hE71g4wwozuxEmv4b0MMnowbH5c=;
 b=cuEZA6Yma73wTrALXGNUB9fZOPLT9DNpSiloikJFrPKXK+2K/nlg+XZD2Y68ELwd5v
 vbFP1X3UDU1+5B/7qjmcIpDoW8kcd8oO2COUjP9BZZcaWV6D2jY3BNGZkeHroN6dyT2J
 OmvRi9OWTNsS7qPskM48pdWfl5Z5JFXlSXlxfXcfI1Fvv0i1Q0g94QjKlhC5L2kkaH44
 4JF3eUk2qPp/Gz4M2/RmOFiLXPURyhhq8HCo1WCDu5XID1zzGLSMzd2k4ypGcNQ22R3x
 cGajMw9KJhfpxdDxHMyAJK5AGZMbgLeoK1rcrxudP1MosgjE2jjJoZtM6CJst9T3ByMM
 Kekw==
X-Gm-Message-State: AOAM533N42pLkLTY50ucISxQqWGHFtqzKEObBPAZlcQ1UkJtzBZgbrbh
 aFckFCJSi68cvvkbLY8U8x1hMQ==
X-Google-Smtp-Source: ABdhPJwcbzKfUO36OS/k2Jh5ACO8aukfDvflt6nwhNdPw85uhSgy4w6M+5b7y4m5k6WfUbrXozIolA==
X-Received: by 2002:adf:a519:: with SMTP id i25mr26895275wrb.312.1621941090614; 
 Tue, 25 May 2021 04:11:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m9sm19422869wrs.36.2021.05.25.04.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:11:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A2FB1FF7E;
 Tue, 25 May 2021 12:11:29 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-8-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 7/9] gitlab-ci: Keep Avocado reports during 1 week
Date: Tue, 25 May 2021 12:11:22 +0100
In-reply-to: <20210525082556.4011380-8-f4bug@amsat.org>
Message-ID: <87sg2b2hlq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Sometimes pull requests are merged during the week-end, triggering
> a CI pipeline. Currently if such pipeline fails, the Avocado reports
> are available for 2 days. For the reviewers working on the project
> during office hours, the reports are already discarded when they
> want to look at them. Increase this time to 1 week, which should
> give reviewers enough time.
>
> Only keep the reports on failure, which is the only case we'll
> look at them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

