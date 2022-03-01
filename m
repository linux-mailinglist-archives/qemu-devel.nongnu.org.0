Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C774C9230
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 18:50:18 +0100 (CET)
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP6dZ-0000Mq-9q
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 12:50:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP6aw-0007IG-9q
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:47:30 -0500
Received: from [2a00:1450:4864:20::52a] (port=36531
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nP6au-0003iC-Tc
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 12:47:30 -0500
Received: by mail-ed1-x52a.google.com with SMTP id cm8so23049537edb.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 09:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=46fkMdfnhldasufV90xDHsl7VVgwtq23xkVkYCN993Y=;
 b=Zcw8gkvqyRpCx7TkAb7ewvbX3ESrUtgZgz1+tqTmW+xfrv5qEHo+dTIACLBazRzkG6
 LktcxuvBgvMZi0TZ74HzsvWWJay97EtiiFgRLFL9bp80cUfVY1uAZGb/+0m0jFsksuje
 90j8REdw5T6TL/AIXOknC2I+//tzpCsKVEo+PLqkICMQV0GfzbP5LoUg371e2jjJU9Iz
 Yf67/Wg4GLhEFpb9tLBN1c8Y1INP0rx3+Mw7EmaGBNXrlnMCN8FgGB4eC+XeItvmMXw6
 oa/AfNwD6Jc7Iegt1QGO4vopaei9rJVDBtZ7PGso32bY9D3lc6WhsVcMIRGBQ+Fdfu6p
 f+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=46fkMdfnhldasufV90xDHsl7VVgwtq23xkVkYCN993Y=;
 b=HkB+f89CHgUKh1XJPDOEt2yGUeY/xGGp16RrWFcyrsPm4q54YKGsFQGE3JuWSSov0Q
 KuvlmjizEYHbn6DaahSFAMJE7+IusnAJ5d15CgIFd0wQ1iKmIZI8v7+wHeTqBbPgxL2M
 eHndzcoCMuAMizjk/OQCu5eW0tfHEhsdNtYFw6i8FXfJcrv6XDSINn1Ci/74fCcc16Nu
 mQE16sP0kiRsu0gisulp8PhJEkfjjJGXz8iSi6EJXQIQs+6iul1CAucnFhpb1cjwH2pF
 MstxdQa32y2pvih0si++WGXZnvgPS9v6p0+haSha2OCswNRg0Qi+GR5tWMKWjEhdLnX9
 +8lg==
X-Gm-Message-State: AOAM5324+852aub+TeS2Dv0wRSz1mxi6tb2bSfo8Ah8dxGNYTWyqUaqg
 YUXDOC7UXtMskEWN9AnOlZzF7g==
X-Google-Smtp-Source: ABdhPJzGDqFNhnBcVeqndQdVVn1EIsHMjA0aFlvtBsu5SAJrnUqV36pcueRAofN9M+9pIUz3iChE5g==
X-Received: by 2002:a05:6402:34c5:b0:411:f082:d69 with SMTP id
 w5-20020a05640234c500b00411f0820d69mr25570682edc.65.1646156847271; 
 Tue, 01 Mar 2022 09:47:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n25-20020aa7db59000000b00415965e9727sm704812edt.18.2022.03.01.09.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 09:47:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B534F1FFB7;
 Tue,  1 Mar 2022 17:47:25 +0000 (GMT)
References: <20220211120747.3074-1-Jonathan.Cameron@huawei.com>
 <20220211120747.3074-15-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v6 14/43] hw/pxb: Allow creation of a CXL PXB (host bridge)
Date: Tue, 01 Mar 2022 17:47:20 +0000
In-reply-to: <20220211120747.3074-15-Jonathan.Cameron@huawei.com>
Message-ID: <87tuchlg42.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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

> From: Ben Widawsky <ben.widawsky@intel.com>
>
> This works like adding a typical pxb device, except the name is
> 'pxb-cxl' instead of 'pxb-pcie'. An example command line would be as
> follows:
>   -device pxb-cxl,id=3Dcxl.0,bus=3D"pcie.0",bus_nr=3D1
>
> A CXL PXB is backward compatible with PCIe. What this means in practice
> is that an operating system that is unaware of CXL should still be able
> to enumerate this topology as if it were PCIe.
>
> One can create multiple CXL PXB host bridges, but a host bridge can only
> be connected to the main root bus. Host bridges cannot appear elsewhere
> in the topology.
>
> Note that as of this patch, the ACPI tables needed for the host bridge
> (specifically, an ACPI object in _SB named ACPI0016 and the CEDT) aren't
> created. So while this patch internally creates it, it cannot be
> properly used by an operating system or other system software.
>
> Also necessary is to add an exception to scripts/device-crash-test
> similar to that for exiting pxb as both must created on a PCIexpress
> host bus.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan.Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

