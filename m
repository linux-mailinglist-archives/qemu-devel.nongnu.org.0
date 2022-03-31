Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6DB4EDFC6
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 19:36:59 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZyjC-00076p-GU
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 13:36:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZyi0-0005fn-Ku
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:35:44 -0400
Received: from [2607:f8b0:4864:20::1130] (port=45163
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZyhz-0000cg-8s
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 13:35:44 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2e6650cde1bso5947897b3.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 10:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Be/LfUxkukYlajZN9PJBLwswPUigo+EgpFZjQaCQjOA=;
 b=R33n1lDvTR3zp/4us9LGvks3B7Ocu1YIA0/CCraGjiLOUR2vQxb0pa2XPAG44oT1yy
 3Gd4jQXZ/m0wAcnE88R0F+ou4/Uc2ghHYIrnY0sqvCTp47G6Qx7oy/peYRWC+TDvxmAA
 s5Wpo7MuEPWRyOC8ZF+baJxnD/EhEsjRsaAcKNeij4IJNCngwrjv0MusEIVGcBasT8/2
 rk8/Quz6dxZfd8xjfAXa5co6pR+igy850snHQSwszCp6QNfqoAv1CqMVv89NM5SNZwr4
 B4MNauBVa03sa3VGldP7Hu0R2qCdQL//7L9TrFsTfh+NfUSJYthE1pxj4pbz7Z1ZwyYO
 cjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Be/LfUxkukYlajZN9PJBLwswPUigo+EgpFZjQaCQjOA=;
 b=DVj1zfcrMakwNTeQ7SkkrxoLJAMRPKn+/yWiV9Jb4bM7SgwJJPa1Biw7bva4kiIvTo
 j8I7Who+BjpPI1LUvT9nUyGxFtTAOyRkcxD+2i0bkuZwuLQBTpB654kg84bt2UxND14G
 J3SgeRcvnyih832GT1Xm/o6ZHmCZ7FJULLV7qTyQ6nr5DqABujiUYpayp3lO0inlzguh
 vZq9I3eyDRdJSpQr/BNKjAkKdDFYo1Ea/h/Qzy9nPUGtTIJ13BYQn6m+cz3rNt+X/G+A
 8eF2vkoBK1aeRI0LziV3hCN+F4ixcz7zZxu50EKJSVU4BWK9u1qw/PBBFSEv4zMFmByd
 gUKg==
X-Gm-Message-State: AOAM530CEWJXv+fTC92rT6eHR+j7XyTNDLbTm1N0Zl0bylaosOEgqOsZ
 fdqa9L5LZBZFCxShanW0OMZ+j6fRLNqshcR8to/A0WiYmV6S4ULM
X-Google-Smtp-Source: ABdhPJwcZRw+DrRkTD0eM2Gns7D8rh6GldYevKemBQC0LQju0UPN4WBQ0PhzK4qcNLQlVpGO1NaBFN5o6KPhukWFra0=
X-Received: by 2002:a81:ac15:0:b0:2e6:d7e3:c4ba with SMTP id
 k21-20020a81ac15000000b002e6d7e3c4bamr6080151ywh.10.1648748142306; Thu, 31
 Mar 2022 10:35:42 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 18:35:31 +0100
Message-ID: <CAFEAcA-wExOSiuJ5F6nBwWXcWW2c1rqHCfT=JNrdWQ4baqu3Og@mail.gmail.com>
Subject: use of uninitialized variable involving visit_type_uint32() and
 friends
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity warns about use of uninitialized data in what seems
to be a common pattern of use of visit_type_uint32() and similar
functions. Here's an example from target/arm/cpu64.c:

static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
{
    ARMCPU *cpu = ARM_CPU(obj);
    uint32_t max_vq;

    if (!visit_type_uint32(v, name, &max_vq, errp)) {
        return;
    }

    [code that does something with max_vq here]
}

This doesn't initialize max_vq, on the apparent assumption
that visit_type_uint32() will do so. But that function is:


bool visit_type_uint32(Visitor *v, const char *name, uint32_t *obj,
                       Error **errp)
{
    uint64_t value;
    bool ok;

    trace_visit_type_uint32(v, name, obj);
    value = *obj;
    ok = visit_type_uintN(v, &value, name, UINT32_MAX, "uint32_t", errp);
    *obj = value;
    return ok;
}

So it reads the value of *obj (the uninitialized max_vq).

What's the right way to write this kind of object-property
setter function? Just pre-initialize the variable to 0?

thanks
-- PMM

