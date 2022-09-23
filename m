Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553B55E81DE
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:40:21 +0200 (CEST)
Received: from localhost ([::1]:58308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnb0-0006oV-Vg
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1obnWA-0001Jk-CI
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:35:20 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:45230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1obnW5-0004oa-13
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:35:16 -0400
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout04.t-online.de (Postfix) with SMTP id 9FEF53E84;
 Fri, 23 Sep 2022 20:35:05 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.228.229]) by fwd78.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1obnVq-40vw1Z0; Fri, 23 Sep 2022 20:34:58 +0200
Message-ID: <38d7417a-fc26-be39-6a63-99c79ee15fc9@t-online.de>
Date: Fri, 23 Sep 2022 20:34:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 00/12] audio: misc. improvements and bug fixes
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Geoffrey McRae <geoff@hostfission.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1663958098-79BAA9DD-ED716B3B/0/0 CLEAN NORMAL
X-TOI-MSGID: c7163aba-5485-4e1a-846f-6aff184f785d
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

A series of audio improvements and fixes.

One note:

Patch 11/12 "audio: fix sw->buf size for audio recording":
If this patch is applied without the patch series "[PATCH 0/2] audio: 
prevent a class of guest-triggered aborts" at 
https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg02347.html, 
issue #71 triggers a QEMU abort. Patch 11/12 is nevertheless correct.

Volker Rümelin (12):
   audio: refactor code in audio_run_out()
   audio: fix GUS audio playback with out.mixing-engine=off
   audio: run downstream playback queue unconditionally
   alsaaudio: reduce playback latency
   audio: add more audio rate control functions
   spiceaudio: add a pcm_ops buffer_get_free function
   spiceaudio: update comment
   audio: swap audio_rate_get_bytes() function parameters
   audio: rename audio_sw_bytes_free()
   audio: refactor audio_get_avail()
   audio: fix sw->buf size for audio recording
   audio: prevent an integer overflow in resampling code

  audio/alsaaudio.c      |  38 ++++++++++++++-
  audio/audio.c          | 107 +++++++++++++++++++++++++++--------------
  audio/audio_int.h      |   4 +-
  audio/audio_template.h |   4 ++
  audio/dbusaudio.c      |   4 +-
  audio/noaudio.c        |   4 +-
  audio/rate_template.h  |  11 +++--
  audio/spiceaudio.c     |  19 ++++++--
  audio/wavaudio.c       |   2 +-
  9 files changed, 141 insertions(+), 52 deletions(-)

-- 
2.35.3

