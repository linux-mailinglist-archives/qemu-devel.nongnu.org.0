Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22325181A2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:49:19 +0200 (CEST)
Received: from localhost ([::1]:33906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlp9i-0000Tq-Rv
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1nlp1g-0000YW-9k; Tue, 03 May 2022 05:41:00 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:43316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1nlp1e-0004D8-7x; Tue, 03 May 2022 05:40:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5281D1F750;
 Tue,  3 May 2022 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651570852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yd/iDnQM5oGNN8QPbxPCoU1QbjGVJ37w6kFC3XxuskY=;
 b=VVVQknNcQBlWCec+8uskws2EnUzr7pb3nRuRjOmZ4yO+hYVeRgcPRSBlQKe8gg9gvT3cnj
 Peq04is022y5D+WvOKKpuT+Ceg5H7i/sWC4F9opT5eqg5BZ3ahXH26CVcxMAIgvsiR1apG
 UECZm/qRxEeINw+7i2X/UybTkhlGzUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651570852;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yd/iDnQM5oGNN8QPbxPCoU1QbjGVJ37w6kFC3XxuskY=;
 b=1L4AADtYLiN/qDY8UU0aYBdy5+OaGtaxRpk/9gTxQVP40/skFeWiW6POdT+xoKzCrmfyiH
 Vq10GNv7ZZYmHXBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0A5313AA3;
 Tue,  3 May 2022 09:40:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lRg9MaP4cGL+XAAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 03 May 2022 09:40:51 +0000
Subject: Re: [PATCH v7 00/22] host: Support macOS 12
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b0933f87-3a73-fbfb-f3ee-52e7ecde73a0@suse.de>
Date: Tue, 3 May 2022 11:40:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 3/7/22 12:17 AM, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Few patches to be able to build QEMU on macOS 12 (Monterey).
> 
> Missing review:
>  0006-hvf-Fix-OOB-write-in-RDTSCP-instruction-decode.patch
>  0013-osdep-Avoid-using-Clang-specific-__builtin_available.patch
>  0014-meson-Resolve-the-entitlement.sh-script-once-for-goo.patch
>  0015-meson-Log-QEMU_CXXFLAGS-content-in-summary.patch
>  0016-configure-Pass-filtered-QEMU_OBJCFLAGS-to-meson.patch
>  0017-ui-cocoa-Constify-qkeycode-translation-arrays.patch
>  0020-ui-cocoa-capture-all-keys-and-combos-when-mouse-is-g.patch
>  0021-ui-cocoa-add-option-to-swap-Option-and-Command.patch
>  0022-gitlab-ci-Support-macOS-12-via-cirrus-run.patch
> 
> Since v6:
> - Dropped merged patches
> - Addressed Akihiko Odaki comments (squashed 2 patches, added R/T-b)
> - Dropped 'configure: Disable out-of-line atomic operations on Aarch64'
> - Add few macos patches on the list pending for 7.0 so tested by CI


Hi Philippe, I did not find v6 somehow,

and I was looking for patch:

"[PATCH v5 06/16] hvf: Enable RDTSCP support"

was it dropped / merged with something else? I do not see it in latest git, nor in this respin,
maybe it is in your tree somewhere?

Thanks,

Claudio

> 
> Since v5:
> - Fixed failed rebase between patches 10 and 16 (Akihiko)
> - Include "ui/cocoa: Fix the leak of qemu_console_get_label"
> 
> Since v4:
> - Use MAC_OS_X_VERSION_MIN_REQUIRED definition (Akihiko)
> - Include patches from Akihiko
> 
> Since v3:
> - Fix --enable-modules
> - Ignore #pragma on softfloat3 tests
> - Addressed Akihiko Odaki comments
> - Include Cameron Esfahani patches
> 
> Since v2:
> - Addressed Akihiko Odaki comments:
>   . use __is_identifier(),
>   . remove cocoa setAllowedFileTypes()
> - Addressed Daniel Berrangé comment:
>   . rebased on testing/next, update libvirt-ci/lcitool
> 
> Akihiko Odaki (2):
>   audio: Log context for audio bug
>   coreaudio: Always return 0 in handle_voice_change
> 
> Cameron Esfahani (2):
>   hvf: Use standard CR0 and CR4 register definitions
>   hvf: Fix OOB write in RDTSCP instruction decode
> 
> Carwyn Ellis (2):
>   ui/cocoa: add option to disable left-command forwarding to guest
>   ui/cocoa: release mouse when user switches away from QEMU window
> 
> Gustavo Noronha Silva (2):
>   ui/cocoa: capture all keys and combos when mouse is grabbed
>   ui/cocoa: add option to swap Option and Command
> 
> Philippe Mathieu-Daudé (14):
>   configure: Allow passing extra Objective C compiler flags
>   tests/fp/berkeley-testfloat-3: Ignore ignored #pragma directives
>   hvf: Make hvf_get_segments() / hvf_put_segments() local
>   hvf: Remove deprecated hv_vcpu_flush() calls
>   block/file-posix: Remove a deprecation warning on macOS 12
>   audio/coreaudio: Remove a deprecation warning on macOS 12
>   audio/dbus: Fix building with modules on macOS
>   audio: Rename coreaudio extension to use Objective-C compiler
>   osdep: Avoid using Clang-specific __builtin_available()
>   meson: Resolve the entitlement.sh script once for good
>   meson: Log QEMU_CXXFLAGS content in summary
>   configure: Pass filtered QEMU_OBJCFLAGS to meson
>   ui/cocoa: Constify qkeycode translation arrays
>   gitlab-ci: Support macOS 12 via cirrus-run
> 
>  .gitlab-ci.d/cirrus.yml            |  16 ++++
>  .gitlab-ci.d/cirrus/macos-12.vars  |  16 ++++
>  audio/audio.c                      |  25 +++---
>  audio/audio_template.h             |  27 +++----
>  audio/{coreaudio.c => coreaudio.m} |  23 +++---
>  audio/meson.build                  |   4 +-
>  block/file-posix.c                 |  14 +++-
>  configure                          |  31 ++++++++
>  include/qemu/osdep.h               |  10 +--
>  meson.build                        |  17 +++-
>  qapi/ui.json                       |  29 +++++++
>  qemu-options.hx                    |  15 ++++
>  target/i386/hvf/vmx.h              |  19 +++--
>  target/i386/hvf/x86.c              |   6 +-
>  target/i386/hvf/x86.h              |  34 --------
>  target/i386/hvf/x86_decode.c       |  12 ++-
>  target/i386/hvf/x86_mmu.c          |   2 +-
>  target/i386/hvf/x86_task.c         |   4 +-
>  target/i386/hvf/x86hvf.c           |  14 +++-
>  target/i386/hvf/x86hvf.h           |   3 +-
>  tests/fp/meson.build               |   5 ++
>  tests/lcitool/refresh              |   1 +
>  ui/cocoa.m                         | 122 ++++++++++++++++++++++++++---
>  23 files changed, 327 insertions(+), 122 deletions(-)
>  create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars
>  rename audio/{coreaudio.c => coreaudio.m} (97%)
> 


