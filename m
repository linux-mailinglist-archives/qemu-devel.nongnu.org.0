Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676955AEB4D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:00:48 +0200 (CEST)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZ8A-0007Di-FA
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVXfN-0002Rk-GK
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:26:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVXfL-0004w9-O5
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 08:26:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id az27so15202563wrb.6
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 05:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=eQlp8Av07ZbzOIyykQmXdXxil7PZgrBnGiaiPeTo7Y4=;
 b=UuVRbMfWkxCFtuH5hRGaU/MBEzEsCPQzdU6ZJIWsi6WFHA82/3BwmfL9H85ivauNwa
 9QQpGRGxX2U6WIAzwiVEQpdtp3UJQju+WNR0RDpdCfSUQREEeUzV6adOGJ7jtYhTAxi/
 /4ujEcS2hNq+X+zid9kRS4lrPlPHg/j4i0L7e2E3hGErqnQic1SvVc8uMiZqRf7hssiy
 sRuG7m0HAutXPdY/eRpLJksCfpUOkk0J/H/KI3GWOxTDexMkWEMjCrtSyYird+Qr26VB
 efyJ1vCXKySMtGVpfaRkYC7lz0j/3JNGCD2GykJYk42j2OU5GtdCSmrd+zmmwLIeAQZY
 LMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=eQlp8Av07ZbzOIyykQmXdXxil7PZgrBnGiaiPeTo7Y4=;
 b=U/zu/utRYETHEnk/qhygqimoW8Lo7GLfNrq9ifiSlWcLnHL3zFJY07NEAAg/mrDPq7
 rUup9RV2iSTiFMVOVzL7h21QnQulfhWhe8nuTiZCLnHxxBICQx+Eva5yDJAbOeaaUIkS
 GXG6e6A0i9F7g7IZEefLdXuCLNpQkhGMBeran3nB87gDVcEAJljGKQ3PTv+9PPSNIZgw
 pmS4z+uIoipj+Rvknj4pNA5VlIT9L0NtCvPs+BCCfMaF2yq8i/xR/bRmr56G4P4lE8aP
 1+3J4WW3vFSNo5MFPijQb8SAL7KiLFc0s5S5JVOzI2NZSerbpIFwSoLut1uUh23Uvk7w
 6pkA==
X-Gm-Message-State: ACgBeo2bofR9R8ttLWNRmR2Qilp2wH6RaBt4PVwhUr/+w68RVKBNGWg7
 xaHTSBH0mZY46+MZc60nGgUh2YV+dHd1ow==
X-Google-Smtp-Source: AA6agR7n7uvMnsBwdPUBuyKL5idyuaAzZOdCly5yJIo4GgEMYmog41K5p0a+dcUE1sm5HE4HuhPPRQ==
X-Received: by 2002:a5d:4a41:0:b0:228:48c6:7386 with SMTP id
 v1-20020a5d4a41000000b0022848c67386mr9757824wrs.649.1662467212668; 
 Tue, 06 Sep 2022 05:26:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a5d5349000000b00228da845d4dsm2388491wrv.94.2022.09.06.05.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:26:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 563A81FFB7;
 Tue,  6 Sep 2022 13:26:51 +0100 (BST)
References: <20220905163939.1599368-1-alex.bennee@linaro.org>
 <CAKmqyKPtuT+BT7S=G3v05=s00p4OE8X+tNaccNsN7sn3yJwbcw@mail.gmail.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, "open
 list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [RFC PATCH] docs/system: clean up code escape for riscv virt
 platform
Date: Tue, 06 Sep 2022 13:26:34 +0100
In-reply-to: <CAKmqyKPtuT+BT7S=G3v05=s00p4OE8X+tNaccNsN7sn3yJwbcw@mail.gmail.com>
Message-ID: <87r10ok7sk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Alistair Francis <alistair23@gmail.com> writes:

> On Mon, Sep 5, 2022 at 6:39 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>
>> The example code is rendered slightly mangled due to missing code
>> block. Properly escape the code block and add shell prompt and qemu to
>> fit in with the other examples on the page.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Are you going to queue via your tree?

--=20
Alex Benn=C3=A9e

