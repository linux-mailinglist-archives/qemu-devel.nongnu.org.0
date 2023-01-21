Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517567656C
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 10:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJARw-0005tk-0M; Sat, 21 Jan 2023 04:46:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pJARr-0005sH-UL
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:46:07 -0500
Received: from mailout10.t-online.de ([194.25.134.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pJARo-0002Xg-Kl
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 04:46:07 -0500
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout10.t-online.de (Postfix) with SMTP id 61BA69E1E;
 Sat, 21 Jan 2023 10:46:00 +0100 (CET)
Received: from [192.168.211.200] ([79.208.25.151]) by fwd80.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pJARj-0RQlUX0; Sat, 21 Jan 2023 10:45:59 +0100
Message-ID: <0a4007dc-e11c-f16e-0e21-dbc4e60caa59@t-online.de>
Date: Sat, 21 Jan 2023 10:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v2 00/11] audio: more improvements
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1674294360-AAFF4A74-10D43EF1/0/0 CLEAN NORMAL
X-TOI-MSGID: 7ad5e98f-fd8c-4bdd-b5cc-a9ef446e4dfa
Received-SPF: none client-ip=194.25.134.21; envelope-from=vr_qemu@t-online.de;
 helo=mailout10.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

A few patches from my audio patch queue.

Patches 1 - 2:
If a guest selects an unsupported sample rate, an error message is 
currently shown. The first patch takes care to suppress the error 
message and reports with the qemu_log_mask(LOG_UNIMP, ...) function that 
this is not supported. The second patch is needed because there are two 
code paths to reach the qemu_log_mask() function in the 
audio_pcm_sw_alloc_resources_* functions. The second path prints an 
additional error message up to now.

For more background information:
https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg04940.html

Patches 3 - 4:
General improvements.

Patches 5 - 9:
These patches remove the audio_calloc() function. The GLib g_new0 macro 
is a better replacement for audio_calloc(). There's one exception where 
g_malloc0() fits better.

Patches 10 - 11:
Audio playback and recording with the ALSA audio backend currently 
doesn't work well with the default audio settings.

v2: Address Daniel's comments

[PATCH v2 07/11] audio/audio_template: use g_malloc0() to replace 
audio_calloc()
The n_bytes argument of g_malloc0() is now always > 0 at this call site.

[PATCH v2 08/11] audio/audio_template: use g_new0() to replace 
audio_calloc()
Check samples for negative values. It's possible to have negative 
samples due to overflows or unsigned to signed conversions. Patch 01/11 
takes care of samples == 0.

Volker Rümelin (11):
   audio: log unimplemented audio device sample rates
   audio: don't show unnecessary error messages
   audio: rename hardware store to backend
   audio: remove unused #define AUDIO_STRINGIFY
   audio/mixeng: use g_new0() instead of audio_calloc()
   audio/alsaaudio: use g_new0() instead of audio_calloc()
   audio/audio_template: use g_malloc0() to replace audio_calloc()
   audio/audio_template: use g_new0() to replace audio_calloc()
   audio: remove audio_calloc() function
   alsaaudio: change default playback settings
   alsaaudio: reintroduce default recording settings

  audio/alsaaudio.c      | 27 ++++++-----------
  audio/audio.c          | 26 +---------------
  audio/audio_int.h      |  8 ++---
  audio/audio_template.h | 68 ++++++++++++++++++++++--------------------
  audio/mixeng.c         |  7 +----
  5 files changed, 48 insertions(+), 88 deletions(-)

-- 
2.35.3

