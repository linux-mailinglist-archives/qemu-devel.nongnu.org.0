Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6746ECC2B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 14:39:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvSp-0006D1-5M; Mon, 24 Apr 2023 08:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pqvSi-0006CE-Pf; Mon, 24 Apr 2023 08:38:33 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pqvSh-000674-1e; Mon, 24 Apr 2023 08:38:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 098C121AA6;
 Mon, 24 Apr 2023 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682339906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9m/I9fZrM/oAlSdMVqxyn5NkRX7eOd0YiT13Q5R7mzo=;
 b=bdw1kDsYFzFf3ewLWd/arsZNbyJpKYRONuQTsoiqv5qTyMvyuFkGzWzIZ7IZI1ZkWW8p3y
 Cat4ZXruKj08dRo2PqalGxH0jVSLIWIP2GgmCUjVvTlYef4fhE2LGxaBVhSU86Jab4lSNR
 FMxfJjOD0XPfjCImf5J9oM77uJShd2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682339906;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9m/I9fZrM/oAlSdMVqxyn5NkRX7eOd0YiT13Q5R7mzo=;
 b=ZO6wWMmsL5J50rUwXf67WDmXNEdiGXooWBKSk3sqlCCHsfHb/hFWeh2pNAQgl60nzsikrz
 PSpj6yLpLoUGKZBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BC111390E;
 Mon, 24 Apr 2023 12:38:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8FtGFUF4RmRUfAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 24 Apr 2023 12:38:25 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v10 06/11] target/arm: move cpu_tcg to tcg/cpu32.c
In-Reply-To: <3175956a-ab3c-7259-1b28-6fe54043238f@linaro.org>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-7-farosas@suse.de>
 <3175956a-ab3c-7259-1b28-6fe54043238f@linaro.org>
Date: Mon, 24 Apr 2023 09:38:23 -0300
Message-ID: <87cz3ttpz4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 12/4/23 14:18, Fabiano Rosas wrote:
>> From: Claudio Fontana <cfontana@suse.de>
>>=20
>> move the module containing cpu models definitions
>> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
>>=20
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/arm/virt.c                         |  2 +-
>>   target/arm/meson.build                |  1 -
>>   target/arm/{cpu_tcg.c =3D> tcg/cpu32.c} | 13 +++----------
>>   target/arm/tcg/cpu64.c                |  2 +-
>>   target/arm/tcg/meson.build            |  1 +
>>   tests/qtest/arm-cpu-features.c        | 12 +++++++++---
>>   6 files changed, 15 insertions(+), 16 deletions(-)
>>   rename target/arm/{cpu_tcg.c =3D> tcg/cpu32.c} (99%)
>
>
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-featur=
es.c
>> index 1cb08138ad..1555b0bab8 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -506,9 +506,15 @@ static void test_query_cpu_model_expansion_kvm(cons=
t void *data)
>>           QDict *resp;
>>           char *error;
>>=20=20=20
>> -        assert_error(qts, "cortex-a15",
>> -            "We cannot guarantee the CPU type 'cortex-a15' works "
>> -            "with KVM on this host", NULL);
>> +        if (qtest_has_accel("tcg")) {
>
> Can we add a comment to explain this non trivial case?
>

Hi, good idea, this is a bit opaque indeed.

> I suppose the reason is "KVM is builtin but not available, so we don't
> want to test the TCG fallback", is that correct?
>

No, it's just that originally the default cpu was cortex-a15 which we
don't give guarantees for when using KVM. But now that cpu is not
present in the KVM-only build at all, hence "The CPU ... is not a
recognized ARM CPU type".

>> +            assert_error(qts, "cortex-a15",
>> +                         "We cannot guarantee the CPU type 'cortex-a15'=
 works "
>> +                         "with KVM on this host", NULL);
>> +        } else {
>> +            assert_error(qts, "cortex-a15",
>> +                         "The CPU type 'cortex-a15' is not a "
>> +                         "recognized ARM CPU type", NULL);
>> +        }
>>=20=20=20
>>           assert_has_feature_enabled(qts, "host", "aarch64");
>>=20=20=20

