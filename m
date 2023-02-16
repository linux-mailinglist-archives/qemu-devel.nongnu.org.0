Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBDE6997ED
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:53:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfdM-0002ev-0D; Thu, 16 Feb 2023 09:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSfdK-0002em-Im
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:53:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSfdI-0004Wu-Ne
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676559191;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cy1OFNWzRRMl4sXiG2mqgJYFWsB/S0EoTf4VEsYGEpQ=;
 b=Cxkz2E37tEIuQDLfOPusXW5G46wIgX6CwkFcx7ftQxpjAb64zsSkJP66cr4L0TXtp7IZNy
 cTyFn0235POjYOLZN/lwQmIKsqkuZCmxognV8enwCXjdJh/Hitaff5mVLMKwlMIC+/GIoM
 xpIuCeSdETd2uHELhF1HJp7Ase2j/9o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-STA9FM7VNqeb4wXpjeH_sQ-1; Thu, 16 Feb 2023 09:53:10 -0500
X-MC-Unique: STA9FM7VNqeb4wXpjeH_sQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so3269901wms.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cy1OFNWzRRMl4sXiG2mqgJYFWsB/S0EoTf4VEsYGEpQ=;
 b=o1MBxNSW2zgPAbCPF6C+cER4BdL6vmC97lJKPuZevtSwlHi0sGaqAFT7ddSDhR4tSZ
 r+bDc9f+fANps3bKWxfV8T8dADToPb6RlgpBMXVb9QEKrSCPc9Y614tj52EvE+qcBw/W
 Wf/kRhrKwIUxrRTbPrfTgdPBJy/KjGBaONMK2JgGl1yYZkexHVisoPerR5XCPDWeIXf0
 B69IJ2oJ1nbw2ho0jh8596NqMsVLapP55CTRxcnXKT3lT9bDtL7hpF5YR8qqf929VI9p
 GcnRRL1vHx7NIqDXp30WSoH2IWY2d7nhDGSmlEg6bwk/5Kgi2uAzvl+fOFqJeEijz+nX
 91Hw==
X-Gm-Message-State: AO0yUKUPA7VbyHPZ+EKhK/Gj/MOIXrO4O/JC6aFqeAHpcY+iI/WAaaT+
 8ktw3sdVoTYpaXRiyksMoJJwzJoJqOb5QpAGT0yNKJCeON0MRDcBMapWjwkCgdsmCJyUZnbtJVP
 uQIFiGZyCJ2Zicz40sqwVYEI=
X-Received: by 2002:adf:e60d:0:b0:2c5:5308:859c with SMTP id
 p13-20020adfe60d000000b002c55308859cmr4884964wrm.18.1676559188929; 
 Thu, 16 Feb 2023 06:53:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/rt07AieO62pKH7AvYZjSb5QID8hZwgiO32ouvM/R3TzncdVZtXev1c8UOpO/mXYJ7a3eUQw==
X-Received: by 2002:adf:e60d:0:b0:2c5:5308:859c with SMTP id
 p13-20020adfe60d000000b002c55308859cmr4884950wrm.18.1676559188611; 
 Thu, 16 Feb 2023 06:53:08 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q14-20020a056000136e00b002c57c555010sm1685235wrz.28.2023.02.16.06.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:53:08 -0800 (PST)
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
Subject: Re: [PATCH v11 04/11] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
In-Reply-To: <20230216143630.25610-5-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 16 Feb 2023 16:36:23 +0200")
References: <20230216143630.25610-1-avihaih@nvidia.com>
 <20230216143630.25610-5-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 15:53:07 +0100
Message-ID: <87a61dirvw.fsf@secure.mitica>
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
> vfio_devices_all_running_and_saving() is used to check if migration is
> in pre-copy phase. This is done by checking if migration is in setup or
> active states and if all VFIO devices are in pre-copy state, i.e.
> _SAVING | _RUNNING.
>
> In VFIO migration protocol v2 pre-copy support is made optional. Hence,
> a matching v2 protocol pre-copy state can't be used here.
>
> As preparation for adding v2 protocol, change
> vfio_devices_all_running_and_saving() logic such that it doesn't use the
> VFIO pre-copy state.
>
> The new equivalent logic checks if migration is in active state and if
> all VFIO devices are in running state [1]. No functional changes
> intended.
>
> [1] Note that checking if migration is in setup or active states and if
> all VFIO devices are in running state doesn't guarantee that we are in
> pre-copy phase, thus we check if migration is only in active state.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


