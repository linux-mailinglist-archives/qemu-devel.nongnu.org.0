Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 229C94AC5DF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:37:56 +0100 (CET)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH71V-0008JL-KY
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:37:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH66V-0007Mr-Bl
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:38:59 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:51611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH66T-0002G0-41
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ruJqdu+ia2Vc3WdV3MrXLhAe00q1dKt+O94rg06IKPo=; b=ZYjgWwSbGfPEOjZlp5mc0PFMlY
 kiA+ZXGijJHQXomAC8PUB97fQy/HmMliBpFSSXHPcikvwm16QLRvcqYZSnV9Ny7AhDj6i+kUT67ik
 FVpysms6w1/OshFrgsnVplS9mvFT3FgIQHCTGE4IXyGpWIlRwxARCPa/pUQ96OdDwFLlywZxGYTyH
 BUEb0LqIOwzPxPMsg62MDoKc3Pnt5X0tuK2vbsuA3bn5ayXIlf3iFheHB+Uo9hLtd9u2hjCvwgaik
 Nr4/sv6IYo2fFOQ8pj01kKeOcAG45tCi4iqeUpoph3onHxUgzDqBpVNvNMS6VNjxnA0NxpIsqAETq
 9TxpCtmOcwmtT8Y6LjLFUFCsslbgjBdLsQnB/0vRvYxmOtnLnJB+ZeC9olwxvf/qLn0a4hFOhDpZh
 F0zpJwj74+uf7o1h1SzgckEK4g4za/v3QQ3bC32I2WKdz0urAMuCB3BrvIGnNFHoOr71T4YtX3MF0
 d4tRf36WxUHHZ5eiAstpA2Gbes5qMLQFSTHrN5V4dLR1JOsAxkvbh06EoKyZKeZjRsR6SkYfE1Htp
 FIbbY3qmTfaAUB7pPbNR5XyL+JhQno3ZuGcwh8WeeOZWDM2wfiiHzBgt5sETlAUYWNvv9xmMvdroh
 ZW23OdELaWym68zhvp35NpDhzGSJmElez+JdpPH9k=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Subject: Re: [PATCH v4 10/11] 9p: darwin: meson: Allow VirtFS on Darwin
Date: Mon, 07 Feb 2022 16:38:54 +0100
Message-ID: <2241459.8USET5ScEs@silver>
In-Reply-To: <CAB26zV2hBsWzTYSTm07Ck20Awyy2at0-uCBmvqrsK7BjxSrfuw@mail.gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <1906604.JvqJJlWBnf@silver>
 <CAB26zV2hBsWzTYSTm07Ck20Awyy2at0-uCBmvqrsK7BjxSrfuw@mail.gmail.com>
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

On Montag, 7. Februar 2022 15:37:00 CET Will Cohen wrote:
> On Mon, Feb 7, 2022 at 9:27 AM Christian Schoenebeck
> <qemu_oss@crudebyte.com>
> wrote:
> > On Sonntag, 6. Februar 2022 21:07:18 CET Will Cohen wrote:
> > > From: Keno Fischer <keno@juliacomputing.com>
> > > 
> > > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > > [Michael Roitzsch: - Rebase for NixOS]
> > > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > > [Will Cohen: - Rebase to master]
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > [Will Cohen: - Add check for pthread_fchdir_np to virtfs]
> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > ---
> > > 
> > >  fsdev/meson.build |  1 +
> > >  meson.build       | 14 ++++++++++----
> > >  2 files changed, 11 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/fsdev/meson.build b/fsdev/meson.build
> > > index adf57cc43e..b632b66348 100644
> > > --- a/fsdev/meson.build
> > > +++ b/fsdev/meson.build
> > > @@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
> > > 
> > >    'qemu-fsdev.c',
> > >  
> > >  ), if_false: files('qemu-fsdev-dummy.c'))
> > >  softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
> > > 
> > > +softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
> > > 
> > >  if have_virtfs_proxy_helper
> > >  
> > >    executable('virtfs-proxy-helper',
> > > 
> > > diff --git a/meson.build b/meson.build
> > > index 5f43355071..6b4adf7e15 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -1421,17 +1421,23 @@ if not get_option('dbus_display').disabled()
> > > 
> > >    endif
> > >  
> > >  endif
> > > 
> > > -have_virtfs = (targetos == 'linux' and
> > > +if targetos == 'darwin' and cc.has_function('pthread_fchdir_np')
> > > +  have_virtfs = have_system
> > 
> > As you are going for a v5 anyway: I would add an error message here if
> > pthread_fchdir_np() is not available. Because it is a bit frustrating for
> > users if their options silently got ignored without any indication why.
> > 
> > > +else
> > > +  have_virtfs = (targetos == 'linux' and
> > > 
> > >      have_system and
> > >      libattr.found() and
> > >      libcap_ng.found())
> > > 
> > > +endif
> > > 
> > > -have_virtfs_proxy_helper = have_virtfs and have_tools
> > > +have_virtfs_proxy_helper = targetos == 'linux' and have_virtfs and
> > > have_tools
> > > 
> > >  if get_option('virtfs').enabled()
> > >  
> > >    if not have_virtfs
> > > 
> > > -    if targetos != 'linux'
> > > -      error('virtio-9p (virtfs) requires Linux')
> > > +    if targetos != 'linux' and targetos != 'darwin'
> > > +      error('virtio-9p (virtfs) requires Linux or Darwin')
> > > +    elif targetos == 'darwin' and not
> > 
> > cc.has_function('pthread_fchdir_np')
> > 
> > > +      error('virtio-9p (virtfs) on Darwin requires the presence of
> > > pthread_fchdir_np')
> 
> Does the error message here suffice for that need? Right now if they're
> running a system without pthread_fchdir_np and don't specify the option, I
> think it'll just quietly disable, but if they --enable-virtfs and the
> function isn't there, they should get a note. I assume this is better, so
> that the ability to compile isn't contingent on having the latest OS, even
> if full support for older OSes isn't provided.

Ah, got it. Yes, makes sense.

But what I would definitely change is the precise error message text here: 
"Darwin" is a bit awkward for a regular user, because most macOS users never 
heard of "Darwin" in the context of Apple systems before. Using the term 
"darwin" in code is fine as it can be assumed that developers know the 
background, but as for regular users I would make it more clear that this is 
actually about macOS, e.g:

	error('virtio-9p (virtfs) requires either Linux or Darwin (macOS)')

I don't mind how to write that exactly; braces, slash, replacing Darwin by 
macOS or whatever, but it should mention 'macOS' here in some form.

> > elif not libcap_ng.found() or not libattr.found()
> > 
> > >        error('virtio-9p (virtfs) requires libcap-ng-devel and
> > > 
> > > libattr-devel') elif not have_system



