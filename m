Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E27A4F38F3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:38:42 +0200 (CEST)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbkKO-0006a4-Vv
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nbkIr-0005VW-3l
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:37:05 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:34774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nbkIp-0005Xr-9V
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:37:04 -0400
Received: by mail-ed1-x536.google.com with SMTP id r10so9435342eda.1
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9a22BYVOc/W6HWs8BgKyA2VVh43njI+QuH6k5mecZEA=;
 b=Vu0CDbwexOfa5eVYRY946mO//6NVarULyyyZVjaHvLdbDcgMBQT7l6GSpbGiDG8d0j
 hQ8FXBXlD/7MCm8xZFPmFoqcQZ1XxvwlRcY1Rr4UAeBK44sxTDcFRtQmhYNAmzjcG/sH
 CF2LaAmH8J3CWf/AqXRrwd6yEUP80Qc82m5Zjyo4jgiDVgA6+/cz8mbefHhKSr3mknnC
 hrRDoJaxe46nsLNTGCwdEHD+eHDCFh46v2Qw0iS5WZTUlOA34QiC4CFAkrvLt5oraPUI
 6cXJknbt5BIIEpE/GZSWczrx+iDzIgFse+PJInrf3WmDygImgI3dMypKkBMn4bbKPf3x
 cumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9a22BYVOc/W6HWs8BgKyA2VVh43njI+QuH6k5mecZEA=;
 b=qaLZGuh+Hw/WtxOPNmZtJ5Ry4OxDJtBTOmbRyjBpobZNzwaR7+5VwbqczjgqscNeE3
 Sfg+5KQKUZN2Jq9a/GcvQk3rtfBNSg7OkFnnjxXUHv13xgfa2NM+uyNXafEdZw9I69Ea
 aXYlrcqng69Q4BT/PT9JPC2F3r+vRHwEQcCWle8qTe6gJHkhpMJimaGlW/96X8lCaflJ
 XbyXHXt0B3ETwRNraxKumfkwiQcNlqlxkA+NB6B2Jr7GJ97WWd+KgLyDawNjxzOAXG5t
 65OYTMJc4qO5RzptPzglcDdRX7TDXqN4iK/2CmHG/K2RqjeFpEKU2/yHAxPZYegRj7W3
 S9eQ==
X-Gm-Message-State: AOAM5305Ka632DgYPF83h4U7OLj1TEqtRiSHcCwLAbCAbh/GNqJ3WZHb
 aQMWdUKQPQOkhWJuWWocOGDwLA==
X-Google-Smtp-Source: ABdhPJyGUol43JcqDpwz1Wp8gwDsZbq+LszdnDsa0FcMVpLu6UkrnbH4y6EI+EJw2RcR//hwkKNXuA==
X-Received: by 2002:aa7:d0cc:0:b0:41c:b59c:c461 with SMTP id
 u12-20020aa7d0cc000000b0041cb59cc461mr3937593edo.285.1649169421431; 
 Tue, 05 Apr 2022 07:37:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a170906a18400b006db0a78bde8sm5610712ejy.87.2022.04.05.07.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 07:37:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D86421FFB7;
 Tue,  5 Apr 2022 15:36:59 +0100 (BST)
References: <20220210145254.157790-1-eric.auger@redhat.com>
 <20220210145254.157790-4-eric.auger@redhat.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 3/5] tests/qtest/libqos: Skip hotplug tests if pci
 root bus is not hotpluggable
Date: Tue, 05 Apr 2022 15:36:53 +0100
In-reply-to: <20220210145254.157790-4-eric.auger@redhat.com>
Message-ID: <87zgkzk35g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: eesposit@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, Coiby.Xu@gmail.com, qemu-arm@nongnu.org, clg@kaod.org,
 stefanha@redhat.com, pbonzini@redhat.com, eric.auger.pro@gmail.com,
 david@gibson.dropbear.id.au
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
<snip>

--=20
Alex Benn=C3=A9e

