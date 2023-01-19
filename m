Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5626734A6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:43:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIQhU-0007jr-2e; Thu, 19 Jan 2023 03:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pIQhR-0007ji-S4
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:55:09 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pIQhP-0000r8-N8
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:55:09 -0500
Received: from [192.168.178.59] (p5b151831.dip0.t-ipconnect.de [91.21.24.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 6C877DA0838;
 Thu, 19 Jan 2023 09:55:01 +0100 (CET)
Message-ID: <d117d4e8-b906-cbde-5efe-43dbb183965c@weilnetz.de>
Date: Thu, 19 Jan 2023 09:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: MSYS2 and libfdt
To: Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
In-Reply-To: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 19.01.23 um 09:14 schrieb Thomas Huth:

>
>  Hi all,
>
> in some spare minutes, I started playing with a patch to try to remove 
> the dtc submodule from the QEMU git repository - according to 
> https://repology.org/project/dtc/versions our supported build 
> platforms should now all provide the minimum required version.
>
> However, I'm hitting a problem with Windows / MSYS2 in the CI jobs: 
> The libfdt is packaged as part of the dtc package there:
>
>  https://packages.msys2.org/package/dtc
>
> ... meaning that it is added with a usr/include and usr/lib path 
> prefix instead of mingw64/include and mingw64/lib like other packages 
> are using (see e.g. 
> https://packages.msys2.org/package/mingw-w64-x86_64-zlib?repo=mingw64). 
> Thus the compiler does not find the library there. Also there does not 
> seem to be a difference between a i686 (32-bit) and x86_64 (64-bit) 
> variant available here? Does anybody know how libfdt is supposed to be 
> used with MSYS2 ?
>
>  Thomas


Hi Thomas,

"dtc" is not the right package for cross builds. We'd require 
mingw-w64-i686-dtc and mingw-w64-x86_64-dtc packages for the QEMU build, 
but those packages are currently not provided by MSYS2.

See https://packages.msys2.org/search?t=binpkg&q=zlib for the zlib 
packages and related cross build packages.

Stefan



