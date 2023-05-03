Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BC56F546B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8cM-0008OY-Q1; Wed, 03 May 2023 05:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8cJ-0007zM-BO
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8cH-0000J9-Mu
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105460;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JQcGQ1baQP0IzZF/iBrRq3uu66dOVW1aRE6+H9KpLT8=;
 b=T/3Fk7OccCX1YTSqqndDk+Yqyvz/xHE34jNrNWhGZWdiLWbeuuMEvME4hYI65Y2dkd9fg7
 CG9s7HwQKR04yBdGhvVA4RIMMzUjUeHpsfcgUVB6xxDckgmoIXgWi2i848RiYWcUG0jb+6
 3w501BcvYKT3AoJQSb8nbvWj7wsp8o0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-jb8umiJNMzKv8_fOgTA7HQ-1; Wed, 03 May 2023 05:17:39 -0400
X-MC-Unique: jb8umiJNMzKv8_fOgTA7HQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3062a46bf21so2304926f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105458; x=1685697458;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JQcGQ1baQP0IzZF/iBrRq3uu66dOVW1aRE6+H9KpLT8=;
 b=BLXzQ1tHd+JYgN+LGXLY2mBKQ5s90GaqjV4TxKEltZfw2hXN7uX7IsD99pyFqL81y2
 ECGb8KtZGYUC5qXhw/1f9RdKf90PRA4w1iDxcDQLgDiRy44zOSriVHAfOQpFE0dqxCaF
 pgTHD3rmh5vfv3Jvlzt+0FeF47ayZ+OKieDuhD7CbsjMQWAzJ+pB8CWs5wdrA/B1OcZL
 TSPjbXy1Tm8OX5xrFNQrhwuFwS24rMUCcn9nzceEUMjOz99bfOByBo381IWZiYXGFcLi
 ZLVJQMWRWgyLSb/lQRJz2vShk0+ZK7gUm1jUeA9O1/qNVbk5ejcejIRKvqy17PmH/QUd
 GvDw==
X-Gm-Message-State: AC+VfDxV4OZXYy/xEaVpu8TvCPzhAsBWo5IHcyAhC/1QSdpQnmaJz2PG
 gtMC3yom+P+9vT4I6BIZ0ri8I6pkGn4Vkii5G8AkUr2G4aoS8QPDtRZnyz4Dfm6gAh7nZZF+zEd
 kAbv2Y8QBcdiM4Uo=
X-Received: by 2002:adf:f491:0:b0:306:35d1:7a98 with SMTP id
 l17-20020adff491000000b0030635d17a98mr4271915wro.8.1683105458457; 
 Wed, 03 May 2023 02:17:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7tOIlmS9JPwQU23VT/tKaONK5sJYEUgI7AcSFyhSQS5VeDbAqIQtkdrh1UJUKb2J/8Wwu2bw==
X-Received: by 2002:adf:f491:0:b0:306:35d1:7a98 with SMTP id
 l17-20020adff491000000b0030635d17a98mr4271896wro.8.1683105458150; 
 Wed, 03 May 2023 02:17:38 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b0030630de6fbdsm6383696wru.13.2023.05.03.02.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:17:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,  Leonardo Bras <leobras@redhat.com>,  Thomas Huth
 <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,  Lukas Straub
 <lukasstraub2@web.de>,  "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
In-Reply-To: <CAFEAcA_G734ap+L-YfLt5Pd65VXFm2xcx_SFwD_ke8B7pcQGbQ@mail.gmail.com>
 (Peter Maydell's message of "Tue, 2 May 2023 11:43:54 +0100")
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
 <CAFEAcA_G734ap+L-YfLt5Pd65VXFm2xcx_SFwD_ke8B7pcQGbQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 11:17:33 +0200
Message-ID: <87lei5sriq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> wrote:
> On Tue, 2 May 2023 at 11:39, Juan Quintela <quintela@redhat.com> wrote:
>> Richard, once that we are here, one of the problem that we are having is
>> that the test is exiting with an abort, so we have no clue what is
>> happening.  Is there a way to get a backtrace, or at least the number
>
> This has been consistently an issue with the migration tests.
> As the owner of the tests, if they are not providing you with
> the level of detail that you need to diagnose failures, I
> think that is something that is in your court to address:
> the CI system is always going to only be able to provide
> you with what your tests are outputting to the logs.

Right now I would be happy just to see what test it is failing at.

I am doing something wrong, or from the links that I see on richard
email, I am not able to reach anywhere where I can see the full logs.

> For the specific case of backtraces from assertion failures,
> I think Dan was looking at whether we could put something
> together for that. It won't help with segfaults and the like, though.

I am waiting for that O:-)

> You should be able to at least get the number of the subtest out of
> the logs (either directly in the logs of the job, or else
> from the more detailed log file that gets stored as a
> job artefact in most cases).

Also note that the test is stopping in an abort, with no diagnostic
message that I can see.  But I don't see where the abort cames from:

$ grep abort tests/qtest/migration-*
tests/qtest/migration-test.c:    visit_type_SocketAddressList(iv, NULL, &addrs, &error_abort);
tests/qtest/migration-test.c:     * In non-multifd case when client aborts due to mismatched
tests/qtest/migration-test.c:     * In multifd case when client aborts due to mismatched
tests/qtest/migration-test.c:     * to load migration state, and thus just aborts the migration
$

Later, Juan.


