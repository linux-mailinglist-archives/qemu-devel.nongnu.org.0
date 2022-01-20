Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA168495652
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 23:23:13 +0100 (CET)
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfpo-0003LC-Ql
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 17:23:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAZVd-0000r1-Lj
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:37:59 -0500
Received: from [2a00:1450:4864:20::334] (port=36514
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nAZVb-0005Yq-PH
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:37:56 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso21365251wma.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=z2+rwXth+XGrQkzvlx9g2NPE1DouR2XLmgR1gBNCLB4=;
 b=KOfWtrHh4vyLicNLrxBnWoCcmpYCVLY7RWAk3GCMLDMjfRZHMX8PfMIQadEnQYliQu
 qUBsVcwgFKsbNdWlKbjqMZfzxcYK/qVe/HR54daZokg89WxHafq1heEItE0aIQ4GIFg+
 ysfzDWWefH8FRMIF8RQnwoJhzgr4ZSIkTZ1PyP5L4rgQEOQSAUyWz+8AE34wB9RM5Tt+
 3aX02Lju1AxfU1Rv27sdvVtYpqTS2AAIeTP89C9d2ULdYANkVTDQHbUQe22PUrwnjl5r
 2RltbJOtuiiUx2mQsTtrFLzzJvv7ui5Ri0A20NJ/dYBb46xIkX5lSCBmbbZYyoZ2NglQ
 dILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=z2+rwXth+XGrQkzvlx9g2NPE1DouR2XLmgR1gBNCLB4=;
 b=nJFqmQByzC/lfgUzCxLRxebZxymxrHKF2Y/lYqcYAHMPtofHM7rMl2Zrr6vuo7SHmq
 aFfUJqim7Jbgpc3mIAG9uIghf6axFcQTNBzkyzFWzCCy5ThMk9P3b5qRWqOxuLRgum7F
 d3srwsFh3XelPKY0EGqK9lQRH1fAlgP60cs7fXRuWZoHw7Nrh8l6076BKMLb+3J77c/n
 3Bp/fg3kppWRNqFX5BmLp1Pr3O5RJwMvzofBd+kVqCiwUDsXOK0F+TdPQXJ5LGhQit2w
 fE2e2XOFYuiYuhatMc1QG2wGpHndLYIjdsw2Jd6UYL5SqMtmQuoM+nq7BDNak7H1pv8S
 dCHA==
X-Gm-Message-State: AOAM532FRwnKEyndT/QmgC9QwtIs7aLSfdSbOZp0Keewa0BzAstV2ouE
 qz9XOq4FoueA5lyq54woV3QBxQ==
X-Google-Smtp-Source: ABdhPJyWq8pgk9KipAksf5H8dFHzHKkSW2wg76muCZJI/pXuMpV347+fsoOU6GOZmfjeyg3PiAOjgA==
X-Received: by 2002:a05:600c:383:: with SMTP id
 w3mr4325109wmd.93.1642693071271; 
 Thu, 20 Jan 2022 07:37:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a9sm2978893wmm.32.2022.01.20.07.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:37:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC4E31FFB7;
 Thu, 20 Jan 2022 15:37:49 +0000 (GMT)
References: <20220118203833.316741-1-eric.auger@redhat.com>
 <20220118203833.316741-4-eric.auger@redhat.com>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/6] tests/qtest/libqos: Skip hotplug tests if pci
 root bus is not hotpluggable
Date: Thu, 20 Jan 2022 15:37:45 +0000
In-reply-to: <20220118203833.316741-4-eric.auger@redhat.com>
Message-ID: <87mtjq7702.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: lvivier@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 mst@redhat.com, eesposit@redhat.com, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, clg@kaod.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Eric Auger <eric.auger@redhat.com> writes:

> ARM does not not support hotplug on pcie.0. Add a flag on the bus
> which tells if devices can be hotplugged and skip hotplug tests
> if the bus cannot be hotplugged. This is a temporary solution to
> enable the other pci tests on aarch64.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

