Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E163260F317
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:01:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onyjz-0004ZM-Sp; Thu, 27 Oct 2022 04:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyjx-0004V8-UO
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:59:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1onyjw-0002Q7-9g
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 04:59:53 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bk15so1003944wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 01:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cWc8ZuMg1/+4qY7rzQF6w0oVRg1s+VU5bhsmROUresc=;
 b=m8SHq17GnllkBzLDUI0cKBCBnxw6KxFC9Ew/VVss/SVAL1xT33ju7XxARfhhxBJTP/
 Bi+Ad/ZO6vO+eHqqf0djGURQU0mtyMkaYXFC56Xuiy16rGesbE7R+XDyaQM7d1RQVXYs
 GDqIhZ6Bh5Q2408HR+ubCUseqtvDu2bryVc56pA24T7mUC+inICP08T3r+wxsG/Sqqn1
 eA2csEKTBvORv0wj6/oMtzHHai7ge39PjK5LDCsJaLLm7tGMyR3PY0tQ767IjZqwLP7p
 hHeScuyZBFRvQuZiyugO/0KVayETNq6lUpc97R01mVOV6PBDxR0ggTPtegu1QkpsVgMM
 mUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cWc8ZuMg1/+4qY7rzQF6w0oVRg1s+VU5bhsmROUresc=;
 b=KdhGRX7fi4/XBsUqGfZ+u5RFp68iPWLBxHAyTpCCLzrktAp+SuADYAa5V9IbevN9kI
 dCBi7hzsxguWFufXKJAHEyoqaOHiwjYyxILNubM9J2/hYS5uRKjmrgvrd0ZGWCq34krO
 PKqdV2Vr6V8ly5Ktmuet33bd3KFz/symeFBeUh0oY5Q7CUn5HL6YoLIJTQZlpT8Yjiby
 81j0BJgDBHZd1AHyURW0AIlmA0F5N4kA3zUzb7FwWHOo65v2XUTY829uUuywMGGlHvbW
 45I2XwqKo4Hp98vc+E7AmRFGLtOTKNOGKFKyyy5DAYzp1q0zXtBBuk50QRlKZvbUjQC9
 HKBw==
X-Gm-Message-State: ACrzQf0Trvp/RQQ18JXxjOQ86JUd3vwjPYobHpDLHC1LesJ23KZLgCgR
 7JpTuWSNA+fIPdoYnXKlDESzow==
X-Google-Smtp-Source: AMsMyM7E352cvnvKVOaC8nFGoKrvYv8reHvdCXxgeuwBf1GvlE6shsatQzuA8/P+egWBRVhCR6tHpA==
X-Received: by 2002:a05:6000:18c7:b0:22e:5503:9c46 with SMTP id
 w7-20020a05600018c700b0022e55039c46mr29775755wrq.668.1666861190719; 
 Thu, 27 Oct 2022 01:59:50 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bk13-20020a0560001d8d00b0023677693532sm677875wrb.14.2022.10.27.01.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:59:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ADB0A1FFB7;
 Thu, 27 Oct 2022 09:59:49 +0100 (BST)
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-5-vikram.garhwal@amd.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, stefano.stabellini@amd.com, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 04/12] hw/i386/xen/xen-hvm: move x86-specific fields
 out of XenIOState
Date: Thu, 27 Oct 2022 09:59:44 +0100
In-reply-to: <20221015050750.4185-5-vikram.garhwal@amd.com>
Message-ID: <877d0l3am2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Vikram Garhwal <vikram.garhwal@amd.com> writes:

> From: Stefano Stabellini <stefano.stabellini@amd.com>
>
> In preparation to moving most of xen-hvm code to an arch-neutral location=
, move:
> - shared_vmport_page
> - log_for_dirtybit
> - dirty_bitmap
> - suspend
> - wakeup
>
> out of XenIOState struct as these are only used on x86, especially the on=
es
> related to dirty logging.
> Updated XenIOState can be used for both aarch64 and x86.
>
> Also, remove free_phys_offset as it was unused.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

