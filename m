Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07286EB05C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 19:13:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppuI3-0002Hj-3v; Fri, 21 Apr 2023 13:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppuI0-0002Gb-NB
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:11:16 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppuHy-0007qU-77
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 13:11:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so1834519f8f.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682097072; x=1684689072;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kR4DXAlMDBIuhLL2B0pgTKZgVl9OcxDTLRxhwoJh2w=;
 b=R5XMG0KZbnqHpNcb3pT+orCfH4KWNuOgkQnqQ6CqHRbCiZhzAvyM7I0ZoGRN/fIoKI
 RoB/nbuUKv4ovfcJ1Uwf32CZ1vyeHV/LojHoz1r+5NtHY/u5eadIlKYEVdBQeqRBIRqb
 YitT0BJe3h60tC/9ZEwbGxafpk9cAavUzGJzGdfGK3PWscXHfthwyCZDfSqTT0awSLCH
 Rk1GrZnrlPU3eIg8gz00wJOP+OpPi46yXeIj4/tLTDn9OBPcqTHVqa6eIgKveFhhFga4
 mM+anwbHZyGvHLiK3H1J6kL3D0fT1mA9vQfTKWhhNoDyB6BO8w6NSLvYjRF9X4Qnrs/L
 PIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682097072; x=1684689072;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2kR4DXAlMDBIuhLL2B0pgTKZgVl9OcxDTLRxhwoJh2w=;
 b=N1F4ubd46NuzWddp4t+sae/UNlil2RB4F5bpB+59hN1bPT/Vgba5jq5CJrEQElEdPv
 n1P1AMt6MNNDHAultzdMy6nFuEckTltwAPmDv1zODSZ8KvY4CwEVGQey3N+aetGU1/ic
 V8GzbabioJhYTp0X7PuKFcQXLwnP1kdCcqMub95NaFGocBqKZuPT7QGAofPbceROl3sK
 9cKXPz4UBn/vQrcWL9EVnUdwzgebggavOXXMNRP8iJkBm5SROP3JmChyXee7Zl0CFuaY
 c8J13zUndjqjixSBi4m5oylZOAae6lN5uUiNP3KoTZwt5ZQaiZImfu5uERhAWNHP2i3R
 KQqQ==
X-Gm-Message-State: AAQBX9cuZbXFbtBEHmy47AqZsJly6Jspz2wuE3lbHveX2lt8fV5Hem4r
 ub9wOVtPWzIH90EuN/5qkb1LAA==
X-Google-Smtp-Source: AKy350aFLOriPLyQoKMxtwY6Bt+nyjVI/YyAtynGfm+ihfrX7T6Wlif6hlaAPAfJUTjLpO3TDwjYGA==
X-Received: by 2002:a5d:560e:0:b0:2ef:ae66:c0e3 with SMTP id
 l14-20020a5d560e000000b002efae66c0e3mr4198575wrv.12.1682097072189; 
 Fri, 21 Apr 2023 10:11:12 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003ee5fa61f45sm8779502wmq.3.2023.04.21.10.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 10:11:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D71B1FFB7;
 Fri, 21 Apr 2023 18:11:11 +0100 (BST)
References: <20230421132421.1617479-1-fei2.wu@intel.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fei Wu <fei2.wu@intel.com>
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v11 00/14] TCG code quality tracking
Date: Fri, 21 Apr 2023 17:42:39 +0100
In-reply-to: <20230421132421.1617479-1-fei2.wu@intel.com>
Message-ID: <87wn259n4g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Fei Wu <fei2.wu@intel.com> writes:

> This patch series were done by Vanderson and Alex originally in 2019, I
> (Fei Wu) rebased them on latest upstream from:
>     https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
> and send out this review per Alex's request, I will continue to address
> any future review comments here. As it's been a very long time and there
> are lots of conflicts during rebase, it's my fault if I introduce any
> problems during the process.

Hi Fei,

Thanks for picking this up. I can confirm that this applies cleanly to
master and I have kicked the tyres and things still seem to work. I'm
not sure if I can provide much review on code I wrote but a few things
to point out:

  - there are a number of CI failures, mainly qatomic on 32 bit guests
    see https://gitlab.com/stsquad/qemu/-/pipelines/844857279/failures
    maybe we just disable time accounting for 32 bit hosts?

  - we need a proper solution to the invalidation of TBs so we can
    exclude them from lists (or at least not do the attempt
    translation/fail dance). Alternatively we could page out a copy of
    the TB data to a disk file when we hit a certain hotness? How would
    this interact with the jitperf support already?

  - we should add some documentation to the manual so users don't have
    to figure it all out by trail and error at the HMP command line.

  - there may be some exit cases missed because I saw some weird TB's
    with very long IR generation times.

    TB id:5 | phys:0xb5f21d00 virt:0xffffcf2f17721d00 flags:0x00000051 1 in=
v/2
            | exec:1889055/0 guest inst cov:1.05%
            | trans:2 ints: g:4 op:32 op_opt:26 spills:0
            | h/g (host bytes / guest insts): 56.000000
            | time to gen at 2.4GHz =3D> code:6723.33(ns) IR:2378539.17(ns)

  - code motion in 9/14 should be folded into the first patch

Even if we can't find a solution for safely dumping TBs I think the
series without "tb-list" is still an improvement for getting rid of the
--enable-profiler and making info JIT useful by default.

Richard,

What do you think?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

