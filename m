Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F17697C25
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:47:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHBG-0005Zp-HA; Wed, 15 Feb 2023 07:46:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSHAy-0005Ul-EU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:46:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSHAw-0000Ds-VP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676465178;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nKuM597ZWzJTHQ52jc8Xadg9f0FQR2adfICB007L6vM=;
 b=WaIy9KnOQE25PC1wdUoBMU5lc3MF159nZKQ76OiBkEBw0fpJlETX6oGbwhPU6hOo57c2lR
 MHUv8tu8V/5JptnYVOzpR47KBrz0owt5mu1x7IZSc92RBsObc8uAMcM7g3pXclztVlV3mO
 C/n1BK115JHXE+bIW2Xf3ReQwkqXHVs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-220-Kjei2HA2O5-6NpJ0lqPtDQ-1; Wed, 15 Feb 2023 07:46:17 -0500
X-MC-Unique: Kjei2HA2O5-6NpJ0lqPtDQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso1083610wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 04:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nKuM597ZWzJTHQ52jc8Xadg9f0FQR2adfICB007L6vM=;
 b=0m27zXid3+ayZguJRJHRE2Ts4amIvm7Phiy78s82xIca/wk3SVC/X71OU37FVodVSI
 NkB73qRnmcveUcEIrKmdEpz+2nJ+TsyzoC36ze6sJvz1kgTf0effAzItjRWKsbyeVDQD
 lqwlFpwpZH26c9tb29K9KXdQ2NAuFDvTJj14E4kMCOiBqP+GiDlnZwN5RLpRUwDnXWxa
 CcUtWFKvB/pGSnW8ZMuwnIClRcpZQPD90TNT8t7Bjkr/dDSU8QZ5TZ8um+NY9rk/PIj8
 3FoY5/N75rEkq5yCAVKade2QgBiuNwptezB9KPJErtgsqro9S12ZWhFjijnKZVxNC5Fv
 A9bg==
X-Gm-Message-State: AO0yUKX9rW7zOQ75a37Xyc+odWbB51xRPakUw7InzTrlVB185molxEeY
 1adeU8ATsnkq352OtQCjD93R5bHStmX5+ehSIICCXiN+Y/m2vDVvdvpPCi7TrnyuqxLJ6TxExGB
 +XF4aKM2N5imTfzA=
X-Received: by 2002:adf:cc8d:0:b0:2c4:57d3:396 with SMTP id
 p13-20020adfcc8d000000b002c457d30396mr1622115wrj.40.1676465176041; 
 Wed, 15 Feb 2023 04:46:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+jOrlrIUrLXg8d2LePRJsq0z/N/rZ53zlMxba0NTAxaQhOyQClNRS/i/6oY83mAaqEct0C0w==
X-Received: by 2002:adf:cc8d:0:b0:2c4:57d3:396 with SMTP id
 p13-20020adfcc8d000000b002c457d30396mr1622093wrj.40.1676465175782; 
 Wed, 15 Feb 2023 04:46:15 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m15-20020a05600c4f4f00b003dfe5190376sm2236138wmq.35.2023.02.15.04.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 04:46:15 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Yishai
 Hadas <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>,  Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 06/12] vfio/migration: Block multiple devices migration
In-Reply-To: <20230209192043.14885-7-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 9 Feb 2023 21:20:37 +0200")
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-7-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 13:46:14 +0100
Message-ID: <87y1oz2j1l.fsf@secure.mitica>
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

Avihai Horon <avihaih@nvidia.com> wrote:
> Currently VFIO migration doesn't implement some kind of intermediate
> quiescent state in which P2P DMAs are quiesced before stopping or
> running the device. This can cause problems in multi-device migration
> where the devices are doing P2P DMAs, since the devices are not stopped
> together at the same time.
>
> Until such support is added, block migration of multiple devices.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

With respect to how it intercat with migration.


