Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B150B61F6D3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 15:56:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os3Xt-0005bh-1y; Mon, 07 Nov 2022 09:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os3Xq-0005ZO-TH
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:56:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os3Xp-0004X7-7q
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 09:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667832972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=zvp/LUJy0xQWoDecCHuWOwBRWdd+un76dTKaeJS+BgA=;
 b=a7Uu1e2u6QBm0q9kKj7/NGu2lems+vd5n1xkv+fJcFFTAVdNzjjeAj4SJpIL3tywBw5Yuz
 gIuglDnEzIsjgvDP3K1PItBwBy9jWHTFh4LdixqfgPCHwd0ZaAusQErOFTnQ4NNYclwg0c
 RKX8DwxueMc2hMFrM76zxGgOP4/oOaU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-N6--5sABNj6EU9hAdDGIng-1; Mon, 07 Nov 2022 09:56:11 -0500
X-MC-Unique: N6--5sABNj6EU9hAdDGIng-1
Received: by mail-wr1-f72.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so2895283wra.22
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 06:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zvp/LUJy0xQWoDecCHuWOwBRWdd+un76dTKaeJS+BgA=;
 b=fDrlRrTGSLAYoEJuXrwQmF//7WtUBjBXScSRrYV7CTiQozD+VVLXhNTyrEJrEUNUCJ
 gl6QPio4DAijIH5CT02znf9KvWxQ/R+/F1wNE4rhD5jHar7w0IG6FI3hLrtIJ1ymI/Jf
 +FhAmP+WGgk34MRdfzTlSE5x1TVjJJmfUN2B75CvnftiwnxVgJtpUZfOwUkxBkHw/Zvw
 uVg4HNAGc5CooUB2/xRPPKhNFCqLyLVp3dnKjgszkaBkkwOHTkLFYG1NqdaNHvIchUh+
 Tnr3dzycjTrHdAHvhfigvszqhu3Z4mYNxJsG5fYL0xwLql++iDp8KAgQCfLlkkpef21W
 OgkQ==
X-Gm-Message-State: ACrzQf3cWg1B3PAcog4UCf1S3YzE79lGDeUS1cphbrLMCZsfhYXx1CTN
 vkxePSGB+q0QS1TzGu8u2erBW3Wl4adUarx8vGGF3eKfwxr2I+oBE0sn554aybmkFLNqSyuMcBr
 dELLP70GtngXKoU6D5UXIB8FsUWnZNQCtqxpTCvm0x5sN1VVEfUuXZ28o34Dm
X-Received: by 2002:adf:f70b:0:b0:236:f367:920f with SMTP id
 r11-20020adff70b000000b00236f367920fmr17616797wrp.129.1667832969811; 
 Mon, 07 Nov 2022 06:56:09 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7VLYlYKitMosIQ4XJs2B7a6mEaMY0Y8Gl0EcXCDBBlOi/daOLEkQ95eotqMNfhXvAOu+U+oQ==
X-Received: by 2002:adf:f70b:0:b0:236:f367:920f with SMTP id
 r11-20020adff70b000000b00236f367920fmr17616778wrp.129.1667832969473; 
 Mon, 07 Nov 2022 06:56:09 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 p14-20020adff20e000000b0022e344a63c7sm7616792wro.92.2022.11.07.06.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 06:56:09 -0800 (PST)
Date: Mon, 7 Nov 2022 09:56:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] checkpatch: better pattern for inline comments
Message-ID: <20221107145600.566503-1-mst@redhat.com>
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
 scripts/checkpatch.pl | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e3e3b43076..be37c9e0bf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1681,10 +1681,15 @@ sub process {
 # Block comment styles
 
 		# Block comments use /* on a line of its own
-		if ($rawline !~ m@^\+.*/\*.*\*/[ \t)}]*$@ &&	#inline /*...*/
-		    $rawline =~ m@^\+.*/\*\*?+[ \t]*[^ \t]@) { # /* or /** non-blank
-			WARN("Block comments use a leading /* on a separate line\n" . $herecurr);
-		}
+		{
+                    # remove inline #inline /*...*/
+                    my $commentline = $rawline;
+                    while ($commentline =~ s@^(\+.*)/\*.*\*/@$1@o) {
+                    }
+                    if ($commentline =~ m@^\+.*/\*\*?+[ \t]*[^ \t]@) { # /* or /** non-blank
+                            WARN("Block comments use a leading /* on a separate line\n" . $herecurr);
+                    }
+                }
 
 # Block comments use * on subsequent lines
 		if ($prevline =~ /$;[ \t]*$/ &&			#ends in comment
-- 
MST


