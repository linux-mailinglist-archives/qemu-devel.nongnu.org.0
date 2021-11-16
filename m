Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95E453733
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:20:04 +0100 (CET)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1Bj-0001Oh-Ib
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1A7-0008UO-5G
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:18:23 -0500
Received: from [2a00:1450:4864:20::432] (port=35681
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1A5-0003KP-JG
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:18:22 -0500
Received: by mail-wr1-x432.google.com with SMTP id i5so38697811wrb.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=x1GFxz6jkT5V3LJzDnK5zJIRBNarDo4sqWylNIHC07Y=;
 b=i6DBcwBO1m+N7mZWeR6yeQMsOADEUCksCyvAQT+9itU92m3hygVi5ltsElHroU+l+s
 FSGnWl9NtF9f3zuZ+CxbU4mIZQ8VOl2mRgDH9HnX73L+YbAycy/x3zeZ19HtBdEDrK5r
 e4zGikN88OhIdf+w1gAM5Ua0ZuokzSMHCNj7RYjfqnZ3E4q8C/qCOb7mOcYqNseYUhQ+
 IS0ZdBhPtyxJE6aP6k17eWfJX2SU+y/a0kDhsM791gf13v9jU+yyngx/7dnVnYIXpMCk
 qqMt2tbr0RipDmlw1nxxSDVX1+t+6PK1whcruc2m1YuGdOwfTnVwMPyrL3POIkF0mFVD
 WqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=x1GFxz6jkT5V3LJzDnK5zJIRBNarDo4sqWylNIHC07Y=;
 b=CKpnFxWT26asaB2G+kerfYO2FYQO+3eCmU5y0oTFTI4z38UgfGMG1TS+8xYu7jT+vg
 PDOkr/NK3M6l0gkqtZ5R8Av8RrxcreFxvI9lYePZLSnDQ5Ps+9MvL31Fh/lmx1msyjvo
 le30Kyoldnfovoep/UKlmHrwjGaKAN2+oQ6xc1Gm8K6F0J1ufc5KaJ4MIuVwfjP/M1uw
 o+I9theJLwtawX36UshezDaCceu1H95JLUdX7TJA3bPBTBKSZ3EGFK9RgdT1UknRPFf9
 88lIJuCgC59jMRL2YOIIoOoKYiWuwmgcZzN9r3doIP29K4MU33UrFgxQqT81ncdgqNTf
 kHoQ==
X-Gm-Message-State: AOAM5334FdOQLjw6mFDwzCj/v0Ev6Bt07shPm4/zupSQmPFPCwepJUJ6
 LoQj3a7wwlPwBxUYtfR5KM/yng==
X-Google-Smtp-Source: ABdhPJwg2b6qmU3o4f0042z+HuPR8kPHSUbUciOyxHuL46BW4sFs26XOiBr1otafJ5KltGspEK4kbA==
X-Received: by 2002:a5d:64cd:: with SMTP id f13mr10728985wri.382.1637079499306; 
 Tue, 16 Nov 2021 08:18:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m20sm3242871wmq.11.2021.11.16.08.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:18:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6E5AB1FF96;
 Tue, 16 Nov 2021 16:18:17 +0000 (GMT)
References: <20211116112757.1909176-1-berrange@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] gitlab: skip cirrus jobs on master and stable branches
Date: Tue, 16 Nov 2021 16:18:07 +0000
In-reply-to: <20211116112757.1909176-1-berrange@redhat.com>
Message-ID: <87lf1ovzue.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On the primary QEMU repository we want the CI jobs to run on the staging
> branch as a gating CI test.
>
> Cirrus CI has very limited job concurrency, so if there are too many
> jobs triggered they'll queue up and hit the GitLab CI job timeout before
> they complete on Cirrus.
>
> If we let Cirrus jobs run again on the master branch immediately after
> merging from staging, that just increases the chances jobs will get
> queued and subsequently timeout.
>
> The same applies for merges to the stable branches.
>
> User forks meanwhile should be allowed to run Cirrus CI jobs freely.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Queued to pr/161121-for-6.2-1, thanks.

--=20
Alex Benn=C3=A9e

