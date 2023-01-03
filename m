Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629665C911
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 22:50:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCp9d-0004mB-GR; Tue, 03 Jan 2023 16:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pCp9b-0004lO-9Y
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 16:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pCp9Z-0001KH-Ob
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 16:49:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672782541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rDE+vtGNq8pa9kgZ6PtbuxvyH/cA7sc1qRD4WaTmIk=;
 b=M6DSmcB/OHPht+cNc4clAaHe3QRQmr5tdY8vm1xvvoj9kg2zTTY5cqHJRaiYQ8aeMbX/vK
 2XKEWNn4Le591hYarg8Dc49W/nx5yP31C/UYmGhOQe5or9gCBuSXtOIy1p8bcUBYhNhF4x
 a6Hq34FtOYqoJ0DdhH4jxbiaTzr2XDc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-LYA9cx49MVW3qMP5TO2L5w-1; Tue, 03 Jan 2023 16:49:00 -0500
X-MC-Unique: LYA9cx49MVW3qMP5TO2L5w-1
Received: by mail-qt1-f197.google.com with SMTP id
 g12-20020ac870cc000000b003a8112df2e9so10901812qtp.9
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 13:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5rDE+vtGNq8pa9kgZ6PtbuxvyH/cA7sc1qRD4WaTmIk=;
 b=UihzG5x+KG+9g+i9aiNnU/kTH1gLPbJx2Yd/5jVJVdPzpALW4v0yef6wR+/ynR25L+
 +qlxAy6NYSCy1t9iaoKW+oBajqq8hGArIKvkgB9Gk+JpmAGgmAjPCe+cpbbFMrb4mdU2
 o+6GONI79qqsm4wimNk+jI7dncR191T+w9NrEEOmrCqsSM1IpKIU3MUFR6oa1UDtesD0
 63F5SHiI6x1jR74A0hbCzIhjlWq88b/8MkansHN4UVOpqK0ZEfHxqxNvdd0Qopj7fFkc
 MecYQ2VR58eN/UT/MRqZPwmEZBTaWgfJonj+P2dCnKphtOv1R/ZO4ur57M2OPSv6JaE/
 Ah7w==
X-Gm-Message-State: AFqh2kpvHxxdQm1kLdL5sgkFWGWpo0ce7isXqVj1efAUtzqyyX1WF1Of
 FTH1HOpUMeXN548Akkl6C5CflgtlUYnCrp1MQfKm7k/HpVBX6o/vINGjcz8HKiBhnCtYR0GeSnq
 E14ivKkOJSDb33zg=
X-Received: by 2002:ac8:4b44:0:b0:3a7:ff64:8c00 with SMTP id
 e4-20020ac84b44000000b003a7ff648c00mr57277002qts.22.1672782538915; 
 Tue, 03 Jan 2023 13:48:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXujZ3z5d0+KhNx9nmUJgXcdMHwf8f7+cYPVapTwToz080T3YckI45f7LT9mmd8Tynhn1sa99A==
X-Received: by 2002:ac8:4b44:0:b0:3a7:ff64:8c00 with SMTP id
 e4-20020ac84b44000000b003a7ff648c00mr57276988qts.22.1672782538719; 
 Tue, 03 Jan 2023 13:48:58 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca.
 [70.52.228.144]) by smtp.gmail.com with ESMTPSA id
 w18-20020ac86b12000000b003a6934255dasm19264476qts.46.2023.01.03.13.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 13:48:57 -0800 (PST)
Date: Tue, 3 Jan 2023 16:48:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>
Subject: Re: [PATCH] memory: Do not print MR priority in flatview HMP output
Message-ID: <Y7SiyMhw9yLX/eG9@x1n>
References: <20221228130439.80341-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221228130439.80341-1-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Dec 28, 2022 at 02:04:39PM +0100, Philippe Mathieu-Daudé wrote:
> When requesting the flatview output with 'info mtree -f',
> the MemoryRegion priority is irrelevant and noise. Remove it.

It is in many cases still helpful debugging information to me.

Maybe it's because it can cause mis-alignment when the priority >= 10?  If
that's the case, how about tabbing it properly instead of removing?

Thanks,

-- 
Peter Xu


