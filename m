Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBC6E9451
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:30:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTQU-0005YD-SW; Thu, 20 Apr 2023 08:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ppTQC-0005Wr-B5
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:29:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ppTQ4-0002Dm-QK
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:29:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8AA734019D
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 15:29:35 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B0BD9215
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 15:29:34 +0300 (MSK)
Message-ID: <d30fbe88-b9ee-81f3-0447-5cb9f2a8cdea@msgid.tls.msk.ru>
Date: Thu, 20 Apr 2023 15:29:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: --disable-system --enable-$some_system_feature: fail?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi!

We've an interesting effect out of our --enable-foo stuff.
For example,

   ./configure --disable-system --enable-gtk

this will fail during build time, this way:

  In file included from ui/x_keymap.c:15:
  ui/trace.h:1:10: fatal error: trace/trace-ui.h: No such file or directory

This is because in meson.build, we first have

if have_system
   trace_events_subdirs += [
     'ui',
   ]
endif

and later we have

subdir('ui')

which, in ui/meson.build, in turn has

if gtk.found()
   gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
   ui_modules += {'gtk' : gtk_ss}
endif

So we end up building ui/gtk.c (which includes trace-ui.h)
but not building trace-ui.h.

It is interesting that ui/meson.build does not check for
have_system at all, ditto for inclusion of subdir('ui'),
but rely solely on gtk.found().

Arguable it is a bug in ./configure options, since one
can't enable gtk without enabling system as well.

This is a widespread thing: many other similar options
behave in a similar way.

Can we fix this somehow to be at least consistent?

Maybe we can guard some subdir('foo') with if have_system
or have_user?  Note there are things like, say, sdlaudio,
which is not in ui/ but will fail in the same way unless
also guarded in audio/meson.build (or whole audio/ should
be omitted without have_system just like ui/).

BTW, can't we always generate trace stuff? I mean, why that
one is guarded with have_{system,user}, while actual subdir
inclusion is not? Maybe we can fix just this inconsistency?

Thanks,

/mjt

