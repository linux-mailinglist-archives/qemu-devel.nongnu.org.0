Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA53599EFE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:28:11 +0200 (CEST)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4qv-0007Qx-Nu
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oP4ok-0004WU-Tw
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:25:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oP4oj-0005QY-Hn
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:25:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so4067153wms.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 09:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=TuSfxUph4WczOVgIUN2t9bOMxr019u1sq/kX5NPpxcI=;
 b=o8lJhFfjUxlbHvA/fTEg28AVmGHxh+87fR0ZYn5rkmc9C16xkx1pg57EBSxZeZB3hi
 IuR8j5nFYsSE4IAJRkOsWMR9vrzx1LQej1u0/cuXdf/Rr+/JEB6x/lJ6z3X6SUZFyqr/
 Xox7T7C+4jzVhxIfDnvfGNusVRbkuKuKnfpLBA2d470el+qxmNrRZPQ3i2WMwrrQwT1v
 tLTOURcdym4MBqHLG6uZ5DSHK6VJvJmtZnEC838c118/k7wjGjgCYXQkvWEEqiDkjqNq
 y1uK4yMmvTHeIRhsE+arKiyF/t6LRVM1+/XYim5y3ou/jBTYFiNGcClnhU+rO9iewiEC
 Nf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=TuSfxUph4WczOVgIUN2t9bOMxr019u1sq/kX5NPpxcI=;
 b=5v0KVzpGsOYHLyLsoEdSoQ5dXXiXWHJ7Z5Ggw1Fa4qtVszxArbAfCVCbMkLbxTaHmU
 pj6lmpSndRFMi1PEnWqirOXwVzC3VyE62CkzAAFOQ2FOrWCAHGMdelAuLzWw0Dvfhiwr
 sLKO5o/lKrHM64SJ7AADINx1eaPAoQoATnhKlDyKxwQ5WzThW8TuAmril9Dz+H7ZL8Pu
 oz+iAocUlRpnTF371FqQy4XqSKfQdUt7VsAY8Tzvdjl/Vxp24Jz3Gf21x0J08G6Z3lFu
 rg626pp6ZV5sppTPfC/9ssHRGtx57p9K1KLkBWUzgLLhUO4QnqIPVmhVDE2NHEv5qz4K
 hVhg==
X-Gm-Message-State: ACgBeo1Zg1lQVopHwl2yc7KXPgWCafwnpmGVDiGVY/P9GtY2hW/Wg+u8
 jbAYwUA5g4cVmmFlGZd6QJBcAw==
X-Google-Smtp-Source: AA6agR4KtdpsEDry+oBOrd2IarLYGPqJ8BBnndW0t2Fl1N5d+aC6ZAOXtLYuRbXUXCKgjtt4zfoDGw==
X-Received: by 2002:a05:600c:3509:b0:3a6:1888:a4bd with SMTP id
 h9-20020a05600c350900b003a61888a4bdmr5379785wmq.191.1660926349187; 
 Fri, 19 Aug 2022 09:25:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0021ea1bcc300sm4686368wrb.56.2022.08.19.09.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 09:25:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 50F881FFB7;
 Fri, 19 Aug 2022 17:25:48 +0100 (BST)
References: <20220819053802.296584-1-thuth@redhat.com>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter
 Xu <peterx@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] Speed up migration tests
Date: Fri, 19 Aug 2022 17:25:31 +0100
In-reply-to: <20220819053802.296584-1-thuth@redhat.com>
Message-ID: <87r11c2oab.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> We are currently facing the problem that the "gcov-gprof" CI jobs
> in the gitlab-CI are running way too long - which happens since
> the migration-tests have been enabled there recently.
>
> These patches now speed up the migration tests, so that the
> CI job should be fine again.

Awesome stuff, queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

