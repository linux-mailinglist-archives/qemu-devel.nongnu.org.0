Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B3C334640
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:07:52 +0100 (CET)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3FO-0006Ed-V2
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iH-0007g9-8a
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iF-0006yM-Ov
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XhijArq5ntw4FCylOZxPK9ewh7UJ92gs2J5AWDr+cwU=;
 b=NeB1s8tlucMTyjy7RPkwP/KAY+MGT1gO4kLZXqQCYPa6HgmRclbl2Ms1E5wqentFGvCZwC
 0ZXB3jMp6oK1UmQl5dNwJvJGyAJXglL557obtS5iolJU9nhgHIe1oQMumrIurpvRiArG7v
 FstrEVcxsxo4YYSECtwfuqGFvvnJGNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-abEGMk2oMFydxAiPG2p3DQ-1; Wed, 10 Mar 2021 12:33:32 -0500
X-MC-Unique: abEGMk2oMFydxAiPG2p3DQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3372E83DD20;
 Wed, 10 Mar 2021 17:33:31 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA70260C13;
 Wed, 10 Mar 2021 17:33:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 0/4] Clean up the -usbdevice mess
Date: Wed, 10 Mar 2021 18:33:19 +0100
Message-Id: <20210310173323.1422754-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"-usbdevice" is still useful for some users. Thus let's clean up the
unwanted parts and make sure that the rest is in a better shape again.

Paolo Bonzini (2):
  usb: remove support for -usbdevice parameters
  usb: remove '-usbdevice u2f-key'

Thomas Huth (2):
  usb: Un-deprecate -usbdevice (except for -usbdevice audio which gets
    removed)
  usb: Document the missing -usbdevice options

 docs/system/deprecated.rst       |  9 --------
 docs/system/removed-features.rst |  8 ++++++++
 hw/usb/bus.c                     | 32 +++++++----------------------
 hw/usb/dev-audio.c               |  1 -
 hw/usb/dev-serial.c              |  2 +-
 hw/usb/u2f.c                     |  1 -
 include/hw/usb.h                 |  2 +-
 qemu-options.hx                  | 35 ++++++++++++++++++++++++++------
 softmmu/vl.c                     |  2 --
 9 files changed, 46 insertions(+), 46 deletions(-)

-- 
2.27.0


