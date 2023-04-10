Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C97B6DC431
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 10:10:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plmai-0008Uq-3m; Mon, 10 Apr 2023 04:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1plmad-0008U1-Ga
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 04:09:27 -0400
Received: from mailout01.t-online.de ([194.25.134.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1plmaa-000823-Tg
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 04:09:27 -0400
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout01.t-online.de (Postfix) with SMTP id CDF2418F9A;
 Mon, 10 Apr 2023 10:09:21 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.29.86]) by fwd85.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1plmaS-1Kyv3Z0; Mon, 10 Apr 2023 10:09:16 +0200
Message-ID: <a0af8c5b-c32e-0f71-54f0-fabf41f9eeb6@t-online.de>
Date: Mon, 10 Apr 2023 10:09:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Content-Language: en-US
To: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@gmail.com, kraxel@redhat.com, armbru@redhat.com,
 qemu_oss@crudebyte.com, pbonzini@redhat.com, wtaymans@redhat.com
References: <20230403202053.80737-1-dbassey@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230403202053.80737-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1681114156-96FFAC52-A11E8007/0/0 CLEAN NORMAL
X-TOI-MSGID: 1d407570-dca5-47aa-ac4f-19a547c43296
Received-SPF: none client-ip=194.25.134.80; envelope-from=vr_qemu@t-online.de;
 helo=mailout01.t-online.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.888, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Dorinda,

> This commit adds a new audiodev backend to allow QEMU to use Pipewire as
> both an audio sink and source. This backend is available on most systems
>
> Add Pipewire entry points for QEMU Pipewire audio backend
> Add wrappers for QEMU Pipewire audio backend in qpw_pcm_ops()
> qpw_write function returns the current state of the stream to pwaudio
> and Writes some data to the server for playback streams using pipewire
> spa_ringbuffer implementation.
> qpw_read function returns the current state of the stream to pwaudio and
> reads some data from the server for capture streams using pipewire
> spa_ringbuffer implementation. These functions qpw_write and qpw_read
> are called during playback and capture.
> Added some functions that convert pw audio formats to QEMU audio format
> and vice versa which would be needed in the pipewire audio sink and
> source functions qpw_init_in() & qpw_init_out().
> These methods that implement playback and recording will create streams
> for playback and capture that will start processing and will result in
> the on_process callbacks to be called.
> Built a connection to the Pipewire sound system server in the
> qpw_audio_init() method.
>
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
> ---
> v10:
> improve error handling
> fix volume functions
> add locks in enable_in out functions
> cleanup in reverse order of intialization
> add triggers for the sync method on the core object
> add waiting function for pw_thread_loop_signal
> improve trace
>
>   audio/audio.c                 |   3 +
>   audio/audio_template.h        |   4 +
>   audio/meson.build             |   1 +
>   audio/pwaudio.c               | 906 ++++++++++++++++++++++++++++++++++
>   audio/trace-events            |   8 +
>   meson.build                   |   8 +
>   meson_options.txt             |   4 +-
>   qapi/audio.json               |  44 ++
>   qemu-options.hx               |  21 +
>   scripts/meson-buildoptions.sh |   8 +-
>   10 files changed, 1004 insertions(+), 3 deletions(-)
>   create mode 100644 audio/pwaudio.c

> diff --git a/audio/trace-events b/audio/trace-events
> index e1ab643add..d6c36139e5 100644
> --- a/audio/trace-events
> +++ b/audio/trace-events
> @@ -18,6 +18,14 @@ dbus_audio_register(const char *s, const char *dir) "sender = %s, dir = %s"
>   dbus_audio_put_buffer_out(size_t len) "len = %zu"
>   dbus_audio_read(size_t len) "len = %zu"
>   
> +# pwaudio.c
> +pw_state_changed(int nodeid, const char *s) "node id: %d stream state: %s"
> +pw_read(int32_t avail, uint32_t index, size_t len) "avail=%d index=%u len=%zu"
> +pw_write(int32_t filled, int32_t avail, uint32_t index, size_t len) "filled=%d avail=%d index=%u len=%zu"
> +pw_vol(const char *ret) "set volume: %s"
> +pw_timer(uint64_t buf_samples) "buffer samples = %lu"

