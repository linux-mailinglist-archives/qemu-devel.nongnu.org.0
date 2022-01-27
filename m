Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37C549E174
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:47:25 +0100 (CET)
Received: from localhost ([::1]:56106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3FM-00041l-Dx
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:47:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD2xF-0004sa-Of
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:28:41 -0500
Received: from [2a00:1450:4864:20::633] (port=38827
 helo=mail-ej1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD2xE-0000KE-7z
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:28:41 -0500
Received: by mail-ej1-x633.google.com with SMTP id k25so5146265ejp.5
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=YvrL/Egk4nS2MmgDpirIBVn4n5zZKOT5j5awxLHZgMI=;
 b=C3aYpUSuRQU+Eaq/IvY8H25i37v6mnqkYX0sQp+oGNsqDDmAMFG6klDPMFgCGOk/ow
 R2nNrCvz22wXjNqW7PTG8c2yB8VZLobFnz0/j2SihdGgUaJgAaxLdKmRkvJmmbyV1khI
 kWRwYe+GVXh9oDAJUqlk0p/XEn5V5vd/2Fi1poWOiqN+eo8gjKUGPdzM/C4Uc6vFp3Kw
 p+TF60BDaoCXWegYYfLTO9myP/xzZY65F8QUuJr/Kd4oJwxC7tUsxoyLnvkO5eiaIbsk
 LAoSvD1LqPD46aTIAVnMdcIh4vn0TIe1JPmspthTdpXbnbh5QiboPO/mRjgLJ/wM+3hm
 ilNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=YvrL/Egk4nS2MmgDpirIBVn4n5zZKOT5j5awxLHZgMI=;
 b=6HgY1FMSW4ylwtu49IhmhhFF4uDqFpde92nSvzpVS3S7k7LAP0CnZXglye6Sl9EqH4
 hSI48L3W3a81W9uXjP+NwwIgMvVFdw4QKy5DiB0WEqnMonAE8C8QavdJM7oaqYf2XWl5
 VqZfJagQ7ruaW4OYUKibzl2Zr1FBkHZ9xvjwKWpQsWC+F9pbXZce55RLTRaRqHlHgD4i
 CniB6R89zHgDmMHOPq6UkI1ZhQjrTc4WuLPtb5BdMx/kh/sgVJV+wPn4Dp8xflJMEV8a
 gpwmXva7NaLj2txTZpXqiE5bj0YvvQl1BcSlVqHsOz2Bf7/z1trlzmHhmeAP8XEpVFux
 260g==
X-Gm-Message-State: AOAM531rdCna/bVCoIs92sPmLlhKoI3PbZqN9PtURTcta/6KoipzPBZH
 iLBkCs4FCNlKCnZBHw8imiwL1A==
X-Google-Smtp-Source: ABdhPJyFUvCjQFocN+c+Rncff/AYlu92A8AqOPrFaYiHE0qs1/B7gVn7bEQ4ZzBlVTeI+/f4FNoBvg==
X-Received: by 2002:a17:907:7ea7:: with SMTP id
 qb39mr2560073ejc.547.1643282918573; 
 Thu, 27 Jan 2022 03:28:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k24sm7036526ejv.179.2022.01.27.03.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:28:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F34B01FFB7;
 Thu, 27 Jan 2022 11:28:36 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-8-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 07/42] hw/cxl/device: Add memory device utilities
Date: Thu, 27 Jan 2022 11:28:31 +0000
In-reply-to: <20220124171705.10432-8-Jonathan.Cameron@huawei.com>
Message-ID: <87h79pbeor.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::633
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
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

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> Memory devices implement extra capabilities on top of CXL devices. This
> adds support for that.
>
> A large part of memory devices is the mailbox/command interface. All of
> the mailbox handling is done in the mailbox-utils library. Longer term,
> new CXL devices that are being emulated may want to handle commands
> differently, and therefore would need a mechanism to opt in/out of the
> specific generic handlers. As such, this is considered sufficient for
> now, but may need more depth in the future.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

