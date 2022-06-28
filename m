Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FFC55E536
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 16:09:53 +0200 (CEST)
Received: from localhost ([::1]:51784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Bua-00083j-UT
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 10:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6BtO-00074y-6w
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6BtL-0001yA-LG
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 10:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656425315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EUm+Q26dlu3r9790Dsov0YvUcyHltAMP5sBPSNwfJY=;
 b=PD3XKUjDbBnRYyN7p40A+IWze9habFlPvet3WEAu+vakwQEh1JW+1Jzdll8RikIQahE4pq
 omCfBvRi661AzoX7xSjTyNt2KoIAyzvwVlQ/47IgY7UUlbzVtrZN97QQqkRo2ECMCIrNY2
 0/l8JrHbYqKtQLG9YRnvdMnmR0zV9Cs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-7OKQjaPcPICtN6GmCaXiHA-1; Tue, 28 Jun 2022 10:08:33 -0400
X-MC-Unique: 7OKQjaPcPICtN6GmCaXiHA-1
Received: by mail-wr1-f72.google.com with SMTP id
 az28-20020adfe19c000000b0021bc8df3721so1148467wrb.7
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 07:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3EUm+Q26dlu3r9790Dsov0YvUcyHltAMP5sBPSNwfJY=;
 b=0PDfALsJT+po8oJCzQWoaiFRRm8tKAdDeUrL1iUdUT1LSSrnr+HOXgrq50DyClw6qK
 /CVGruhnuuZedHDPiaLBKN7gxbL+dG/aq/euhIcboviQFfgYppPEO29buB48AnP8UWm5
 QovMMJTQsHRoU7QSWCCn7k5O2w0U1uy0bC3Y8qXwTPcKPljKAHFZkMfDqmmWr48ZDghr
 0zE448+Abu3vCzFiFNmGW3QPJQ5MgX4DWF31t2jhRwXHozxKPWeNIEiG9UZYPPTlylnZ
 cHW3zLuidxA1i7E+cFbpcvj5aWHsQqLzF80UkXnTeuefdvSeSqshIibrYQuy5RDHi0o9
 gseg==
X-Gm-Message-State: AJIora+bOzN8Aq8nj0/m3OFnlOMcEoMifRE/WARWSz/FmGXqaGRqkCIO
 kEyRnuL7/31Lu+uOs+/S58kx+YehzYhnbA82Tp9z2PmspRtj2+a3Qj2Jo9Bp7iYU1CYMsKVE2AF
 mnUvA9S6vT8/ae6Y=
X-Received: by 2002:a1c:770b:0:b0:3a0:42d9:6f4e with SMTP id
 t11-20020a1c770b000000b003a042d96f4emr19976042wmi.164.1656425312706; 
 Tue, 28 Jun 2022 07:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uOitEnloAHAvCifrC2IwenmEIee89n4VQ8re9YKnWH4B/iBHYa+GeUWJqkubRtYuH2OUBIbw==
X-Received: by 2002:a1c:770b:0:b0:3a0:42d9:6f4e with SMTP id
 t11-20020a1c770b000000b003a042d96f4emr19976005wmi.164.1656425312458; 
 Tue, 28 Jun 2022 07:08:32 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l17-20020a5d5611000000b002101ed6e70fsm13765174wrv.37.2022.06.28.07.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 07:08:31 -0700 (PDT)
Date: Tue, 28 Jun 2022 15:08:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Subject: Re: [PATCH 2/5] tests: wait for migration completion before looking
 for STOP event
Message-ID: <YrsLXV0fX/uTDSBU@work-vm>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628105434.295905-3-berrange@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> When moving into the convergance phase, the precopy tests will first
> look for a STOP event and once found will look for migration completion
> status. If the test VM is not converging, the test suite will be waiting
> for the STOP event forever. If we wait for the migration completion
> status first, then we will trigger the previously added timeout and
> prevent the test hanging forever.

Yeh OK, I guess we might end up with a similar time limit being added to
qtest_qmp_eventwait.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qtest/migration-test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d33e8060f9..ac9e303b1f 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1232,6 +1232,10 @@ static void test_precopy_common(MigrateCommon *args)
>  
>          migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
>  
> +        /* We do this first, as it has a timeout to stop us
> +         * hanging forever if migration didn't converge */
> +        wait_for_migration_complete(from);
> +
>          if (!got_stop) {
>              qtest_qmp_eventwait(from, "STOP");
>          }
> @@ -1239,7 +1243,6 @@ static void test_precopy_common(MigrateCommon *args)
>          qtest_qmp_eventwait(to, "RESUME");
>  
>          wait_for_serial("dest_serial");
> -        wait_for_migration_complete(from);
>      }
>  
>      if (args->finish_hook) {
> -- 
> 2.36.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


