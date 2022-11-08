Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEE16213AE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:52:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osP1R-0001OP-E9; Tue, 08 Nov 2022 08:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osP1P-0001OF-1g
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osP1N-0005Nf-J8
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667915528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=JUXBO6HtmcRpZLIv41x7COPzthebfsMZLx5bmXnfKVk=;
 b=VhWbyUZDXeYQUlNiTVZrox1/KkEujZv/QmILumeAz6Z8ysyGeVCCoL2eeXEoPela9PJ807
 zkqP92vFy90PwsY+Kz9J4Ew4pp/9PQhmst6kzQTfPPk/82wgfb6iygTU8Q8TtZGcpyVXTb
 JgHMNXu8C73ztQPfHviLZFasD0YRsaA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-429IjLh_MPGFhhdBHsezAQ-1; Tue, 08 Nov 2022 08:52:07 -0500
X-MC-Unique: 429IjLh_MPGFhhdBHsezAQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso9656947qvr.0
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 05:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JUXBO6HtmcRpZLIv41x7COPzthebfsMZLx5bmXnfKVk=;
 b=mq2Wcs2hm2xiKZqHuNeuJF3HNp4fqReN0+voSAeaxRp8BPEUVVkGTlVIrVg6/BCC+5
 CF1AogRzf0diA5j1zgaDGjpYfAWKF+eNV18q15q60aOfur3DptTuSqvgPItcTElxr2C8
 PTA8eL0DVJbJvwomWH/Hpr1gDcBaeQItqMiThRePQQBfAsiFlSugjBG5MyNr6ifbisbb
 M1u4Ue/KxcovJM9GXNZ2AIraYCRQE6SJYL7ftiSeCwHSalyLMKVvf88pOGgucrDGku2G
 J4Kdm4WXLjCoyFQrqSDIgnH8GpohczSjzyXtrbu6eDp3mt6nJHiaFDi3y+LNHZUoJZGo
 b2lw==
X-Gm-Message-State: ACrzQf34exhZSlX+GK5dyrqAIqW0K7KSYWDpjklptuf/lgCAeurR/C/U
 p5HOhTcDPzpPSGEq84rDrBOi93lGD+KXqMMOGTYYitwpWNJkxi9ZP4VFaABMNtyg8XaNzvqrSUB
 J9rKg/w7F9Qr2V+QGU50yfNMKAuuIM6/y284OT1w9lGRhhfgmAqQZv96IFtqe
X-Received: by 2002:a05:620a:404c:b0:6d9:9fa1:535e with SMTP id
 i12-20020a05620a404c00b006d99fa1535emr40395364qko.509.1667915526516; 
 Tue, 08 Nov 2022 05:52:06 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7eIw/j43LCuceJ+5ZOyx3Ipj4RcuXtX4HQ+/TfD4oRobAFgCEoqvefUop3mP3MCfBteiLLTw==
X-Received: by 2002:a05:620a:404c:b0:6d9:9fa1:535e with SMTP id
 i12-20020a05620a404c00b006d99fa1535emr40395337qko.509.1667915526180; 
 Tue, 08 Nov 2022 05:52:06 -0800 (PST)
Received: from redhat.com ([138.199.52.3]) by smtp.gmail.com with ESMTPSA id
 j129-20020a37b987000000b006cdd0939ffbsm9113782qkf.86.2022.11.08.05.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 05:52:05 -0800 (PST)
Date: Tue, 8 Nov 2022 08:52:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] checkpatch: typo fix
Message-ID: <20221108135155.1121566-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

remove inline #inline - it's an obvious typo. Should just be remove
inline.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bc7d4780ec..6ecabfb2b5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1682,7 +1682,7 @@ sub process {
 
 		# Block comments use /* on a line of its own
 		my $commentline = $rawline;
-		while ($commentline =~ s@^(\+.*)/\*.*\*/@$1@o) { # remove inline #inline /*...*/
+		while ($commentline =~ s@^(\+.*)/\*.*\*/@$1@o) { # remove inline /*...*/
 		}
 		if ($commentline =~ m@^\+.*/\*\*?+[ \t]*[^ \t]@) { # /* or /** non-blank
 			WARN("Block comments use a leading /* on a separate line\n" . $herecurr);
-- 
MST


