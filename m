Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C707532EA7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 18:10:59 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntX7a-0005WD-7F
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 12:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWk6-0003AX-1m
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:46:42 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ntWk4-0006FW-Iv
 for qemu-devel@nongnu.org; Tue, 24 May 2022 11:46:41 -0400
Received: by mail-ej1-x62b.google.com with SMTP id rq11so14088716ejc.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ITHQZkfmFUhJpyCcl3rNAFVNyJBL8+Qnoel1748UrpA=;
 b=h6nlXicYfO0IWc6qAgFvxM4yjxuBlHN0pb44Ejjb4Oz6coXV0btlZRpYraneU1FKIq
 pYsMKft+cnPesEZiHLUjVurPuzroL8vM1dbkhU3EUfOEeu9ly4hI35XpntwAhj0qNpjG
 k/sfEXQplxVFX4Vz3GkotbAj5JD8zsN2fBDg03vT8P/Nu83vPTrWZ0mebvGQ5NSmAhOd
 pe3K88PDWWo8aEtjw9i0CpibJZ2rNoS1FyPyqzTDPGF+lrFO2BT6LHVeLY0LhpBvsNE8
 Jivp/Wg+VJzGStMzo3OCG13QnSDB/kgGsmA8ztneN+udUQeCU4dDnhYovOxENXSbXQha
 Ym/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ITHQZkfmFUhJpyCcl3rNAFVNyJBL8+Qnoel1748UrpA=;
 b=5slxY//RbW2SdNGhUqhdtkLFuYeWfAuPyg0cKE/HzmN3s5Z3xF9yC/S7UTpXsmMOkF
 gCWxcI50GkUHhS24f6hrmrwDPIMKrN6Qa2iurL0x0DRGF8f+oSyHF9Wa7K5+prdxbJBK
 EIzYhFcGoWA1OdglhXkC2OxPKRQXWbD43KjqMU37IFFMy9etXbEQuICQdm96bDi7PjJz
 9+CooEtVeuOj3RFJNzqtFIndgQc6xKPJeKIM2Pye6JFvEz4kDk854xC6Hr45O+R7y3Zn
 2weXJ2vVFH2nnDESpbuOY844fiYdYR9sgmZ/4qfKd0cmtCZ1ZzYKXB2DzK8X8+9SYclg
 h66g==
X-Gm-Message-State: AOAM532zZupZvuNXXjE2KPt960mLbW3UvxUdKatDkiu/RdjhkBCsG/Ti
 f4/wy0GXO00YcLq5NFSmSH3fbg==
X-Google-Smtp-Source: ABdhPJzPkkFof1+/ge9C1uNfOn0bO6cXdVd0hRjGB+RbGDxafNhNN9kf+F38rkiIB238UYZ694x11g==
X-Received: by 2002:a17:907:60d1:b0:6fe:b0af:2fde with SMTP id
 hv17-20020a17090760d100b006feb0af2fdemr18449260ejc.692.1653407199079; 
 Tue, 24 May 2022 08:46:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 my9-20020a1709065a4900b006fe8d8c54a7sm6839223ejc.87.2022.05.24.08.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:46:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 68EEA1FFBA;
 Tue, 24 May 2022 16:46:37 +0100 (BST)
References: <20220524092600.89997-1-thuth@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Wainer dos
 Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, Stefan Weil
 <sw@weilnetz.de>
Subject: Re: [PATCH] .gitlab-ci.d/crossbuilds: Fix the dependency of the
 cross-i386-tci job
Date: Tue, 24 May 2022 16:46:32 +0100
In-reply-to: <20220524092600.89997-1-thuth@redhat.com>
Message-ID: <878rqr6ihu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Thomas Huth <thuth@redhat.com> writes:

> The cross-i386-tci job uses the fedora-i386-cross image, so we should mak=
e sure
> that the corresponding job that builds it (the i386-fedora-cross-containe=
r job)
> has finished before we start the TCI job.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

