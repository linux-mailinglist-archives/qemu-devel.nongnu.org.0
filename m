Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC312B845F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:08:30 +0100 (CET)
Received: from localhost ([::1]:51610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSof-0000Ap-HP
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:08:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfSkl-0007Oh-MD
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:04:27 -0500
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:39481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfSkj-0008DJ-HU
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:04:27 -0500
Received: by mail-qt1-x841.google.com with SMTP id b16so2465102qtb.6
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 11:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u+3/eaqNuAYy1ZBdjvxQ2Y7CxlMh81Gm6rDNDi2t2h8=;
 b=nYM6w7zIh/7Vu8HTpwQMIHvt3fbQi+eZejLV9c8aUxiKEvX/A9BnVpVryBvfk9luF5
 MA/pgThNDpzj3vcL/swYdLlt1LMhCrADhahE+3VoYBgtfZPjPjX0Tue1vSSYeYwfxAdl
 jz+49TcDHEkyPYQPHatuxx0bNsiDTmsHhoUm7Fy9lE4zGjQ0J6iNPI3mHy6bDv7qrDju
 5hDs215QzFJShZBNldZPH1AE60IVMU5nZiY0kkM4SP5Lbkxe/iFTUOSbM4rhitB1EAG/
 O+cdzx12BFmAz4L9E7zK9/FqwoChC7JQHL0oMO9pofMe3oOUcXoiQBKxbdnmizGq5KBQ
 vgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+3/eaqNuAYy1ZBdjvxQ2Y7CxlMh81Gm6rDNDi2t2h8=;
 b=sfcpB2tzKhtYImdF18XHldQr3u4S3LBQwl4htgQlk3hzQgG6utyt6KKFfMprg3UOOc
 a/SOTz3dpuqsoQfSu1U0sf/Vih4+iX8+2kCbJLqy8pSR1JbdQZiDfOCm+95lyK8xvRTY
 oDlMoPgdB/uz/XKYO4eRwGbXyXImq4yd6KL0I5Ib0dBkDz495ARB62NSKBcH9AlnOKJ6
 2fNwM2/JV1Mjv+IAoRggiy0CLfQ05F6xx4ewKaRw136TAcbR2J+PEAJBemKftusVuDTJ
 QzQNvm0Hew0VuSXa6z5mrpQw8mMD1uylZIrCLhJ+tF0pOxUAB6sqx/6MrRlM6YiZ3Ufn
 mAtA==
X-Gm-Message-State: AOAM5314AnmIHLWvUfdCGkuFROhFWsywZTue9F8gxMEuLIlgz94ExV/D
 Ri72c3zo8wekvCaSCtNcHA==
X-Google-Smtp-Source: ABdhPJw+kEMVrozA/zYRE7UNISveKTEmzyMUc+Agk0NzQJcJHtDiXOvIiTbMZuSWg4ojlSw+rR7T/g==
X-Received: by 2002:aed:22ab:: with SMTP id p40mr6066256qtc.200.1605726262672; 
 Wed, 18 Nov 2020 11:04:22 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id 199sm17206616qkm.62.2020.11.18.11.04.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 11:04:22 -0800 (PST)
Date: Wed, 18 Nov 2020 14:04:20 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/2] tests/test-image-locking: Pass the fd to the
 argument of qemu_has_ofd_lock()
Message-ID: <20201118190420.jl3o6ungxjyyrlax@gabell>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201106040102.13892-2-msys.mizuma@gmail.com>
 <20201118154456.GC11988@merkur.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118154456.GC11988@merkur.fritz.box>
Received-SPF: pass client-ip=2607:f8b0:4864:20::841;
 envelope-from=msys.mizuma@gmail.com; helo=mail-qt1-x841.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 04:44:56PM +0100, Kevin Wolf wrote:
> Am 06.11.2020 um 05:01 hat Masayoshi Mizuma geschrieben:
> > From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> > 
> > Pass the file descriptor of /dev/null to qemu_has_ofd_lock() because
> > former patch is changed the argument.
> > 
> > Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> > ---
> >  tests/test-image-locking.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/test-image-locking.c b/tests/test-image-locking.c
> > index ba057bd66c..2b823e1588 100644
> > --- a/tests/test-image-locking.c
> > +++ b/tests/test-image-locking.c
> > @@ -144,14 +144,19 @@ static void test_set_perm_abort(void)
> >  
> >  int main(int argc, char **argv)
> >  {
> > +    int fd;
> > +
> >      bdrv_init();
> >      qemu_init_main_loop(&error_abort);
> >  
> >      g_test_init(&argc, &argv, NULL);
> >  
> > -    if (qemu_has_ofd_lock()) {
> > +    fd = open("/dev/null", O_RDONLY);
> > +
> > +    if ((fd != -1) && (qemu_has_ofd_lock(fd))) {
> 
> The parentheses are redundant.
> 
> >          g_test_add_func("/image-locking/basic", test_image_locking_basic);
> >          g_test_add_func("/image-locking/set-perm-abort", test_set_perm_abort);
> > +        close(fd);
> >      }
> 
> Please merge this with patch 1, otherwise the build will fail with only
> patch 1 applied (breaks bisectability).

Got it. I'll merge this to patch 1.

Thanks!
Masa

