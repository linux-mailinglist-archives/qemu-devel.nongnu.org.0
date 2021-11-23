Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787D345A2BE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 13:37:51 +0100 (CET)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpV3W-00012G-1M
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 07:37:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpV0s-0007QA-M7
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 07:35:06 -0500
Received: from [2a00:1450:4864:20::336] (port=38434
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mpV0r-0000LM-6r
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 07:35:06 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso2088447wms.3
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 04:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O/Po9GBMwTKKj4W7NuVI3DXT3epe9RRJlNRAzOi9iWw=;
 b=kA7nI6wfccDTW0gkZMT8nw4iyBKRjMjxIK5qQOSs1b1+jJe4Vn45CBbJ/15n2ESaAY
 c2+c4c4cSedBmCsxB7zxKhp8q9fbulJw6y/89J8rW8sUUHaUvjdmvsSO9T9MFg57m3eg
 se2veRKhwjhQ+dkiQVK0QRfA8EFrdKriORAlWkWTcVu+oXOf4GCtC4Ew23wviBJ+KbVa
 gZcnt4yLWo4O8h2nVMn9kd0v/b4mjDfJ2SFK0cvoqmTp10xybrstmohj31l+n2PVudyi
 I+0HOqDQ0B92hscm3tnCQdu7urpSbtuvFJfxJy0zNgzOO87vzD0pucWE3VVd2tSMTEBY
 xR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O/Po9GBMwTKKj4W7NuVI3DXT3epe9RRJlNRAzOi9iWw=;
 b=1EprXfcPZRwGh4c37raCtU5H1nh6jtJZQjgJuOkd1Ymu25Kc+9VXrxuks3m59YdDhW
 9nFdctDlOxF1mQDxm6iCwxBvpH5RzN6Tm+n1gUtGKDXuN7BmPYYFUZzzj1zltXddqsQr
 t9Ntg2QWd1XBuHKCRTqyhLlCrPG6Xk2f363hfxdU0hayyjjpMQiwYRPwFJW7gk8wDz+X
 ACgulnb1qno3zDXlceLAACU2gs3y/YKbqkfb5QksM08rGhZq7haWGaa8GAdzywrAJXOD
 +JhqxenfkPCn+1lYzhJ8S2rPhhoGhLw2GnxI/CKZcZc5MJ3O/Qa5atZkv4GoDQiO8xRD
 F1rw==
X-Gm-Message-State: AOAM533St5VMI8Ztfbu+wfKo11obgWSJP0u++ttyNUk2VCuTSpaZnl+X
 qKdBtDzsKkYIVa6QlIyxzoXUggqEMTZfgfIQhpCJGg==
X-Google-Smtp-Source: ABdhPJxYOC5J1CEm9KNhTZpZlKiYQbyTxcK/CHKVcWXcMJ4l/UoHi4p74/By7Qv5NSmBMKoF8HFUOiPEnMUt/SfsndY=
X-Received: by 2002:a1c:96:: with SMTP id 144mr2719123wma.126.1637670903375;
 Tue, 23 Nov 2021 04:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20211123122859.22452-1-agraf@csgraf.de>
In-Reply-To: <20211123122859.22452-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Nov 2021 12:34:52 +0000
Message-ID: <CAFEAcA9ceorf5YK+yKS8KGfHPgFDTxWkLyfva0NDmkrHV5zz2A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Extend nested and mte checks to hvf
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 saar amar <saaramar5@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 at 12:29, Alexander Graf <agraf@csgraf.de> wrote:
>
> The virt machine has properties to enable MTE and Nested Virtualization
> support. However, its check to ensure the backing accel implementation
> supports it today only looks for KVM and bails out if it finds it.
>
> Extend the checks to HVF as well as it does not support either today.
>
> Reported-by: saar amar <saaramar5@gmail.com>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Without this check, what happens if you try to enable
both eg virtualization and hvf? Crash, unhelpful error
message, something else?

thanks
-- PMM

