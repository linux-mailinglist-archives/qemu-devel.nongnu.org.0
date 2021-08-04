Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66DC3DF8C5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 02:12:48 +0200 (CEST)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB4Wd-0007E6-Dt
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 20:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mB4Vr-0006SZ-7x
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 20:11:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mB4Vn-0001Lv-OM
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 20:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628035914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EttMs1S6dNhnHDvG7GR5Mp3AxpFFQc4flIVFXgGhcdc=;
 b=Im376HO7h+mbjSZCjoDMATqgabXfH8Y65RL22DzmA5lC0XTqUnFd/7CsX+PffZoiBtWJL3
 5HSq/GTOOFS+wnQwZhC/Ht+oUVKxuAbxD1L2VFVHv7C0TNruuFTtYAurlPRXxCOr1nAGap
 jAfrUhyH+6hsOkL/X3eywY6QhfRXXKY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-FEyUfxwwN-KnMHzXme4qJw-1; Tue, 03 Aug 2021 20:11:53 -0400
X-MC-Unique: FEyUfxwwN-KnMHzXme4qJw-1
Received: by mail-qv1-f69.google.com with SMTP id
 o32-20020a0c85a30000b0290328f91ede2bso445196qva.1
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 17:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EttMs1S6dNhnHDvG7GR5Mp3AxpFFQc4flIVFXgGhcdc=;
 b=PnXRmKfUKTrm2Cr8KCuOjvLfldzNGVnSkTlCim0LPTPcRRnf8MVfEugZtNGP8k8KGC
 oUnkCRWT2/Wb96d1TA6spXLVJykFQqOTgZ95veA/WndLcXMzZFEkEXfjiSHDZZqjS3Ng
 jlg5nLiiATDSLErNCu1FwC2hRynWSZ1zTTccp+yq6LOwWoy7YoFVGPt1vBJldt1r2ve9
 3PVvwzWqQvimzSnpBU6ISrpVdkU8r1o8Z0mUGL0WXorrVE/HS0LKs514waa4lWzoyFK6
 aL9FkHLVlxq6QVXKwka+7KOUU2l7eLEGLFPULB2zygRyFdrhFbLcQj7dEASO0z6lSGGe
 wz6A==
X-Gm-Message-State: AOAM5310RA+0TdroAJ0dUZJqh8mM6A7x78cvhokcu/iAHXdXcqtiR8Ej
 pDLUEYH3Mcp5ecv0aYlj2bTZ8P/xJsS1X+lvTGIsJHbhEPLUSviLsYFhhPDxIdUtIFp3uVup1Lh
 uf7yoOWjKU2JdpYQ=
X-Received: by 2002:a05:6214:1142:: with SMTP id
 b2mr24290395qvt.0.1628035912842; 
 Tue, 03 Aug 2021 17:11:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPcy8F5ujFXDr75kbRuJ6WlTSB/yDzzLRb5cqp6WRjQJFGmqbtYFBBMNuGez8RkjW5NphZTg==
X-Received: by 2002:a05:6214:1142:: with SMTP id
 b2mr24290370qvt.0.1628035912587; 
 Tue, 03 Aug 2021 17:11:52 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-92-76-70-75-133.dsl.bell.ca.
 [76.70.75.133])
 by smtp.gmail.com with ESMTPSA id x10sm333028qkf.91.2021.08.03.17.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 17:11:52 -0700 (PDT)
Date: Tue, 3 Aug 2021 20:11:51 -0400
From: Peter Xu <peterx@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] Makefile: Fix cscope issues on MacOS and soft links
Message-ID: <YQnbR0DR3W+pXJ+r@t490s>
References: <20210801171144.60412-1-peterx@redhat.com>
 <87a6lyf9ux.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87a6lyf9ux.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Alex,

On Tue, Aug 03, 2021 at 11:18:36PM +0100, Alex Bennée wrote:
> 
> Peter Xu <peterx@redhat.com> writes:
> 
> > This patch fixes actually two issues with 'make cscope'.
> >
> > Firstly, it fixes the command for MacOS "find" command as MacOS will append the
> > full path of "$(SRC_PATH)/" before each found entry, then after the final "./"
> > replacement trick it'll look like (e.g., "qapi/qmp-dispatch.c"):
> >
> >   /qapi/qmp-dispatch.c
> >
> > Which will point to the root directory instead.
> >
> > Fix it by simply remove the "/" in "$(SRC_PATH)/" of "find-src-path", then
> > it'll work for at least both Linux and MacOS.
> >
> > The other OS-independent issue is to start proactively ignoring soft links when
> > generating tags, otherwise by default on master branch we'll see this error
> > when "make cscope":
> >
> > cscope: cannot find file subprojects/libvhost-user/include/atomic.h
> >
> > This patch should fix the two issues altogether.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 401c623a65..5562a9b464 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -229,7 +229,8 @@ distclean: clean
> >  	rm -f linux-headers/asm
> >  	rm -Rf .sdk
> >  
> > -find-src-path = find "$(SRC_PATH)/" -path "$(SRC_PATH)/meson" -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
> > +find-src-path = find "$(SRC_PATH)" -path "$(SRC_PATH)/meson" -prune -o \
> > +	-type l -prune -o \( -name "*.[chsS]" -o -name "*.[ch].inc" \)
> 
> The second half of the change causes my "make gtags" to descend down
> build directories and complain about unindexed files.

Would this help?

---8<---
diff --git a/Makefile b/Makefile
index 5562a9b464..eeb21f0e6a 100644
--- a/Makefile
+++ b/Makefile
@@ -251,7 +251,7 @@ gtags:
                "GTAGS", "Remove old $@ files")
        $(call quiet-command,                           \
                (cd $(SRC_PATH) &&                      \
-                $(find-src-path) | gtags -f -),        \
+                $(find-src-path) -print | gtags -f -), \
                "GTAGS", "Re-index $(SRC_PATH)")
 
 .PHONY: TAGS
---8<---

For some reason, "make gtags" didn't use "-print" as the last expression.  My
understanding is when expression is not specified, then it's default will be
"-print".  However for some reason it acts like that when "-print" is not there
all the "-prone" expressions are not really behaving.  Above does work for me,
but frankly I don't really know enough on how "find" works here.

If you agree, I can repost a v2 with that squashed.

Thanks,

-- 
Peter Xu


