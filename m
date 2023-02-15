Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6888D697CA9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:03:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHRV-0004jN-Cv; Wed, 15 Feb 2023 08:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSHRG-0004cv-Ac
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:03:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSHRE-0004Z2-UZ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676466188;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kW+4r/IsnylXOZnjFVHlIJ/ky0viI0P7SFDd6DvFhw=;
 b=OxmSLlm7uvErQwbKeNAL8WnWeBoJCFjcNctZzvqX2MC0UO3BXFjlnzNvGwEmEfGZuidBH3
 RU3YXaOEYQVz2KA8jtiDr6gm3y5odTN1Ba0S1mpiwpOhExqlH1RT77H3FTkr/TqBKPjPAg
 rhqXVImbXXX5cWhodp45uMOagftIceg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-Ry-xB6eMMt6nJYRwumAdyA-1; Wed, 15 Feb 2023 08:03:06 -0500
X-MC-Unique: Ry-xB6eMMt6nJYRwumAdyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso1107083wmb.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 05:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3kW+4r/IsnylXOZnjFVHlIJ/ky0viI0P7SFDd6DvFhw=;
 b=gz8aei4fxIkkpPVG+5gEJOfvFTq9eeKHtDJjRLkG/WCByw0TPIFclsonXxaHQd0ri3
 5M+GHYDJn0+e/trWDAMKg0Hpo3a3Ob5CJwfUzk4SxrACwhQOYWnijLwQ+daAT5yCws5k
 h/B48TKL54HHaMeYGYxXVOb9Ei93XG6on8TElSC931U0h1mgvJCIqsyRMippzTfVE9cO
 skGF03bXFblBanyFuWeFgOaRyZIoFhECI9LDrP3K0tr259ZTs1SmwRJ5qllQqjhnYmeg
 gErPBuyji8yOy9cceWmnv9NR1WB4i1Q9H34Px6s5I5BwWkWiUJqSljY+l8jipDEEudG/
 kCUA==
X-Gm-Message-State: AO0yUKVbaXRMdIeO6pBGnjlHVC69FfV0+0J+MZU2Uh9buFGijvIGlzf+
 m4R976NFooZN3l4A8T94SeHWfInM3WTP01PVu1cU4phRTq7UdA2+n2iho3YKtNWXNnn0N/taFFH
 YjxOM2ZDo5+cfapk=
X-Received: by 2002:a05:600c:a4c:b0:3de:a525:1d05 with SMTP id
 c12-20020a05600c0a4c00b003dea5251d05mr1678522wmq.8.1676466185770; 
 Wed, 15 Feb 2023 05:03:05 -0800 (PST)
X-Google-Smtp-Source: AK7set++7SNGikSj6e9oU76ymfSzHFLYeCt1sY1vrnSzFQCyoxDRZtzMYCXlFj1swza7GvuyRexjFw==
X-Received: by 2002:a05:600c:a4c:b0:3de:a525:1d05 with SMTP id
 c12-20020a05600c0a4c00b003dea5251d05mr1678491wmq.8.1676466185475; 
 Wed, 15 Feb 2023 05:03:05 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 q2-20020a5d5742000000b002c560e6ea57sm5218480wrw.47.2023.02.15.05.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:03:04 -0800 (PST)
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
Subject: Re: [PATCH v10 11/12] vfio: Alphabetize migration section of VFIO
 trace-events file
In-Reply-To: <20230209192043.14885-12-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 9 Feb 2023 21:20:42 +0200")
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-12-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 14:03:04 +0100
Message-ID: <87h6vn2i9j.fsf@secure.mitica>
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
> Sort the migration section of VFIO trace events file alphabetically
> and move two misplaced traces to common.c section.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


