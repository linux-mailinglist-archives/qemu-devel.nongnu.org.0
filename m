Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D63E49E25C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 13:28:32 +0100 (CET)
Received: from localhost ([::1]:56578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3t9-0003w2-No
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 07:28:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3WZ-0000no-0C
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:05:11 -0500
Received: from [2a00:1450:4864:20::42a] (port=36750
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD3WW-0005xF-J9
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 07:05:10 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u15so4375804wrt.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 04:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=wC5AJAToOzdyWv76wjRLKppn9pQtgWR38O4l4EJP0E0=;
 b=ALLf2LsuxHIZC5I1LP7FulLCCIxU9f7vI6+K2R/gzZkj5/+onZppJOefECeXSY5TrN
 qfE0Tw+kNTqRoQzmTpkJsfEcs9ah0CQ4Lr08Z4Ki1K/OOb/DV4vCRew/pPogpnQyWbZY
 yuM1wIvgcoB4hOVVp4lSNk32C+AyxljiXpYBxUhHxFIKdIPWdTG+WE+NeojAQNIAgCkd
 iaurGRPCzB0VJgWZY77QmHtqVxva4iOlhOnkiK8sX3ecPGqb0m/D351FIfFJLJG/3Y8V
 zwDy3i/Jv9pz+AAoqOtOX5rji6UFVpSLOyayJ9PN7YaBoQszUEX44KlLczB9cb/e4ORq
 /9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=wC5AJAToOzdyWv76wjRLKppn9pQtgWR38O4l4EJP0E0=;
 b=PMnbWbfoN+V7RAfgZXkJ7M3uy0YpWsdxVeHXCD5lQ2RfH8Y1ClQ5dqKPwmR3Njz1AM
 CKnw8UugbSTdrmsQvQ7HzKgN7FMiVGZrGOGS7LmOVl6CDRjEgTuUKefAR7l8oVKwZayM
 QNnWKklbjZH2GowpbVvHOzuGpmfsHHrpjI6WY2B1FIpP+gMPK/O6fEVdMH0eL6AubJID
 NeRzpRDL0F9wYYyGkcuTQcbn5EV5ooL4QpMa2PvGicL4muI1ws4gaYGNH4Gr521PkO4+
 6tuohqLEYfV6e73HM8mLwq7i+dXVgEKN+HEyBK6xvlCG6MPj7C1nUm/+DbSd/fuUo7kF
 Z3DA==
X-Gm-Message-State: AOAM531oPG5zHXqBVK7bGGTZ41caMI07lSf2wUmMsm4Z8Qbb4HjjehFf
 I+aSB5J0R7Nd2+GV++pgxiZIWg==
X-Google-Smtp-Source: ABdhPJwlXJ9yWjlrcjJcAF/GSPCFnEUgq6J5oh9ztAq8cJhZb6ef5bBQX0jf0nF6m4LJNiA/tlkiqw==
X-Received: by 2002:a05:6000:1292:: with SMTP id
 f18mr2836522wrx.133.1643285107124; 
 Thu, 27 Jan 2022 04:05:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k37sm10803669wms.0.2022.01.27.04.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:05:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11FA21FFB7;
 Thu, 27 Jan 2022 12:05:05 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-13-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 12/42] hw/pci/cxl: Create a CXL bus type
Date: Thu, 27 Jan 2022 12:05:00 +0000
In-reply-to: <20220124171705.10432-13-Jonathan.Cameron@huawei.com>
Message-ID: <87r18t9yfi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
> The easiest way to differentiate a CXL bus, and a PCIE bus is using a
> flag. A CXL bus, in hardware, is backward compatible with PCIE, and
> therefore the code tries pretty hard to keep them in sync as much as
> possible.
>
> The other way to implement this would be to try to cast the bus to the
> correct type. This is less code and useful for debugging via simply
> looking at the flags.
>
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

