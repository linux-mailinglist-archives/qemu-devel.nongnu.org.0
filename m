Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F16B1C84
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 08:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paArO-0002Dx-Sl; Thu, 09 Mar 2023 02:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paArI-0002Br-K5
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 02:38:42 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paArG-0004ts-9o
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 02:38:40 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso578932wms.5
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 23:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678347516;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I2H7BXPFKvJnVJYfDvMUg0n1itP0bahyQZ6NPxpoQKI=;
 b=UPHVaH51DocvFVk7cMBY9IRGcDKItPXm9skOim22XiQ9EjZp3/IgpTujSWW7H3c//6
 NFo17hlFlRTAxfX2925jb/uhbk4ekQpnj8uKbW8Np04vJ7Xzg5+uTsAFYVrNwMOXZIUr
 fT2CN+bG3bJItc/lRJ+JhLEBPWkAzo1wcIEQeGbkHDncP/nNjnGSitQzZBBbKFyMZ7ZL
 s3O6Fra0flYY0FCB3Mr9xKyRAHoeh5uj5NVfgxsRlqD1srpWGwHBbeRCLfENSoui+k1h
 W3e1qjROMTtm8P9Ns+oXarZKceJm66gkQAa3Kq6TjGiZ8hSNhFskYUJ/swxQ8MZ94C2x
 h6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678347516;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I2H7BXPFKvJnVJYfDvMUg0n1itP0bahyQZ6NPxpoQKI=;
 b=e1YueVgTbaEW/Bn8vU9BzNSbNfwEf2VIbNEQWvSm/Qj2D7b6Mz5ao6/P8nZZFLfG3I
 aQoHAIoRlcDVQvXP23wBW8g0BJlxu1hSXl8mVACIfJpWRT57yLHY+Ao5O2UjDOhzItH5
 18wENE/c2Pqa8h+i/eOI1LfAUtzs4er1JWZ66cxQWliaaRYxeE0zmckdDLI25A3FGD5q
 YrW/SvTpiSZdoZFUHECEprzR5iotffVAtIfgPmy5VA7rovxw5G6+a25q/PhLHtpumH4k
 b9hRa/wos3kX9yzNzpLuWtRfVU3nrEx0ew//yprdal8FfzJKTem+h9yubseRyZ1bpyB8
 QwNw==
X-Gm-Message-State: AO0yUKXdCDM4AxY5SFl195WA0NR4+ysq30KfLbQDy555teZEepGQ0eZR
 JUZvhZp+x16lWNcGgxfw/aVjpQ==
X-Google-Smtp-Source: AK7set+XnFK0zrtgcIavvAfV1DJ1tHT/+zLotCfJMeWRsa0x0kVaYVszByT8s/SxfTekN09YS+vdBg==
X-Received: by 2002:a05:600c:4fc5:b0:3ea:f0d6:5d37 with SMTP id
 o5-20020a05600c4fc500b003eaf0d65d37mr18135909wmq.8.1678347516268; 
 Wed, 08 Mar 2023 23:38:36 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b003eb596cbc54sm1845151wmo.0.2023.03.08.23.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 23:38:35 -0800 (PST)
Message-ID: <6309e5e3-e7d9-9089-7a02-b1487291378a@linaro.org>
Date: Thu, 9 Mar 2023 08:38:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] use qatzip to acclerate the live migration
Content-Language: en-US
To: "dennis.wu" <dennis.wu@intel.com>, qemu-devel@nongnu.org
References: <20230308005930.237169-1-dennis.wu@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
In-Reply-To: <20230308005930.237169-1-dennis.wu@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Dennis,

Thank for this patch.

On 8/3/23 01:59, dennis.wu wrote:
> qatzip https://github.com/intel/QATzip is a project that
> supply the zlib like api with the Intel QAT hardware.
> compress and decompress performance with small data block
> (4kb page) is low with qatzip API. so we compose multiple
> pages into a multi page address structure which is a buffer
> list, then we compose these pages together and then call
> compress and decompress. we also expand the io_buf_size
> since qat is fast have have stress to the IO_BUFF.
> 
> If there is no QAT hardware, qatzip will fall back to the
> software with proper congfiguration. that mean if host server

Typo "configuration".

> have the QAT hardware, while destination server don't have QAT,
> the live migration still work well.
> 
> To use the qatzip, one parameter is added in both host and
> destination side:
> (qemu) migrate_set_parameter compress-with-qat 1
> if you proper eabled the qatzip, then you can benefit from
> the QAT accelleration.

"acceleration".

