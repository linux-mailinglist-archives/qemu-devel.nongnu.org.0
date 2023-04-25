Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200FE6EE8CA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:06:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOvV-0000Yi-LC; Tue, 25 Apr 2023 16:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prOvU-0000YX-6v
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prOvS-0004kZ-LX
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682453169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SsglBzJ5bPzxNfeLbd557X2S04FxtGdn7SKhC9ebl8Y=;
 b=dTBF5ymgbSQlLMRNSogI689d38PQmwmHbG+UmY6+bq+Si2yu/xUSEl+X338JUxAesqoKPl
 3B0L39yB2jPmgRiGkLIv7/OTVGO7bjilxD/Cw/w9PHw9Lb5NGn4R/Dzq2z2VC5aosIS+Dw
 +leFkevdWVV3aHAt6j2nh2+3olk/t0Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-56XW6E8cPHe6Nakb5XawJA-1; Tue, 25 Apr 2023 16:06:07 -0400
X-MC-Unique: 56XW6E8cPHe6Nakb5XawJA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2ff4bc7a770so3337978f8f.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 13:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682453166; x=1685045166;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SsglBzJ5bPzxNfeLbd557X2S04FxtGdn7SKhC9ebl8Y=;
 b=asaYKg4ViiBipIHfnm6qMFNhpOvRxGfnPVerp4Ezs7+Lp0UlGH1yi4vcj8HYvcwXJs
 +1hhIjrm1ZWwTz5qV2SWCJlh0+2zA2hUH0FbURjom0E2EZdsS3ox0VYPmUMoliNs+d3n
 49PhhR/Elbk3RkMJmPxY5bqz4bFlzEBSAV4Z72Xz4s02oiZ53gP5MrPAB3CaVzCKO8qc
 cXDnjcF2eve3pbQAFvBuU++o8zf2KhF4iKipNuCxY/CBip3SlaGBVJQ6Z2jLEMv7dVWK
 coBp3TgkwJc+U8qjcZ2DLjXq1hUyoA4F3n+MY3jFisIVNDuHEMk2+jet9M3UuPFZOkiO
 SXWA==
X-Gm-Message-State: AAQBX9ee9bj7WgO/6tk+a2jWAqSQt9MQYOxJFpDEY0GQLYZTOjxvvS5b
 viMwvyfyZ8AV+mrKPHPhcErKBcSlF4yJVM9vgBxTdvOUJC1qH3UA4M+DcVzNRYgmOoGRpQopN9x
 1O+8QBt9+iSYh+yQ=
X-Received: by 2002:a5d:4c49:0:b0:2fb:f93f:b96 with SMTP id
 n9-20020a5d4c49000000b002fbf93f0b96mr13670397wrt.31.1682453166430; 
 Tue, 25 Apr 2023 13:06:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350YfiRsmasgXI05pwsdzLH6HiA1xwXtPeZGb761cEOJCrmglV5GDfvkyJQtGlmoyx51T3jJOAg==
X-Received: by 2002:a5d:4c49:0:b0:2fb:f93f:b96 with SMTP id
 n9-20020a5d4c49000000b002fbf93f0b96mr13670383wrt.31.1682453166136; 
 Tue, 25 Apr 2023 13:06:06 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 t12-20020a5d690c000000b002f74578f494sm13870719wru.41.2023.04.25.13.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:06:05 -0700 (PDT)
Date: Tue, 25 Apr 2023 16:06:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 den-plotnikov@yandex-team.ru, lersek@redhat.com, kraxel@redhat.com
Subject: Re: [PATCH v2 0/3] ROM migration
Message-ID: <20230425160524-mutt-send-email-mst@kernel.org>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <17200eef-53c0-71c2-6b7b-0f16514b223d@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17200eef-53c0-71c2-6b7b-0f16514b223d@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 25, 2023 at 07:37:43PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 25.04.23 19:14, Vladimir Sementsov-Ogievskiy wrote:
> > Hi all!
> > 
> > v2: simply ignore romfile on incoming migration when romsize is
> > specified.
> > 
> > Here I suggest a way to solve a problem, when we have existing
> > running QEMU with old option ROM of small size and want to migrate to
> > new environment where we don't have this ROM file.
> > 
> > All the details are in patch 03; 01-02 are simple code style
> > improvements.
> > 
> > Vladimir Sementsov-Ogievskiy (3):
> >    pci: pci_add_option_rom(): improve style
> >    pci: pci_add_option_rom(): refactor: use g_autofree for path variable
> >    pci: ROM preallocation for incoming migration
> > 
> >   hw/pci/pci.c | 101 ++++++++++++++++++++++++++++-----------------------
> >   1 file changed, 55 insertions(+), 46 deletions(-)
> > 
> 
> While being here, could I ask a question:
> 
> As I understand, netcard ROM file is needed only for network boot. So, it's absolutely correct to use romfile="" option: network boot will not work, but everything else will work correctly. Is that right?
> 
> -- 
> Best regards,
> Vladimir

That is correct.

-- 
MST


