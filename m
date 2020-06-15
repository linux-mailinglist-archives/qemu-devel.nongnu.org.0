Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DC31F9C5A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 17:54:45 +0200 (CEST)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkrRc-0004j5-Ag
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 11:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkrQk-0004Bb-Uw
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 11:53:50 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkrQj-0007ZK-Dx
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 11:53:50 -0400
Received: by mail-oi1-x241.google.com with SMTP id a21so16300222oic.8
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 08:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpWoqLfnguV0GF6n4sJERMG+0Xr1p7BH5DoEXiKawJQ=;
 b=kS/4p+1Xf00zo77o/0QZGXVkaM0e5CHgM4kDNE4lKpSLqYOokRmTrzAoFWyb3xC//y
 Exru4PSTsuX/ZYcu7Q0PY8ysi9YBtcwVMRBzdyQOWq68ug4oaahur3YQR113utD8jZPK
 2TTu5eaAKWuvdCDsq+OgzLxIsKhaPG164KAhWlh4SVeITCLTEZYfqP2V8hN2OFSNw2N2
 c7HxmRj/eHBDhIYFfchWh3i2Pv5Yppb1jdB+itvo1QFWHpx3X+AXTosEa7HkSMkUlZ4a
 XS/cSTyJo5rhwzo+mXVpdZt+7hWA2VMzpDTD4jpGKaUOLoO2jhdCpbFkGY6T7GXexoYg
 KFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpWoqLfnguV0GF6n4sJERMG+0Xr1p7BH5DoEXiKawJQ=;
 b=ZyYbS5JE5zn4Fg//ySVASDRVUg4tW6bLalcEulLc1ufdanr/meymwaZt4p/JoYYIlf
 K4x/7lH8D5Y8ci9n6Eg+UQrm9te5sSPTcDzlVE9EshegHX34i1G9CZFtMKB6GURfWXNe
 bPdIDe1YrRNh/N2afch0zG7VNNTynwG5LDB6HHTAcd/Y7QjJdRNQrDHQ6vU1/8WsreyW
 oKre8Z1qzKB9LmWD5EWfDcAx4DBOXBwvCvh1MF0O62fERMSxhkBtXBMLSnhck2ehreRm
 l1fRw/z+kQeGfMgXt0esrB3rp0C4ua3JgR4AZoCGrpGDDmI9hMHhsiQKs8pVmDoyXJnD
 Jz3Q==
X-Gm-Message-State: AOAM5304z2MDMVFV8ZknpuSOxHQrEpTexioLuc4ARWWjYiIXo3PDSY+f
 JYM/cQFqU+2R5GZlpmGX/ZMXqR3goUziunGyTbfXYQ==
X-Google-Smtp-Source: ABdhPJz/dLhMgzEaqMzMzutuHgM69KbjBV3f6an0jDjlyC17KvCwJ9Sf9rYrzBWzeHjfuWLlQGI/SX4Y2TQeU9jBzd0=
X-Received: by 2002:aca:568c:: with SMTP id k134mr4196oib.48.1592236428190;
 Mon, 15 Jun 2020 08:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200529112757.32235-1-beata.michalska@linaro.org>
In-Reply-To: <20200529112757.32235-1-beata.michalska@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 16:53:37 +0100
Message-ID: <CAFEAcA_d=F6k3RcihV2x-HiOR-Qq+kWOcwh1FL9AUcG_2SqEVA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] target/arm: kvm: Support for KVM DABT with no
 valid ISS
To: Beata Michalska <beata.michalska@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Christoffer Dall <Christoffer.Dall@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 May 2020 at 12:28, Beata Michalska
<beata.michalska@linaro.org> wrote:
>
> Some of the ARMv7 & ARMv8 load/store instructions might trigger a data abort
> exception with no valid ISS info to be decoded. The lack of decode info
> makes it at least tricky to emulate the instruction which is one of the
> (many) reasons why KVM will not even try to do so.
>
> So far, if a guest made an attempt to access memory outside the memory slot,
> KVM reported vague ENOSYS. As a result QEMU exited with no useful information
> being provided or even a clue on what has just happened.
>
> ARM KVM introduced support for notifying of an attempt to execute
> an instruction that resulted in dabt with no valid ISS decoding info.
> This still leaves QEMU to handle the case, but at least now it gives more
> control and a start point for more meaningful handling of such cases.
>
> This patchset relies on KVM to insert the external data abort into the guest.
>
>
> Thanks for all the input on the previous version!



Applied to target-arm.next, thanks.

-- PMM

