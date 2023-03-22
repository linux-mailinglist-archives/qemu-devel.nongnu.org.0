Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 739666C4488
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 09:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1petPL-000099-0D; Wed, 22 Mar 2023 04:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1petOy-0008Uu-N0
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:00:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1petOu-0007GO-VJ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 04:00:56 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3FF6F40158;
 Wed, 22 Mar 2023 11:00:38 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B8105DD;
 Wed, 22 Mar 2023 11:00:37 +0300 (MSK)
Message-ID: <11b30bf8-04d6-8e00-6c94-6e2e00429bed@msgid.tls.msk.ru>
Date: Wed, 22 Mar 2023 11:00:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@google.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 gert.wollny@collabora.com, qemu-devel@nongnu.org,
 pkg-qemu-devel@alioth-lists.debian.net
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
 <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
 <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
 <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
 <CAAfnVBmueH6M_SAmiK0CE77c_yZN-cFLRKMtbtArJb8StjpaDw@mail.gmail.com>
 <CAAfnVBnA5J7NO3FdEh3-PP5_GO3uda-Gs_zdFrLj5C6j6-DOLQ@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAAfnVBnA5J7NO3FdEh3-PP5_GO3uda-Gs_zdFrLj5C6j6-DOLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

18.03.2023 00:40, Gurchetan Singh пишет:
[[big snip]]

> Okay, I think the next steps would actually be code so you can see our vision.  I have few questions that will help with my RFC:
> 
> 1)  Packaging -- before or after?
> 
> gfxstream does not have a package in upstream Portage or Debian (though there are downstream implementations).  Is it sufficient to have a versioned 
> release (i.e, Git tag) without the package before the change can be merged into QEMU?
> 
> Is packaging required before merging into QEMU?
> 
> 2) Optional Rust dependencies
> 
> To achieve seamless Wayland windowing with the same implementation as crosvm, we'll need optional Rust dependencies.  There actually has been interest 
> in making Rust a non-optional dependency:
> 
> https://wiki.qemu.org/RustInQemu <https://wiki.qemu.org/RustInQemu>
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04589.html <https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg04589.html>
> 
> I actually only want Rust as an optional dependency on Linux, Windows, and MacOS -- where Rust support is quite good.  Is there any problem with using 
> Rust library with a C API from QEMU?
> 
> 3) Rust "Build-Depends" in Debian
> 
> This is mostly a question to Debian packagers (CC: mjt@)
> 
> Any Rust package would likely depend on 10-30 additional packages (that's just the way Rust works), but they are all in Debian stable right now.
> 
> https://packages.debian.org/stable/rust/ <https://packages.debian.org/stable/rust/>
> 
> I noticed when enabling virgl, there were complaints about a ton of UI libraries being pulled in.
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=813658 <https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=813658>
> 
> That necessitated the creation of the `qemu-system-gui` package for people who don't need a UI.  I want to make gfxstream a Suggested Package in 
> qemu-system-gui, but that would potentially pull in 10-30 additional Rust build dependencies I mentioned.
> 
> Would the 10-30 Rust Build dependencies be problematic?  I think QEMU already has hundreds right now.

There's no reason to worry about *build*-time dependencies.

There's also no big reason to worry about runtime dependencies, and to worry about
Suggests vs Recommends, etc, - this all can be adjusted when needed, packages can
be spilt further, etc, - it is normal practice.

/mjt

