Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3C131B813
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:36:15 +0100 (CET)
Received: from localhost ([::1]:58322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcAo-0002OY-Vd
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lBc9G-0001S8-H6; Mon, 15 Feb 2021 06:34:38 -0500
Received: from kerio.kamp.de ([195.62.97.192]:51469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lBc9E-00044u-UQ; Mon, 15 Feb 2021 06:34:38 -0500
X-Footer: a2FtcC5kZQ==
Received: from [172.21.12.60] ([172.21.12.60]) (authenticated user pl@kamp.de)
 by kerio.kamp.de with ESMTPSA
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits));
 Mon, 15 Feb 2021 12:34:28 +0100
Subject: Re: [PATCH V2 1/7] block/rbd: bump librbd requirement to luminous
 release
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-2-pl@kamp.de> <20210215101123.GC7226@merkur.fritz.box>
 <20210215101911.GA1542881@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <3c6dd9d8-f842-dd9b-e56b-0bb07357f975@kamp.de>
Date: Mon, 15 Feb 2021 12:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215101911.GA1542881@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, ct@flyingcircus.io,
 mreitz@redhat.com, pbonzini@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.21 um 11:19 schrieb Daniel P. Berrangé:
> On Mon, Feb 15, 2021 at 11:11:23AM +0100, Kevin Wolf wrote:
>> Am 26.01.2021 um 12:25 hat Peter Lieven geschrieben:
>>> even luminous (version 12.2) is unmaintained for over 3 years now.
>>> Bump the requirement to get rid of the ifdef'ry in the code.
>>>
>>> Signed-off-by: Peter Lieven <pl@kamp.de>
>>> diff --git a/meson.build b/meson.build
>>> index 5943aa8a51..02d263ad33 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -691,19 +691,24 @@ if not get_option('rbd').auto() or have_block
>>>                              required: get_option('rbd'),
>>>                              kwargs: static_kwargs)
>>>     if librados.found() and librbd.found()
>>> -    if cc.links('''
>>> +    result = cc.run('''
>> Doesn't running compiled binaries break cross compilation?
>>
>>>         #include <stdio.h>
>>>         #include <rbd/librbd.h>
>>>         int main(void) {
>>>           rados_t cluster;
>>>           rados_create(&cluster, NULL);
>>> +        rados_shutdown(cluster);
>>> +        #if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
>>> +        return 1;
>>> +        #endif
>>>           return 0;
>> Would #error achieve what you want without running the binary?
>>
>> But most, if not all, other version checks use pkg-config instead of
>> trying to compile code, so that's probably what we should be doing here,
>> too.
> Yep, for something that is merely a version number check there's no
> need to compile anything. pkg-config can just validate the version
> straightup.


I would have loved to, but at least the Ubuntu/Debian packages do not contain

pkg-config files. I can switch to #error, of course. My initial version of the patch

distinguished between can't compile and version is too old. With #error we just

can say doesn't compile, but I think this would be ok.


Peter



