Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AB56997DB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfap-0008CS-0Y; Thu, 16 Feb 2023 09:50:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSfab-0008Bw-AD
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:50:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSfaZ-00041t-LT
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676559022;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbGziHU1+egue5AO3PSXSDZxGJ3d7ndZjNg5zqhg2ow=;
 b=T5V2oZyena8rJd40v5dcyJBIWWHZCZ4TVtcL4yMsyJdq2LePPvHVAeLfM3oe94gPUNC6G9
 hBm5e2LS8+9b0Keqe9rv8329wKsKGG+VR1Gi7QdP2Nw1mHeUlUXVV4pF8s1Ax2QaQVVl20
 ZNS5T49363n3NNw+nCrEEEk6XKb2ztQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-dCxcEf9FPSalSZJQKbUZmQ-1; Thu, 16 Feb 2023 09:50:20 -0500
X-MC-Unique: dCxcEf9FPSalSZJQKbUZmQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 r15-20020a5d494f000000b002c54d9b8312so282340wrs.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FbGziHU1+egue5AO3PSXSDZxGJ3d7ndZjNg5zqhg2ow=;
 b=YB+BcvOo+50Rh4g/uhJvfkSO4NpX4v0g4469RfjEUKogce4ROgbsF+wJ6tbVTK7nd8
 dkMv8hRGudOWkcuUkbopiP8UTqUGYFAburXFu6JporMGMNMOi4kFhSvMwQaBkCvVg71u
 klL3gXHpI+Cp5oqXCaftv8dIscGIqH7N2YHPCwxbmeYsD38bbX3rr0E1x1hoa6fDKG6g
 Bz9ylrMb53wee/2U+j0Dd0FkcvauSl8fYMhR6vUoAsHuRBy91RZdlIiNjIbUDfRZb1oC
 oh8erMTlxBPugomjuxW3b9G2qoQ0+I99RrPOj8xwo3yxlZLQgmnnCm+PEjgAKSGdwyzV
 dTXw==
X-Gm-Message-State: AO0yUKWz87ffB0cKgBSzzFhXCaP6EH3Kso3G1AvGiejHQKnx+eKLHP1S
 XFhTGmtaapo6ksPGEBS1WbQfSHHe51ysAhK8rITEFBAi4GMilNisXkr05tY8lr8BshGOJ5z1nVt
 oR2l5O3OepmXI7uo=
X-Received: by 2002:adf:f8cb:0:b0:2c5:52ee:9cb5 with SMTP id
 f11-20020adff8cb000000b002c552ee9cb5mr5344854wrq.71.1676559019745; 
 Thu, 16 Feb 2023 06:50:19 -0800 (PST)
X-Google-Smtp-Source: AK7set82sOqWpd+vEX+0hRsL8Rrf1Z/8Wp32hg/7K5fgq6I1BcQ0gAbEHvCGlgJ7eLknRiTF9QGPOQ==
X-Received: by 2002:adf:f8cb:0:b0:2c5:52ee:9cb5 with SMTP id
 f11-20020adff8cb000000b002c552ee9cb5mr5344834wrq.71.1676559019458; 
 Thu, 16 Feb 2023 06:50:19 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m10-20020adffa0a000000b002c56013c07fsm1704254wrr.109.2023.02.16.06.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:50:18 -0800 (PST)
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
Subject: Re: [PATCH v11 06/11] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
In-Reply-To: <20230216143630.25610-7-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 16 Feb 2023 16:36:25 +0200")
References: <20230216143630.25610-1-avihaih@nvidia.com>
 <20230216143630.25610-7-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 15:50:17 +0100
Message-ID: <87edqpis0m.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
> Move vfio_dev_get_region_info() logic from vfio_migration_probe() to
> vfio_migration_init(). This logic is specific to v1 protocol and moving
> it will make it easier to add the v2 protocol implementation later.
> No functional changes intended.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>


Reviewed-by: Juan Quintela <quintela@redhat.com>


