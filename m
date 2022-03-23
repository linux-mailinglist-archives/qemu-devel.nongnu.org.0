Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390574E56EE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:50:01 +0100 (CET)
Received: from localhost ([::1]:50756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4BL-0006L6-QC
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:49:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX44E-0002p4-9w
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:42:39 -0400
Received: from [2a00:1450:4864:20::436] (port=37602
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nX44C-00033U-5H
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:42:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id u16so2956561wru.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 09:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=qDcNEt3D318ovUSTpIPY3Ml+8sJEL8vRAQP16O7rzRktxf0gDyWO/4VYp1XFOk0hmx
 0EG6apkEMrwmlAD9jXCGlnK9cQdVupPNeLFxwxY7GgzKoorb5ElIBDC/VFqINptU+qof
 B1QCgV0Cy/C4F4GmfDCCVIZQIRRAhPRpL+qqfQgjZ8GHl/Qgxyo9bcEdxoAlzWm2AT8O
 KPv1tiygMqmwS/U31JXn8Wz6AOLo++8AzB5RxeBZ+GmJD5fq5e2Z9lpdwraK4L2GBwF7
 6QUAVuZudqPlt7y9dhtjvaeBKiY0yhDDagzrON15rJJ7qg1qJ0i/QqGpUwMIMYc1tk4y
 tQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=OErHMJE8GgWPQlXVIVAQtiBB7L/KTTR7gKEe+mBI41NijBtqIeBG8sdRV/10Dfz4iP
 JjYtt5b5e9uIH3UCpJuVKqsOmeE49m8xPbcmwo+BZcvk+qwOTU/ZobvNadV+yzT2aoZ9
 86NBeN07MbwnYJeWgREOvS70MC1nlVxuh5mS44QXRZwZM73/XBsye5NCgG0URAnhXGOm
 SgGAaSjxBC9vdEmB8yTWUrtShgwWFeoc2A5MClmOE5QEYvp/7xJc17zzA+yDKW2pD8dW
 hSmDwmmzXV9yK+i+qf67SmUIIXBnaZLTBId6Pwnp9JisKFXbaI/mpymroQATwKkFaHJL
 fEFg==
X-Gm-Message-State: AOAM530haU482xPV6dGdJimg9YUQ3qVTmzNQ6Z8yG/ELSlJBITOldefp
 N8b3Xkb2U0J4sX3iksQ0z3xh0Tcw7DhYJA==
X-Google-Smtp-Source: ABdhPJyDzjXjPqLkhuKRPkgAzGCRsGMEwc4zLfck1pHI57O7Nl4lvEeytLjmoy1SVCJzU2gH7Ylxjw==
X-Received: by 2002:a5d:618c:0:b0:204:2f:2c1a with SMTP id
 j12-20020a5d618c000000b00204002f2c1amr634891wru.709.1648053754943; 
 Wed, 23 Mar 2022 09:42:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a5d6488000000b002051f1028f6sm378512wri.111.2022.03.23.09.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 09:42:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2095A1FFB7;
 Wed, 23 Mar 2022 16:42:33 +0000 (GMT)
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-6-richard.henderson@linaro.org>
User-agent: mu4e 1.7.10; emacs 28.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL for-7.1 05/36] util/log: Move qemu_log_lock,
 qemu_log_unlock out of line
Date: Wed, 23 Mar 2022 16:42:29 +0000
In-reply-to: <20220320171135.2704502-6-richard.henderson@linaro.org>
Message-ID: <87mthg4o3q.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

