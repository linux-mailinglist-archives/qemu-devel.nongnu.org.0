Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6F05E7316
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:45:22 +0200 (CEST)
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obaYz-0004SO-8f
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obaXO-0002t9-4T
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obaXK-0007Jq-Pm
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663908217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjBPZHB+8Q9xyk3XyJF5XGNw7d47JLDQaBlLSN6RD0k=;
 b=cBVjCiJZPmQydWaOQ/NfsrmahCgwudHC0kfwMvA8+qwZ65zKkG+lgGyyfXf+6AuLe9mQCF
 JZ9OxgWbTU0IJ+9a0ikytoz4/Du9ay6i0fd6mITFcWOgX7aVDmUW+gYfGPl/B0l8C2bunq
 MszxcUAssnoSte1KSV1JG+tk6c8mpHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-3y5Bu6GvNBy7LVgfAhzWnQ-1; Fri, 23 Sep 2022 00:43:34 -0400
X-MC-Unique: 3y5Bu6GvNBy7LVgfAhzWnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 679871C05132;
 Fri, 23 Sep 2022 04:43:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9659A2166B26;
 Fri, 23 Sep 2022 04:43:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F169321E6900; Fri, 23 Sep 2022 06:43:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Bin Meng <bmeng.cn@gmail.com>,  qemu-devel@nongnu.org,  Bin Meng
 <bin.meng@windriver.com>,  Alexander Bulekov <alxndr@bu.edu>,  Andrew
 Jeffery <andrew@aj.id.au>,  Bandan Das <bsd@redhat.com>,  Coiby Xu
 <Coiby.Xu@gmail.com>,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Fam Zheng <fam@euphon.net>,  Joel Stanley
 <joel@jms.id.au>,  John Snow <jsnow@redhat.com>,  Juan Quintela
 <quintela@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,  Laurent
 Vivier <lvivier@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,  Stefan Hajnoczi
 <stefanha@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,  qemu-block@nongnu.org
Subject: Re: [PATCH v2 07/39] tests: Avoid using hardcoded /tmp in test cases
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-8-bmeng.cn@gmail.com>
 <CAJ+F1CKUOd=fLO9f_vVGOajcgi9+XSrbNjPUX+H5hhrxGMCU2g@mail.gmail.com>
Date: Fri, 23 Sep 2022 06:43:30 +0200
In-Reply-To: <CAJ+F1CKUOd=fLO9f_vVGOajcgi9+XSrbNjPUX+H5hhrxGMCU2g@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Thu, 22 Sep 2022
 21:46:44 +0200")
Message-ID: <87mtaqhf9p.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Tue, Sep 20, 2022 at 2:47 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Lots of test cases were written to use hardcoded /tmp directory for
>> temporary files. To avoid this, we update them to use g_dir_make_tmp()
>> or g_file_open_tmp() when appropriate.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>> Changes in v2:
>> - Use g_dir_make_tmp(), g_file_open_tmp() when appropriate
>>
>>  tests/qtest/fuzz/generic_fuzz_configs.h |  4 ++--
>>  tests/qtest/ahci-test.c                 | 19 +++++++++++--------
>>  tests/qtest/aspeed_smc-test.c           |  5 ++---
>>  tests/qtest/boot-serial-test.c          |  9 +++++----
>>  tests/qtest/cxl-test.c                  | 15 ++++++---------
>>  tests/qtest/fdc-test.c                  |  5 +++--
>>  tests/qtest/fuzz/virtio_blk_fuzz.c      |  4 ++--
>>  tests/qtest/hd-geo-test.c               | 24 +++++++++++-------------
>>  tests/qtest/ide-test.c                  | 10 ++++++----
>>  tests/qtest/libqtest.c                  | 12 ++++++++----
>>  tests/qtest/migration-test.c            |  7 ++++---
>>  tests/qtest/pflash-cfi02-test.c         |  8 +++++---
>>  tests/qtest/qmp-test.c                  |  6 ++++--
>>  tests/qtest/vhost-user-blk-test.c       |  3 ++-
>>  tests/qtest/vhost-user-test.c           |  8 ++++----
>>  tests/qtest/virtio-blk-test.c           |  4 ++--
>>  tests/qtest/virtio-scsi-test.c          |  4 ++--
>>  tests/unit/test-image-locking.c         |  8 ++++----
>>  tests/unit/test-qga.c                   |  2 +-
>>  tests/vhost-user-bridge.c               |  3 +--
>>  20 files changed, 85 insertions(+), 75 deletions(-)
>>
>> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h
>> b/tests/qtest/fuzz/generic_fuzz_configs.h
>> index 0775e6702b..a825b78c14 100644
>> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
>> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
>> @@ -20,8 +20,8 @@ typedef struct generic_fuzz_config {
>>  } generic_fuzz_config;
>>
>>  static inline gchar *generic_fuzzer_virtio_9p_args(void){
>> -    char tmpdir[] =3D "/tmp/qemu-fuzz.XXXXXX";
>> -    g_assert_nonnull(g_mkdtemp(tmpdir));
>> +    g_autofree char *tmpdir =3D g_dir_make_tmp("qemu-fuzz.XXXXXX", NULL=
);
>> +    g_assert_nonnull(tmpdir);
>>
>>      return g_strdup_printf("-machine q35 -nodefaults "
>>      "-device virtio-9p,fsdev=3Dhshare,mount_tag=3Dhshare "
>> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
>> index f1e510b0ac..00524f14c6 100644
>> --- a/tests/qtest/ahci-test.c
>> +++ b/tests/qtest/ahci-test.c
>> @@ -44,9 +44,9 @@
>>  #define TEST_IMAGE_SIZE_MB_SMALL 64
>>
>>  /*** Globals ***/
>> -static char tmp_path[] =3D "/tmp/qtest.XXXXXX";
>> -static char debug_path[] =3D "/tmp/qtest-blkdebug.XXXXXX";
>> -static char mig_socket[] =3D "/tmp/qtest-migration.XXXXXX";
>> +static char *tmp_path;
>> +static char *debug_path;
>> +static char *mig_socket;
>>  static bool ahci_pedantic;
>>  static const char *imgfmt;
>>  static unsigned test_image_size_mb;
>> @@ -1437,10 +1437,10 @@ static void test_ncq_simple(void)
>>
>>  static int prepare_iso(size_t size, unsigned char **buf, char **name)
>>  {
>> -    char cdrom_path[] =3D "/tmp/qtest.iso.XXXXXX";
>> +    g_autofree char *cdrom_path;
>>
>
> Whenever introducing g_auto* usage, please make sure to initialize the
> variable to NULL or a correct value.

Potential food for checkpatch.pl.

[...]


