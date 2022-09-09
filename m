Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC0B5B2E9F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 08:19:28 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWXML-0005me-Sp
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 02:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oWXFw-00025D-FZ
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:12:49 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:50260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oWXFn-0002qc-CV
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 02:12:48 -0400
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout07.t-online.de (Postfix) with SMTP id B03D5C4BE;
 Fri,  9 Sep 2022 08:12:33 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.228.180]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oWXFe-4If2VV0; Fri, 9 Sep 2022 08:12:30 +0200
Message-ID: <f7ad8818-b165-4306-64f9-ec4e786a9493@t-online.de>
Date: Fri, 9 Sep 2022 08:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v3] audio: Add sndio backend
To: Alexandre Ratchov <alex@caoua.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Brad <brad@comstyle.com>
Cc: qemu-devel@nongnu.org
References: <YxibXrWsrS3XYQM3@vm1.arverb.com>
Content-Language: en-US
In-Reply-To: <YxibXrWsrS3XYQM3@vm1.arverb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1662703950-50A2B689-16050A26/0/0 CLEAN NORMAL
X-TOI-MSGID: dc7f095f-9d4e-4f92-8e71-e9b85f1fad4d
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.09.22 um 15:23 schrieb Alexandre Ratchov:
> sndio is the native API used by OpenBSD, although it has been ported to
> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.).
>
> Signed-off-by: Brad Smith<brad@comstyle.com>
> Signed-off-by: Alexandre Ratchov<alex@caoua.org>
> ---
>
> References to the previous patch versions and related discussions are
> here:
>
> https://marc.info/?l=qemu-devel&m=163973393011543	(v2)
> https://marc.info/?l=qemu-devel&m=163626248712444	(initial patch)
>
> Here are the changes between v2 and v3 of this patch:
>
> - fixed of typos in file-names in MAINTAINERS
> - added Gerd Hoffmann to the M: entry in MAINTAINERS
> - added missin S: entry in MAINTAINERS
> - removed unused #include "qemu-common.h"
> - bumped "Since:" version to 7.2 in qapi/audio.json
> - regenerated scripts/meson-buildoptions.sh
> - implement buffer_get_free() method, introduced by
>    commit 9833438ef624155de879d4ed57ecfcd3464a0bbe
>
>    audio: restore mixing-engine playback buffer size
>
> Running "make update-buildoptions" triggered unrelated changes of
> scripts/meson-buildoptions.sh, that I removed from the commit as they
> are not related to sndio.
>
> Tested on OpenBSD, still works as expected :-)
>
> Regards,
> Alexandre
>
>   MAINTAINERS                   |   7 +
>   audio/audio.c                 |   1 +
>   audio/audio_template.h        |   2 +
>   audio/meson.build             |   1 +
>   audio/sndioaudio.c            | 565 ++++++++++++++++++++++++++++++++++
>   meson.build                   |   9 +-
>   meson_options.txt             |   4 +-
>   qapi/audio.json               |  25 +-
>   qemu-options.hx               |  16 +
>   scripts/meson-buildoptions.sh |   7 +-
>   10 files changed, 632 insertions(+), 5 deletions(-)
>   create mode 100644 audio/sndioaudio.c
>

Tested again on Linux.

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>
Tested-by: Volker Rümelin <vr_qemu@t-online.de>