The compilation fails on Windows. It's "%" PRIu64 instead of "%lu". Btw. 
I think it would be better to trace the 'quantum' instead of 'buffer 
samples'.

FAILED: libqemuutil.a.p/meson-generated_.._trace_trace-audio.c.obj
"cc" "-m64" "-mcx16" "-Ilibqemuutil.a.p" "-I." "-I../qemu" "-Iqapi" 
"-Itrace" "-Iui" "-Iui/shader" 
"-IC:/usr/msys64/mingw64/include/glib-2.0" 
"-IC:/usr/msys64/mingw64/lib/glib-2.0/include" 
"-IC:/usr/msys64/mingw64/include/pixman-1" "-fdiagnostics-color=auto" 
"-Wall" "-Winvalid-pch" "-Werror" "-std=gnu11" "-O2" "-g" "-iquote" "." 
"-iquote" "C:/usr/msys64/home/ruemelin/git/qemu" "-iquote" 
"C:/usr/msys64/home/ruemelin/git/qemu/include" "-iquote" 
"C:/usr/msys64/home/ruemelin/git/qemu/tcg/i386" "-U_FORTIFY_SOURCE" 
"-D_FORTIFY_SOURCE=2" "-fno-pie" "-no-pie" "-D_GNU_SOURCE" 
"-D_FILE_OFFSET_BITS=64" "-D_LARGEFILE_SOURCE" "-fno-strict-aliasing" 
"-fno-common" "-fwrapv" "-Wundef" "-Wwrite-strings" 
"-Wmissing-prototypes" "-Wstrict-prototypes" "-Wredundant-decls" 
"-Wold-style-declaration" "-Wold-style-definition" "-Wtype-limits" 
"-Wformat-security" "-Wformat-y2k" "-Winit-self" "-Wignored-qualifiers" 
"-Wempty-body" "-Wnested-externs" "-Wendif-labels" 
"-Wexpansion-to-defined" "-Wimplicit-fallthrough=2" 
"-Wmissing-format-attribute" "-Wno-missing-include-dirs" 
"-Wno-shift-negative-value" "-Wno-psabi" "-fstack-protector-strong" 
"-pthread" -MD -MQ 
libqemuutil.a.p/meson-generated_.._trace_trace-audio.c.obj -MF 
"libqemuutil.a.p/meson-generated_.._trace_trace-audio.c.obj.d" -o 
libqemuutil.a.p/meson-generated_.._trace_trace-audio.c.obj "-c" 
trace/trace-audio.c
In file included from trace/trace-audio.c:5:
C:/usr/msys64/home/ruemelin/git/qemu/audio/trace-events: In function 
'_nocheck__trace_pw_timer':
C:/usr/msys64/home/ruemelin/git/qemu/audio/trace-events:26:22: error: 
format '%lu' expects argument of type 'long unsigned int', but argument 
5 has type 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
    26 | pw_timer(uint64_t buf_samples) "buffer samples = %lu"
       |                      ^~~~~~~~~~~~~~~~~~~~~~~~
......
    29 | # audio.c
       |
       |                        |
       |                        uint64_t {aka long long unsigned int}
C:/usr/msys64/home/ruemelin/git/qemu/audio/trace-events:26:22: error: 
format '%lu' expects argument of type 'long unsigned int', but argument 
2 has type 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
    26 | pw_timer(uint64_t buf_samples) "buffer samples = %lu"
       |                      ^~~~~~~~~~~
|                                                               |
| uint64_t {aka long long unsigned int}
cc1.exe: all warnings being treated as errors

With best regards,
Volker

> +pw_audio_init(void) "Initialize Pipewire context"
> +
>   # audio.c
>   audio_timer_start(int interval) "interval %d ms"
>   audio_timer_stop(void) ""
>



