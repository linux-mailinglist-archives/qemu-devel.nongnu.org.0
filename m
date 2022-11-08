Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3B462098C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 07:22:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osHyh-00011s-Uh; Tue, 08 Nov 2022 01:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osHyR-0000yD-A4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 01:20:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osHyP-0007S7-Dt
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 01:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667888436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dS5X8RzNNTU71Fsv+Qh5tN0rUKj0N2KhqVD8kCP/X/w=;
 b=OSfAV3Of2CJfP0lRxZh0MSqbGAgzgzJAhvL3SwEpUI9cCCgpQA1R4Z2J0ame7cJWc06iF+
 R7uQtmebafBOP50/zWwkpMCOcdHUjxWYhzRVlADOChSJUyurLDNm5sCvVrY/Pqrg/V4GVe
 Wkpx4zFRfD1Yw7vu+6JVFu84R9mR75U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-nUFX2fcsNni67WUYojS9VQ-1; Tue, 08 Nov 2022 01:20:35 -0500
X-MC-Unique: nUFX2fcsNni67WUYojS9VQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 h1-20020a0ceda1000000b004b899df67a4so8998704qvr.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 22:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dS5X8RzNNTU71Fsv+Qh5tN0rUKj0N2KhqVD8kCP/X/w=;
 b=F4bM/AlHRibqbSH3q38JMQ9/C+ZjpcRGz+JrcEXqUmBFfAOroCqqeqjWEtAuTivVSi
 RTR1NxmlfR+JK7riNO+Bu18o/TLQIQ06lf6x58p2r/c2d9j2eOqSzD88BvRqlJXVBi6x
 5z98MlCbqQrPoOw57JD7mU+b1tazKnQDj9SrSmMfIQIsjJyWaHojqArVzuZaM+IsBGse
 6wKuEkrycW3KNE7YdjUdGm6HJpZ+16OjuCONgO2RGz+vpSXrS5tBLnNHkbJm7yIeoy+d
 VGWwR3kOpvadJOkOx5/on54mHJx8vcQ7XrQBWbW3WbErawjsPfA5L+pHowrbnBu9Q8cS
 nOdg==
X-Gm-Message-State: ACrzQf03H4suKmxkNMfsuN1NX7jGqWcVFrAwcbv0F5psen50GUwdYXQ5
 hhxoIHwoRJ548DBFhCQDGmqu4oBKN36FpSBc0/WqFxiTfVkaQAmLf7Ij+QrMtUxTWAQ2XWHzT0p
 PxLcsoGeZupqDrF0S/GIBNMx3AiUWI6t/cmsX85xFKs09fWV2cLg4l2yvHMbz
X-Received: by 2002:a0c:a9cb:0:b0:4b4:746d:c0e7 with SMTP id
 c11-20020a0ca9cb000000b004b4746dc0e7mr48268486qvb.48.1667888434880; 
 Mon, 07 Nov 2022 22:20:34 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4cg//iv1MbYz2412xJbWulxsVCWuFDYKCywl7J7mil7KfeA3UZW/hxBlRryWmey+nanFxx1Q==
X-Received: by 2002:a0c:a9cb:0:b0:4b4:746d:c0e7 with SMTP id
 c11-20020a0ca9cb000000b004b4746dc0e7mr48268472qvb.48.1667888434589; 
 Mon, 07 Nov 2022 22:20:34 -0800 (PST)
Received: from redhat.com ([138.199.52.3]) by smtp.gmail.com with ESMTPSA id
 z10-20020ac87caa000000b003a50d92f9b4sm7644693qtv.1.2022.11.07.22.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 22:20:33 -0800 (PST)
Date: Tue, 8 Nov 2022 01:20:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3] checkpatch: better pattern for inline comments
Message-ID: <20221108061959.946298-1-mst@redhat.com>
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

since v2:
    fix typo in a comment

 scripts/checkpatch.pl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e3e3b43076..6ecabfb2b5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1681,8 +1681,10 @@ sub process {
 # Block comment styles
 
 		# Block comments use /* on a line of its own
-		if ($rawline !~ m@^\+.*/\*.*\*/[ \t)}]*$@ &&	#inline /*...*/
-		    $rawline =~ m@^\+.*/\*\*?+[ \t]*[^ \t]@) { # /* or /** non-blank
+		my $commentline = $rawline;
+		while ($commentline =~ s@^(\+.*)/\*.*\*/@$1@o) { # remove inline /*...*/
+		}
+		if ($commentline =~ m@^\+.*/\*\*?+[ \t]*[^ \t]@) { # /* or /** non-blank
 			WARN("Block comments use a leading /* on a separate line\n" . $herecurr);
 		}
 
-- 
MST


