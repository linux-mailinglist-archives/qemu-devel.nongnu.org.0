Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E82B39E0
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:29:29 +0100 (CET)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQWW-0001l3-Bc
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUW-0008UD-Pm
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUV-0001Y2-19
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yB+iWwjcAdJo3aku5jv0oHVt9QpfV3gRJttPbNSWZik=;
 b=ClWzk40Qxo4j5cGKJg0ichNouMcZkcuvverhPr08PNFQC6sBWoURO3qXQov5AEtkKoAT/l
 bKWkLwoQCxFeztmmPHBMVzxS6JjvXoiujw50M+Sa808WQ36t3n61ArsS9A9UuxZOEqtjh0
 N/Gu6bkq8SpCxDgcVKOmXT76hW1ZgHg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-C3CztIHIPbSdhyFvh4mIFg-1; Sun, 15 Nov 2020 17:27:20 -0500
X-MC-Unique: C3CztIHIPbSdhyFvh4mIFg-1
Received: by mail-wr1-f72.google.com with SMTP id h11so9777976wrq.20
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yB+iWwjcAdJo3aku5jv0oHVt9QpfV3gRJttPbNSWZik=;
 b=BDrL8FuDzb6EOpe6XltzABvfV2EGD+S+WTZKN9f8ncf7/poYpl1ZAjMdVFya/DO7qU
 vN/aWydzV7yXxomsgivDCpjAoiy0s7lO8lfyahCzcZ7lf5NhlTwGckc+SdJKKU0vjDg4
 zw4yWuuCZqUYlu33YSsT5PiPBbP+UMSSh12c/MLLStype6Er+s/yHKIKxkZlGaHu+7XZ
 XAPF2csNz2FL4R71Z0bLiTuXZyCFBGtQW+1XTVeQsB41YpmTdK1eS4bBUxmRFmAqZp1K
 BbaBxPR5fhVdEpr+UpKPNO9Oq/sotLcIYaIzc6cD2yOFElcKyvo8XRCBIINgNLar083C
 GaUQ==
X-Gm-Message-State: AOAM530hYKOJlIdJTW8Art+Dc1V91/xaMYwS+xlwgR5qjaEDiiJ01B9n
 pUh1KeGUFcba8LaD5llosSMJlR/dOylPohTIwYba0pJ/xEJZdA/gMoR1lMQKfr2poVdR6LalRCX
 PqpkS3/jcDZgeNnAC0YM6kx4mR1cA+gV4LBmUmibcDA8QqqNbaXrzZDIje9gE
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr15991538wrs.331.1605479238795; 
 Sun, 15 Nov 2020 14:27:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxP8AC7wfYNNL/G+KjhvQibXRTYJumgUzI8WVNUe3/7H7/wHq6fe57oAyGhp18FC8tvvsv30w==
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr15991514wrs.331.1605479238519; 
 Sun, 15 Nov 2020 14:27:18 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id n6sm20409305wrj.60.2020.11.15.14.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:17 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/17] vhost-user-blk-server: depend on CONFIG_VHOST_USER
Message-ID: <20201115220740.488850-4-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 16:39:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

I interpreted CONFIG_VHOST_USER as controlling only QEMU's vhost-user
device frontends. However, virtiofsd and contrib/ vhost-user device
backends are also controlled by CONFIG_VHOST_USER. Make the
vhost-user-blk server depend on CONFIG_VHOST_USER for consistency.

Now the following error is printed when the vhost-user-blk server is
enabled without CONFIG_VHOST_USER:

  $ ./configure --disable-vhost-user --enable-vhost-user-blk ...
  ../meson.build:761:8: ERROR: Problem encountered: vhost_user_blk_server requires vhost-user support

Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201110171121.1265142-3-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 4b789f18c1..7fd874eec7 100644
--- a/meson.build
+++ b/meson.build
@@ -751,11 +751,14 @@ statx_test = '''
 
 has_statx = cc.links(statx_test)
 
-have_vhost_user_blk_server = (targetos == 'linux')
+have_vhost_user_blk_server = (targetos == 'linux' and
+    'CONFIG_VHOST_USER' in config_host)
 
 if get_option('vhost_user_blk_server').enabled()
     if targetos != 'linux'
         error('vhost_user_blk_server requires linux')
+    elif 'CONFIG_VHOST_USER' not in config_host
+        error('vhost_user_blk_server requires vhost-user support')
     endif
 elif get_option('vhost_user_blk_server').disabled() or not have_system
     have_vhost_user_blk_server = false
-- 
MST


