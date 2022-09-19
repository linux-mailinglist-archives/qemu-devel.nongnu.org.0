Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C95BD53F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 21:35:32 +0200 (CEST)
Received: from localhost ([::1]:51306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaMYF-0000RV-8A
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 15:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1oaMSH-0003Ct-E9
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:29:21 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:46947
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1oaMSD-0005Fs-Hn
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 15:29:20 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4MWZVd55D9z8PbN;
 Mon, 19 Sep 2022 15:29:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=y2ygjKd5C
 EexuPJtJQ3zhsVWbBE=; b=crc3kXyLPNo83+pj7semSWZU/DnYffVwmfs0CQl/o
 phthjSJDsATLza243RLVll4WscARNEDUvrBX1ufnComF9kzv5OzAtFPfnlnFscP1
 H10WitfhAO6QpJ/BWr7J9X8IV3cqSgqD9mEGOOkKo2K3vahggxr/dS/zWeMJEXPT
 Go=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=oW4
 GO9ilxBtyfqDPkZsdcrJmbjJ/CGmIpjQoVIq6+na9A25qaOh40cqXWmRjo8YL9ib
 lmQsvHJDeJDLSI5VVWPLwPh/usmjlrdslx17u299OsP5zlH9LC7YWVIbMNRWf0uQ
 dS/gb7DRQNZnxxbj537Ezly5XnPjyKWqiNqQTwcs=
Received: from [IPV6:2001:470:b0db:100:38f9:f971:4c66:2899] (unknown
 [IPv6:2001:470:b0db:100:38f9:f971:4c66:2899])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4MWZVd36v9z8PbK;
 Mon, 19 Sep 2022 15:29:13 -0400 (EDT)
Message-ID: <25a2f6d5-7302-e27a-826a-ef5722bd2bea@comstyle.com>
Date: Mon, 19 Sep 2022 15:29:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:105.0) Gecko/20100101
 Thunderbird/105.0
Subject: Re: [PATCH v3] audio: Add sndio backend
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Alexandre Ratchov <alex@caoua.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org
References: <YxibXrWsrS3XYQM3@vm1.arverb.com>
 <f7ad8818-b165-4306-64f9-ec4e786a9493@t-online.de>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <f7ad8818-b165-4306-64f9-ec4e786a9493@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.952,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/2022 2:12 AM, Volker R=C3=BCmelin wrote:
> Am 07.09.22 um 15:23 schrieb Alexandre Ratchov:
>> sndio is the native API used by OpenBSD, although it has been ported t=
o
>> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.)=
.
>>
>> Signed-off-by: Brad Smith<brad@comstyle.com>
>> Signed-off-by: Alexandre Ratchov<alex@caoua.org>
>> ---
>>
>> References to the previous patch versions and related discussions are
>> here:
>>
>> https://marc.info/?l=3Dqemu-devel&m=3D163973393011543=C2=A0=C2=A0=C2=A0=
 (v2)
>> https://marc.info/?l=3Dqemu-devel&m=3D163626248712444 (initial patch)
>>
>> Here are the changes between v2 and v3 of this patch:
>>
>> - fixed of typos in file-names in MAINTAINERS
>> - added Gerd Hoffmann to the M: entry in MAINTAINERS
>> - added missin S: entry in MAINTAINERS
>> - removed unused #include "qemu-common.h"
>> - bumped "Since:" version to 7.2 in qapi/audio.json
>> - regenerated scripts/meson-buildoptions.sh
>> - implement buffer_get_free() method, introduced by
>> =C2=A0=C2=A0 commit 9833438ef624155de879d4ed57ecfcd3464a0bbe
>>
>> =C2=A0=C2=A0 audio: restore mixing-engine playback buffer size
>>
>> Running "make update-buildoptions" triggered unrelated changes of
>> scripts/meson-buildoptions.sh, that I removed from the commit as they
>> are not related to sndio.
>>
>> Tested on OpenBSD, still works as expected :-)
>>
>> Regards,
>> Alexandre
>>
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
>> =C2=A0 audio/audio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 audio/audio_template.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +
>> =C2=A0 audio/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 audio/sndioaudio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 565 ++++++++++++++++++++++++++++++++++
>> =C2=A0 meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
>> =C2=A0 meson_options.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
>> =C2=A0 qapi/audio.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 25 +-
>> =C2=A0 qemu-options.hx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +
>> =C2=A0 scripts/meson-buildoptions.sh |=C2=A0=C2=A0 7 +-
>> =C2=A0 10 files changed, 632 insertions(+), 5 deletions(-)
>> =C2=A0 create mode 100644 audio/sndioaudio.c
>>
>
> Tested again on Linux.
>
> Reviewed-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Tested-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

ping.

