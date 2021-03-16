Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35633DBB0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:57:55 +0100 (CET)
Received: from localhost ([::1]:45048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDx4-00059K-0B
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMDNf-0003ma-5d
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:21:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lMDNd-0001s9-1Z
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=8wu1vYG8HEXfrRPu8g3G2xk239QW+BZfTjBIYtEbLZM=;
 b=aeGMsAYDFQPKKkXne0Pu+tBxiZE3G/9pZ221rvmGuk8Ni7rK4eB82tu19HEdWZWZ+NaUm0
 oy1ujRY//PbBx91z0j+37XBqYP5VAivmiLM96Tc892YXiViioiv2FtGgm4EABqd6EB1xqG
 5M3B1CclWbwrheqOJdy7ymMYghgIXlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-p-74BMGrMjmvW5gwS6cYoA-1; Tue, 16 Mar 2021 13:21:13 -0400
X-MC-Unique: p-74BMGrMjmvW5gwS6cYoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6001283DD20
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:21:12 +0000 (UTC)
Received: from work-vm (ovpn-113-133.ams2.redhat.com [10.36.113.133])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D1A60C0F;
 Tue, 16 Mar 2021 17:21:05 +0000 (UTC)
Date: Tue, 16 Mar 2021 17:21:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: berrange@redhat.com, kraxel@redhat.com, victortoso@redhat.com
Subject: Half a usb-redir idea
Message-ID: <YFDo/oHikOEcXFcg@work-vm>
MIME-Version: 1.0
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
  I've got a half-baked idea, which I thought might be worth mentioning.

How hard would it be to give qemu a usbredir server rather than client?
It would have nothing guest visible but would look logically like the
front (?) half of a usb interface; then you could use all of the
existing qemu emulated and passthrough device code, to build a usb
hierarchy and present it to a remote qemu.

You'd get the ability to do emulated USB CDROM/storage, audio, network
and the glue for host USB connection (and smart cards??) - all in one
client that you can then use for connecting to a remote qemu.

The next step of that is to make something analogous to a
qemu-storage-daemon, but for USB, so you have something that can
do all that USB stuff without actually having any processors.

The even crazier step would then be to add a VNC client, and then you
have an almost complete remote client.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


