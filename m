Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEFF6CBB91
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 11:55:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph62z-0007Zf-W6; Tue, 28 Mar 2023 05:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1ph62x-0007ZG-TX
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:55:19 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1ph62w-0004DE-7I
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:55:19 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n10-20020a05600c4f8a00b003ee93d2c914so8659595wmq.2
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 02:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112; t=1679997316;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iwFgrSbXkMkX6HpkB4zoThlw5Yfzmy+7oy4ZzlGDulk=;
 b=JbKg93/kp0buJnzINIiZE70OCYeo/PBDUL5me6Rm/w8azPk6PwawMmy5mHb1AuWIsy
 aNsKH7u5KuoGiAaKu5ks9xBTTNvTFJkn95HwFsQlgxBz4hmCIHz6Glq/Of3BtRxA49iZ
 9AP80ycU1A6zT3nv19HYmJYnJ25De8v12ITfJXdUFoYCRZar6MDRJv6A+Y7JdzGhDRmk
 OG+UQG+m4cvwxvj/dSFjvew8mdhnmGyAoGAepdbVTnafqNHwlCud74AsB8yjS5viGL67
 0NTnLUqJCWnxQtqUoE4JHdoqgKWDoYmDU11MpsUXTXwJMmSvtVnnsn0IOvWqpyTrpk2x
 24cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679997316;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iwFgrSbXkMkX6HpkB4zoThlw5Yfzmy+7oy4ZzlGDulk=;
 b=UdyKZnfpkVG94C1tb+H39x1fYn6U5CCCCs8Et0qMxIzii4GItmK3EEqSygCtdnhkXE
 atcIg8wqJxl250H5eZ2IKMZqqbxf6XLh4gsWvvzsqT1XSfDIcyE62T9hKtSC6Swe+D9/
 xaRz/y3nNN/DBMxWHf5pSIOfFczN/UkwZQocz+uaWCvSgY19FsCbDhy2KjMdnVFsXzij
 cw5PTDxaU5hlf5M3dXjGpmR0ZtMNBv53uh8fpyqzGSsVS4wpJUFWz0j5nHdt9hGjZCaD
 fy+jDoy6BQIzm4xVQmRWdTxl4WDfhZDOuEtKRlxDyK4aSup3ouaz966+/5FNQSR2d2nH
 htuQ==
X-Gm-Message-State: AO0yUKW/n8rNkwfc7lms8dwDncbKhRsLXL24WSI6w5+n5XPYnEscaGV5
 3+/49KkX9QG7WIVRunIsjnR1LQ==
X-Google-Smtp-Source: AK7set/h9L+GWgrPpq1SG4TPVfTV5uK3RgyY9Kgr98MW8Srjf5jVh7ivAmzcoNlx/66dAjPAeKYx4A==
X-Received: by 2002:a1c:f60f:0:b0:3ed:90b2:60c6 with SMTP id
 w15-20020a1cf60f000000b003ed90b260c6mr11891332wmc.19.1679997316265; 
 Tue, 28 Mar 2023 02:55:16 -0700 (PDT)
Received: from smtpclient.apple ([188.25.247.154])
 by smtp.gmail.com with ESMTPSA id
 o39-20020a05600c512700b003edddae1068sm12145792wms.9.2023.03.28.02.55.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Mar 2023 02:55:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.2\))
Subject: Re: Peter Maydell
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <BF3FFEF0-8818-40DE-A27E-AA8844ACAEF8@gmail.com>
Date: Tue, 28 Mar 2023 12:55:14 +0300
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <46CB357D-23C0-47FC-B355-5FBF59A764A5@livius.net>
References: <BF3FFEF0-8818-40DE-A27E-AA8844ACAEF8@gmail.com>
To: cavin narsinghani <cavinnarsinghani@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.2)
Received-SPF: none client-ip=2a00:1450:4864:20::32f;
 envelope-from=ilg@livius.net; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



> On 28 Mar 2023, at 12:38, cavin narsinghani =
<cavinnarsinghani@gmail.com> wrote:
>=20
> =EF=BB=BF
> Yes, I agree.

That statement was from Nov 2020.

I would say that things got significantly better in the last few years. =
;-)

Liviu


