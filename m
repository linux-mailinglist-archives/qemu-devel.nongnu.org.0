Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F5597976
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 00:08:08 +0200 (CEST)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oORCo-0004PV-UR
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 18:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oORBB-00033E-Or
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 18:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oORB8-0006Mm-0h
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 18:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660773980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9v97ya0iOSfCiwE2PAw9Qf/RKJyTMUZHUCQt12v8Iw4=;
 b=FGW3zO7u5hQEMIKFWaPhwQLqQi5h7217bcf0oqed0ITx3z9XcUAro0o+YWV4ieugoDl78h
 4hwXnJpvI5pIVup2qkcPvLRLkscwssRf9xGx1BGS+zcHxPMY65jVPaCK7Svn1t3v59fLiy
 ZVTjHWgZo4x3u9EhhKZ0PbmZzjl84rE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-uCwHHHtOMqK8Ga0q3rIeTQ-1; Wed, 17 Aug 2022 18:06:18 -0400
X-MC-Unique: uCwHHHtOMqK8Ga0q3rIeTQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 e30-20020ac8011e000000b00342f61e67aeso11317417qtg.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 15:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=9v97ya0iOSfCiwE2PAw9Qf/RKJyTMUZHUCQt12v8Iw4=;
 b=HsHklzisFCxU5KuDOLBqABaXTxmtemCR5Gq/Kz787NVDAUMCeglumZv5yqOxQa1qsd
 PNR1CsZUO8BBjOYFvVaMt3ewSjNwVi8cvRDpBmCdOhgKU1NADV9P1FB35RAZl77E2d2E
 s8AImLr5CZvrT9w+XCkaO9++No5iOEas9NSpbtpDYXPJFGlsEhXzva/FiqLXXRy/eayM
 HlnhwplDZJc2tn9oX2lsOepnj8gOAwK1coEK4gtiHAp6w7jjAzgkUd45X1RlS/OpCHT/
 XRq1ew3d5JIzf9mdtwLzBBkmlPm5DOSm70CQlMHIiHefPUzSXwWph07rNL5s8Zzup3gG
 DlFQ==
X-Gm-Message-State: ACgBeo28FemnilMYMLP3r9H9XiefdbAcERVVNA8/kRVcX0MsQnJZ6p/x
 HpD7TtIY+u88cbRi1h7yq56wHZGilXaXy90rsJB0aGd2OaRA96cEy5FRDMbz6IMqM78yoNDyfWk
 pxLzDx546f7aOPpM=
X-Received: by 2002:a05:6214:d42:b0:496:a71b:d75 with SMTP id
 2-20020a0562140d4200b00496a71b0d75mr4553462qvr.51.1660773978195; 
 Wed, 17 Aug 2022 15:06:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7oTOeEoc5hlVHcDHCgiERyHhSQ1n5WHUcm79iC09RcD5ulFZs9WAVgggVJLZWJhW3s7ZEvMA==
X-Received: by 2002:a05:6214:d42:b0:496:a71b:d75 with SMTP id
 2-20020a0562140d4200b00496a71b0d75mr4553436qvr.51.1660773977856; 
 Wed, 17 Aug 2022 15:06:17 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 cg14-20020a05622a408e00b003435983a263sm13661754qtb.46.2022.08.17.15.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 15:06:17 -0700 (PDT)
Date: Wed, 17 Aug 2022 18:06:16 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 1/8] qapi/migration: Introduce x-vcpu-dirty-limit-period
 parameter
Message-ID: <Yv1mWLkErL/BNupE@xz-m1.local>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
 <22a4776fc05a4174cb07728e0350430a420e2b9c.1658561555.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <22a4776fc05a4174cb07728e0350430a420e2b9c.1658561555.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, Jul 23, 2022 at 03:49:13PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce "x-vcpu-dirty-limit-period" migration experimental
> parameter, which is used to make dirtyrate calculation period
> configurable.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  migration/migration.c | 16 ++++++++++++++++
>  monitor/hmp-cmds.c    |  8 ++++++++
>  qapi/migration.json   | 31 ++++++++++++++++++++++++-------
>  3 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index e03f698..7b19f85 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -116,6 +116,8 @@
>  #define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
>  #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
>  
> +#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */

Why 500 but not DIRTYLIMIT_CALC_TIME_MS?

Is it intended to make this parameter experimental, but the other one not?

Thanks,

-- 
Peter Xu


