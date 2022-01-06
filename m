Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EB34862E8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:27:05 +0100 (CET)
Received: from localhost ([::1]:51542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Pz6-0005jk-Iw
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:27:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n5PPW-0004pv-Ga
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:50:20 -0500
Received: from mailout03.t-online.de ([194.25.134.81]:33074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1n5PPU-0007Lt-HK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 04:50:18 -0500
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout03.t-online.de (Postfix) with SMTP id 30B6A849;
 Thu,  6 Jan 2022 10:48:08 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd75.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1n5PNP-3zf0zJ0; Thu, 6 Jan 2022 10:48:07 +0100
Message-ID: <de8ab0a9-debc-e205-bbc2-7602a704468b@t-online.de>
Date: Thu, 6 Jan 2022 10:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 00/15] reduce audio playback latency
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
References: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
In-Reply-To: <cfcae86f-59c3-a2c5-76cd-1ab5e23e20f3@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1641462487-000184BD-4A155DEC/0/0 CLEAN NORMAL
X-TOI-MSGID: d1a2d25e-f682-4e81-875e-65153840a834
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> This patch series reduces the playback latency for audio backends,
> in some cases significantly. For PulseAudio, the audio buffer is
> also moved from the QEMU side to the PulseAudio server side. This
> improves the drop-out safety for PulseAudio.
>

>
> Volker Rümelin (15):
>   audio: replace open-coded buffer arithmetic
>   audio: move function audio_pcm_hw_clip_out()
>   audio: add function audio_pcm_hw_conv_in()
>   audio: inline function audio_pcm_sw_get_rpos_in()
>   paaudio: increase default latency to 46ms
>   jackaudio: use more jack audio buffers
>   audio: copy playback stream in sequential order
>   audio: add pcm_ops function table for capture backend
>   audio: revert tests for pcm_ops table
>   audio: restore mixing-engine playback buffer size
>   paaudio: reduce effective playback buffer size
>   dsoundaudio: reduce effective playback buffer size
>   ossaudio: reduce effective playback buffer size
>   paaudio: fix samples vs. frames mix-up
>   sdlaudio: fix samples vs. frames mix-up
>
>  audio/alsaaudio.c   |   1 +
>  audio/audio.c       | 194 ++++++++++++++++++++++++--------------------
>  audio/audio_int.h   |   9 +-
>  audio/coreaudio.c   |  13 +--
>  audio/dsoundaudio.c |  30 ++++---
>  audio/jackaudio.c   |   5 +-
>  audio/noaudio.c     |   1 +
>  audio/ossaudio.c    |  17 +++-
>  audio/paaudio.c     |  49 ++++++-----
>  audio/sdlaudio.c    |  21 +++--
>  audio/wavaudio.c    |   1 +
>  11 files changed, 199 insertions(+), 142 deletions(-)
>

I used the wrong mail address to send these patches. I'll wait a few 
days for reviews before I send a version 2 series with the correct address.

With best regards,
Volker

