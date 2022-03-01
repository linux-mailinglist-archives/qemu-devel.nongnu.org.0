Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B97FA4C9285
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 19:03:31 +0100 (CET)
Received: from localhost ([::1]:40448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6qQ-0004GA-DZ
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 13:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP6ny-0003QS-HO
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:00:58 -0500
Received: from [2a00:1450:4864:20::42c] (port=44935
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP6nx-00085C-5B
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 13:00:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u1so21757825wrg.11
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 10:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dII4/E7nT8P0EHlPIb8FQ4IezjgVFuFEwukcVtjA6gw=;
 b=x02if5M8ph4V/Ye0HcJLXFjKVsOMhVK/xsNd6L+CIjjtIUbNzggg3guSafQ3P0WKeI
 ac2z3PsTIxV47TNh7fI70EOz5HYeuEstOQYuN9Khur69xHMykOQTMrTHV6FRJwM0tCM4
 8m+cx1t4BCVNGwtgXiCEfkB/C2/rCpJ2r5bXTbt9EOHdVZSObhW/12MJACMB72DvZ2DU
 iOFlK1sFiIbmyVsTx+YL36dJbyT47QurQ3rhgxP35RsgT8SD1K5dLe83TAcfB3Hkin+h
 ts7dOncwaLDFWIrOiJqIKJYSzB3AL934u8LWveU2KEi8T0d7OFnGMjcLSUSjztAvusj/
 /5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dII4/E7nT8P0EHlPIb8FQ4IezjgVFuFEwukcVtjA6gw=;
 b=kwPGScuBsh2Z/kwL/01KbKxuPy4bizkQgQYu/J6b3qYp2cnC5dIB9vXXCt/qVwbyea
 Zxv5qVNECl/P6XEPZocWNZRRwuffrDzhJxjepwMfRuCqUfRJaVayuZU8fXVy9zODox55
 fNLDp5WfOeGD2ZkAicN9V9oxccXqv7emnu11kUXkFRRZESGzyrF0WM4VCuZC4qIUY+p/
 vPbCS5C8AP0rlyiKa94dTFmSjoXTOrYb1HCw1p4ifaRes479sT9vIHkqH2eJYqjJ/rCc
 puUc8xk9Hcq64u4pjLbogV32vfRY1YAw783exKAPSVV6AT6QcR7M5rZqvyw71xH76HTc
 ZJzw==
X-Gm-Message-State: AOAM530pcNJfVke0GU/ixwLpUjKHkc01tenP8fD+AR9vob0al2bla2Ri
 +v+i2DgkiDegDxMJJU09++qcxg==
X-Google-Smtp-Source: ABdhPJxbL1lxCgT4MIg2AZnqHNc1Mpzr5bY+iBVQB0cQCt+dziY8QNLfWnBx0vz4QL6Mtfs4smBWoA==
X-Received: by 2002:adf:c44d:0:b0:1ea:99b6:2c2a with SMTP id
 a13-20020adfc44d000000b001ea99b62c2amr20725054wrg.716.1646157654765; 
 Tue, 01 Mar 2022 10:00:54 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm15147575wrg.62.2022.03.01.10.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 10:00:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F21CC1FFB7;
 Tue,  1 Mar 2022 18:00:52 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-16-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 15/43] qtest/cxl: Introduce initial test for pxb-cxl
 only.
Date: Tue, 01 Mar 2022 18:00:44 +0000
In-reply-to: <20220211120747.3074-16-Jonathan.Cameron@huawei.com>
Message-ID: <87pmn5lfhn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 .  Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> Initial test with just pxb-cxl.  Other tests will be added
> alongside functionality.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