> Since the compress/decompress offloading to the QAT hardware,
> no CPU resource neede (only a periodomic polling need some CPU

"needed", "periodic"

> resource).
> 
>  From the performance, with the same threads scale, with QATzip
> (HW), the live migration will have 2~4 time of performance.
> 
> plan: so far qatzip API support SVM，but no batch APIs and the
> requirement is raised. once the batch APIs ready, the perf expect
> to reach close to 10x.
> 
> Signed-off-by: dennis.wu <dennis.wu@intel.com>
> 
> update

What do you mean by "update" here?

Please prefix the patch subject with 'migration:'.

Please Cc the maintainers, otherwise your patch won't be
reviewed / merged:

$ ./scripts/get_maintainer.pl -f qapi/migration.json
Juan Quintela <quintela@redhat.com> (maintainer:Migration)
"Dr. David Alan Gilbert" <dgilbert@redhat.com> (maintainer:Migration)
Eric Blake <eblake@redhat.com> (supporter:QAPI Schema)
Markus Armbruster <armbru@redhat.com> (supporter:QAPI Schema)
qemu-devel@nongnu.org (open list:All patches CC here)

> ---
>   meson.build           |   3 +-
>   migration/migration.c |  22 ++
>   migration/migration.h |   1 +
>   migration/qemu-file.c |  13 +-
>   migration/qemu-file.h |   3 +
>   migration/ram.c       | 771 ++++++++++++++++++++++++++++++++++--------
>   monitor/hmp-cmds.c    |   4 +
>   qapi/migration.json   |   8 +-
>   8 files changed, 687 insertions(+), 138 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 861de93c4f..2c8ecba936 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -464,6 +464,7 @@ if have_system or have_tools
>                         method: 'pkg-config', kwargs: static_kwargs)
>   endif
>   zlib = dependency('zlib', required: true, kwargs: static_kwargs)
> +qatzip = dependency('qatzip', required: true, method: 'pkg-config', kwargs: static_kwargs)

IIUC when using "required: true", all hosts (and non-Intel ones too)
won't be able to build QEMU if libqatzip is not available / installed.

If libqatzip is compatible with pkg-config, you can use "method:
'pkg-config', required: qatzip.found()".
Otherwise better is to provide a generic --enable-qatzip option in
meson_options.txt, then you can use "required: get_option('qatzip')"
here.

See: https://www.qemu.org/docs/master/devel/build-system.html#stage-2-meson

>   libaio = not_found
>   if not get_option('linux_aio').auto() or have_block
> @@ -3058,7 +3059,7 @@ libmigration = static_library('migration', sources: migration_files + genh,
>                                 name_suffix: 'fa',
>                                 build_by_default: false)
>   migration = declare_dependency(link_with: libmigration,
> -                               dependencies: [zlib, qom, io])
> +                               dependencies: [qatzip, zlib, qom, io])
>   softmmu_ss.add(migration)
>   
>   block_ss = block_ss.apply(config_host, strict: false)
> diff --git a/migration/migration.c b/migration/migration.c
> index 695f0f2900..4a5c5c532e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c


> @@ -2421,6 +2431,15 @@ bool migrate_postcopy_blocktime(void)
>       return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME];
>   }
>   
> +bool migrate_compress_with_qat(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->parameters.compress_with_qat;
> +}


> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -388,6 +388,7 @@ bool migrate_use_return_path(void);
>   uint64_t ram_get_total_transferred_pages(void);
>   
>   bool migrate_use_compression(void);
> +bool migrate_compress_with_qat(void);
>   int migrate_compress_level(void);
>   int migrate_compress_threads(void);
>   int migrate_compress_wait_thread(void);
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 1479cddad9..fd6adf04b4 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -22,6 +22,7 @@
>    * THE SOFTWARE.
>    */
>   #include "qemu/osdep.h"
> +#include <qatzip.h>
>   #include <zlib.h>
>   #include "qemu/madvise.h"
>   #include "qemu/error-report.h"
> @@ -31,7 +32,8 @@
>   #include "trace.h"
>   #include "qapi/error.h"
>   
> -#define IO_BUF_SIZE 32768
> +/* with qat hw, the io buffer size need to expand */

No need to explain what you do in the commited code.

> +#define IO_BUF_SIZE 524288

(512 * KiB)

But it might be worth considering moving that buffer
to the heap, and allocating 32/512KiB depending on
migrate_compress_with_qat().

