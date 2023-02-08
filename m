Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A668F7D2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:06:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPpl0-0005KE-1n; Wed, 08 Feb 2023 14:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPpku-0005Hn-GR
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:05:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPpko-0001zo-Vx
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675883109;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YidgLrxEx9n1Bia+JpgFFjrQgzDHDJyYkpDRxYItnXM=;
 b=A4ADnqBKDVCH7UvEuOfTycXeoPXFrD+W2QW8vBENuxlHnhWkytjXOPcLmMsADsbB1IsztY
 dFspAwMToMTYJvTPtT0vLxXIZFarBblbk/Tpa+Vt9++qe5JVoDAE4t2lZCAIFmRXOfJLhf
 aOKy42Vo16YsA8vFLN7vzcEEGBEXgew=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-CprmNvjZMHCphOE-yE08Yg-1; Wed, 08 Feb 2023 14:05:08 -0500
X-MC-Unique: CprmNvjZMHCphOE-yE08Yg-1
Received: by mail-wm1-f72.google.com with SMTP id
 d14-20020a05600c34ce00b003dd07ce79c8so1475927wmq.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YidgLrxEx9n1Bia+JpgFFjrQgzDHDJyYkpDRxYItnXM=;
 b=kYLltKrtijdxIvIfNwnanXe/wHeHgDZxT5jFonM/Ihjb11S1rsJJ+yYUrX5QOqTM5z
 PH89I6WiGKJesL2WXGVJGgBCbW2Y3DP5KWomElYpG0w1B8Y2QXynNT1lytS2mSFuDxn/
 QLcdXBhMmMSKxpL+1U5tUf+s2/bFG511P+AmbFiIbTdhun25BDzeKDJuPXK91y6XikzO
 XpJyRcHJRPgwVvWQT9jrqKrgyRBpXFMUxxnjVAAuUysHh8zmGERJngV93gW1Y0UwtReu
 AxuypNQDUQlcZbsYh8VkX6mYHpBV0jpkq2Ik5SfrUDENUC3n+IcGWM2dbqJB9LksUv+z
 N0ig==
X-Gm-Message-State: AO0yUKXn/WJg8bwhxNxuq7P/9e9noVEIgewrQ36CHwOeueVRH5v9NXkx
 8Zd8J7HuIiTAxf3MQasnkJ1SxqD/zgROkTFBGlIV0hMeGS0lTZGGxm+oBN65sVoo4rC1/FYfdHE
 0pCdcL6Tu7vQpf9s=
X-Received: by 2002:a05:600c:704:b0:3df:d8c5:ec18 with SMTP id
 i4-20020a05600c070400b003dfd8c5ec18mr7631854wmn.13.1675883106991; 
 Wed, 08 Feb 2023 11:05:06 -0800 (PST)
X-Google-Smtp-Source: AK7set93XwwWDgu98ydH3B07hkHEmC9mxKczn74rh1QqHezVv+m2/CtbwRoPcSbrdleOqJ0CFCY+Cg==
X-Received: by 2002:a05:600c:704:b0:3df:d8c5:ec18 with SMTP id
 i4-20020a05600c070400b003dfd8c5ec18mr7631835wmn.13.1675883106826; 
 Wed, 08 Feb 2023 11:05:06 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 g20-20020a7bc4d4000000b003a3442f1229sm2747014wmk.29.2023.02.08.11.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 11:05:04 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,  Leonardo Bras
 Soares Passos
 <lsoaresp@redhat.com>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 1/2] linux-headers: Update to v6.1
In-Reply-To: <20230207205711.1187216-2-peterx@redhat.com> (Peter Xu's message
 of "Tue, 7 Feb 2023 15:57:10 -0500")
References: <20230207205711.1187216-1-peterx@redhat.com>
 <20230207205711.1187216-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 08 Feb 2023 20:05:03 +0100
Message-ID: <871qn0asgw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Xu <peterx@redhat.com> wrote:
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
>  include/standard-headers/linux/ethtool.h      |  63 +++++++-
>  include/standard-headers/linux/fuse.h         |   6 +-
>  .../linux/input-event-codes.h                 |   1 +
>  include/standard-headers/linux/virtio_blk.h   |  19 +++
>  linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
>  linux-headers/asm-generic/mman-common.h       |   2 +
>  linux-headers/asm-mips/mman.h                 |   2 +
>  linux-headers/asm-riscv/kvm.h                 |   4 +
>  linux-headers/linux/kvm.h                     |   1 +
>  linux-headers/linux/psci.h                    |  14 ++
>  linux-headers/linux/userfaultfd.h             |   4 +
>  linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
>  13 files changed, 298 insertions(+), 20 deletions(-)

Reviewed-by: Juan Quintela <quintela@redhat.com>


