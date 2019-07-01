Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E30B37D4E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 21:37:59 +0200 (CEST)
Received: from localhost ([::1]:57022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYyD0-0003Yf-Cw
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 15:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57809)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lvivier@redhat.com>) id 1hYy14-0005Ue-N5
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 15:25:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1hYy12-00077y-No
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 15:25:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>)
 id 1hYy0u-00068p-VU; Thu, 06 Jun 2019 15:25:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27F58B2DCE;
 Thu,  6 Jun 2019 19:25:04 +0000 (UTC)
Received: from [10.40.204.44] (ovpn-204-44.brq.redhat.com [10.40.204.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DED01897F;
 Thu,  6 Jun 2019 19:24:58 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20190108224600.23125-1-david@gibson.dropbear.id.au>
 <20190108224600.23125-10-david@gibson.dropbear.id.au>
 <759cdab3-6cf9-bb83-54f2-12d60063b15c@redhat.com>
 <6d1c8b12-0e27-b3f3-9e0e-ad68c5572ed7@ilande.co.uk>
 <09f7a354-b1be-48b4-15ea-4923386b6a77@redhat.com>
Message-ID: <cc1a09a4-9045-f71f-7d60-b638f59ac824@redhat.com>
Date: Thu, 6 Jun 2019 21:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <09f7a354-b1be-48b4-15ea-4923386b6a77@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 06 Jun 2019 19:25:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-ppc] [PULL 09/29] target/ppc: introduce
 get_cpu_vsr{l, h}() and set_cpu_vsr{l, h}() helpers for VSR register access
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Anton Blanchard <anton@ozlabs.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/06/2019 09:43, Laurent Vivier wrote:
> On 05/06/2019 08:32, Mark Cave-Ayland wrote:
>> On 04/06/2019 22:23, Laurent Vivier wrote:
>>
>>> This patch breaks something in the libcrypto.
>>>
>>> I've been able to reproduce the problem with Fedora 29:
>>>
>>> dnf install 'dnf-command(download)'
>>> dnf download --source coreutils-single
>>> rpm --verify coreutils-8.30-7.fc29.src.rpm
>>> error: coreutils-8.30-7.fc29.src.rpm: Header V3 RSA/SHA256 Signature, key ID 429476b4: BAD
>>> error: coreutils-8.30-7.fc29.src.rpm: Header SHA256 digest: BAD (Expected fa042669e74ac435bd5defaa8c2e4efe779a0329c24f2b6377591c53b38aa280 != d6e22527412fafc4aa12882432d0d157e5427097710eeb2d5fce8fbc52a47be6)
>>> error: coreutils-8.30-7.fc29.src.rpm: not an rpm package (or package manifest)
>>>
>>> See https://bugzilla.redhat.com/show_bug.cgi?id=1715017
>>>
>>> I've tested with origin/master (47fbad45d47af8af784bb12a5719489edcd89b4c) and all the 
>>> merged fixes for this patch don't fix this problem.
>>>
>>> We should be able to reproduce it on Debian Sid too: it breaks ssh (this is one of the rare binaries using libcrypto on debian).
>>>
>>> I've been able to reproduce it with qemu linux-user if I enable PPC_FEATURE2_VEC_CRYPTO in linux-user/elfload.c
>>> (git clone -b linux-user-ppc64-hwcap git@github.com:vivier/qemu.git).
>>>
>>> To ease debugging, you can install a Fedora 29 chroot with something like:
>>>
>>> curl -o container.tar.xz http://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/29/Container/ppc64le/images/Fedora-Container-Base-29-1.2.ppc64le.tar.xz
>>> tar Jxvf container.tar.xz '*/layer.tar'
>>> mkdir -p chroot/ppc64le/29
>>> cd chroot/ppc64le/29
>>> tar xf $OLDPWD/*/layer.tar
>>> cd -
>>> cp ~/qemu/ppc64le-linux-user/qemu-ppc64le chroot/ppc64le/29/
>>> [use "configure --target-list=ppc64le-linux-user --static --disable-tools" and don't forget to run scripts/qemu-binfmt-conf.sh]
>>
>> One of Anton's VSX patches hasn't landed in master yet and is still queued in
>> ppc-for-4.1: "target/ppc: Fix lxvw4x, lxvh8x and lxvb16x".
>>
>> Can you try David's ppc-for-4.1 branch first and let me know if that solves the
>> issue? If not, I'll take a look at it later in the week when I have a bit more time.
> 
> Thank you Mark.
> 
> Anton's patch fixes the problem.

But there are two problems remaining with Fedora 29:

- in libssl (openssl-libs-1.1.1-3.fc29.ppc64le):

  $ curl -o /dev/null https://www.google.com
  ...
  curl: (35) error:1408F119:SSL routines:ssl3_get_record:decryption failed or bad record mac

- in the kernel (4.18.16-300.fc29.ppc64le):

[   39.742120] crypto_register_alg 'aes' = 0
[   39.919286] crypto_register_alg 'cbc(aes)' = 0
[   40.053942] crypto_register_alg 'ctr(aes)' = 0
[   40.372764] alg: skcipher: Test 1 failed (invalid result) on encryption for p8_aes_xts
[   40.373458] 00000000: 91 7c f6 9e bd 68 b2 ec 9b 9f e9 a3 ea dd a6 92
[   40.373568] 00000010: 98 10 35 57 5e dc 36 1e 9a f7 bc ba 39 f2 5c eb
[   40.374139] crypto_register_alg 'xts(aes)' = 0
[   40.389241] alg: hash: Test 2 failed for p8_ghash
[   40.389422] 00000000: 5f 89 ab f7 20 57 20 57 20 57 20 57 20 57 20 57

My qemu is on top of 

0d74f3b427 Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-pull-request' into staging
+ "target/ppc: Fix lxvw4x, lxvh8x and lxvb16x"

Thanks,
Laurent

