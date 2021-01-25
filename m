Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894C0302EDD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 23:22:05 +0100 (CET)
Received: from localhost ([::1]:59934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4AFI-0005Fc-Ki
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 17:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l4ADm-0004oY-C1
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:20:32 -0500
Received: from kerio.kamp.de ([195.62.97.192]:56956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l4ADf-0000nq-SG
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 17:20:28 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 23:20:17 +0100
Received: (qmail 24661 invoked from network); 25 Jan 2021 22:20:19 -0000
Received: from ac50.vpn.kamp-intra.net (HELO ?172.20.250.50?)
 (pl@kamp.de@::ffff:172.20.250.50)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 25 Jan 2021 22:20:19 -0000
Subject: Re: configure does not detect librados or librbd since the switch to
 meson
To: Paolo Bonzini <pbonzini@redhat.com>, dillaman@redhat.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, philmd@redhat.com
References: <23268a39-078d-ed13-6bb4-590ce1292662@kamp.de>
 <b8dff207-21d9-ce8f-63b3-f877d29d90c6@kamp.de>
 <bb07c231-6584-0d4d-959b-46948c9ab9bc@redhat.com>
 <00855a0d-33e0-d835-e6e0-4d3af963975b@kamp.de>
 <7499e47d-b3d9-5ca5-2321-45b04ba06fca@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <d697d48f-f202-b542-63c2-1e19c8f25062@kamp.de>
Date: Mon, 25 Jan 2021 23:20:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7499e47d-b3d9-5ca5-2321-45b04ba06fca@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.01.21 um 22:57 schrieb Paolo Bonzini:
> On 25/01/21 20:47, Peter Lieven wrote:
>>> Can you include the meson-logs/meson-log.txt output?
>>
>> Sure:https://pastebin.com/u3XtbDvQ
>
> Does this work for you?
>
> diff --git a/meson.build b/meson.build
> index 690d48a6fd..a662772c4a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -14,6 +14,9 @@ config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
>  enable_modules = 'CONFIG_MODULES' in config_host
>  enable_static = 'CONFIG_STATIC' in config_host
>
> +# Allow both shared and static libraries unless --enable-static
> +static_kwargs = enable_static ? {'static': true} : {}
> +
>  # Temporary directory used for files created while
>  # configure runs. Since it is in the build directory
>  # we can safely blow away any previous version of it
> @@ -679,10 +682,10 @@ endif
>  rbd = not_found
>  if not get_option('rbd').auto() or have_block
>    librados = cc.find_library('rados', required: get_option('rbd'),
> -                             static: enable_static)
> +                             kwargs: static_kwargs)
>    librbd = cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
>                             required: get_option('rbd'),
> -                           static: enable_static)
> +                           kwargs: static_kwargs)
>    if librados.found() and librbd.found() and cc.links('''
>      #include <stdio.h>
>      #include <rbd/librbd.h>
> @@ -693,6 +696,9 @@ if not get_option('rbd').auto() or have_block
>      }''', dependencies: [librbd, librados])
>      rbd = declare_dependency(dependencies: [librbd, librados])
>    endif
> +  if not rbd.found() and get_option('rbd').enabled()
> +    error('could not link librbd')
> +  endif
>  endif
>
>  glusterfs = not_found
>
> (It's not a complete patch, all instances of "static: enable_static" would need to be changed because other libraries could have the same issue).


Yes, it does.


Please CC me, when you submit a complete patch. I will build my V2 of the rbd driver rewrite on top of this then.


Thanks,

Peter



