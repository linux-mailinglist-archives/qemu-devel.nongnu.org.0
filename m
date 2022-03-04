Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882124CD898
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:07:33 +0100 (CET)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQASq-00033k-0B
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQAFz-0004Ry-Uh; Fri, 04 Mar 2022 10:54:15 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:45379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQAFy-0004ww-6V; Fri, 04 Mar 2022 10:54:15 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MhDIw-1o3KYL2XH0-00eNci; Fri, 04 Mar 2022 16:54:03 +0100
Message-ID: <ff78228f-b4f6-9bba-9efc-a06d4f339035@vivier.eu>
Date: Fri, 4 Mar 2022 16:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] qtest: replace gettimeofday with GTimer
Content-Language: fr
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-3-marcandre.lureau@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220304152704.3466036-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mOD4XREQRHflxbDjoHatsHL/1+gPcDa8FrEsb9dkDkdF55UiRnd
 j+q7A7OFUgFNmMj9hHQ15/dXs71MXLkeMK1cUNsII26I1y0w9T94iEuhMiHWdcFlVaXkFFt
 G47DhGh4D/ZBMGIqyNR5iEn8MBa1DpF1UCgK3rGQoenKeSTgm1sx5wbSjhDnTAq6Ew0cKrn
 7JS9D+TAlC+r7FddH9pDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WWmS4QIPLVY=:kXER+j04kHsivvmCiLX1ES
 wwgfGmf+88XC7r1QdTYzpJ9m0yNb6YcYNeXhpZY3gfzuuSSrVuv+27NhejXTtKHU/e2l5wxA/
 wCXwMQ3S5jRWi6hVu+KCPKmubVeO5P+zeaNp9gMDXbCJQZrtcrIpta4ojNqxO0pdD2ykpCbSz
 jTre8XKmdb5BbkV4LGrHA4hXZ8+cUe3OynY7/gJs1P/hRNf8pnbTm7TGdtW2qeMAH+a6xDhnn
 IJS4M3N3cPkLLrX2XOfbHAWJKEXicp54BKaasitSo+/o8YgWFLwyWs5FTW3XVRlgULR3ASBLM
 URpE4kbHmW+M0OT53PK6o6AXze/9fc7JADpXl9LovKe0zNeH0npS71JuV0GwySGURnh1IY4KM
 QE3o67kZoAZkmj2AkS6JsLLq5J4v0G3Qihn/AKOnmgc3Y28lm7CQMIPBgwr0V9HSS78iqYKwq
 e+4lcgrjRy5rAObUmMZcy6z0SfE5CrPnwiIqNC+JxLEsyK7gZIVsi0oExbVk23D6Qk4i6GthZ
 YEYe/uRQV6wjpBw+n9xDEREKUHnf9TYBCdHnzNFBW/tcsYT00yNgoDbNa4nQE1Cgq1uOV6KWE
 BFLpqKlOHdYqSjuuGlq2d3f/fazLig71oCYHInPP67m3PIC0h5Ess6kX/yrlaJf3WOOJ53v4U
 A7SU4cuwl/S3goI8bJQQLbgaVYugSYPdT+HsTM6ETRsa4+nWlu4a1u4O9LW0DsV9eoeQ=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/03/2022 à 16:27, marcandre.lureau@redhat.com a écrit :
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> glib provides a convenience helper to measure elapsed time. It isn't
> subject to wall-clock time changes.
> 
> Note that this changes the initial OPENED time, which used to print the
> current time.
> 

Time is printed using FMT_timeval ("%ld.%06ld"), but g_timer_elapsed() returns a gdouble.

Are you sure it works properly?

Laurent

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   softmmu/qtest.c | 39 ++++++++++-----------------------------
>   1 file changed, 10 insertions(+), 29 deletions(-)
> 
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 8b7cb6aa8e46..b2bb7777d17d 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -58,12 +58,12 @@ static FILE *qtest_log_fp;
>   static QTest *qtest;
>   static GString *inbuf;
>   static int irq_levels[MAX_IRQ];
> -static qemu_timeval start_time;
> +static GTimer *timer;
>   static bool qtest_opened;
>   static void (*qtest_server_send)(void*, const char*);
>   static void *qtest_server_send_opaque;
>   
> -#define FMT_timeval "%ld.%06ld"
> +#define FMT_timeval "%.06f"
>   
>   /**
>    * DOC: QTest Protocol
> @@ -264,28 +264,13 @@ static int hex2nib(char ch)
>       }
>   }
>   
> -static void qtest_get_time(qemu_timeval *tv)
> -{
> -    qemu_gettimeofday(tv);
> -    tv->tv_sec -= start_time.tv_sec;
> -    tv->tv_usec -= start_time.tv_usec;
> -    if (tv->tv_usec < 0) {
> -        tv->tv_usec += 1000000;
> -        tv->tv_sec -= 1;
> -    }
> -}
> -
>   static void qtest_send_prefix(CharBackend *chr)
>   {
> -    qemu_timeval tv;
> -
>       if (!qtest_log_fp || !qtest_opened) {
>           return;
>       }
>   
> -    qtest_get_time(&tv);
> -    fprintf(qtest_log_fp, "[S +" FMT_timeval "] ",
> -            (long) tv.tv_sec, (long) tv.tv_usec);
> +    fprintf(qtest_log_fp, "[S +" FMT_timeval "] ", g_timer_elapsed(timer, NULL));
>   }
>   
>   static void GCC_FMT_ATTR(1, 2) qtest_log_send(const char *fmt, ...)
> @@ -386,12 +371,9 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>       command = words[0];
>   
>       if (qtest_log_fp) {
> -        qemu_timeval tv;
>           int i;
>   
> -        qtest_get_time(&tv);
> -        fprintf(qtest_log_fp, "[R +" FMT_timeval "]",
> -                (long) tv.tv_sec, (long) tv.tv_usec);
> +        fprintf(qtest_log_fp, "[R +" FMT_timeval "]", g_timer_elapsed(timer, NULL));
>           for (i = 0; words[i]; i++) {
>               fprintf(qtest_log_fp, " %s", words[i]);
>           }
> @@ -846,21 +828,20 @@ static void qtest_event(void *opaque, QEMUChrEvent event)
>           for (i = 0; i < ARRAY_SIZE(irq_levels); i++) {
>               irq_levels[i] = 0;
>           }
> -        qemu_gettimeofday(&start_time);
> +
> +        g_clear_pointer(&timer, g_timer_destroy);
> +        timer = g_timer_new();
>           qtest_opened = true;
>           if (qtest_log_fp) {
> -            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n",
> -                    (long) start_time.tv_sec, (long) start_time.tv_usec);
> +            fprintf(qtest_log_fp, "[I " FMT_timeval "] OPENED\n", g_timer_elapsed(timer, NULL));
>           }
>           break;
>       case CHR_EVENT_CLOSED:
>           qtest_opened = false;
>           if (qtest_log_fp) {
> -            qemu_timeval tv;
> -            qtest_get_time(&tv);
> -            fprintf(qtest_log_fp, "[I +" FMT_timeval "] CLOSED\n",
> -                    (long) tv.tv_sec, (long) tv.tv_usec);
> +            fprintf(qtest_log_fp, "[I +" FMT_timeval "] CLOSED\n", g_timer_elapsed(timer, NULL));
>           }
> +        g_clear_pointer(&timer, g_timer_destroy);
>           break;
>       default:
>           break;


