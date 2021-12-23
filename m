Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0AF47E136
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 11:17:05 +0100 (CET)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0L9k-0000mA-5y
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 05:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0L7d-0006oR-M0
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0L7a-0006sD-FH
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 05:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640254489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8Lqsw6/q5K/GsbrbDDFAAcbrQAsX6YJVuBetTcmBeI=;
 b=iYkZdtqSZWs29SVAQ2iIdy9haLaC+5TYvyZUWvyCSawP+pOzbN9zIAPIP+vf2hxijySkil
 J1b7eNpuVuZ3TjLMlOE1zgEhNDhDdUrvFIa8WlZN0dB4XAw4guzdp/CgbsXevbtoCLJKUR
 mwbuZ4H5KfpTUe5udEzKNwdnJv2VEBc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-fDodpEWoOXiOh9NO4ogdeA-1; Thu, 23 Dec 2021 05:14:48 -0500
X-MC-Unique: fDodpEWoOXiOh9NO4ogdeA-1
Received: by mail-wr1-f69.google.com with SMTP id
 s23-20020adf9797000000b001a24674f0f7so1179575wrb.9
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 02:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N8Lqsw6/q5K/GsbrbDDFAAcbrQAsX6YJVuBetTcmBeI=;
 b=K2ZgAVuFiHhN4VtfCvVBQwWUW2GNPX/wTEyDgG6o+giXElXVn0pNRtBQx+Hcxd2ehK
 Iyqz0IXzvQky8IRDVy/r9ygphdi5kjh7dDkDRzj913xgek3VZfO3MK8xVWbIx2KYkJgq
 qjyMEHve8E7kW//zO4CTcC+Emd/MhUhs8ETrCmNwfyEzQQlQDmDJaXCTuJgGqr3pD1Dd
 7iFb9aiB/Bs/fg5HQjKb2nNrg3d0MhBMGunmhExJqmzdJN+rqxCK53xOFnLrtj6p4AYq
 nTl6qcPtv2TL32ui3jDNcLrkqik7i9KXnOZK4ROy1ocqt7RKf2F27VDZVsOGyU+Yrj/R
 gYdQ==
X-Gm-Message-State: AOAM531bmk1u7UyZ/pMnekMFyVPBSSfueaSiFoMP0T75Tn0ftIdKmGo7
 gFFWMyYEvz4iqBNdeyaldiigPYz7rotxnLC/UKE+XDSej+khLj3nQ26O3PVuB6U49egpEXTL5tV
 mJHdlpU/4RB+F13h1njkMutRqrCVwK2dpn1wYl3KCC40mY/S33e1/pG/ZvyUvk5cq
X-Received: by 2002:adf:f085:: with SMTP id n5mr1260854wro.418.1640254487357; 
 Thu, 23 Dec 2021 02:14:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuPiMDSO+/2Ya793k51CAu30dNj1ZMZB6VUUTNVzkq45z9Jqso+3uTbR2AvsA4pP73JnPSCg==
X-Received: by 2002:adf:f085:: with SMTP id n5mr1260840wro.418.1640254487186; 
 Thu, 23 Dec 2021 02:14:47 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id r1sm5505403wrz.30.2021.12.23.02.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 02:14:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] qapi/block: Restrict vhost-user-blk to
 CONFIG_VHOST_USER_BLK_SERVER
Date: Thu, 23 Dec 2021 11:14:26 +0100
Message-Id: <20211223101426.3143647-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223101426.3143647-1-philmd@redhat.com>
References: <20211223101426.3143647-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building QEMU with --disable-vhost-user and using introspection,
query-qmp-schema lists vhost-user-blk even though it's not actually
available:

  { "execute": "query-qmp-schema" }
  {
      "return": [
          ...
          {
              "name": "312",
              "members": [
                  {
                      "name": "nbd"
                  },
                  {
                      "name": "vhost-user-blk"
                  }
              ],
              "meta-type": "enum",
              "values": [
                  "nbd",
                  "vhost-user-blk"
              ]
          },

Restrict vhost-user-blk in BlockExportType when
CONFIG_VHOST_USER_BLK_SERVER is disabled, so it
doesn't end listed by query-qmp-schema.

Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Reword + restrict BlockExportOptions union (armbru)
---
 qapi/block-export.json | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index c1b92ce1c1c..f9ce79a974b 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -277,7 +277,8 @@
 # Since: 4.2
 ##
 { 'enum': 'BlockExportType',
-  'data': [ 'nbd', 'vhost-user-blk',
+  'data': [ 'nbd',
+            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
             { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
 
 ##
@@ -319,7 +320,8 @@
   'discriminator': 'type',
   'data': {
       'nbd': 'BlockExportOptionsNbd',
-      'vhost-user-blk': 'BlockExportOptionsVhostUserBlk',
+      'vhost-user-blk': { 'type': 'BlockExportOptionsVhostUserBlk',
+                          'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
       'fuse': { 'type': 'BlockExportOptionsFuse',
                 'if': 'CONFIG_FUSE' }
    } }
-- 
2.33.1


