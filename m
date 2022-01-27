Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A2A49E5D0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:17:43 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6Wr-00008w-A0
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:17:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5mH-00074v-QJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:29:33 -0500
Received: from [2a00:1450:4864:20::32d] (port=33581
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD5mF-0004QV-WD
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:29:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 n12-20020a05600c3b8c00b0034eb13edb8eso3404964wms.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RicQOisaO04B9GBLBPS0jGWaeVqHqZaQe9mPCjO4FXI=;
 b=Vap2O54BFKTXQ4CV64PilR+EKDbadYgvJk7rtSaw1uQSBDnU1bjEJQrD5bX8pfwMBZ
 aBE6SWyNaTk0bHnJrbAjqYsqj+uAglJsq5E0RWsq3d5JD2HNWfolE8WHWMqR5r35vbPs
 ywDSegDysixIJjstEgKkhv42Sph/xyIlfvpxyBYOS+nl8QVnBwn1YZMTKhvHgThcZCOw
 fFwOwcFpzohyjlhA61fw4yUTYGmcOIu039ewv8i0vG6jFaOKrv3FGfYUp+O+veuMvQwA
 1LChEO2GoiMZThF0zIepI6X/gPfrP1jr3pp+SX1N5g2YxlTCG05TliomILc4UEsGDz2f
 OJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RicQOisaO04B9GBLBPS0jGWaeVqHqZaQe9mPCjO4FXI=;
 b=Z6LQMgQ4p9sizezdsiOdRUTcweF2eLGHWF3KQTZ81gNEGHoUIMinCwyqLXhmJ2TXFi
 sVUbwwebJ5dMAAjNegrBM4rs9Tp1dQ4kYRtXZVqSTP/soDKTiMY0TXgjAADdh/9oB9MI
 m4rsRQ5DLzUTI9KjozqBkXha8JEZt0yzlua5UnfsMbGBjRO7aPbblZ3U2RbHoosIlBI8
 F5Qtqw0eik191U397wxDQqHSY+HVrDe1HySEzBh4HGf0OiP1humxP4kghNx9zP4aeKhh
 Yemu2C+LVBCEaTthoFVuiJqDnRTkt+orzRQHm16BEQgsAqvKgBWhD+9FkrkZF7myBbvs
 zvYw==
X-Gm-Message-State: AOAM532El+VxnZ9qaj0xhuwVb/ix7JVN740iJRl1SoaGEoESo0h4uEyV
 +PLTmyzWRXFuJ6csJVriJftLRw==
X-Google-Smtp-Source: ABdhPJxT9o6yEHtZkzPqNS2kWs8gjkwfalClUNDJP5093P+1RycF21QeT0Y101HSOeJhoNum580e8g==
X-Received: by 2002:a05:600c:3d94:: with SMTP id
 bi20mr12024697wmb.14.1643293770277; 
 Thu, 27 Jan 2022 06:29:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r12sm2211152wrw.73.2022.01.27.06.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:29:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63E191FFB7;
 Thu, 27 Jan 2022 14:29:28 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 00/42] CXl 2.0 emulation Support
Date: Thu, 27 Jan 2022 14:22:52 +0000
In-reply-to: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
Message-ID: <87sft98d6f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

> Previous version was RFC v3: CXL 2.0 Support.
> No longer an RFC as I would consider the vast majority of this
> to be ready for detailed review. There are still questions called
> out in some patches however.

I've been through and added comments through the first half of the
patches. I'll see if I can get to the second half next week however if
you beat me to it with a re-rev I expect some ripples from the requested
changes.

Aside from ensuring the rest of the builds work:

  https://gitlab.com/stsquad/qemu/-/pipelines/456700583/failures
=20=20
it looks pretty good to me. I await the next version ;-)

--=20
Alex Benn=C3=A9e

