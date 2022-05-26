Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2212535253
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 18:51:18 +0200 (CEST)
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuGhi-0005Cd-40
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 12:51:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuGg9-0004TP-8n
 for qemu-devel@nongnu.org; Thu, 26 May 2022 12:49:41 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuGg7-0003LJ-Jp
 for qemu-devel@nongnu.org; Thu, 26 May 2022 12:49:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id x12so2866407wrg.2
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 09:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=sizJwv2+J7w8Oq2pRGxDyjSSTDftdkfS9b75UmjZMrk=;
 b=Q6zltKz/CTsAgIg5d27kUz4yQIZAUU+hC06MeIdJ8EPYe2p67VTisZd567rmUwnAiC
 urI/vxk95UaRhs3OsfWapS5gYD9jd5KFxuh6meeu0MdZ/UcqUMZBc88+a8QAX8ppb4nM
 xszLX1pveYnjQBqTcGCvydb9Gy9x1CyCL3wGuBc8l1j4A71DdrEWVOrUrf+PpoxtMOrN
 wjh293vXRhP2y2i9hzAoLbKJlAMeNrSrq8i8G+KpBzu9sQ7IbkOSiZp0rY6hHFRI0YnU
 aQtlcTFYHkao10vfiJntaZOZg3aFLfAvwTdzI7rRxdnMNY+yrV1egRbOtw1EoD4CDPWT
 lelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=sizJwv2+J7w8Oq2pRGxDyjSSTDftdkfS9b75UmjZMrk=;
 b=YFf0EFbrYHSHMju8Q4aXa1mJaqdTcTJ/DnL/JjKMUi+BM+HLX0xoDt4109Bt7a4y0M
 4TSDZQYbCox4VB5DEThX/gJ0oUyLPb/vvFt0WerTBWmPRw2G8x2PAFbwfaHoUlM3Xf/T
 GOlgOY5baz/ugY6cmx+GsccGWizI4A6ca37qrpQlXaY9NY+hmHPg8r7HtLszxt6tP0dw
 +csXGbgGcnbyGVrlxf8vPyKqVfQ5CKJ4yip9Rpvu7Te0+q1TCTvY+Cz6opuc7+PGmB1D
 x+bH10gOu5zur1W8Xgfag/VEm8nPLyaw5dX5YwsevXdgT2Sk0WxJpZbBmd6RJNABx1+e
 uhiQ==
X-Gm-Message-State: AOAM530MusjcLJnsvBftHOxug2vjVJ6KRGAoijYXSupcTd94obohYQUk
 e5w3aEAQ+XMSnmvkyHQ/pFa/Og==
X-Google-Smtp-Source: ABdhPJwiE04RcIy2vRJJ8lLjSxFswAxcKe8fms5+G4qS14rWDulcoPH5Fsmzff9IJI0JEhPQPxCGoQ==
X-Received: by 2002:a5d:584b:0:b0:20f:ec17:30b8 with SMTP id
 i11-20020a5d584b000000b0020fec1730b8mr13532689wrf.461.1653583777729; 
 Thu, 26 May 2022 09:49:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a05600c4f5300b003974a00697esm5793151wmq.38.2022.05.26.09.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 09:49:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CAD91FFB7;
 Thu, 26 May 2022 17:49:36 +0100 (BST)
References: <20220517092616.1272238-1-pbonzini@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH 00/16] Cross compilation of embedded firmware
Date: Thu, 26 May 2022 17:49:29 +0100
In-reply-to: <20220517092616.1272238-1-pbonzini@redhat.com>
Message-ID: <87v8tsz1b3.fsf@linaro.org>
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> This is the next part of the firmware cross compilation story.  It only
> looks at firmware that's strictly part of QEMU (optionrom, s390-ccw,
> vof), and does not do docker cross compilers yet; but it takes the
> infrastructure from tests/tcg/configure.sh and moves it in the main
> configure script so that others can use it.
>
> I actually expect the compiler tests to move back to tests/tcg, running
> at Make time after the docker images are built.  For now, the file is
> moved as a whole, including both compiler detection and the tests.

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

