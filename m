Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB2276FFC
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 13:31:42 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLPTR-0005sZ-Co
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 07:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kLPOM-0007j7-Du
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 07:26:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kLPOJ-0004xa-T5
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 07:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600946782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WuLgQ8YVGBV38U6Y+yuzMjXipQ4CSzdPz2uLs+7OmYs=;
 b=G1vuuZGOYUPPFEMKqmUe98imRUAjhq2FJMmQmEYxBYgHU3v5pazBRTzrAEkUvQ91TvjS9H
 Swc87HxJlBABEDQuPZ+I44p/9VdXVCkHyU8Va4yV90RsD5ywtxnzoGiKiYcmcK/HHtMrTn
 Hqkc4za3YO1jWnkaUAkd5O43QgsLq9s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-pFLkF5J1OV2HrmQVs3UKqg-1; Thu, 24 Sep 2020 07:26:19 -0400
X-MC-Unique: pFLkF5J1OV2HrmQVs3UKqg-1
Received: by mail-wm1-f72.google.com with SMTP id l26so749249wmg.7
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 04:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WuLgQ8YVGBV38U6Y+yuzMjXipQ4CSzdPz2uLs+7OmYs=;
 b=E1xiXK6H+IHxmMxQrFZnkaVNREl5fjkz2EUdrbfd9gJabivDCtzqhWwey0QAxB5C3b
 WRXh8dgQJ/xkIGHcAoUUEdiTsaEyze8n59D7hit0kdYqoUWeM6tUC0JYDPqykmF3rHSB
 d9GYu5TrGforcV2+o5sH3m2qrG136lNOOCyLlfdoooDr9ZsLANh/POVT2fdCs4jY8rMh
 KDnjLQyzUC4HhrGSb+XGP2QprIsQulIrpQL9DxYeo5lcIkVB3tfbauMWVRpDlphwmovJ
 QZQdsHqtJ5w+BWjCg+oghEAxzOZxJSwCA/pQarCKr/U2FgvQh4RpJRAZMYDR2upLKRCb
 1AbA==
X-Gm-Message-State: AOAM531DlWZLXPlSRuLWCa8Qrqg/CUOH3LtYkk1FA8313NoP18p3Idi1
 CvL5XvVXbBx4k1pTaWI24Uj15yTyKuLidF8njbVJ3/iiBt+qOitMZT3rajzbKxGWDcbtyujKpXL
 JzyvNAQgkHEjWFOU=
X-Received: by 2002:a5d:4910:: with SMTP id x16mr5035795wrq.204.1600946778378; 
 Thu, 24 Sep 2020 04:26:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYdTGZLQtDauRixVP5ckhZtYtit2ENm606+ym6SamkGFv0hBq8+e8LVof9Dlry0v9BLc0Csw==
X-Received: by 2002:a5d:4910:: with SMTP id x16mr5035766wrq.204.1600946778142; 
 Thu, 24 Sep 2020 04:26:18 -0700 (PDT)
Received: from redhat.com (bzq-79-179-71-128.red.bezeqint.net. [79.179.71.128])
 by smtp.gmail.com with ESMTPSA id t10sm3028133wmi.1.2020.09.24.04.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 04:26:17 -0700 (PDT)
Date: Thu, 24 Sep 2020 07:26:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dima Stepanov <dimastep@yandex-team.ru>
Subject: Re: [PATCH v5 0/7] vhost-user-blk: fix the migration issue and
 enhance qtests
Message-ID: <20200924072506-mutt-send-email-mst@kernel.org>
References: <cover.1599813294.git.dimastep@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <cover.1599813294.git.dimastep@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 stefanha@gmail.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, fengli@smartx.com, yc-core@yandex-team.ru,
 pbonzini@redhat.com, raphael.norwitz@nutanix.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 11, 2020 at 11:39:42AM +0300, Dima Stepanov wrote:
> v4 -> v5:
>   - vhost: check queue state in the vhost_dev_set_log routine
>     tests/qtest/vhost-user-test: prepare the tests for adding new
>     dev class
>     tests/qtest/vhost-user-test: add support for the
>     vhost-user-blk device
>     tests/qtest/vhost-user-test: add migrate_reconnect test
>     Reviewed-by: Raphael Norwitz
>   - Update qtest, by merging vhost-user-blk "if" case with the
>     virtio-blk case.

