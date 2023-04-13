Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED86B6E0680
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 07:43:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmpiD-0003zy-Eb; Thu, 13 Apr 2023 01:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pmpi4-0003zP-Dr
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 01:41:28 -0400
Received: from mailout04.t-online.de ([194.25.134.18])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pmpi0-0004EL-Qe
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 01:41:28 -0400
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout04.t-online.de (Postfix) with SMTP id 0671BC626;
 Thu, 13 Apr 2023 07:41:20 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.18.128]) by fwd72.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pmphv-2JJmOP0; Thu, 13 Apr 2023 07:41:19 +0200
Message-ID: <13188abf-aad4-7ea4-4374-ac9f31d6f1b4@t-online.de>
Date: Thu, 13 Apr 2023 07:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v11] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Content-Language: en-US
To: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@gmail.com, kraxel@redhat.com, armbru@redhat.com,
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
References: <20230412135730.51012-1-dbassey@redhat.com>
 <CACzuRywAxttzMCB=8D_Lq+V-ZgTxAJs1azaB3Xxa+zN2zbufMA@mail.gmail.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <CACzuRywAxttzMCB=8D_Lq+V-ZgTxAJs1azaB3Xxa+zN2zbufMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1681364479-3C8ABC0E-66A58654/0/0 CLEAN NORMAL
X-TOI-MSGID: c57e7abc-bb72-45f5-9bea-699ddf8fcbb3
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.04.23 um 15:59 schrieb Dorinda Bassey:
> Hi Volker,
>
> It seems that for some unknown reason using audio_pcm_info_clear_buf in playback_process causes segmentation fault. Hence I moved the handling of buffer underruns from the playback process to the qpw_write process because that is the underlying cause of buffer underrun.
>

Hi Dorinda,

I guess you made a mistake somewhere if you see a segmentation fault. This patch for v10 works fine on my computer.

diff --git a/audio/pwaudio.c b/audio/pwaudio.c
index f9da86059f..0f272d6744 100644
--- a/audio/pwaudio.c
+++ b/audio/pwaudio.c
@@ -79,7 +79,7 @@ stream_destroy(void *data)
 static void
 playback_on_process(void *data)
 {
-    PWVoice *v = (PWVoice *) data;
+    PWVoice *v = data;
     void *p;
     struct pw_buffer *b;
     struct spa_buffer *buf;
@@ -108,19 +108,28 @@ playback_on_process(void *data)
     n_bytes = SPA_MIN(req, buf->datas[0].maxsize);
 
     /* get no of available bytes to read data from buffer */
-
     avail = spa_ringbuffer_get_read_index(&v->ring, &index);
+    if (avail <= 0) {
+        PWVoiceOut *vo = container_of(data, PWVoiceOut, v);
 
-    if (avail < (int32_t) n_bytes) {
-        n_bytes = avail;
-    }
+        audio_pcm_info_clear_buf(&vo->hw.info, p, n_bytes / v->frame_size);
+    } else {
+        if ((uint32_t)avail < n_bytes) {
+            /*
+             * PipeWire immediately calls this callback again if we provide
+             * less than n_bytes. Then audio_pcm_info_clear_buf() fills the
+             * rest of the buffer with silence.
+             */
+            n_bytes = avail;
+        }
 
-    spa_ringbuffer_read_data(&v->ring,
-                                v->buffer, RINGBUFFER_SIZE,
-                                index & RINGBUFFER_MASK, p, n_bytes);
+        spa_ringbuffer_read_data(&v->ring,
+                                 v->buffer, RINGBUFFER_SIZE,
+                                 index & RINGBUFFER_MASK, p, n_bytes);
 
-    index += n_bytes;
-    spa_ringbuffer_read_update(&v->ring, index);
+        index += n_bytes;
+        spa_ringbuffer_read_update(&v->ring, index);
+    }
 
     buf->datas[0].chunk->offset = 0;
     buf->datas[0].chunk->stride = v->frame_size;
-- 
2.35.3

With best regards,
Volker


