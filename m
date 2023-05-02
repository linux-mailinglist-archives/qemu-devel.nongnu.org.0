Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5CD6F4662
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:53:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrMO-0000Ha-HG; Tue, 02 May 2023 10:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrMI-0000Gs-F8
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:52:02 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrMG-000594-Ps
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:52:02 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50b37f3e664so6278134a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039119; x=1685631119;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mF+zMGVbAPbV/xStYxuDg9Tgjy/fj1dzOt1Y9eEZuSU=;
 b=H1tGyX2AB/+av7b2+M1zqnxBg3r4zwuqvQs8ZSZx86sGtww9Ll0RFpJETKSJMEGDHW
 zl1HHTCt/FGd9oFvcLryrcQqlHDeTKb9vMfjglguSxryurgogKRf0ljNFFoj5LVmNfgX
 BJorGPGzRq9AEen7kRtpP5kqlR42vpE8t4lsEd1ppFMb+8zxD4e6hb9EgVwdBfcHJfux
 4IwK1rkjJdNVGbENH3aFk+BYE4uwSf+Le1JA08IuqKeU7RAtmQegbRJd+/LSswwC/8ch
 gsPhLkQ8kJtIvA3m32Dg9qI5hVHKrvLXw+QAoFUR0sYhXlZMw1WH5CRtY1MFloxdQYlr
 M5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039119; x=1685631119;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mF+zMGVbAPbV/xStYxuDg9Tgjy/fj1dzOt1Y9eEZuSU=;
 b=N+NODpiX43PP5RlzlRuBvS3/B4mNxvUHI4S3IS3wkUpszK0fLe2b295xbSrufuyylI
 QuEG6ZoQ+iXo6ypad98+EPRh08q6nnXOfd3t3zuRLAfubYG+G7OOLpWKR2l7dBcEM+2Q
 XOXXOdHKe9J2DJvYZC28VO4AvgQzHdLLl/OujXaPhrEGyJC9Ygw5WRE0wiq2yjHz0ZsR
 WilXOmqsZxYfwQiX3+5/C+z2mPBfm2GTZ9hWpfoxseO4fVAVXvyybga3gbMPJa5mIGMQ
 RD1UqiEHUhmFocppYRLKbPTMKY4i7A/mUuEPv4oWrGypnvVai6aXP2VveTdvaawQYOPL
 SSyA==
X-Gm-Message-State: AC+VfDz+L+txIeywOZfnnuSKfelWB6eXhhlyKlAmkCgdPuzJGgIJ1O9K
 pWjgeRjhnMDg+CzAc29X9w4SrmFswvw9jCP+b5H3Ag==
X-Google-Smtp-Source: ACHHUZ5nV1hLMIWn0EQaQVzg89f/PUQgrLsn3+SRY4V/jDDpIIhk5o7moY6Xa7th94Vhyew4xDQAbUnnOMpwbYTLUtQ=
X-Received: by 2002:a05:6402:407:b0:501:d52d:7f88 with SMTP id
 q7-20020a056402040700b00501d52d7f88mr7620187edv.10.1683039119008; Tue, 02 May
 2023 07:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180013.14814-1-farosas@suse.de>
 <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 15:51:48 +0100
Message-ID: <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2 May 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
> >
> > Hi,
> >
> > Some minor changes:
> >
> > - new patch to move a test under CONFIG_TCG (broken on master);
> > - new patch to document the unsupported CPU test (Philippe);
> > - changed the test skip message when no KVM or TCG are present (Igor).
>
> Applied to target-arm.next; thanks for your persistence in
> working through the many versions of this patchset.

Update: I had to drop "gitlab-ci: Check building KVM-only aarch64 target"
because it enables a CI job that fails on our aarch64 runner
(because it wants to run tests using KVM but that machine
isn't configured to allow the runner to use KVM).

thanks
-- PMM

