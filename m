Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7A38E381
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 11:45:10 +0200 (CEST)
Received: from localhost ([::1]:58008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll793-0000WK-P3
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 05:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ll76Q-0007NE-EW
 for qemu-devel@nongnu.org; Mon, 24 May 2021 05:42:26 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ll76N-0007SE-Kk
 for qemu-devel@nongnu.org; Mon, 24 May 2021 05:42:26 -0400
Received: by mail-ej1-x630.google.com with SMTP id p24so39551245ejb.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 02:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5ONGaH/4OPzry/prSZ2UCPG8A0rU3qiC2X3xVrEjzzI=;
 b=k7/Q2vEWQxWOCwWnS5qnhA61/mLJKVWyJVWLdjnL7sh92QKO+NExf4kMBCN0ysyzap
 DmvI6am5JpdFTI+Tm4I3mHK/vc+sKb1TdwvVd9OjQbbLxmVOBj928rEf+Vlj3aRHdp7U
 F0sgJsy0Zo+5nMghb5BKCbyJBxgfTppAvI4zYVEsW9pXUQ9Z15evYFzpMogtglBFPZHU
 BCSbhGuK8oSDZrdDk6xyKSrYibRrzbjWzRmys0GnmAr0GTREerHy8drQtxGD+Qu45/ok
 ffAT1irnrr5PhpbewhvVfs8kpGytB/C8Ir0G9AOHkoi9tFY3EJ3eUAXtl/Jr/9snZf6T
 fJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5ONGaH/4OPzry/prSZ2UCPG8A0rU3qiC2X3xVrEjzzI=;
 b=ei2uuXe8x9NkboqVYjNocdP8aMKqAvlnAyC4h1Gflzfc0WedePikFXX0SQhWtYQ9N6
 E6SnfYObm4ywSQ6/OcJclPDS0arP2MM0U5NOfO/BDRsaAH8zCclKU8Rgj87M30WjWNuy
 wdeBWXGIpwoRDZJF1hLs2YMAjsM4ghtwCoP5GJLQYSUqRDl0zlmBtspqvAo2bsME3fVC
 nrSXGsPuVg4cn6dQvQBdm4YGnk970Tz8LzSNDmmJR0J5zKIm/JVCUuXDONHBG5BgGP0Z
 rXk7EUESiGfaCT04RelGx9fMv5H1TZ7oQ1iP37V18AOCcyqPs5aYUgQrPeEcak2+nNOW
 rfBg==
X-Gm-Message-State: AOAM530qWUm/rXjezb87dU2c1TT49MSisye6t4ONEmdkY+/9JuLviY87
 gS+Gs1vj/u52pqKUGRqj8FR2bpU7wOZq1or0N98lPw==
X-Google-Smtp-Source: ABdhPJzQAcpNIAjAZs6dTK4tIQzUnnVMpcaHbyhssYFEQe23vk2mltCdB8+DBBDjaZKb3haUuqCSSvyhPdABVYsjOcM=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr22606123ejb.85.1621849341571; 
 Mon, 24 May 2021 02:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210524084201.1665973-1-jamie@nuviainc.com>
In-Reply-To: <20210524084201.1665973-1-jamie@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 10:41:58 +0100
Message-ID: <CAFEAcA_AZGK6yKy6FN=YfVC=OMdpQnDBz=nndKaibDLRXk2aDw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix missing exception class
To: Jamie Iles <jamie@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 May 2021 at 09:42, Jamie Iles <jamie@nuviainc.com> wrote:
>
> The DAIF and PAC checks used raise_exception_ra to raise an exception
> and unwind CPU state but raise_exception_ra is currently designed for
> handling data aborts as the syndrome is partially precomputed and
> encoded in the TB and then merged in merge_syn_data_abort when handling
> the data abort.  Using raise_exception_ra for DAIF and PAC checks
> results in an empty syndrome being retrieved from data[2] in
> restore_state_to_opc and setting ESR to 0.  This manifested as:
>
>   kvm [571]: Unknown exception class: esr: 0x000000 =E2=80=93
>   Unknown/Uncategorized
>
> when launching a KVM guest when the host qemu used a CPU supporting
> EL2+pointer authentication and enabling pointer authentication in the
> guest.

raise_exception() and raise_exception_ra() are supposed to have
the same semantics apart from one of them being passed a return
address. So perhaps we should look at trying to fix this by
making raise_exception_ra() not first carefully set and then
very opaquely unconditionally trash env->exception.syndrome...

thanks
-- PMM

