Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2565826BF90
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 10:42:53 +0200 (CEST)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIT1g-0003Sn-6T
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 04:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIT0J-00028Q-A3
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 04:41:27 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43869
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kIT0H-0007cy-Kk
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 04:41:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600245684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/N1RtEVHhfKvdVUQ4ybw9x1AsoKfn07Qb3S13HMz1mM=;
 b=NhjTiCUvXUKFqYxJQu9uvoUXLAOxpsdgp5Di5gtipN9RyVLFP6psJxFJOg5Bek7Do4XQuH
 GW/fH9sTY8MXuNlrXtR6Li5fmaDaHewcQ8FpIUmXcBQSWSUgSnAmHjiigLD87r/3ldgFHB
 irCQ9k8szPrLCdPEHb38mnnDzH419fQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-rIXJOjvTNRS-4sHSpD_cJA-1; Wed, 16 Sep 2020 04:41:22 -0400
X-MC-Unique: rIXJOjvTNRS-4sHSpD_cJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B629280733A
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 08:41:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 734CE610F3;
 Wed, 16 Sep 2020 08:41:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9DA299D78; Wed, 16 Sep 2020 10:41:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] audio: build spiceaudio as module
Date: Wed, 16 Sep 2020 10:41:17 +0200
Message-Id: <20200916084117.21828-3-kraxel@redhat.com>
In-Reply-To: <20200916084117.21828-1-kraxel@redhat.com>
References: <20200916084117.21828-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:41:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/meson.build b/audio/meson.build
index 15c06ba0453b..18a831129ed0 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -7,7 +7,6 @@ softmmu_ss.add(files(
   'wavcapture.c',
 ))
 
-softmmu_ss.add(when: [spice, 'CONFIG_SPICE'], if_true: files('spiceaudio.c'))
 softmmu_ss.add(when: [coreaudio, 'CONFIG_AUDIO_COREAUDIO'], if_true: files('coreaudio.c'))
 softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'], if_true: files('dsoundaudio.c'))
 softmmu_ss.add(when: ['CONFIG_AUDIO_WIN_INT'], if_true: files('audio_win_int.c'))
@@ -18,7 +17,8 @@ foreach m : [
   ['CONFIG_AUDIO_OSS', 'oss', oss, 'ossaudio.c'],
   ['CONFIG_AUDIO_PA', 'pa', pulse, 'paaudio.c'],
   ['CONFIG_AUDIO_SDL', 'sdl', sdl, 'sdlaudio.c'],
-  ['CONFIG_AUDIO_JACK', 'jack', jack, 'jackaudio.c']
+  ['CONFIG_AUDIO_JACK', 'jack', jack, 'jackaudio.c'],
+  ['CONFIG_SPICE', 'spice', spice, 'spiceaudio.c']
 ]
   if config_host.has_key(m[0])
     module_ss = ss.source_set()
-- 
2.27.0


