Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C246F5A0C39
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 11:05:56 +0200 (CEST)
Received: from localhost ([::1]:42236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR8oF-0000k5-Gn
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 05:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oR8Qr-0000sb-D9
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oR8Qn-00011f-7B
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661416899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07NuFVTlPFiEw+vr4pL0hZa8ugwtJTg9hxjGo3WP8K4=;
 b=Dy6v9c1SW3z0OrHLQH6vkj/2HWrd2tTZF8xBsnXQvgLNCjRIIsrihw8BygfTui63wtmCFD
 wyIrJOJwYICjWyNLZQ86aFCVv4NgMF3p/asYgOuSbBAairfO8kCtEThrfjpMZwy/LzZOrT
 BMokQA6Vp9EImeqjGMNSQjkGJRuQaBE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-nx_QCy_FNwKEz0Oe6bklJA-1; Thu, 25 Aug 2022 04:41:38 -0400
X-MC-Unique: nx_QCy_FNwKEz0Oe6bklJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 az42-20020a05600c602a00b003a552086ba9so2164388wmb.6
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 01:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=07NuFVTlPFiEw+vr4pL0hZa8ugwtJTg9hxjGo3WP8K4=;
 b=0+ZcVPzGFeAyU/PUwsoy+Hr6TWSNjlaBvcfzV4kdl16lrUGVQxSG9TC8CLJChVPzTj
 G5GAZ/DqtLgaInSjncXQ0zlC7j3Gsx49B9bsheBDwWhDtVfINqZqffVw9FMEdtYFlr6H
 wvGe0eAs8GjxyQGHSLzGJ+r0EsE1OJSPAMa9U4LlKlf9RgOJ/HemFwem+k8A55a6SVAC
 EgTPMX2fe6QSDS5/Pbh1PXH7tav0em91awYnnNxVz8kMU2OkFF72E5FyUBda1lWbj6LD
 8B2dB0ecdLpZ4sXYfM7rqz0598Sk3epq56UzQLzdxiKS1FPGIaEya3A0uWXSBY0401AE
 8RJw==
X-Gm-Message-State: ACgBeo2+xTQ+Uas3PufLdGvDZBH+HoeTuL8aSNyLCJxvthdGI/9/pNaJ
 a6UkHSrVUkeCXO3zSeTRPtvtRwa8FbO18grAi5HLbXTVgFwEsWREb7A4FzCGTonFL1As32xt8xZ
 E1u8S9r/EaEdvCMc=
X-Received: by 2002:a05:600c:4c06:b0:3a5:4eec:eb4b with SMTP id
 d6-20020a05600c4c0600b003a54eeceb4bmr1639566wmp.151.1661416896816; 
 Thu, 25 Aug 2022 01:41:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Xl9y5wzWTKfSDTdW6pKlmNkHTyHmB2W2hrXUM0nVb09SiO4XwigWByWhFlhHDA5XBMJMSLw==
X-Received: by 2002:a05:600c:4c06:b0:3a5:4eec:eb4b with SMTP id
 d6-20020a05600c4c0600b003a54eeceb4bmr1639534wmp.151.1661416896565; 
 Thu, 25 Aug 2022 01:41:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 d12-20020adff2cc000000b002238ea5750csm23611445wrp.72.2022.08.25.01.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 01:41:36 -0700 (PDT)
Message-ID: <6157f96b-7553-db89-d9ed-4c4464fb3792@redhat.com>
Date: Thu, 25 Aug 2022 10:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Bandan Das <bsd@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>,
 Joel Stanley <joel@jms.id.au>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-8-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 07/51] tests: Avoid using hardcoded /tmp in test cases
