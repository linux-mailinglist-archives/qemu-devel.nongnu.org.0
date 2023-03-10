Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC36B3FEF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:06:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pacRo-0002yF-A1; Fri, 10 Mar 2023 08:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pacRl-0002xI-No; Fri, 10 Mar 2023 08:06:09 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pacRj-0001Pr-QO; Fri, 10 Mar 2023 08:06:09 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF1E820659;
 Fri, 10 Mar 2023 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678453564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2k9+tpCAeN/8/On3DVhNJslrvVdEZxM6eN5p2uLU9rA=;
 b=nYI/2EjYkdQ8q7VdzUc/CEWOCc2kMDRFV8NyoA3iXjCvI50T8rBkPf3bhEbWWJ6iMmEaz0
 0VzQxyhZplFzEZANe26YsHMPRmn21PK5pQq0qrEcn8KBbqqzxZd3yzFUe1u98Ujx3uTIfl
 GSdCQA2Pi0/yM/InHjr39ifPS1eDVSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678453564;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2k9+tpCAeN/8/On3DVhNJslrvVdEZxM6eN5p2uLU9rA=;
 b=vnzeLboL+aKoH6y59nC3FmrgR+xq3JoRJspjhURS0nI6WR1HBAHQFsagQbJ8sd0eabQfaM
 NqkzfL/Hf6tAPsDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 647EB13592;
 Fri, 10 Mar 2023 13:06:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GH7GCzwrC2SvNAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 13:06:04 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, Juan
 Quintela <quintela@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani
 Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
In-Reply-To: <20230310050550-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
 <20230310050550-mutt-send-email-mst@kernel.org>
Date: Fri, 10 Mar 2023 10:06:01 -0300
Message-ID: <87h6useoxy.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
>> It is possible to have a build with both TCG and KVM disabled due to
>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>> host.
>> 
>> If we build with --disable-tcg on the aarch64 host, we will end-up
>> with a QEMU binary (x86) that does not support TCG nor KVM.
>> 
>> Fix tests that crash or hang in the above scenario. Do not include any
>> test cases if TCG and KVM are missing.
>> 
>> Make sure that calls to qtest_has_accel are placed after g_test_init
>> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
>> printed before other messages") to avoid TAP parsing errors.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> I don't like it that we are hard-coding the list of accelerators
> like this. Make a wrapper?
>

Are you thinking of some sort of "has_any_accel" wrapper?

Some of the code uses has_tcg/kvm for other purposes, so there would be
slight duplication. And the issue really is !tcg && !kvm, i.e. other
accelerators are not taken into account.

