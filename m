Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46023611196
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:36:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOaU-0002Wg-Kr; Fri, 28 Oct 2022 08:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ooOVy-00009F-0U
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:31:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ooOVw-0004E4-EY
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666960267;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PabQ59sOxv22wIBVFBccH9/8odroZSIn4R2lJLQAqXQ=;
 b=hwx8PD/eXKbtdDKSOhFH7i8nUIt/lOlbcvop8cwYoQ299YaHrnGGcDV/VFje6gMPKpjwlV
 4K+5t01mj1gdq10Wme2GHq76cAtX9cxWruSQcCs25DpIAbloi3Zo48ZPEhmq4s4lRZwCvZ
 hcm/lvq36RE6Dgi0JE+tuXIbsGZYVgo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-qDiWqXQPPveqpv8F3WpEXg-1; Fri, 28 Oct 2022 08:31:05 -0400
X-MC-Unique: qDiWqXQPPveqpv8F3WpEXg-1
Received: by mail-wm1-f71.google.com with SMTP id
 125-20020a1c0283000000b003c5e6b44ebaso418112wmc.9
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PabQ59sOxv22wIBVFBccH9/8odroZSIn4R2lJLQAqXQ=;
 b=daVsJr9CRY+u3aZ0NLZ+cN+9IACM1qAkx+P3th5FD+6uwzm0xwd1walazZgpoDdK3t
 7oo7sELi8+xkVnxfDD07uhFVrgO6LLa/g40/PIHrz4pPCmYgw905+hWZmDUoG+yLKolT
 qcba0pIl0FmPf1mGFd7uXOijn+JTocu2ZfCDIZyWXNrS10ehnb6cmLslCB3lE2pq4uzm
 APS2njh/gCsgthG7LbCZS8alFPWxrJ+UXapeEkG6BBZv+9FhzZFmrQAmUo803TtTtDe2
 cZppcS+u47rCVMC2ScoFTcTlkyh2u2hFxBLMoPdnnVfRSPLn+RGG2mx2Dg5fhgiZGQ9m
 c7Cg==
X-Gm-Message-State: ACrzQf0PIe/zLijfcQRRHC62Sv7kUdR2MeOmOj5cf2h9HRgatdLDaOh9
 DB4kxjbbldtYWryu8NK9LWMsKCQKkQeJj1UnqGEZ7f2Q5EksqSAT4uaLKaFlhnTXPh1ZGUEuJT6
 4PydR5xFBLQ87jhM=
X-Received: by 2002:adf:d1e5:0:b0:234:2aaf:3b97 with SMTP id
 g5-20020adfd1e5000000b002342aaf3b97mr31768153wrd.536.1666960264174; 
 Fri, 28 Oct 2022 05:31:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4WfomgY393x0MX2GUZi2mE+xHxO86p4sZwxJr9sul4SCBI3Y8AA0liC9Ie5NlBk89nOFuDLA==
X-Received: by 2002:adf:d1e5:0:b0:234:2aaf:3b97 with SMTP id
 g5-20020adfd1e5000000b002342aaf3b97mr31768137wrd.536.1666960263987; 
 Fri, 28 Oct 2022 05:31:03 -0700 (PDT)
Received: from localhost (255.4.26.77.dynamic.reverse-mundo-r.com.
 [77.26.4.255]) by smtp.gmail.com with ESMTPSA id
 i1-20020adfefc1000000b00236722ebe66sm3644610wrp.75.2022.10.28.05.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:31:03 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Laurent Vivier
 <lvivier@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Thomas Huth
 <thuth@redhat.com>
Subject: Re: [PATCH v6 05/11] tests/qtest: Use EXIT_FAILURE instead of magic
 number
In-Reply-To: <20221028045736.679903-6-bin.meng@windriver.com> (Bin Meng's
 message of "Fri, 28 Oct 2022 12:57:30 +0800")
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-6-bin.meng@windriver.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 28 Oct 2022 14:31:02 +0200
Message-ID: <87o7tww2nt.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bin Meng <bin.meng@windriver.com> wrote:
> When migration fails, QEMU exits with a status code EXIT_FAILURE.
> Change qtests to use the well-defined macro instead of magic number.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


>
> ---
>
> Changes in v6:
> - new patch: "tests/qtest: Use EXIT_FAILURE instead of magic number"
>
>  tests/qtest/dbus-vmstate-test.c | 2 +-
>  tests/qtest/migration-test.c    | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/dbus-vmstate-test.c b/tests/qtest/dbus-vmstate-test.c
> index 74ede651f6..6c990864e3 100644
> --- a/tests/qtest/dbus-vmstate-test.c
> +++ b/tests/qtest/dbus-vmstate-test.c
> @@ -233,7 +233,7 @@ test_dbus_vmstate(Test *test)
>      test->src_qemu = src_qemu;
>      if (test->migrate_fail) {
>          wait_for_migration_fail(src_qemu, true);
> -        qtest_set_expected_status(dst_qemu, 1);
> +        qtest_set_expected_status(dst_qemu, EXIT_FAILURE);
>      } else {
>          wait_for_migration_complete(src_qemu);
>      }
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index aa1ba179fa..28a06d8170 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1342,7 +1342,7 @@ static void test_precopy_common(MigrateCommon *args)
>          wait_for_migration_fail(from, allow_active);
>  
>          if (args->result == MIG_TEST_FAIL_DEST_QUIT_ERR) {
> -            qtest_set_expected_status(to, 1);
> +            qtest_set_expected_status(to, EXIT_FAILURE);
>          }
>      } else {
>          if (args->iterations) {
> @@ -1738,7 +1738,7 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
>      migrate_qmp(from, uri, "{}");
>  
>      if (should_fail) {
> -        qtest_set_expected_status(to, 1);
> +        qtest_set_expected_status(to, EXIT_FAILURE);
>          wait_for_migration_fail(from, true);
>      } else {
>          wait_for_migration_complete(from);


