Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9AC958D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 02:22:08 +0200 (CEST)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFosh-0004gR-Tt
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 20:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mattkilgore12@gmail.com>) id 1iFoqy-0003fi-9P
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 20:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mattkilgore12@gmail.com>) id 1iFoqv-0006xj-4q
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 20:20:18 -0400
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:45221)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mattkilgore12@gmail.com>)
 id 1iFoqu-0006wM-Tp
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 20:20:17 -0400
Received: by mail-io1-xd43.google.com with SMTP id c25so1422863iot.12
 for <qemu-devel@nongnu.org>; Wed, 02 Oct 2019 17:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZpL2QlrOfFOoBcw03WcvmeK1nzE30tInidheJ6LmBg=;
 b=mgalxweaQfGmIswtya5ZXm+uyKlJ6pcxYumNN6/UzdnbYs7aAznWwjePRQbuWxZnad
 evgXP8TDNUb2IRzIQkL1607xQbBwqEcyxYoVvUNhXJeBlwaW0JzfL1zLneHCjDDt3O7l
 uv+aWKcMhlhTBUwpUGHnZTkdCzlFoU4YlMh0zH2j+vffp2CUqx8BaueWcwDtXs5a3Tls
 ApevEKI4894AR8jO7NGL+PRrDhPCw/FSMYhvjXHynHACj/wjqPkYADvFb3z7eifYw85W
 6q8JhHQXtSu6HVgjidZX50549C3FjspJATtkKbYSx96pfvpeyqB8PfHpCiGbHPLeT7+4
 3+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZpL2QlrOfFOoBcw03WcvmeK1nzE30tInidheJ6LmBg=;
 b=lsiLR8zQ1+FprF9oP887wnX6HT2w0K7H8KnhIFLDGde/kkHGXx12T1DFdM4wCU7Lax
 3gXn64MzP/HNMVwpq50rNWDOJlgsf53oW6nbbvLHML3DYu8YmfdroD7c3kVYPE8sUCAs
 LOapPpqigqk9Qya5wge7Vm53S7UzKssdUnkcfaPHbNa/SiewzfbSz9gIfrZVMYkwsJkl
 ukw+qS+wWwbAUhSg7f+Df7aZiYZQETtkEjR24QsY3czO4U0DHoEQDMfx36EdTOvS3bJi
 YZaIq0JqHBxGX/nAAE06D42SkFqWWiOSjDj9Oh6dksfpN+eckq4GEYgyvxjayxVG+gLd
 pTnw==
X-Gm-Message-State: APjAAAV0falcTH/PiO+kELsU2Yc98PsVTkvK+1UpuNhAvg9Utx0iAeQ2
 XPFRF9Aj9xqm7DZEOD5aW2OP4MDg
X-Google-Smtp-Source: APXvYqy+wz7UbYMt9adLlg9IaW2uqY5KKgedcdUFy6peoHdi3g6m+sC0HEAJTqAt4uwiLY0sLrSNrg==
X-Received: by 2002:a92:b09:: with SMTP id b9mr6788186ilf.122.1570062014530;
 Wed, 02 Oct 2019 17:20:14 -0700 (PDT)
Received: from matt-laptop3.localdomain (d118-75-38-58.col.wideopenwest.com.
 [75.118.58.38])
 by smtp.gmail.com with ESMTPSA id u204sm303673iod.50.2019.10.02.17.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 17:20:13 -0700 (PDT)
From: Matthew Kilgore <mattkilgore12@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] curses: correctly pass color and attributes to setcchar()
Date: Wed,  2 Oct 2019 20:18:49 -0400
Message-Id: <20191003001849.7109-1-mattkilgore12@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
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
Cc: samuel.thibault@ens-lyon.org, Matthew Kilgore <mattkilgore12@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current code uses getcchar() and setcchar() to handle the cchar_t
values, which is correct, however it incorrectly deconstructs the chtype
value that it then passes to setcchar():

    1. The bit mask 0xff against the chtype is not guaranteed to be
       correct. curses provides the 'A_ATTRIBUTES' and 'A_CHARTEXT' masks
       to do this.

    2. The color pair has to be passed to setcchar() separately, any color
       pair provided in the attributes is ignored.

The first point is not that big of a deal, the 0xff mask is very likely
to be correct. The second issue however results in colors no longer
working when using the curses display, instead the text will always be
white on black.

This patch fixes the color issue by using PAIR_NUMBER() to retrieve the
color pair number from the chtype value, and then passes that number to
setcchar. Along with that, the hardcoded 0xff masks are replaced with
A_ATTRIBUTES and A_CHARTEXT.

Signed-off-by: Matthew Kilgore <mattkilgore12@gmail.com>
---
 ui/curses.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/ui/curses.c b/ui/curses.c
index ec281125acbd..3a1b71451c93 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -75,14 +75,16 @@ static void curses_update(DisplayChangeListener *dcl,
     line = screen + y * width;
     for (h += y; y < h; y ++, line += width) {
         for (x = 0; x < width; x++) {
-            chtype ch = line[x] & 0xff;
-            chtype at = line[x] & ~0xff;
+            chtype ch = line[x] & A_CHARTEXT;
+            chtype at = line[x] & A_ATTRIBUTES;
+            short color_pair = PAIR_NUMBER(line[x]);
+
             ret = getcchar(&vga_to_curses[ch], wch, &attrs, &colors, NULL);
             if (ret == ERR || wch[0] == 0) {
                 wch[0] = ch;
                 wch[1] = 0;
             }
-            setcchar(&curses_line[x], wch, at, 0, NULL);
+            setcchar(&curses_line[x], wch, at, color_pair, NULL);
         }
         mvwadd_wchnstr(screenpad, y, 0, curses_line, width);
     }
-- 
2.23.0


