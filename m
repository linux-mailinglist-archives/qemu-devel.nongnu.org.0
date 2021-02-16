Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF65931CA08
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:44:53 +0100 (CET)
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBymi-000573-Qa
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBylQ-0004cR-RB
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:43:33 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBylP-0005mx-9v
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:43:32 -0500
Received: by mail-ed1-x52d.google.com with SMTP id v9so7312383edw.8
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qqzWh1UevmScfS8gfyhPo67W/Edc1KUJ86I/qlnhzFE=;
 b=Nki0Rfjkhg0Zz1SptQOv1T81zEUzcqs0KIRQ8FPxvtvzqdL9nnFmZOgM0NiOCR7rsS
 Taw0g3Po6YAS334s1rIQ9P331cblALdH1k4rEt71uFQGYYSO6S4gZovRDTuwhVLdfosi
 hphSGiVWXubIbWwNSAP+WxbF54AMf91xGKBuE/0akEQCu4QYTGty+7D9WYmTWYwOUDCC
 rHP0etJ2aCIv67AAooCGe+7bSWQ0Nd/tBf8QaJ339Aj+2XLjL5VqLJCp2Ui0RmjTBazQ
 XxgOJQaV2ZoIuhBcE1gxlxu4W2uQE436Xj5950zPcX9czSMv8h4yW/xv2j7Mgn2J3WUC
 PYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqzWh1UevmScfS8gfyhPo67W/Edc1KUJ86I/qlnhzFE=;
 b=pYUkJQYhar2CnGO4aWj1V+Fm+pgK2tvlkj6ylxA2gpvrH/+ZB8xbH9SG43VC2k4Tq4
 N+ewC82/EcQ56pRU4yf8Gaztj0StEus2IYTFz7qpbsnjGRRL9r32SxX95gQV+rPwICqu
 v1tCgNHJuMbfNnayLXWgMcCw5b8vu1OvQi6Oqq+capvugOwb1ROPME4qHMLFn4nDx3yk
 tBQwJZB/0wy3sOGtKE3BpE5wxzQ4FbCHceQiD98+RtFd1CXot7W0XtqLM8Onk0+9YFpF
 oMUqDmwOIqCOONjB4U3MfvzWzC0iqtaSB9aZwPGQiJ0mEIO0WfTPgqkFlUbwAQ3ZjdzY
 xcPA==
X-Gm-Message-State: AOAM533XhRUmxPcUz+aGHIz8BZQnxC3gmMfIW/Ca6sup+vyYqKGBFNaI
 QOP+0D5YUuRFfRKTB8btAjalkCAD+bVfPAkL2YB8GA==
X-Google-Smtp-Source: ABdhPJzGOO7EkplKmvDoFmOO7dNEaIUXq3wPHE/r1Ne39EgJCMYvvL+ldNFL7P0foqOp1fqrDXzO50iMwxFUVvXsRVM=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr19962325edd.100.1613475809720; 
 Tue, 16 Feb 2021 03:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20210216110056.1228582-1-thuth@redhat.com>
In-Reply-To: <20210216110056.1228582-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 11:43:18 +0000
Message-ID: <CAFEAcA_R9vgujvdBhcMTVeB9yktp81Yxz-F8fPMniTHDZEnHLw@mail.gmail.com>
Subject: Re: [PATCH] pc-bios/s390-ccw: Use memory barriers in virtio code
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 11:01, Thomas Huth <thuth@redhat.com> wrote:
> According to the virtio specification, a memory barrier should be
> used before incrementing the idx field in the "available" ring.
> So far, we did not do this in the s390-ccw bios yet, but recently
> Peter Maydell saw problems with the s390-ccw bios when running
> the qtests on an aarch64 host (the bios panic'ed with the message:
> "SCSI cannot report LUNs: response VS RESP=09"), which could
> maybe be related to the missing memory barriers. Thus let's add
> those barriers now. Since we've only seen the problem on TCG so far,
> a "bcr 14,0" should be sufficient here to trigger the tcg_gen_mb()
> in the TCG translate code.
>
> (Note: The virtio spec also talks about using a memory barrier
> *after* incrementing the idx field, but if I understood correctly
> this is only required when using notification suppression - which
> we don't use in the s390-ccw bios here)
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

This noticeably increases the reliability of the test for me:
it goes from failing one time in 2 or 3 to failing about one time
in 5 or 6. However it does still hit the virtio_scsi_parse_req()
check on "out_size && in_size" eventually. So my guess is that this
is not a sufficient supply of barriers. I'm firmly not a virtio expert
but my reading of the spec suggested that some of the way the
s390-ccw code is doing things might be in the wrong order and
need restructuring beyond merely "add barriers to existing code".

thanks
-- PMM

