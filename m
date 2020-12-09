Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEF42D410A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 12:26:37 +0100 (CET)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmxcC-0008UR-69
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 06:26:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kmxa4-0007Vw-SC; Wed, 09 Dec 2020 06:24:24 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1kmxa3-0006c0-FZ; Wed, 09 Dec 2020 06:24:24 -0500
Received: by mail-pl1-x641.google.com with SMTP id r4so757850pls.11;
 Wed, 09 Dec 2020 03:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E4jW8dTGul91vPurOLnVetppwNq6Xo6WgbxH1CwxQvI=;
 b=LHRYR0HMw3ir3z6tM4zePeutuEP/tvtfpo3EtpXwIiXI1X+0E193qxxcOsQj+LeAg2
 MG+rVen/bCqGisT5KZmxTV83Wwqp++Y4X3W5aN6EA/JjMJ6FKnHnlzBrYnYGU/ZwPa1M
 xtJhSOJAwAgJoiIkk+KsWZHsYhJO4UkIhuFQhwH9jySfhPP300e43OfYZlKZEqM0xox/
 VRiRJoLAEWbpggQm1lB7Pfye6xrQMI15fyXv5UP9BD+EXBI5PDhpm+8hHuhWBsmsuEfC
 BAw9HhURhAjPckmaTnQ0SlbC3eQmCi95Hvjz2YwgNg16byuH95JXy5XgyMCfEIzKAonQ
 1BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E4jW8dTGul91vPurOLnVetppwNq6Xo6WgbxH1CwxQvI=;
 b=hxBInQruJf4MfnxEjsRs8PZShSmiYeJokKukArSJfz/FAWDs4XAOd/bYVQtc2OFe4c
 PV2Ck5RcNMa32wCHV06/A0XUhYpZVZ0VKzKCBX0VMgQuN3uuYItSaa3cQfa9QjcgmeFS
 ToG7jO7oTu6vfKuh5VCvL9CDTr1Hbec6HzTPzUP247rY9oTFKHuuipSsfnrW3vDg2NVT
 4XgTtV6dvvz7+niswZnBNrH6ftf7F38DQh8t0dfGpIkJ9zYcWs0etj+5WvzbKxKqDkEa
 Ivvx0bnQ+prvA8PGrTA0gUaiODvuEHTeoOAV+Ko7mUFXeaHsrICFeRpIY8SY3+r0+/PG
 lGAA==
X-Gm-Message-State: AOAM530glRRVU7bbUFaeH/92WirzydfvWExu96fMBpjqYIbUf86KMMbk
 DdnD7znhFKJEIyhw/9d2WcM=
X-Google-Smtp-Source: ABdhPJweVxMgaNoz9LDKsUzzkiid1PP6rvCG8JB1qj+rUXypSQRagIgmSzQlbW6YX/BnhZ3TYfYzow==
X-Received: by 2002:a17:902:a581:b029:da:d78:7f79 with SMTP id
 az1-20020a170902a581b02900da0d787f79mr1587560plb.32.1607513061353; 
 Wed, 09 Dec 2020 03:24:21 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id k21sm2216564pfu.77.2020.12.09.03.24.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 09 Dec 2020 03:24:20 -0800 (PST)
Date: Wed, 9 Dec 2020 20:24:17 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH] hw/block/nvme: fix bad clearing of CAP
Message-ID: <20201209112417.GA4484@localhost.localdomain>
References: <20201208091658.41820-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201208091658.41820-1-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