I dropped patches 3-7 since they were stalling on some systems.
Pls work with Peter Maydell (cc'd) to figure it out.


> v3 -> v4:
>   - vhost: recheck dev state in the vhost_migration_log routine
>     Reviewed-by: Raphael Norwitz
>   - vhost: check queue state in the vhost_dev_set_log routine
>     Use "continue" instead of "break" to handle non-initialized
>     virtqueue case.
> 
> v2 -> v3:
>   - update commit message for the 
>     "vhost: recheck dev state in the vhost_migration_log routine" commit
>   - rename "started" field of the VhostUserBlk structure to
>     "started_vu", so there will be no confustion with the VHOST started
>     field
>   - update vhost-user-test.c to always initialize nq local variable
>     (spotted by patchew)
> 
> v1 -> v2:
>   - add comments to connected/started fields in the header file
>   - move the "s->started" logic from the vhost_user_blk_disconnect
>     routine to the vhost_user_blk_stop routine
> 
> Reference e-mail threads:
>   - https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg01509.html
>   - https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg05241.html
> 
> If vhost-user daemon is used as a backend for the vhost device, then we
> should consider a possibility of disconnect at any moment. There was a general
> question here: should we consider it as an error or okay state for the vhost-user
> devices during migration process?
> I think the disconnect event for the vhost-user devices should not break the
> migration process, because:
>   - the device will be in the stopped state, so it will not be changed
>     during migration
>   - if reconnect will be made the migration log will be reinitialized as
>     part of reconnect/init process:
>     #0  vhost_log_global_start (listener=0x563989cf7be0)
>     at hw/virtio/vhost.c:920
>     #1  0x000056398603d8bc in listener_add_address_space (listener=0x563989cf7be0,
>         as=0x563986ea4340 <address_space_memory>)
>     at softmmu/memory.c:2664
>     #2  0x000056398603dd30 in memory_listener_register (listener=0x563989cf7be0,
>         as=0x563986ea4340 <address_space_memory>)
>     at softmmu/memory.c:2740
>     #3  0x0000563985fd6956 in vhost_dev_init (hdev=0x563989cf7bd8,
>         opaque=0x563989cf7e30, backend_type=VHOST_BACKEND_TYPE_USER,
>         busyloop_timeout=0)
>     at hw/virtio/vhost.c:1385
>     #4  0x0000563985f7d0b8 in vhost_user_blk_connect (dev=0x563989cf7990)
>     at hw/block/vhost-user-blk.c:315
>     #5  0x0000563985f7d3f6 in vhost_user_blk_event (opaque=0x563989cf7990,
>         event=CHR_EVENT_OPENED)
>     at hw/block/vhost-user-blk.c:379
> The first patch in the patchset fixes this issue by setting vhost device to the
> stopped state in the disconnect handler and check it the vhost_migration_log()
> routine before returning from the function.
> qtest framework was updated to test vhost-user-blk functionality. The
> vhost-user-blk/vhost-user-blk-tests/migrate_reconnect test was added to reproduce
> the original issue found.
> 
> Dima Stepanov (7):
>   vhost: recheck dev state in the vhost_migration_log routine
>   vhost: check queue state in the vhost_dev_set_log routine
>   tests/qtest/vhost-user-test: prepare the tests for adding new dev
>     class
>   tests/qtest/libqos/virtio-blk: add support for vhost-user-blk
>   tests/qtest/vhost-user-test: add support for the vhost-user-blk device
>   tests/qtest/vhost-user-test: add migrate_reconnect test
>   tests/qtest/vhost-user-test: enable the reconnect tests
> 
>  hw/block/vhost-user-blk.c          |  19 ++-
>  hw/virtio/vhost.c                  |  39 ++++-
>  include/hw/virtio/vhost-user-blk.h |  10 ++
>  tests/qtest/libqos/virtio-blk.c    |  14 +-
>  tests/qtest/vhost-user-test.c      | 290 +++++++++++++++++++++++++++++++------
>  5 files changed, 322 insertions(+), 50 deletions(-)
> 
> -- 
> 2.7.4


