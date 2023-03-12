Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7866B63C5
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 09:03:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbGeA-0008Ot-6S; Sun, 12 Mar 2023 04:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pbGdo-0008O9-5q
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 04:01:23 -0400
Received: from mailout03.t-online.de ([194.25.134.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pbGdk-0001T0-5T
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 04:01:13 -0400
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout03.t-online.de (Postfix) with SMTP id 77A2E2065A;
 Sun, 12 Mar 2023 09:01:09 +0100 (CET)
Received: from [192.168.211.200] ([79.208.22.72]) by fwd80.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pbGdf-1PdvST0; Sun, 12 Mar 2023 09:01:07 +0100
Message-ID: <64425814-c379-ef8f-b217-11d47f9f3bab@t-online.de>
Date: Sun, 12 Mar 2023 09:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: Dorinda Bassey <dbassey@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: kraxel@redhat.com, armbru@redhat.com, qemu_oss@crudebyte.com,
 pbonzini@redhat.com, wtaymans@redhat.com, qemu-devel@nongnu.org
References: <20230306171020.381116-1-dbassey@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230306171020.381116-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1678608067-ABFF2A74-72E06E47/0/0 CLEAN NORMAL
X-TOI-MSGID: 969a7c65-eb11-40de-9fab-d41363a2814c
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

> +/* output data processing function to read stuffs from the buffer */
> +static void
> +playback_on_process(void *data)
> +{
> +    PWVoice *v = (PWVoice *) data;
> +    void *p;
> +    struct pw_buffer *b;
> +    struct spa_buffer *buf;
> +    uint32_t n_frames, req, index, n_bytes;
> +    int32_t avail;
> +
> +    if (!v->stream) {
> +        return;
> +    }
> +
> +    /* obtain a buffer to read from */
> +    b = pw_stream_dequeue_buffer(v->stream);
> +    if (b == NULL) {
> +        error_report("out of buffers: %s", strerror(errno));
> +        return;
> +    }
> +
> +    buf = b->buffer;
> +    p = buf->datas[0].data;
> +    if (p == NULL) {
> +        return;
> +    }
> +    req = b->requested * v->frame_size;
> +    if (req == 0) {
> +        req = 4096 * v->frame_size;
> +    }
> +    n_frames = SPA_MIN(req, buf->datas[0].maxsize);
> +    n_bytes = n_frames * v->frame_size;
> +
> +    /* get no of available bytes to read data from buffer */
> +
> +    avail = spa_ringbuffer_get_read_index(&v->ring, &index);
> +
> +    if (!v->enabled) {
> +        avail = 0;
> +    }
> +
> +    if (avail == 0) {
> +        memset(p, 0, n_bytes);

memset() doesn't work for unsigned samples. For unsigned samples, a 
stream of zeros is silence with a DC offset. When Pipewire mixes this 
stream with another, the result is a clipped audio stream. To hear this, 
start QEMU with qemu-system-x86_64 -machine pcspk-audiodev=audio0 
-device ich9-intel-hda -device hda-duplex,audiodev=audio0 -audiodev 
pipewire,id=audio0,out.mixing-engine=off ... and start playback with the 
hda device.

With best regards,
Volker

> +    } else {
> +        if (avail < (int32_t) n_bytes) {
> +            n_bytes = avail;
> +        }
> +
> +        spa_ringbuffer_read_data(&v->ring,
> +                                    v->buffer, RINGBUFFER_SIZE,
> +                                    index & RINGBUFFER_MASK, p, n_bytes);
> +
> +        index += n_bytes;
> +        spa_ringbuffer_read_update(&v->ring, index);
> +    }
> +
> +    buf->datas[0].chunk->offset = 0;
> +    buf->datas[0].chunk->stride = v->frame_size;
> +    buf->datas[0].chunk->size = n_bytes;
> +
> +    /* queue the buffer for playback */
> +    pw_stream_queue_buffer(v->stream, b);
> +}
> +
>

