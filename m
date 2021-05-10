Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AA9377CEF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:09:39 +0200 (CEST)
Received: from localhost ([::1]:46894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg02r-0006mf-J6
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lfzzF-0005rq-Op; Mon, 10 May 2021 03:05:53 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lfzzD-0002iI-MS; Mon, 10 May 2021 03:05:53 -0400
Received: by mail-qv1-xf34.google.com with SMTP id u7so7821282qvv.12;
 Mon, 10 May 2021 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+YNb5mD3l8IIwUuWm1uPtMvJvJNOsmnq/UPShCNDek=;
 b=lGFg8aFl1nsCaKlneHvPEVMtsduSEy4arjkO0jCFmEecSUh6LumgNNMRn5se0zcydI
 oKup3kyIcA0dpCkMvjxhORG5zCABnwJrb0OpaLAokFz9m+e7i+FVQ5O20H7OAUkDEIPs
 A/C31SbXiW6dnl7NT+10jAQaK9fUZyAw9DagY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+YNb5mD3l8IIwUuWm1uPtMvJvJNOsmnq/UPShCNDek=;
 b=LiXf4XX4UVs/daHl9m6kLs0x+NKGHtrgE+tShOLJxNftL9Zw+U9hMzwkDbrIwkXOBu
 ekQeTCGAfzdvQDmrfe8PG1BKKIFyF1x18UTCtvA8PkQiql8sGrOmfGTEbu2UYzA0SLeB
 84x9YRKOf0B/vxx+q0AMutJ10f2R98vT/YQnmqeAtF4c+iyGO+GC1Yqaq5oQ6I/42n56
 O/s69VpssYJo7svYFxmuRfSmkk3ZV6hj1T/5xgRj/LadIFe5heOUldou53Um7j8IWbpD
 QxaXcar/i3lJH3ZKP8jlMHFWrUSfBgBDiS0jM/rmrex6G3wwzbmJN/TmxuvX55e4Rub+
 W98A==
X-Gm-Message-State: AOAM530D5nWU8ptOoYd3V1iwkwYoj3xlO6IYWQlLfrc0HOC10oVv+Ra6
 7FfWoVHtEDkSK7fn/YOSmrIL2XQnjm7JwCf09xE=
X-Google-Smtp-Source: ABdhPJwIbTSWiqa9sqvRm+D9YWCxmRDCaPLVotGkU/UBDc3VPVpToG6Zxpz31ZeQ9QRBBYsGmoBnR1w55ngHRaJHCaM=
X-Received: by 2002:a0c:d786:: with SMTP id z6mr21969057qvi.18.1620630349765; 
 Mon, 10 May 2021 00:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210505170101.3297395-1-titusr@google.com>
 <20210505170101.3297395-2-titusr@google.com>
In-Reply-To: <20210505170101.3297395-2-titusr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 May 2021 07:05:37 +0000
Message-ID: <CACPK8XfkEdA1TLFm5W3rs0UHVVJ03e2mtgZJ+1caNt9NA0ZEWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/i2c: add support for PMBus
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf34.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 5 May 2021 at 17:14, Titus Rwantare <titusr@google.com> wrote:
>
> QEMU has support for SMBus devices, and PMBus is a more specific
> implementation of SMBus. The additions made in this commit makes it easier to
> add new PMBus devices to QEMU.
>
> https://pmbus.org/specification-archives/
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

