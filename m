Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0D4C4B4D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 17:49:24 +0100 (CET)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNdmU-0007ip-VP
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 11:49:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nNdiE-0005Ab-3z
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:44:58 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:43069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nNdiC-0000Vz-2M
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 11:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=BMadfWoS4ePcSyIVE07n91T0aiY5D7LIXjyeKpEkzGU=; b=DpprZy+WN/WdMogO633xCk+747
 ePq0A71iuBSUJH0DuuXnQeCxHwFSADRWxQNJDwgfq6Q4oaiBxKnE7lb09N4TSYqzpQRKy0PEkx+9y
 KyOuhrvHlqpJ6VXrxEsw6CH7CtsEACW8U6qUYx7F32QUsx5szzXVZ9rpgTxA1tuPpP7/tMzHU3/Rx
 rEVbvPRBRPJk3aTRIwkFvpTDuZjPpzEbav9Y50UYBK+N5DUIhTrKdfKhx6i+yH5aTnkTsh2NylfRH
 ivuENrQWBPdAK/vUEhxVahw+03RzBB7kk75dK3CM+5VxCf3lAUsF9Cu+Y9IW7SFML8mjhUrMqKg+k
 qzyxx9WdrQ0dXw7zVCzINKMlwywSiI2Hkvw++hyc6WlxVBLL9yXyA5tJxIdKBsovfNzAdv4FU6ZvG
 84KmQtB1kZqxULROie50aoQa578wGxPx6v+yuVk0GkBRtY28ogWYADBzFwmAUJZ+O3/f44vtG4Z30
 xtHnMKU/szIepmc+u0iC+fqj6p708EZ+NBF8YlIv6TQU2kFVjen8ZXKA4CC1W39YkfQy7MVMRDKzD
 ZRqAoE75ON/0HADEmCmwL2x+JVKT1EzWK3Dq+lBMDSjB+ONnWtJFzxiiF/UoKQZHu2xXSeAvcp6Gy
 HiULBEhBvJzgyJgSOaH9dwb8z17wn0jB5ceANqYOg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Fri, 25 Feb 2022 17:44:51 +0100
Message-ID: <6945668.jiNg9iTkrT@silver>
In-Reply-To: <CAB26zV2PaeWhq_PkwTjC1XaOXB-cBo4fmPgOnnTsjGLBZbUvLw@mail.gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
 <2843831.zseRdOWLSh@silver>
 <CAB26zV2PaeWhq_PkwTjC1XaOXB-cBo4fmPgOnnTsjGLBZbUvLw@mail.gmail.com>
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

On Freitag, 25. Februar 2022 17:38:51 CET Will Cohen wrote:
> On Fri, Feb 25, 2022 at 11:31 AM Christian Schoenebeck <
> 
> qemu_oss@crudebyte.com> wrote:
> > On Freitag, 25. Februar 2022 15:00:40 CET Will Cohen wrote:
> > > On Tue, Feb 22, 2022 at 9:27 AM Christian Schoenebeck
[...]
> > > osdep.h is the wrong place, should it go back to 9p-util, where it lived
> > > before it moved to osdep?
> > 
> > The other function Peter wanted out from osdep.h would fall into that
> > category
> > as well. I understand it like "only put things into osdep.h as very last
> > resort". CCing Peter on this. If he doesn't give you green light, or on
> > doubt,
> > then yes please move it from osdep -> 9p-util.
> > 
> > Will, are you planning to send a v9 of this series soon? Next week I need
> > to
> > add changes that would collide with these here. So if you intend to send
> > it
> > soon, then I just wait so that we can finally queue these macOS patches
> > here
> > for QEMU 7.0, before I would go along with my changes.
> > 
> > Best regards,
> > Christian Schoenebeck
> 
> Prepping a v9 now based on all the other changes + the formatting issues.
> I'll send this weekend if that's okay!

Thumbs up! :)

Best regards,
Christian Schoenebeck



