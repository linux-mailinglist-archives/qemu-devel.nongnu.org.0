Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B949E213
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:10:41 +0100 (CET)
Received: from localhost ([::1]:33292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3br-0002bm-Qg
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:10:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3Ss-0004zK-0i
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:01:22 -0500
Received: from [2a00:1450:4864:20::42f] (port=40608
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3Sq-0005Hm-31
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:01:21 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s18so4319422wrv.7
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 04:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SJMNltEFIBFgRfXY/9TKs/P+kxKApyZgAbg4a3ViYJQ=;
 b=YgMGGe1rLpXkvn5ttphlEZROPN6e3s/Jlu9obpuzgQT8bt9qzPMBrgPhMiI6aBy4Su
 /0dsAjlYPpFTBoTuO2QPwjVOAKxXdey2JVZDFh9p0oGw7lYLxkuAZSMXbSi9lJKC02NA
 749a7S1hvSzq0xIWnhw1MH9Ots49I81pguLMnjC/jJLbPYJauFIs5fAlUYl/TxfKuyVi
 dZMJDZksYX4QGWXiH8MEo2Wee9HZcuzkWx6WJGpy9B3FJqK796NtrDyt7rWM06oF/3Kl
 b7WpHIXEf4suhDbNo+2Nuqc1qYa0fKLWx8EtmPIFYvKnQIMUgTUhMdQKjpgpTJIavKyk
 f0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SJMNltEFIBFgRfXY/9TKs/P+kxKApyZgAbg4a3ViYJQ=;
 b=4qYmwg9o6MsJwXrN4G5tfcl/XuuYU0VQ7OKirRg/rCpDwhOPA4cZuVL571eGmiebwG
 N14QCNpw+nbpNJwG683gSASBKvBcPaNiWgI4p+Iu1/yHqT/LZ2sIo9NywRpuh24/FqvP
 PyCb4II5FbYVgD800As3lE4/4bo3w5QVKeqwV4dmn/kHUtAO53VllaI3WxWKA8ymQ89U
 mVSkyCGiUDc8dbWslbhA0lZTz/hQjv09rf2QkA4gCGc8sqURAh3YqRvVUyLk58fgLW1Q
 K1m0+9lxp+8syxFZqzORSgXPAkY/rK1uLpnlYwBJksXKkJuHebRU/hqBfAZ45DQs/M6G
 n8yw==
X-Gm-Message-State: AOAM533zd5wvjP5hb6/ebDVxWM0iMRtOeTOr197HAg2gpINHZIZsav7r
 y44WtogRqrls9oyjFaZI2eEyCA==
X-Google-Smtp-Source: ABdhPJyOl5e9SOAErFENG0DQV3jPGZl7A2ZmYS7qXZ5vU/Ym3cpFF11PsDMqGPhp0ftxMJLNqxbzjQ==
X-Received: by 2002:a5d:53cf:: with SMTP id a15mr2623857wrw.677.1643284877565; 
 Thu, 27 Jan 2022 04:01:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bh26sm1827525wmb.40.2022.01.27.04.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:01:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF2D81FFB7;
 Thu, 27 Jan 2022 12:01:15 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-12-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 11/42] hw/pxb: Use a type for realizing expanders
Date: Thu, 27 Jan 2022 12:01:11 +0000
In-reply-to: <20220124171705.10432-12-Jonathan.Cameron@huawei.com>
Message-ID: <87v8y59ylw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
> This opens up the possibility for more types of expanders (other than
> PCI and PCIe). We'll need this to create a CXL expander.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