>> ---
>> This currently affects Arm, but will also affect x86 after the xenpvh
>> series gets merged. This patch fixes both scenarios.
>> ---
>>  tests/qtest/bios-tables-test.c | 10 ++++++++--
>>  tests/qtest/boot-serial-test.c | 10 ++++++++++
>>  tests/qtest/migration-test.c   |  9 ++++++++-
>>  tests/qtest/pxe-test.c         |  7 ++++++-
>>  tests/qtest/vmgenid-test.c     |  8 ++++++--
>>  5 files changed, 38 insertions(+), 6 deletions(-)
>> 
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>> index d29a4e47af..5cbad2f29f 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -2109,8 +2109,7 @@ static void test_acpi_virt_oem_fields(void)
>>  int main(int argc, char *argv[])
>>  {
>>      const char *arch = qtest_get_arch();
>> -    const bool has_kvm = qtest_has_accel("kvm");
>> -    const bool has_tcg = qtest_has_accel("tcg");
>> +    bool has_kvm, has_tcg;
>>      char *v_env = getenv("V");
>>      int ret;
>>  
>> @@ -2120,6 +2119,13 @@ int main(int argc, char *argv[])
>>  
>>      g_test_init(&argc, &argv, NULL);
>>  
>> +    has_kvm = qtest_has_accel("kvm");
>> +    has_tcg = qtest_has_accel("tcg");
>> +
>
> why are you moving these? init at declaration time is
> generally cleaner.
>

Thomas had asked me to put calls to qtest_has_accel after g_test_init. I
just brought the existing one along for consistency. From the commit
message:

 "Make sure that calls to qtest_has_accel are placed after g_test_init
 in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
 printed before other messages") to avoid TAP parsing errors."

>> +    if (!has_tcg && !has_kvm) {
>> +        return 0;
>> +    }
>> +
>>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>          ret = boot_sector_init(disk);
>>          if (ret) {
>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>> index 3aef3a97a9..406b4421cc 100644
>> --- a/tests/qtest/boot-serial-test.c
>> +++ b/tests/qtest/boot-serial-test.c
>> @@ -17,6 +17,9 @@
>>  #include "libqtest.h"
>>  #include "libqos/libqos-spapr.h"
>>  
>> +static bool has_tcg;
>> +static bool has_kvm;
>> +
>>  static const uint8_t bios_avr[] = {
>>      0x88, 0xe0,             /* ldi r24, 0x08   */
>>      0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
>> @@ -287,6 +290,13 @@ int main(int argc, char *argv[])
>>  
>>      g_test_init(&argc, &argv, NULL);
>>  
>> +    has_tcg = qtest_has_accel("tcg");
>> +    has_kvm = qtest_has_accel("kvm");
>> +
>
> and here why do we need them global?
>

I was trying to make things easier when merging this other series that
puts the variables there as well:
https://lore.kernel.org/r/20230119145838.41835-5-philmd@linaro.org

Second time I get asked this so I'll change it for the next version =)

>> +    if (!has_tcg && !has_kvm) {
>> +        return 0;
>> +    }
>> +
>>      for (i = 0; tests[i].arch != NULL; i++) {
>>          if (g_str_equal(arch, tests[i].arch) &&
>>              qtest_has_machine(tests[i].machine)) {
>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>> index d4ab3934ed..7eedee7b2d 100644
>> --- a/tests/qtest/migration-test.c
>> +++ b/tests/qtest/migration-test.c
>> @@ -2459,7 +2459,7 @@ static bool kvm_dirty_ring_supported(void)
>>  
>>  int main(int argc, char **argv)
>>  {
>> -    const bool has_kvm = qtest_has_accel("kvm");
>> +    bool has_kvm, has_tcg;
>>      const bool has_uffd = ufd_version_check();
>>      const char *arch = qtest_get_arch();
>>      g_autoptr(GError) err = NULL;
>> @@ -2467,6 +2467,13 @@ int main(int argc, char **argv)
>>  
>>      g_test_init(&argc, &argv, NULL);
>>  
>> +    has_kvm = qtest_has_accel("kvm");
>> +    has_tcg = qtest_has_accel("tcg");
>> +
>
> same. why the move?
>

g_test_init

>> +    if (!has_tcg && !has_kvm) {
>> +        return 0;
>> +    }
>> +
>>      /*
>>       * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
>>       * is touchy due to race conditions on dirty bits (especially on PPC for
>> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
>> index 62b6eef464..935b661dac 100644
>> --- a/tests/qtest/pxe-test.c
>> +++ b/tests/qtest/pxe-test.c
>> @@ -131,11 +131,16 @@ int main(int argc, char *argv[])
>>      int ret;
>>      const char *arch = qtest_get_arch();
>>  
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
>> +        return 0;
>> +    }
>> +
>>      ret = boot_sector_init(disk);
>>      if(ret)
>>          return ret;
>>  
>> -    g_test_init(&argc, &argv, NULL);
>>  
>>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>          test_batch(x86_tests, false);
>> diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
>> index efba76e716..9eb6371ae8 100644
>> --- a/tests/qtest/vmgenid-test.c
>> +++ b/tests/qtest/vmgenid-test.c
>> @@ -165,13 +165,17 @@ int main(int argc, char **argv)
>>  {
>>      int ret;
>>  
>> +    g_test_init(&argc, &argv, NULL);
>> +
>> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
>> +        return 0;
>> +    }
>> +
>>      ret = boot_sector_init(disk);
>>      if (ret) {
>>          return ret;
>>      }
>>  
>> -    g_test_init(&argc, &argv, NULL);
>> -
>>      qtest_add_func("/vmgenid/vmgenid/set-guid",
>>                     vmgenid_set_guid_test);
>>      qtest_add_func("/vmgenid/vmgenid/set-guid-auto",
>> -- 
>> 2.35.3

