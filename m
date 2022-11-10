Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB6F624C87
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 22:07:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otEkx-0005Zc-QU; Thu, 10 Nov 2022 16:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEks-0005WJ-MA
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:06:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1otEkq-0005jR-Ur
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 16:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668114391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TRFsfwwAx0e8eqQuXPPVh7MDILx3c7Ch1bJHyt5QCUs=;
 b=LjeGYkR6WxMOEnrieXaUNxVT6sbRYjensM0AZzx84X/Ok4tbmgZ5Dh+zsSqxreYYUXZl4C
 TQn7lFxDEIITOFpiEWAu0J6M73C+XLZmKduKPImNGKedlW1WsfOlGrYeR08CEjnl0Ggw4v
 8A2jLhTT8/XelZDbSSoxhvosxCVir0Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-pzh_oiDuO5y9wG2z7KKRmQ-1; Thu, 10 Nov 2022 16:06:30 -0500
X-MC-Unique: pzh_oiDuO5y9wG2z7KKRmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u9-20020a05600c00c900b003cfb12839d6so1016957wmm.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 13:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TRFsfwwAx0e8eqQuXPPVh7MDILx3c7Ch1bJHyt5QCUs=;
 b=CXo+/kp1PYQTFn3dojVspOlbWVZZxETQlqe+5lCRcqodPLfBf2+mTXYtkW0TaOaoxv
 LthupR1dlxPx13TpYo68e0dodCcZizzQRO5DtfWbRj4mc5Fo6vbgWplclZnX6tC7Wb6i
 X8gFDV+4mE4DGCUseFOUmtNjX2/kskB0MJmNtexSeDnRDTnfgLaQKuuKuivsCyQzrwIF
 HoYnNmFCWy0rRu+rPo4hxhY1j4RMoR8ciN0pvP8lqr0niOy7peth0HtqlOh+e4kFrLgm
 Rba+H6cpDYG2AkaIM16BjL8v1B0452L7CKGh8jPogI3b4F7ELg1quoT3pKFeCQFspdKT
 SEcA==
X-Gm-Message-State: ACrzQf3shPHrx3QbAI+X0pzprH7oFxemBVdRS8PVFnZnzSw44WFnyDOG
 1s3P6L4JvfgxdFoRo0NIESSOyuVtjfnRI0y2iC0LKq6ey3D1ttxRe6jUGYOinhlubtr4Pef6Ym5
 FrN/ptQ+gRw8lyjFbgD2i6DJfRENVuXdOXcKfH8QQj9MSl1w/GmX0ExYz29vS
X-Received: by 2002:adf:db4d:0:b0:236:699b:be5e with SMTP id
 f13-20020adfdb4d000000b00236699bbe5emr40835250wrj.147.1668114388636; 
 Thu, 10 Nov 2022 13:06:28 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4wOJcv/Jlkx1m0eCRyXtZT/Tt5AZSHbHcJXBjJ07tVl283DFQ06N+GjkiCAeoziCGfGIUW3Q==
X-Received: by 2002:adf:db4d:0:b0:236:699b:be5e with SMTP id
 f13-20020adfdb4d000000b00236699bbe5emr40835235wrj.147.1668114388413; 
 Thu, 10 Nov 2022 13:06:28 -0800 (PST)
Received: from redhat.com ([2.52.3.250]) by smtp.gmail.com with ESMTPSA id
 p1-20020a1c5441000000b003b4868eb71bsm6216790wmi.25.2022.11.10.13.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 13:06:27 -0800 (PST)
Date: Thu, 10 Nov 2022 16:06:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 1/3] checkpatch: typo fix
Message-ID: <20221110210428.137015-2-mst@redhat.com>
References: <20221110210428.137015-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110210428.137015-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

Fixes: 1ef47f40dc ("checkpatch: better pattern for inline comments")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221108135155.1121566-1-mst@redhat.com>
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


