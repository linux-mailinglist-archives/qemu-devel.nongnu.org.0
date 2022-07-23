Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2457F06D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 18:24:30 +0200 (CEST)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFHvZ-0003CV-Hs
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 12:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFHuF-0001eV-9I
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 12:23:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFHuD-0002YF-N3
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 12:23:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v13so2494984wru.12
 for <qemu-devel@nongnu.org>; Sat, 23 Jul 2022 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8FQtx5fNC2dbZLnrDMNylgbRLfP5fhhrUQS96wIUuts=;
 b=GuqmjC4EvFf52MCcDdMbw+gyjHkpKibY5LCxCskUVpV31mOH19Gma1INPMik7JIH6h
 yiZpyilf+m/iARcTEAyMvgSrkvlxKWQeeKRkcMKQ2TDjeFL4YgaaNqZ4wF3Xf24yrK3b
 DU9w+klIQiCP0LSkSWfWVFOzAilUh1X8D5hvcJd49R/Jgp7xRnIDD+9nypPk385p10Cq
 xb2vCUPFt8YOD2pAkoVz2V3EzrIpxPi2h0au5JFq+vrLNAX9Yo3Q4Tti1siN+Ae99fE2
 H566BB/GmUvkA8QiTmykfelVWZfboywUyVvq79kJgrdX5IljTBcSwdk1YRar11jyaKsc
 1Z5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8FQtx5fNC2dbZLnrDMNylgbRLfP5fhhrUQS96wIUuts=;
 b=cyaRt42w8MPG58LpK9rkYqrETgclMKao4aT4CwOaRTcga2cnaM/+cAz1BCKKFTyKaX
 u376u8qdffjZVFzARw2zPHvR3DDq6iEpBFM88Vr1gnB2w7RHM3qs4BIneh2VrhEck6ep
 3aXSPrAvElmKE9Ihp5dRptSKFR8/m12BePqWlRFAxGfeOLljhq7iR4zFfVlQZrh+Xw5e
 oLsN5O+Tc/yUZJFeczjvnBLWhukg20mhascGz6I8sorIc3Zyy7sikSdhbrO10uqiYSjj
 amrrGDNk18t+jVuOL7VXPK3JXQoTX5dym3urR/i06uc+J64Xgtdsf8JS2D+nuDIAjeuk
 0V+w==
X-Gm-Message-State: AJIora9IK0H3QjmY6c0IcQl/thEXPSwfxsu9IhxuVJkhQEuTTz+WYOYN
 WUZ1T5V1bdPZa1WeFu5LQKe42w==
X-Google-Smtp-Source: AGRyM1sxb5PgzY9yvTHDeUrwGyvlMlP/xKPgg71YrR6RHPAuLSZBHhfpCS4zvAGyXXFuVmaLpwWI6w==
X-Received: by 2002:a5d:6d0c:0:b0:21e:5391:7a64 with SMTP id
 e12-20020a5d6d0c000000b0021e53917a64mr3278424wrq.498.1658593383696; 
 Sat, 23 Jul 2022 09:23:03 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a5d5256000000b0021e2fccea97sm7612199wrc.64.2022.07.23.09.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 09:23:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4F7C1FFB7;
 Sat, 23 Jul 2022 17:23:01 +0100 (BST)
References: <20220722130431.2319019-1-berrange@redhat.com>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>
Subject: Re: [PATCH v2 0/3] ci: refresh packages/containers and misc changes
Date: Sat, 23 Jul 2022 17:22:55 +0100
In-reply-to: <20220722130431.2319019-1-berrange@redhat.com>
Message-ID: <87zggzn6hm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> Mostly this is to get the latest libvirt-ci content pulled in,
> but I throw two small fixes on top.
>
> Changed in v2:
>
>   - Reworded various bits of the commit message
>     for first patch

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

