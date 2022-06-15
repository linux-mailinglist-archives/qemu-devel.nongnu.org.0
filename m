Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEAD54C696
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 12:58:18 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Qj3-0008SC-6V
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 06:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1Qf8-0005Jx-1I
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1Qey-00026n-DU
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 06:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655290435;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gd9P8WhgZz2nf19PbmFBdCcjH+aMstJFnv+1OGl1u9M=;
 b=afF2q51X3IqWOgLzACUMjEth7T61KzpbPIimtlRvtpmUEg6/pDdaGUVmDDO5hZWoP2sWHj
 LZIrz8yyukpbcykqBrgDYZhvBHdUgy5Yf2iNbDm05FuWXyBerf3ZK+mHwAftozU1WJxaIB
 iBzq1Vm4xyHyVgimFkCa940bggoA4b4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-iqAXx0T1Oaqu1MQ3B6E15A-1; Wed, 15 Jun 2022 06:53:52 -0400
X-MC-Unique: iqAXx0T1Oaqu1MQ3B6E15A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C34D4299E778;
 Wed, 15 Jun 2022 10:53:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83B632166B26;
 Wed, 15 Jun 2022 10:53:50 +0000 (UTC)
Date: Wed, 15 Jun 2022 11:53:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 0/4] cutils: Introduce bundle mechanism
Message-ID: <Yqm6PMnlwnVx3vwG@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
 <dc3cff18-e8ad-2817-d484-53f7197bf6f7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc3cff18-e8ad-2817-d484-53f7197bf6f7@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 10:39:29AM +0200, Paolo Bonzini wrote:
> On 6/14/22 23:07, Akihiko Odaki wrote:
> > Developers often run QEMU without installing. The bundle mechanism
> > allows to look up files which should be present in installation even in
> > such a situation.
> > 
> > It is a general mechanism and can find any files located relative
> > to the installation tree. The build tree must have a new directory,
> > qemu-bundle, to represent what files the installation tree would
> > have for reference by the executables.
> > 
> > v4:
> > * Add Daniel P. Berrangé to CC. Hopefully this helps merging his patch:
> >    https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg02276.html
> > * Rebased to the latest QEMU.
> > 
> > v3:
> > * Note that the bundle mechanism is for any files located relative to the
> >    installation tree including but not limited to datadir. (Peter Maydell)
> > * Fix "bridge" typo (Philippe Mathieu-Daudé)
> > 
> > v2: Rebased to the latest QEMU.
> 
> I like the idea, but I have a couple issues with the implementation:
> 
> - at the meson level, there is some repetition of mkdir and ln run_commands.
> Perhaps you could just fill in a dictionary, and then do something like
> 
>   created_paths = {}
>   foreach source, dest: var
>     path = fs.parent(qemu_bundledir / dest)
>     created_paths += {path: true}
>   endforeach
>   run_command('mkdir', '-p', created_paths.keys())
>   foreach source, dest: var
>     run_command('ln', '-sf', meson.project_source_root() / source,
>                 qemu_bundledir / dest)
>   endforeach

Per my other reply, IMHO, all the meson changes are redundant.

I've just sent a series that illustrates how we can improve the
qemu_find_file method so it correctly copes with install dir
vs build dir being different layouts, and be extensible to
any types of file (bios, keymaps, icons, helper exes, and
more).

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


