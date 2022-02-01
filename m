Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08C4A5FA7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:10:32 +0100 (CET)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEund-0007Ma-MB
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:10:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEsWR-0008P6-A5
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:44:39 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:41527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nEsWK-0002Gx-16
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=9cnpef1OTXb7a3sX3wDx1NruUGI2/wOxLasY1MNcnhU=; b=XhEBdZd7ySEo/acLDe/4vuy5ut
 qUwMolV9iCZHjzQqHUiKkMiOywlCwmNKHtMyla2+0GtyFW64gJySfvZ1b//Bkw4soHkm+n8umt9MT
 OhqjUsLzK3uVe83YyIehneHxLTbSsAuBE3CZ0WJ7zhpY2Vs1qh5mGMzFvcWmOCm0p5z02BsnvOwHc
 P3+N7fFblwLWIbvFX6ZXhDFZViaCHyllTrD7pjnHVbpqlr9YYq8C6DrO1cYehXVEjNYAZ4P+1I8m3
 z9zu442wHlr4nyVD7g4umToTeDt9zqa/zUlwLCNLDVDRqehByj3ZmQgYkB0X3y/WSjnGf5rSgyHl3
 ZBFnj4WK+UherjIF9o2proxJzFQlfDc5XvwQN/iqCK5uWyllMUDEhx0+KpuBEQMF4zmyhlfl3ejir
 CIa6SyM8u09baSptLkSIe1B9IskEwiYPOHTmHoVeu40epm8gc3gW9eqqNQXKXIKw/BMPgpuqT5xBG
 9/hyMxkPT6kM65Yyg1tw/BmrOYkt2yKbTNDzXwpU94DNsBvu9e49x/isQjrOSkMF5wgoj03ljfBTq
 F4g1t0tpd+pyx0+w0K+sA7tzevRiz9h0cYUxwE8uctS59aIiqw4gnS3EWzaBhUAl94Pl1UJ1W/psg
 U5T8kOC1fuuuZ+iMzqozFvfUxs0qaB6RoF0FNjypQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, hi@alyssa.is,
 Greg Kurz <groug@kaod.org>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 10/11] 9p: darwin: Implement compatibility for mknodat
Date: Tue, 01 Feb 2022 13:44:01 +0100
Message-ID: <1820026.hqzvqzRMiJ@silver>
In-Reply-To: <CAB26zV3_oQ-tAfOrRefJNG8w6DPOiNhn5VBwahLPOmrKsO1LTA@mail.gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
 <CAB26zV0Lf==9f62RM10vaLHEMcjPwVshs51Z9oNLu17GYV2kDw@mail.gmail.com>
 <CAB26zV3_oQ-tAfOrRefJNG8w6DPOiNhn5VBwahLPOmrKsO1LTA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 31. Januar 2022 23:26:46 CET Will Cohen wrote:
> Upon further review, it looks like since 10.12 there's actually a
> (not-heavily-documented) function that wraps this syscall and avoids the
> need to call the private syscall directly:
> https://opensource.apple.com/source/libpthread/libpthread-218.51.1/src/pthre
> ad_cwd.c.auto.html. Chromium uses it too (
> https://chromium.googlesource.com/chromium/src/+/lkgr/base/process/launch_ma
> c.cc#110) -- given that we're not looking for pre-10.12 compatibility, I'm a
> little less worried about the workaround breaking in the future if this
> wrapper gets used instead.
> 
> Would it work to change to pthread_fchdir_np, remove all the syscall
> discussion in the comment, and add a meson check for pthread_fchdir_np as a
> prereq for virtfs on darwin?

Using pthread_fchdir_np() looks like a better solution, yes. It still seems to 
be a private macOS API though. I can't find the function in any of Apple's 
publicly released header file, and Chromium therefore declares the function by 
itself (directly in launch_mac.cc):

extern "C" {
// Changes the current thread's directory to a path or directory file
// descriptor. libpthread only exposes a syscall wrapper starting in
// macOS 10.12, but the system call dates back to macOS 10.5. On older OSes,
// the syscall is issued directly.
int pthread_chdir_np(const char* dir) API_AVAILABLE(macosx(10.12));
int pthread_fchdir_np(int fd) API_AVAILABLE(macosx(10.12));
...
}  // extern "C"

But if you are guarding this with a meson check then sure, no objections from 
my side at least.

Adding Peter on CC just in case.

Best regards,
Christian Schoenebeck



