Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B175FBB76
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 21:42:38 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiL9C-00035q-03
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 15:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiKwQ-0001Ca-Fr
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 15:29:26 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oiKwN-0005vA-Uk
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 15:29:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id bk15so23102324wrb.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 12:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iFOnTBpHHk2lPC36OkAFkLtYVfMNv27EtcggejFREzQ=;
 b=X9wloYQmZijwl56jdDvkTPOZQVZ7x0JAOg3N/15MvceYzy0i74nEGla5mybxqT0oi9
 QEWIzvbmFUUE+IueTUHKYQVQoqDNpG2RScg27gQA63UiaDYfF/qw4gbzGXbjXWV+8lp9
 Uov8JNqrSkjiwnEjDZIZIGIzfd4NRCf8+2wJNYTUVsQPl0m4jnNoTHZaeD2tPwzGJKC0
 TUrU+CPKggEMcQ1bsFeXxvzyITXBPzdqWLzdgxh7Fr6KSFKDGFMXpurXJ/OlpRmRHmAi
 G9btw6+2wNSg9RQitsv0IuLOul+dB+5Gn1y1+p70/q5gMelIXbT2qShOdBq/DDesangb
 I2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=iFOnTBpHHk2lPC36OkAFkLtYVfMNv27EtcggejFREzQ=;
 b=8GUERwLQ7xOynYmGJbmu+Dh8mUfkAZsmzx86ayhXKF2eIyvic02NdD6A82ZYL2eiGW
 8HompL04TLFsLC+CRm1qO4WuJnpNOsesw+1yr6FKvvbjfIoom+1nGEVlp70M7kWCfnC0
 Yncz3BTdTSZH9qDEezGuhm7HvniREnhvFX+6oBkX1PMzgOjB+gOTchayyR6pKv1AGwAi
 iWCakCuvmwL/Y9z8JOO5Z6e/JKlr/0S7GAaMaKkBsdduW9osxRccKsTWHV+JgXViFqfu
 jJZMTULWLcjT6zCHunWG8XUZxOY+nsn7AjmVdHnHdsRhE2FNB/Eul1mmC8adLK+Bn3Lp
 eTYw==
X-Gm-Message-State: ACrzQf3ziHC0PpGfVvT5mBA1P4Q67PfsKscbC53JGLaBdhb29ie3NXsl
 etA/c9l7CanEUbJsj5E80UaRgQ==
X-Google-Smtp-Source: AMsMyM6cHPRg7QBr82jbHh1i81TNJxIhA/pnRnh1ziL9RUtZMhFwexn63w3Y6EBsTkIvKK9E2Ke/Pw==
X-Received: by 2002:a5d:6c6e:0:b0:22e:355e:4bc8 with SMTP id
 r14-20020a5d6c6e000000b0022e355e4bc8mr16241599wrz.24.1665516562562; 
 Tue, 11 Oct 2022 12:29:22 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d604d000000b0022ae4f8395dsm11753364wrt.96.2022.10.11.12.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 12:29:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B6E221FFB7;
 Tue, 11 Oct 2022 20:29:21 +0100 (BST)
References: <20221011113417.794841-1-alex.bennee@linaro.org>
 <CAJSP0QUKNXHqjXRh5McFVZ=n5wO5HVzBbvbc62gS7ggYYMvOwQ@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com
Subject: Re: [PATCH v1 0/4] testing/next hotfix (revert bios build, mingw)
Date: Tue, 11 Oct 2022 20:29:11 +0100
In-reply-to: <CAJSP0QUKNXHqjXRh5McFVZ=n5wO5HVzBbvbc62gS7ggYYMvOwQ@mail.gmail.com>
Message-ID: <87h70aqhv2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Hajnoczi <stefanha@gmail.com> writes:

> Hi Alex,
> Please send a pull request and I'll kick off the CI.

I've sent you a PR with just the revert in it.

>
> Thanks,
> Stefan


--=20
Alex Benn=C3=A9e

