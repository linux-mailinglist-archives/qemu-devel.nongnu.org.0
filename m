Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB61CD544
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 11:36:01 +0200 (CEST)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY4qu-0006rI-9b
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 05:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY4q0-0006LW-0f
 for qemu-devel@nongnu.org; Mon, 11 May 2020 05:35:04 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY4py-0006ft-E7
 for qemu-devel@nongnu.org; Mon, 11 May 2020 05:35:03 -0400
Received: by mail-ot1-x341.google.com with SMTP id z17so7005370oto.4
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZrvoiAAYZwZVS7OrJX91gTd8JISmw1TseE8i8WIlAWY=;
 b=AB5eMyzwEdSyOvAGLzFrqgPIfoG6gsmsLEz1aULpi9xdD6P949ID2iA+8y7Pew+6ui
 HkZgNqWY2K7Mknt7abHeCGjXc22dTYTFEoETIvziGQQqbklhM2Ip6FKGOccg9X5WpEfa
 evrSjloIkK5lya2mYPeOfRq7gqGv7h1WoxMQ01HP1czhRD+CMgAJuESXkGqVJ3qiQFTS
 XMyCvQCeCKKbxVnAufGb5Hpejp4b6CKnwUQK2hiPtMKZOTiw6Wk82qlaqbWC0Fdz3VQq
 pCHjJAJ39RcGDdzpKHP52+RASVpaPmKZ4aho4XQxAfcNPkctHkaKMM50l8oI5mru7y3R
 qeUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZrvoiAAYZwZVS7OrJX91gTd8JISmw1TseE8i8WIlAWY=;
 b=XiJE2u9CBaKxgsWhMXWK6EBF0LB1jn2oq5lepTsR+fB7LE3bwF5lybcjU1FCvTimfN
 ISApywHIbt+YA59tREey0G2C5w3Vhy/4C+WFPogWkPOBnI5m5FPZ1x5+vf0ARnRXZfXu
 LUly/V+spsTOqJl50EaOcepspkgMllsZ72IWeOtjfQQgKnTfruFht5vks9qavoVWSyg5
 88qtokrG6x8osSr2yL5oL/av0i76I1b2GIjBrlTvvzmXGm64ThDY/6JzW9ChqUAEqMff
 AHAK7dn20+v88a1hGiP6oQ/YjEpuyX2RyY69BmmEbqnHkvd7dBz606I9mEX6+gTwWQL6
 ECsQ==
X-Gm-Message-State: AGi0Pua0qU9OCrUsUIUPE0mWGznz0xQWKiL8glgNaxvC5u6yTcLw0Z+s
 2TKzNXNlutGGsneLN9PGPafeK+oNmw9ECsYkwYWDFg==
X-Google-Smtp-Source: APiQypKR2gVwI606HfPknTXGqEm8dxKs1+KrNlJzUTkDN1Xlv2G/xkqe/Gzo0g2BlbWVv1h9ZeralsFbhEabRHXd/uE=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr12138559otb.135.1589189700920; 
 Mon, 11 May 2020 02:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200508100755.7875-1-pannengyuan@huawei.com>
 <20200508100755.7875-2-pannengyuan@huawei.com>
 <878si2hnht.fsf@secure.mitica>
In-Reply-To: <878si2hnht.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 10:34:49 +0100
Message-ID: <CAFEAcA9Eovg+A6=LJW1e6gJ8BbiCdi0CGJQodyZtC3yTm+n88A@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration/rdma: fix potential nullptr access in
 rdma_start_incoming_migration
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Pan Nengyuan <pannengyuan@huawei.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 May 2020 at 08:53, Juan Quintela <quintela@redhat.com> wrote:
>
> Pan Nengyuan <pannengyuan@huawei.com> wrote:
> > 'rdma' is NULL when taking the first error branch in rdma_start_incoming_migration.
> > And it will cause a null pointer access in label 'err'. Fix that.
> >
> > Fixes: 59c59c67ee6b0327ae932deb303caa47919aeb1e
> > Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

NB: this is CID 1428762.

thanks
-- PMM

