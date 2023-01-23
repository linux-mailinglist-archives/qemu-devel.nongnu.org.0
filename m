Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68576788B6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 21:53:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK3oF-00019V-RY; Mon, 23 Jan 2023 15:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pK3oD-000198-A8
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:52:53 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pK3o8-0004qn-Tw
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 15:52:53 -0500
Received: from [192.168.178.59] (p5b151831.dip0.t-ipconnect.de [91.21.24.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 75C1EDA0760;
 Mon, 23 Jan 2023 21:52:45 +0100 (CET)
Message-ID: <607a5f89-b01b-5c72-dccd-c739a9d2bb7d@weilnetz.de>
Date: Mon, 23 Jan 2023 21:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>, qemu-devel@nongnu.org
Cc: den@virtuozzo.com, yur@openvz.org, marcandre.lureau@gmail.com,
 mike.maslenkin@gmail.com
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
 <20221129173809.544174-2-andrey.drobyshev@virtuozzo.com>
 <d5b918b7-dae3-3084-d0fa-310d8c26f43d@weilnetz.de>
 <1330af6e-ee4e-2e1f-f7ca-bcf0109de786@virtuozzo.com>
Subject: Re: [PATCH v2 1/2] qga-win: add logging to Windows event log
In-Reply-To: <1330af6e-ee4e-2e1f-f7ca-bcf0109de786@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.147,
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

Am 23.01.23 um 20:38 schrieb Andrey Drobyshev:

> Hi Stefan,
>
> On 1/23/23 19:28, Stefan Weil wrote:
>> Hi,
>>
>> cross builds fail with this code. Please see details below.
>>
>> Am 29.11.22 um 18:38 schrieb Andrey Drobyshev via:
>>> This commit allows QGA to write to Windows event log using Win32 API's
>>> ReportEvent() [1], much like syslog() under *nix guests.
>>>
>>> In order to generate log message definitions we use a very basic message
>>> text file [2], so that every QGA's message gets ID 1.  The tools
>>> "windmc" and "windres" respectively are used to generate ".rc" file and
>>> COFF object file, and then the COFF file is linked into qemu-ga.exe.
>>>
>>> [1]
>>> https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa
>>> [2]
>>> https://learn.microsoft.com/en-us/windows/win32/eventlog/message-text-files
>>>
>>> Originally-by: Yuri Pudgorodskiy <yur@virtuozzo.com>
>>> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
>>> ---
>>>    configure                 |  3 +++
>>>    qga/installer/qemu-ga.wxs |  5 +++++
>>>    qga/main.c                | 16 +++++++++++++---
>>>    qga/meson.build           | 19 ++++++++++++++++++-
>>>    qga/messages-win32.mc     |  9 +++++++++
>>>    5 files changed, 48 insertions(+), 4 deletions(-)
>>>    create mode 100644 qga/messages-win32.mc
>>>
>>> diff --git a/configure b/configure
>>> index 26c7bc5154..789a4f6cc9 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -372,6 +372,7 @@ smbd="$SMBD"
>>>    strip="${STRIP-${cross_prefix}strip}"
>>>    widl="${WIDL-${cross_prefix}widl}"
>>>    windres="${WINDRES-${cross_prefix}windres}"
>>> +windmc="${WINDMC-${cross_prefix}windmc}"
>> Here the needed cross prefix is added ...
>>
>>>    pkg_config_exe="${PKG_CONFIG-${cross_prefix}pkg-config}"
>>>    query_pkg_config() {
>>>        "${pkg_config_exe}" ${QEMU_PKG_CONFIG_FLAGS} "$@"
>> [...]
>>> diff --git a/qga/meson.build b/qga/meson.build
>>> index 3cfb9166e5..1ff159edc1 100644
>>> --- a/qga/meson.build
>>> +++ b/qga/meson.build
>>> @@ -98,7 +98,24 @@ if targetos == 'windows'
>>>      endif
>>>    endif
>>>    -qga = executable('qemu-ga', qga_ss.sources(),
>>> +qga_objs = []
>>> +if targetos == 'windows'
>>> +  windmc = find_program('windmc', required: true)
>> ... but here the cross prefix is missing and the cross build aborts
>> because windmc does not exist.
> There's no need for the cross prefix here.  After you've run ./configure
> with --cross-prefix, argument, you'll see the following in
> build/config-meson.cross file:
>
> [binaries]
> ....
> widl = ['x86_64-w64-mingw32-widl']
> windres = ['x86_64-w64-mingw32-windres']
> windmc = ['x86_64-w64-mingw32-windmc']
>
> And these are the actual values meson's find_program() is going to be
> looking for.  So it doesn't seem like there's anything broken here, it's
> a matter of build requirements.


My configure terminates with an error because of the missing windmc 
before it has written config-meson.cross. I have run an incremental build:

Program windmc found: NO

../../../qga/meson.build:103:2: ERROR: Program 'windmc' not found or not 
executable

A full log can be found at 
/qemu/bin/debug/x86_64-w64-mingw32/meson-logs/meson-log.txt
ninja: error: rebuilding 'build.ninja': subcommand failed
FAILED: build.ninja
/usr/bin/python3 /qemu/meson/meson.py --internal regenerate /qemu 
/home/stefan/src/gitlab/qemu-project/qemu/bin/debug/x86_64-w64-mingw32 
--backend ninja
make: *** [Makefile:165: run-ninja] Fehler 1
make: Verzeichnis „/qemu/bin/debug/x86_64-w64-mingw32“ wird verlassen

A clean fresh build works indeed fine.

Stefan



