Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17003377D2D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:34:03 +0200 (CEST)
Received: from localhost ([::1]:43170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0QT-0007Hu-SM
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0Mo-0003uh-3U; Mon, 10 May 2021 03:30:14 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:36652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0Mm-0000Ha-Na; Mon, 10 May 2021 03:30:13 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id dl3so7870951qvb.3;
 Mon, 10 May 2021 00:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GZEE+Kg8VDpO5ZDd2lD+5Gm7jcOckZOqYNoFBEOQG1w=;
 b=e0bniKF3D8Cfls1kFYVCYxRVKVNLgVgRmSZBPGbfNcLRhwnJt1vOTX7wb3AXryw71Y
 cDMFfJ/W040nqdqN4DzSo6XRGk5BSotdb6rQNF30o4GIWjNoLhFopMFqFZZobuY+ITnN
 XHz8X9HWluVUqesylB+vazBS3T6lKu7Ds0YZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GZEE+Kg8VDpO5ZDd2lD+5Gm7jcOckZOqYNoFBEOQG1w=;
 b=qvZTtgzEfs3LXXw4nbRqu9o/MeBQvmxGQw93gKxlNqTjHQA2haytNUUn/dktu1SP4G
 CZGqdmn+92loEGDW4hx4wafi7Ieb5vGCD42aKrzIhJsrRhnvscRL+9dqdvXUA00O/dyd
 PDy5i3MG35CTJQYmFLYUaZ8x/FllR9j20D4DsAARYKc1j1bC9oQzDCN0PqrOcZacImA6
 TDhZ5E/WOvdbmwyaFcUVu6Bg5QYqoumGeXhITUJZB+z3Nda4ztuwWXX4Or+TfUC5WyZe
 nFtTvR86+PL7nhq1MCk2fhLE8ASP3v8dfpEAE6vtlkcEwpqz7F6U/G4FR+LNXCASKJRN
 3ljA==
X-Gm-Message-State: AOAM533yIF8sl7QVr9FbaM0ZXMOeJKTBqrhBwi2o1s7RtlE47MUMs4a1
 7vTBsgW7cEC3m9Ksrzm5SAT+8c7QyBTTGMYvbhE=
X-Google-Smtp-Source: ABdhPJzlwIY+2sMZKitsctOWjlE/VX0xO4yCXvMQEbtle+dTZXnyG9f1K81JmGjaWDk5Uc1ZueQFIkXdeytScUWDqXc=
X-Received: by 2002:ad4:4c49:: with SMTP id cs9mr22194097qvb.43.1620631811200; 
 Mon, 10 May 2021 00:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210505170101.3297395-1-titusr@google.com>
 <20210505170101.3297395-6-titusr@google.com>
In-Reply-To: <20210505170101.3297395-6-titusr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 May 2021 07:29:59 +0000
Message-ID: <CACPK8XcYu7DFCFip9mCmRGVdYUy02uZRAFcaCPoTrercNcDMZA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] tests/qtest: add tests for MAX34451 device model
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 May 2021 at 17:34, Titus Rwantare <titusr@google.com> wrote:
>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

