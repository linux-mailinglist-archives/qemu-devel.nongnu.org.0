Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E746997F7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfem-0003O9-5j; Thu, 16 Feb 2023 09:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSfek-0003Ny-3X
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:54:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSfeh-0004fT-0a
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676559277;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dTvjUwTBStlw4w8bal8Rjupq5B0ugqLHBDNP2VPlESU=;
 b=Xj1NmdlpCPCMlODWG2X95SJ10662H9bkTqrIqvwEuFuWt+ritKCJrV17jeTBYSnajk652j
 Xs6A9P8lsKuxDsDn1FwItCwwrSMW9ahC2x5m77sWPrwm/NDmLZzNcpv55tRmCs72xz9TJl
 g4wQDf8IT4zZdaHTJ0Kama3RndkfD9k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-oz2hklFbOlqkiMwIldYN3g-1; Thu, 16 Feb 2023 09:54:36 -0500
X-MC-Unique: oz2hklFbOlqkiMwIldYN3g-1
Received: by mail-wm1-f71.google.com with SMTP id
 n4-20020a05600c3b8400b003dfe223de49so3270420wms.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dTvjUwTBStlw4w8bal8Rjupq5B0ugqLHBDNP2VPlESU=;
 b=qyAqwm5e28d8CIfd5ZceMI468abCVsdbCTFg2xrNLAm8cfH1kcQ5Tx/nIZl0WqR8Dz
 oexzJDoNkQw1Nb/9ayESuiDlbMPizgT3krMW1ZO4ixHOfVNrxiqgTRZ9Mk30eHR7fjMh
 TX6CmzNjRdHQldzkd0H20WzrRgBu/bLADADDIpWguppyJOYe1WsXo0B418X2WBwNGvML
 u0rMQpeKNI3OVTufggOMltYvzrReNxiF59EzECj2Dt6dLMHfTYFVmUIHzRw+Zg3NR9Mx
 6dvCTQkMdaElU9pG2Ltb24odgXmyutyKwPljToIDchOiohu6rJYm7KXOD0gRwUUa/QgI
 BsHw==
X-Gm-Message-State: AO0yUKWaKAb4acgZPz2vJlLoJPKCVD7Gl7cvlTUQv1E0wWKUYcUMkNay
 nRUc2/FxLC+YRNx4CViSY2Crowr8NrunqI+feDt8kDuuBsDTRNDOfWJe25uDhftUbhgSCZU1VjF
 6cUlGKsxqYiEId38=
X-Received: by 2002:a05:600c:1817:b0:3df:e472:fe03 with SMTP id
 n23-20020a05600c181700b003dfe472fe03mr6075095wmp.30.1676559275197; 
 Thu, 16 Feb 2023 06:54:35 -0800 (PST)
X-Google-Smtp-Source: AK7set+R+JIQTeSRNf9+IVE5iWfq07ZwtD+YcZkXjLXx0Du/IKdz6EJMg9zSWJEuO/8AcPKJgnQspw==
X-Received: by 2002:a05:600c:1817:b0:3df:e472:fe03 with SMTP id
 n23-20020a05600c181700b003dfe472fe03mr6075070wmp.30.1676559274940; 
 Thu, 16 Feb 2023 06:54:34 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 ja20-20020a05600c557400b003dfefe115b9sm2024648wmb.0.2023.02.16.06.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:54:33 -0800 (PST)
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
Subject: Re: [PATCH v11 07/11] vfio/migration: Rename functions/structs
 related to v1 protocol
In-Reply-To: <20230216143630.25610-8-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 16 Feb 2023 16:36:26 +0200")
References: <20230216143630.25610-1-avihaih@nvidia.com>
 <20230216143630.25610-8-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 15:54:33 +0100
Message-ID: <875yc1irti.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
> To avoid name collisions, rename functions and structs related to VFIO
> migration protocol v1. This will allow the two protocols to co-exist
> when v2 protocol is added, until v1 is removed. No functional changes
> intended.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


