Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2360D3BBDA1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:43:53 +0200 (CEST)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Ot6-0005u7-3V
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0OqF-0001n3-MC
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:40:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0OqE-0001Oc-3k
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:40:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id n9so4813939wrs.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=aJ0FqJHymQGpOoZ7xXzcEN6EoKh7oAgbqsG2lLnHGIpxalYPEL+4Q9VP6+8LueKhDn
 r6XE5J/KezTnMgmIA681ibOmwKXZhl4vtrDVq0bXoDHVHP7EcdcUyZv1An7vv9E557cl
 2DJmoaEYEaQZK7cvH+mND2huCyAicmCl+u0O5m+9QpgBesvZkNBRZ3jyXyzrrngrgXux
 kRWGuK2SqsLsRtd/ccvjspOcI1HvRW1pG+b1o24njt8awydLkdzhyuuYNYSJ9ExPk+DZ
 rFmsmjf/JtUTFDfklz+Siqw9hl6Qyxj59DWaZpYEESzFfnDarP7x8gFm4Oc2FkDL3J3s
 Px6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4s9UUzjLvPagDrGvn4yvmibyzEYwfyvlXd24adG1de8=;
 b=Wwjw+nvQY8Sirxqog57qnLqal5cDVyWPsYWrcWUmpn8Vye9kPBL1jsNTLB8SY7bIHQ
 pzqCKuy5Nnsc9Rh3jxKKAdPKAjp2Bhfg6q8OamkFJyN+ryemhzDk4HtSPPJkl+SQjRhY
 OqhpBQ5LvZvrKisSkU9wyL2bS0Mm7uWR26eXGH0xzqDe5t+YoPJn86AEPXjCpjSamwON
 hf/ZXSlx2mHaCiUIDliFYBMVl9cOWidBwmCiD5htrgmH8ILkDjo4/ZLOeHcRWxraxvHR
 Wjh67OPfb5u2j5nHxBd0UaGhKvKCTE2OLaplPhVm6Gd4a4a37ushgWaypHJwJ2TsekCz
 DCPg==
X-Gm-Message-State: AOAM532pNiBK5ZhFiKEnofzeLHMuO2NLlxSOgGOINEFgInBCGLR+uxxZ
 h4SFrYGWyvUhSH2PMyYZ19H1+A==
X-Google-Smtp-Source: ABdhPJzKWXW7vBDn7Ht8pVu1blomT3wn3rCja2X7rgocoyfCFkxTKbF/Z0xpipKRs1qfFLFTF4aTRg==
X-Received: by 2002:adf:e101:: with SMTP id t1mr15920033wrz.215.1625492452851; 
 Mon, 05 Jul 2021 06:40:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f22sm12522978wmb.46.2021.07.05.06.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:40:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5C2121FF7E;
 Mon,  5 Jul 2021 14:40:51 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-12-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 11/22] tests/docker: expand centos8 package list
Date: Mon, 05 Jul 2021 14:40:46 +0100
In-reply-to: <20210623142245.307776-12-berrange@redhat.com>
Message-ID: <87bl7g515o.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

