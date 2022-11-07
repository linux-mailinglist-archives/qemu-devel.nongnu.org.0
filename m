Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E528D61FEA3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 20:28:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os7m5-0002dy-T1; Mon, 07 Nov 2022 14:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os7m3-0002dp-Tg
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 14:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os7m2-0006LL-BV
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 14:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667849229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5ThdCAu1sYxnlkDWkaeXyRpXUCBpaIJehe6JiX+JUZY=;
 b=jO2D1CJNXI9Ibw5dOZtFo1N+EE3VAfr9p+0xjdsgIzOzqu64A77BIvcmb35iE0mIWFmjeR
 OGqpqaQy0F/pSNxN29UeMFcGRNsuvYDLNYh3lbROiNYmMa7H6AuEyEvHxQ6j23WUIdIidv
 uwpEn+KwZ+kJd6SgEAIqqB7T0uqW2+A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-5YvkXX4mOFiuLfLKTxUssw-1; Mon, 07 Nov 2022 14:27:08 -0500
X-MC-Unique: 5YvkXX4mOFiuLfLKTxUssw-1
Received: by mail-wm1-f72.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso6207240wms.5
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 11:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ThdCAu1sYxnlkDWkaeXyRpXUCBpaIJehe6JiX+JUZY=;
 b=Q/ZRNbawP/hvw4enAZJUx3bughohZ8ez04aoW1vLMEhKZhUVqMyPxZQgIyCq9tOv24
 zfEMjw3vQMIRbt6NaGHdUDlXgxKJdzjm6G399UQWgtQ4gcJw733HkPiuyrOxNS2uGblq
 koLpFHHiCRuiy5fDy5eVolSuyc/PlNXXODKD6NztQhOhpTBsaW07PEHGcrKfSkHhLTTD
 uEXpXWXilxTE9kmO4zPkmT9xMj8H0po7ejli1EhMZIW5QVnXRE5QqBLpNfxLCpBH0qeZ
 R2QdX0bvyJ5wRDGhi6U871LtfLnlbG8niAWG0G+dp7Rss/UPmpZM53WOaXquBK/4Ut34
 fU7Q==
X-Gm-Message-State: ACrzQf31MzIZsO3KiMob26KR2o7dqaduWrTJWJXsuOyQ3tlAN9ToV1kL
 x6z6vqhXQf6h5egTFznIESBAOfDyiV6++4lm0x3YR0FwZvFat4K9RDE9KBFLNAqj9H2Y1y4gVCe
 HnCZy/XhsLw4jOVA1EvThVrynmF8e4FaDirg1hXCZcnGs6djBqZRqrMiTlXBu
X-Received: by 2002:a5d:6e8e:0:b0:220:5fa1:d508 with SMTP id
 k14-20020a5d6e8e000000b002205fa1d508mr34271866wrz.337.1667849226470; 
 Mon, 07 Nov 2022 11:27:06 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7svjsLLVb1mNpLmIbCFLcXJUncSVI6X30Kd35q8Hl2o7YcvE81kvLaMWFqDrvlxXJFOhvsGg==
X-Received: by 2002:a5d:6e8e:0:b0:220:5fa1:d508 with SMTP id
 k14-20020a5d6e8e000000b002205fa1d508mr34271835wrz.337.1667849226127; 
 Mon, 07 Nov 2022 11:27:06 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c1c1600b003a6125562e1sm9587138wms.46.2022.11.07.11.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 11:27:05 -0800 (PST)
Date: Mon, 7 Nov 2022 14:27:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2] checkpatch: better pattern for inline comments
Message-ID: <20221107192635.919171-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

checkpatch is unhappy about this line:

    WARNING: Block comments use a leading /* on a separate line
    #50: FILE: hw/acpi/nvdimm.c:1074:
    +                   aml_equal(aml_sizeof(pckg), aml_int(1)) /* 1 element? */));

but there's nothing wrong with it - the check is just too simplistic. It
will also miss lines which mix inline and block comments.

Instead, let's strip all inline comments from a line and then check for block
comments.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

changes from v1:
    indendation fixes (in script itself)

 scripts/checkpatch.pl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e3e3b43076..bc7d4780ec 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1681,8 +1681,10 @@ sub process {
 # Block comment styles
 
 		# Block comments use /* on a line of its own
-		if ($rawline !~ m@^\+.*/\*.*\*/[ \t)}]*$@ &&	#inline /*...*/
-		    $rawline =~ m@^\+.*/\*\*?+[ \t]*[^ \t]@) { # /* or /** non-blank
+		my $commentline = $rawline;
+		while ($commentline =~ s@^(\+.*)/\*.*\*/@$1@o) { # remove inline #inline /*...*/
+		}
+		if ($commentline =~ m@^\+.*/\*\*?+[ \t]*[^ \t]@) { # /* or /** non-blank
 			WARN("Block comments use a leading /* on a separate line\n" . $herecurr);
 		}
 
-- 
MST