>   #define MAX_IOV_SIZE MIN_CONST(IOV_MAX, 64)
>   
>   struct QEMUFile {
> @@ -46,6 +48,7 @@ struct QEMUFile {
>                       when reading */
>       int buf_index;
>       int buf_size; /* 0 when writing */
> +
>       uint8_t buf[IO_BUF_SIZE];
>   
>       DECLARE_BITMAP(may_free, MAX_IOV_SIZE);
> @@ -440,7 +443,8 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
>       return 0;
>   }
>   
> -static void add_buf_to_iovec(QEMUFile *f, size_t len)
> +/*public the function and use it in other source code*/

No need to explain what you do in the commited code.

> +void add_buf_to_iovec(QEMUFile *f, size_t len)
>   {
>       if (!add_to_iovec(f, f->buf + f->buf_index, len, false)) {
>           f->buf_index += len;
> @@ -450,6 +454,11 @@ static void add_buf_to_iovec(QEMUFile *f, size_t len)
>       }
>   }
>   
> +uint8_t *qemu_get_pos(QEMUFile *f)
> +{
> +    return f->buf + f->buf_index;
> +}
> +
>   void qemu_put_buffer_async(QEMUFile *f, const uint8_t *buf, size_t size,
>                              bool may_free)
>   {
> diff --git a/migration/qemu-file.h b/migration/qemu-file.h
> index 3f36d4dc8c..bd554e2e17 100644
> --- a/migration/qemu-file.h
> +++ b/migration/qemu-file.h
> @@ -25,6 +25,7 @@
>   #ifndef MIGRATION_QEMU_FILE_H
>   #define MIGRATION_QEMU_FILE_H
>   
> +#include <qatzip.h>

Surely this header needs to be guarded with some #ifdef'ry,
maybe CONFIG_LIBQATZIP.

>   #include <zlib.h>
>   #include "exec/cpu-common.h"
>   #include "io/channel.h"
> @@ -137,6 +138,8 @@ bool qemu_file_is_writable(QEMUFile *f);
>   
>   #include "migration/qemu-file-types.h"
>   
> +void add_buf_to_iovec(QEMUFile *f, size_t len);
> +uint8_t *qemu_get_pos(QEMUFile *f);
>   size_t qemu_peek_buffer(QEMUFile *f, uint8_t **buf, size_t size, size_t offset);
>   size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size);
>   ssize_t qemu_put_compression_data(QEMUFile *f, z_stream *stream,
> diff --git a/migration/ram.c b/migration/ram.c
> index 3532f64ecb..a1be55a0f0 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
[...]

> @@ -527,8 +609,16 @@ static void compress_threads_save_cleanup(void)
>           qemu_thread_join(compress_threads + i);
>           qemu_mutex_destroy(&comp_param[i].mutex);
>           qemu_cond_destroy(&comp_param[i].cond);
> -        deflateEnd(&comp_param[i].stream);
> -        g_free(comp_param[i].originbuf);
> +        /* call deflateEnd or qzTeardownSession, qzClose */
> +        if (migrate_compress_with_qat()) {
> +            qzTeardownSession(&comp_param[i].qzsess);
> +            qzClose(&comp_param[i].qzsess);
> +            qzFree(comp_param[i].compbuf);
> +            qzFree(comp_param[i].decompbuf);

You need to guard for CONFIG_LIBQATZIP somewhere, otherwise
this won't build on hosts / OSes where libqatzip is not
available / installed.

[...]

> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -629,6 +629,8 @@
>   #                  no compression, 1 means the best compression speed, and 9 means best
>   #                  compression ratio which will consume more CPU.
>   #
> +# @compress-with-qat: compress with qat on and off.

Missing "(since 8.1)" tag.

>   # @compress-threads: Set compression thread count to be used in live migration,
>   #                    the compression thread count is an integer between 1 and 255.
>   #
> @@ -768,7 +770,7 @@
>   { 'enum': 'MigrationParameter',
>     'data': ['announce-initial', 'announce-max',
>              'announce-rounds', 'announce-step',
> -           'compress-level', 'compress-threads', 'decompress-threads',
> +           'compress-level', 'compress-with-qat', 'compress-threads', 'decompress-threads',
>              'compress-wait-thread', 'throttle-trigger-threshold',
>              'cpu-throttle-initial', 'cpu-throttle-increment',
>              'cpu-throttle-tailslow',
> @@ -799,6 +801,8 @@
>   #
>   # @compress-level: compression level
>   #
> +# @compress-with-qat: compression with qat

Missing "(since 8.1)" tag.

>   # @compress-threads: compression thread count
>   #
>   # @compress-wait-thread: Controls behavior when all compression threads are
You can open a free GitLab account to run QEMU CI tests and check
your patch works on all supported configurations, see:
https://wiki.qemu.org/Testing/CI/GitLabCI
https://www.qemu.org/docs/master/devel/ci.html

Also, consider adding a test for this qatzip feature. See:
- tests/avocado/migration.py
- tests/qtest/migration-test.c

Regards,

Phil.

