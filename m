Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5892A426A2A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:53:00 +0200 (CEST)
Received: from localhost ([::1]:59636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoQt-0006cO-BF
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJc-0006GE-8w
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:29 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:35291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJX-0006wo-Rq
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:26 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFKX3-1mWrJQ2ZmT-00FiNH; Fri, 08
 Oct 2021 13:45:21 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] macfb: fix overflow of color_palette array
Date: Fri,  8 Oct 2021 13:45:09 +0200
Message-Id: <20211008114518.757615-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008114518.757615-1-laurent@vivier.eu>
References: <20211008114518.757615-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2zNOwlwd1PfnPqmBw8BdLlZtUT2N/oR9KExfZH28VwiF6v/OUxx
 qgRYJFwYIBptn23TvYgj2hWq2zivPRC2haM61MN6XMqX9nUneLoGwwwwjusqDpbCujW/Or8
 CcRqSdVofZUM0WunmhVrPb8XOUGDm5xyvSEcb8vvA6Meyz1SqYfEiB3ll6JRyuRoZZuRb8S
 d5cv6O4oxzcj9ZsZjV75Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I3aqEsHuMEM=:esJOlYJFBp4TxBV0+wt7X3
 Wt3KtKV4QoAicfczlWzIl/zi08UB2DeJ6a91vJmbUhG2PWRGJpIC074UGOm3mduSxYfdsPquq
 M5HbHrbBE8sgDKcILVY6roxRlK3Uuzfcw+oWM4fECxZcqH7szmInRxFfWBCUeSN+YVb2VUxgo
 6jKAQ1eYaxS6YujgQ2V8TMG5sUrSOIllZDoQYzEGLmSJR736y0SLDs2vc23Bwi6oEHMjq0gfZ
 dUrMAH1/8uKM36AvOk/9k7sJ5lLFrUosSCY+5lQFPVE4XsM6LOZVyrxDtoqG/UUme2tK6ciRt
 paBJ1BHsEKE6/DDAWpZ4qBCiVLEqpLDevdRzlKbSLRywQj6qYThGDq7MutEoEo9zkGtizcFXW
 IdXMVPg4LNGZcGeq2PG897hKHVj1M3WdtZzS2GCksssNDHJS9gUgCuiQPJx4/6uJ/a5FD/RlU
 0wnCIxgPfsC7LTuLU7SvIXLwcjEj/h8nJc0QrWyJ0/ZQ5AOHTkYG4VpoMRD//EMTZS7TSaflb
 fbivH4ZrQpVajsXnBravfawGpfbbL1PDACxhKSNonzdkLPgfG96M2qpptvkzIVskB/sk2DSOj
 XZ8eHk7e8niTwpW6SJ3xqfrgnKOcNugdeyGE3+eiL4D0DMOci37PgQ5Jx+11AUBxFz4jQAGhx
 J73OlmjcWrQhylEdSiOUDuL2dnEHdwSBM30rItfyGU0WMWXKX+3iGU16OGkPIfsyF3tFYYPcl
 cYb8nIyO4gvBhXmoK4PF2q2cfgH0rOFg48nYCw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The palette_current index counter has a maximum size of 256 * 3 to cover a full
color palette of 256 RGB entries. Linux assumes that the palette_current index
wraps back around to zero after writing 256 RGB entries so ensure that
palette_current is reset at this point to prevent data corruption within
MacfbState.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211007221253.29024-5-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/macfb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index b363bab8896a..39dab49026c3 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -303,7 +303,9 @@ static void macfb_ctrl_write(void *opaque,
         s->palette_current = 0;
         break;
     case DAFB_LUT:
-        s->color_palette[s->palette_current++] = val;
+        s->color_palette[s->palette_current] = val;
+        s->palette_current = (s->palette_current + 1) %
+                             ARRAY_SIZE(s->color_palette);
         if (s->palette_current % 3) {
             macfb_invalidate_display(s);
         }
-- 
2.31.1


