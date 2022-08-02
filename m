Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B53587DC3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:01:01 +0200 (CEST)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsSC-0002GQ-8a
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIsHh-0002kg-Ih
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:50:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIsHe-0005vB-QD
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659448204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+TD1kEapXHJAzTs2zGA4WEnAZPubhBhVdpg16oFhVfQ=;
 b=UE8VJc6R/hDfhUvgJiaFT5dKYHzwGt/8pnWzq8ahSmlNJASZF3b1+/XV+WhMqJAuy8Of21
 TfIBkLxegDfYO+7SAyc1XK+WNFPzCpKWBmj8ynq+tEgwi5gQQR23uykyhwRbo8arlfknhL
 qfCE/skEEBGmRzwGdJw5h18b60w8wHo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-hJrV9QkGMlCZqaif0I6A4g-1; Tue, 02 Aug 2022 09:50:03 -0400
X-MC-Unique: hJrV9QkGMlCZqaif0I6A4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 z11-20020a05600c0a0b00b003a043991610so2021503wmp.8
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 06:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+TD1kEapXHJAzTs2zGA4WEnAZPubhBhVdpg16oFhVfQ=;
 b=ekPt/VwYpWNRMDiyocU8nYLb8DKm2fXcY+/if5YJ5U4PEpFw9jWZN11ZhRjSEyQez5
 hGaQwAYKaeWqkWVDCj69zUnhfqbLMG3DLnIdwjCibxzQRbiNzKeOuOQz5g4bVKLffxhq
 aHmOZBkIV7pkMIEK0wgn52zHW77RfsNwY5vMzs2CmBn0BRNfiAcUo09vz/OXkRTBUHh/
 6voE6ZknxfkCQ8Wa2XkTpfx4EmMnG8hkZL4ZxqW0M4Dc68m3CoN/yiZ2rFF1ce5tLh2e
 ZKqNdAN42XdNoZeYr0TeAFNSOCQH/5jfRi8dPGIiG359tgoAIeQNbPPLN/YC9ojXAtGB
 OEgQ==
X-Gm-Message-State: ACgBeo16sr1o5vvEx/ca8pSIcDBTiqqeVBjKmuCWzqOKSZNBOzWlTUYW
 7ihuzYoC0oxazGxUcMXgGOeiAsutLZwgbOL359K2txB1KMyUMEFRrBAh1cvDZ1LwRexoaejTFNZ
 Incz1uNyQqHrj0eQ=
X-Received: by 2002:a5d:64e2:0:b0:21d:38e8:2497 with SMTP id
 g2-20020a5d64e2000000b0021d38e82497mr12378068wri.142.1659448202168; 
 Tue, 02 Aug 2022 06:50:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7YPg9BXdkAlGxikGfZE/5DE6J0A6lmXztVvVYIutbVbcwyCFDcg/QCADQqyu//FW6h3YYKQw==
X-Received: by 2002:a5d:64e2:0:b0:21d:38e8:2497 with SMTP id
 g2-20020a5d64e2000000b0021d38e82497mr12378053wri.142.1659448201953; 
 Tue, 02 Aug 2022 06:50:01 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bk9-20020a0560001d8900b0021d76a1b0e3sm15211278wrb.6.2022.08.02.06.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 06:50:01 -0700 (PDT)
Date: Tue, 2 Aug 2022 14:49:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] migration: fix coverity nits
Message-ID: <Yukrhw1N5J/6tPJP@work-vm>
References: <20220721115207.729615-1-peter.maydell@linaro.org>
 <CAFEAcA9EjyoZAx5DfjdnwCvW4z=TxFS3940H9nBErH0_cYUanA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9EjyoZAx5DfjdnwCvW4z=TxFS3940H9nBErH0_cYUanA@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Thu, 21 Jul 2022 at 12:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > This patchset fixes four Coverity nits in the migration code.
> > The first patch is just adding an assert() to clue coverity in
> > that an array index must be in-bounds. The second adds an ULL
> > suffix to force a multiplication to be done at 64 bits.
> >
> > thanks
> > -- PMM
> >
> > Peter Maydell (2):
> >   migration: Assert that migrate_multifd_compression() returns an
> >     in-range value
> >   migration: Define BLK_MIG_BLOCK_SIZE as unsigned long long
> 
> Ping? This series got reviewed but doesn't seem to have
> made it into a migration pullreq yet.

Queued

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


