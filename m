Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806546F6848
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:30:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVGg-0000WC-Pn; Thu, 04 May 2023 05:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1puVGe-0000Vw-QV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:28:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1puVGd-0001Vk-5m
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683192530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BeAxqs1LzzXxdudKQjujMlbwfOBb6sgVVEImEITwY3U=;
 b=il3pc0jGMdEP5av/kpMTi60ftvm0gH7OeCf7mv9MJe/no55NrkuONUnIyqExxlHeU7FTHI
 rtRDtBHPfK2epuqndnw/IHGFAC1RByyStGK1xuPN2ZWn6DV6qbK3mCRkdZgXBrM1nrApPN
 +tGhbeSXRmUA8zZ13J94aiJZeRAqKF4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-rIPJwquRMQq2F8ejXP46og-1; Thu, 04 May 2023 05:28:49 -0400
X-MC-Unique: rIPJwquRMQq2F8ejXP46og-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f3fde29b1fso992125e9.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 02:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683192527; x=1685784527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BeAxqs1LzzXxdudKQjujMlbwfOBb6sgVVEImEITwY3U=;
 b=CGnhti3TjVFbsZjaenACQlukhbf7VgTGs3GSWlsrXuYTLUwZiC0K3bxQ8o1L7F5UZw
 79ZrNfzgT0+fvABY/t9fEuR5uBgM02g0r9pdAVNY+4GG/7artWtqt+S6yeQrUYEvSsTt
 UnDXupWS8HDlroyGvAxTm7yDt4j+sB7/EHjZF0JYwAEwta9pGPtASABAxlzxd2M/fGuS
 5z/XemmkyAghr6NlYxSbMfV/rWywyfrWi2fK9bC6L9nYsLuc6fC2cQGnKEa4vLrILeeE
 Gq/Itiw63ThRPzPNu6qemydQf7RR3v4txlfwOzgQ0D84KxYa3v1cfqklPMjUCzaSYmUD
 Uw+Q==
X-Gm-Message-State: AC+VfDz7kb3gfrbcqWRdLpvX0F+jZxqAd5ml2x+oIdgJmb9vEOZyq2w3
 6vGSwjjbb0quchvDzIIKZU9TbMk8EBdFR1nyCOcmifbtcvkBjeKbEt4yTIyV6DOO7BAe9o0mkyB
 +l6q/kEEZOvrOcCKB95OhkkRYoDcwa6B9ljAah54UUXDK1VO2gZza/f9iCmxavRGLDqJZhoR9HW
 4=
X-Received: by 2002:a05:600c:3797:b0:3f1:82c6:2d80 with SMTP id
 o23-20020a05600c379700b003f182c62d80mr16886416wmr.5.1683192527374; 
 Thu, 04 May 2023 02:28:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6g5xb5wnS7QG0Q6DucIxUNbnB6Fl5uMrNilE9hoVX6NOv+ky8OrGh6Myoegcb2eTlgMupk3A==
X-Received: by 2002:a05:600c:3797:b0:3f1:82c6:2d80 with SMTP id
 o23-20020a05600c379700b003f182c62d80mr16886394wmr.5.1683192527035; 
 Thu, 04 May 2023 02:28:47 -0700 (PDT)
Received: from step1.redhat.com ([5.179.186.0])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b003062b2c5255sm11753375wrw.40.2023.05.04.02.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 02:28:46 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jjongsma@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 0/2] block/blkio: add 'fd' option to virtio-blk-vhost-vdpa
 driver
Date: Thu,  4 May 2023 11:28:41 +0200
Message-Id: <20230504092843.62493-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.40.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

v2:
- added patch 01 to use monitor_fd_param() in the blkio module
- use monitor_fd_param() to parse the fd like vhost devices [Stefan]

v1: https://lore.kernel.org/qemu-devel/20230502145050.224615-1-sgarzare@redhat.com/

The virtio-blk-vhost-vdpa driver in libblkio 1.3.0 supports the new
'fd' property. Let's expose this to the user, so the management layer
can pass the file descriptor of an already opened vhost-vdpa character
device. This is useful especially when the device can only be accessed
with certain privileges.

Stefano Garzarella (2):
  stubs/monitor: add monitor_fd_param()
  block/blkio: add 'fd' option to virtio-blk-vhost-vdpa driver

 qapi/block-core.json |  6 ++++-
 block/blkio.c        | 53 +++++++++++++++++++++++++++++++++++++++++++-
 stubs/monitor.c      |  6 +++++
 3 files changed, 63 insertions(+), 2 deletions(-)

-- 
2.40.1