In-Reply-To: <20220824094029.1634519-8-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Use g_get_tmp_dir() to get the directory to use for temporary files.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/fuzz/generic_fuzz_configs.h |  6 ++++--
>   tests/qtest/ahci-test.c                 | 15 +++++++++++----
>   tests/qtest/aspeed_smc-test.c           |  4 +++-
>   tests/qtest/boot-serial-test.c          |  8 ++++++--
>   tests/qtest/cxl-test.c                  |  9 ++++++---
>   tests/qtest/fdc-test.c                  |  4 +++-
>   tests/qtest/fuzz/virtio_blk_fuzz.c      |  2 +-
>   tests/qtest/hd-geo-test.c               |  8 ++++----
>   tests/qtest/ide-test.c                  |  8 ++++++--
>   tests/qtest/libqtest.c                  | 10 +++++++---
>   tests/qtest/migration-test.c            |  4 +++-
>   tests/qtest/pflash-cfi02-test.c         |  7 +++++--
>   tests/qtest/qmp-test.c                  |  4 +++-
>   tests/qtest/vhost-user-blk-test.c       |  3 ++-
>   tests/qtest/vhost-user-test.c           |  3 ++-
>   tests/qtest/virtio-blk-test.c           |  2 +-
>   tests/qtest/virtio-scsi-test.c          |  3 ++-
>   tests/unit/test-image-locking.c         |  6 ++++--
>   tests/unit/test-qga.c                   |  2 +-
>   tests/vhost-user-bridge.c               |  3 ++-
>   20 files changed, 76 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 0775e6702b..d0f9961187 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -20,13 +20,15 @@ typedef struct generic_fuzz_config {
>   } generic_fuzz_config;
>   
>   static inline gchar *generic_fuzzer_virtio_9p_args(void){
> -    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
> +    char *tmpdir = g_strdup_printf("%s/qemu-fuzz.XXXXXX", g_get_tmp_dir());
>       g_assert_nonnull(g_mkdtemp(tmpdir));

Could you switch this to g_dir_make_tmp(), please ? (see 
https://docs.gtk.org/glib/type_func.Dir.make_tmp.html )

(and as David said, please use g_autofree to avoid the g_free() later)

> -    return g_strdup_printf("-machine q35 -nodefaults "
> +    gchar *args = g_strdup_printf("-machine q35 -nodefaults "
>       "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
>       "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
>       "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
> +    g_free(tmpdir);
> +    return args;
>   }
>   
>   const generic_fuzz_config predefined_configs[] = {
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index f1e510b0ac..f26cd6f86f 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -44,9 +44,9 @@
>   #define TEST_IMAGE_SIZE_MB_SMALL 64
>   
>   /*** Globals ***/
> -static char tmp_path[] = "/tmp/qtest.XXXXXX";
> -static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
> -static char mig_socket[] = "/tmp/qtest-migration.XXXXXX";
> +static char *tmp_path;
> +static char *debug_path;
> +static char *mig_socket;
>   static bool ahci_pedantic;
>   static const char *imgfmt;
>   static unsigned test_image_size_mb;
> @@ -1437,7 +1437,7 @@ static void test_ncq_simple(void)
>   
>   static int prepare_iso(size_t size, unsigned char **buf, char **name)
>   {
> -    char cdrom_path[] = "/tmp/qtest.iso.XXXXXX";
> +    char *cdrom_path = g_strdup_printf("%s/qtest.iso.XXXXXX", g_get_tmp_dir());
>       unsigned char *patt;
>       ssize_t ret;
>       int fd = mkstemp(cdrom_path);

Would it be better to use g_file_open_tmp() here?
(see https://docs.gtk.org/glib/func.file_open_tmp.html)

> @@ -1872,6 +1873,7 @@ int main(int argc, char **argv)
>       }
>   
>       /* Create a temporary image */
> +    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>       fd = mkstemp(tmp_path);
>       g_assert(fd >= 0);

g_file_open_tmp() ?

Also for the other temporary files in this test?

> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 05ce941566..cab769459c 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -608,7 +608,7 @@ static void test_write_block_protect_bottom_bit(void)
>       flash_reset();
>   }
>   
> -static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
> +static char *tmp_path;
>   
>   int main(int argc, char **argv)
>   {
> @@ -617,6 +617,7 @@ int main(int argc, char **argv)
>   
>       g_test_init(&argc, &argv, NULL);
>   
> +    tmp_path = g_strdup_printf("%s/qtest.m25p80.XXXXXX", g_get_tmp_dir());
>       fd = mkstemp(tmp_path);

g_file_open_tmp() ?

> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 2f99d71cab..404adcfa20 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -224,8 +224,10 @@ static bool check_guest_output(QTestState *qts, const testdef_t *test, int fd)
>   static void test_machine(const void *data)
>   {
>       const testdef_t *test = data;
> -    char serialtmp[] = "/tmp/qtest-boot-serial-sXXXXXX";
> -    char codetmp[] = "/tmp/qtest-boot-serial-cXXXXXX";
> +    char *serialtmp = g_strdup_printf("%s/qtest-boot-serial-sXXXXXX",
> +                                      g_get_tmp_dir());
> +    char *codetmp = g_strdup_printf("%s/qtest-boot-serial-cXXXXXX",
> +                                    g_get_tmp_dir());

These look like good candidates for g_file_open_tmp(), too.

Please check also the other spots in this patch, I haven't looked through 
all of them now...

  Thomas


