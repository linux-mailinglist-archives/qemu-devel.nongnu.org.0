Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0206D6203C9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:31:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB0x-0006j4-S8; Mon, 07 Nov 2022 17:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0v-0006gM-9t
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0t-0006ur-8n
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lzAVXaFvxvOqn7nHsXw4bM3M0iuHcWI5pt2PzDrK97g=;
 b=Oz03PzngNxH0do8ipyXjIH0mWnDDzKIhiy0BTNH93ddru99myXiQmgUFeBomUmC1CtTnhZ
 VaN//BtCT28Rds8H1FUkhQ7Fy/VaR+Ug/fA0MNmhP1Dlla3/Lcijgdkiwvv3divfJCH17j
 f/AC5mbW4lOjUAYFAbBEk8qgO7Kbu7g=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-223-uyRWRydBOnu6hlhfTsn-CA-1; Mon, 07 Nov 2022 17:54:34 -0500
X-MC-Unique: uyRWRydBOnu6hlhfTsn-CA-1
Received: by mail-qk1-f200.google.com with SMTP id
 j13-20020a05620a410d00b006e08208eb31so11328414qko.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzAVXaFvxvOqn7nHsXw4bM3M0iuHcWI5pt2PzDrK97g=;
 b=meeM+ebwzdQKwkwOJ8U+s1ueeaJOSZj9mw0+vH8JGs8gsQDGzco+mmdUqi9ZCxgFrs
 Yeq75uwmJECHPyIjBlE9HfE72/l+5KHtM6QsptSOT1c7uj1dHpO28PuJKsTSOQmMMQ3e
 fyyTVIDiOfBHdJ1kl4OSdIAt2sTCafEdqLf2pJ7tL/CjeNenU2TfRlCRtmECzk4QUFsT
 OrpY/BtkpopynPXXSKpTHwdZYccaop5Gqz0w70ZvzsXb0l9fqWAlft9HENIhXMr8Ad5r
 oHKAqMAzSch/4O+gSCBcZtDv1EKxcmbVbsieENLRe8CZ4TydEOPVywsUFUfonUStmquD
 stlA==
X-Gm-Message-State: ACrzQf1eUCSqGSZu5yzzRo7gWKpbUZA3IZ8hmIy9e1OrQE5kEc0ILNVd
 PAkVHDKQyBeCP1o0WJcrQBPcWvrYTD/fOzlfePgxDOAp7yOIl5ZVA+FVFfNYPS5clR051pg10Wu
 /K4nqydD3KhOL3P4n4S3uVjPDH5Ko8SM1D/3l3xfM5tPl6clKnwwdxPJocXtH
X-Received: by 2002:ac8:5746:0:b0:39c:deac:c69c with SMTP id
 6-20020ac85746000000b0039cdeacc69cmr41228623qtx.292.1667861673417; 
 Mon, 07 Nov 2022 14:54:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7dY/c5DgCV4on6V+4EYTwYHGqGS3OfW/69pT3i/vtKKyLR/E2FXVRf+fu1ym5pOowiQkrQjw==
X-Received: by 2002:ac8:5746:0:b0:39c:deac:c69c with SMTP id
 6-20020ac85746000000b0039cdeacc69cmr41228606qtx.292.1667861673110; 
 Mon, 07 Nov 2022 14:54:33 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 x25-20020ac84d59000000b003a4f14378d1sm6877867qtv.33.2022.11.07.14.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:54:32 -0800 (PST)
Date: Mon, 7 Nov 2022 17:54:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL v4 83/83] checkpatch: better pattern for inline comments
Message-ID: <20221107224600.934080-84-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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


