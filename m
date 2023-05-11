Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFEB6FEE7C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:16:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2Oq-0006HJ-Gc; Thu, 11 May 2023 05:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1px2Oi-0006EM-8w
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1px2Oe-00078r-GB
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683796535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LWAC0GvvRioCejoKV58wOmMwVyuqKIWg9gDJirSm7Ws=;
 b=hwwh/oHphf12Wpi7RGyjCnlhV/cUY94trc3ac8gwfCebOVqJNjvqPFiklrbN0yf4ksb/xV
 6lfrKOcjkeTdp5yHPmN+fHUPJ5fMfUzmGPBN3vVZHn8njMuy1vOKJ6hwfX6fW55ogDGr59
 dTaa+x/SY0xPEr5c3k0Dck+f35Uzal4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-KQJjFYKWPG-v1bX7bH_BuQ-1; Thu, 11 May 2023 05:15:33 -0400
X-MC-Unique: KQJjFYKWPG-v1bX7bH_BuQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f41a04a297so20222765e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683796532; x=1686388532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LWAC0GvvRioCejoKV58wOmMwVyuqKIWg9gDJirSm7Ws=;
 b=CqjIzc1rpoOvz9QSBpk/nNXHj1IAlhvvu/a5zaDuervEYmvWyqOAQnQBxYwUpn+bgS
 9WswK6/z5N7VPIoMVWt/EnnhLsn/aB12HstFvlJmj7nm+96npMxLHd0qudcEXXXeNzaG
 fFRU7ptnX3GTdIAcNuCIm+nJ2O0nYyiQf+aPn3B1etG0t/QHgLGT2nc/M6sh0NtMZOe3
 fRQ2YsJHS6FxxaM/6W2Y2wFnVXulNXBvsXCGWZqs7KA9roBy/MJPihRL+qtEijiiJI0K
 kppYTekXTfg/rj+EwokukEOXQ+4LD4HN5dNJAHLPurTwE504cBYOoZn0eXH6dvhj0hYO
 SYug==
X-Gm-Message-State: AC+VfDxfasWjCeymZjxzcUEi1ZDydKB3yraEh3emjYop6dwCz6dqMKkz
 DKf7lHs5lnCwVkNFFeOQ2EVvMN9TaqcXYMgUw0q4RJuU5DTmuOLrQvO/rAYnq0QcfjKFb2m9fAT
 F+dHC4/oJdwlGcpEOzNR7sp15Wl6mkfiOYQGja9QhTNxdE3wAzKoB+ynQlPI2g7YRyEjGHr902h
 w=
X-Received: by 2002:a1c:7c0f:0:b0:3f4:219f:5b7a with SMTP id
 x15-20020a1c7c0f000000b003f4219f5b7amr9893592wmc.30.1683796532062; 
 Thu, 11 May 2023 02:15:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4XmnOn9OVg2WqhzIcLsPVJHUZt5oaS5vjbCwihFW/CLa9gX0Sz8QD0qRIEUcSUq86bl4mSsQ==
X-Received: by 2002:a1c:7c0f:0:b0:3f4:219f:5b7a with SMTP id
 x15-20020a1c7c0f000000b003f4219f5b7amr9893571wmc.30.1683796531725; 
 Thu, 11 May 2023 02:15:31 -0700 (PDT)
Received: from step1.lan ([5.77.69.175]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c0b5900b003f4272c2d10sm10268788wmr.1.2023.05.11.02.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:15:30 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jonathon Jongsma <jjongsma@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 0/1] block/blkio: support 'fd' option for
 virtio-blk-vhost-vdpa driver
Date: Thu, 11 May 2023 11:15:26 +0200
Message-Id: <20230511091527.46620-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v3:
- use qemu_open() on `path` to simplify libvirt code [Jonathon]
- remove patch 01 since we are not using monitor_fd_param() anymore

v2: https://lore.kernel.org/qemu-devel/20230504092843.62493-1-sgarzare@redhat.com/
- added patch 01 to use monitor_fd_param() in the blkio module
- use monitor_fd_param() to parse the fd like vhost devices [Stefan]

v1: https://lore.kernel.org/qemu-devel/20230502145050.224615-1-sgarzare@redhat.com/

The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
'fd' property. Let's expose this to the user, so the management layer
can pass the file descriptor of an already opened vhost-vdpa character
device. This is useful especially when the device can only be accessed
with certain privileges.

Stefano Garzarella (1):
  block/blkio: use qemu_open() to support fd passing for virtio-blk

 block/blkio.c | 53 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 9 deletions(-)

-- 
2.40.1


