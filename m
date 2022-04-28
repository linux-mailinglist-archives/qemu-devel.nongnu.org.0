Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907AE5136AC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:17:13 +0200 (CEST)
Received: from localhost ([::1]:34978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk4xE-00014v-M2
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk4u5-0006mn-MW
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nk4u3-00017i-Th
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651155235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojJ3Cjh7bIgw7VGZjW3bThrExLE/qwoabiFYpnoO/7w=;
 b=LEeSC399tOsMohKYqVU4FDRq9ax5svxwWPZP6hE6GELDCXVgD0qBdvPbm+fGdzmDNBtlr+
 xICXgkeCVJxeh0+RX73uI5HKn55gNDV9kiL/OiNP6LA9XOSHEi9EkoYsvM8W6eCGV8alqs
 vsHzLZh2HKUQylQYU5b/QifNG4kKO2k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-la9cpLRxPRyvI4u7gVRqaw-1; Thu, 28 Apr 2022 10:13:53 -0400
X-MC-Unique: la9cpLRxPRyvI4u7gVRqaw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5554C85A5BC
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 14:13:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F2F1414A7EA;
 Thu, 28 Apr 2022 14:13:52 +0000 (UTC)
Date: Thu, 28 Apr 2022 09:13:50 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v3 8/9] tests: add multifd migration tests of TLS with
 x509 credentials
Message-ID: <20220428141350.5sox5ipvwh6shgv7@redhat.com>
References: <20220426160048.812266-1-berrange@redhat.com>
 <20220426160048.812266-9-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220426160048.812266-9-berrange@redhat.com>
User-Agent: NeoMutt/20220415-26-c08bba
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 05:00:47PM +0100, Daniel P. Berrangé wrote:
> This validates that we correctly handle multifd migration success
> and failure scenarios when using TLS with x509 certificates. There
> are quite a few different scenarios that matter in relation to
> hostname validation, but we skip a couple as we can assume that
> the non-multifd coverage applies to some extent.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qtest/migration-test.c | 127 +++++++++++++++++++++++++++++++++++
>  1 file changed, 127 insertions(+)
> 
> +
> +static void test_multifd_tcp_tls_x509_mismatch_host(void)
> +{
> +    /*
> +     * This has different behaviour to the non-multifd case.
> +     *
> +     * In non-multifd case when client aborts due to mismatched
> +     * cert host, the server has already started trying to load
> +     * migration state, and so it exits with I/O  failure.

odd double space

> +     *
> +     * In multifd case when client aborts due to mismatched
> +     * cert host, the server is still waiting for the other
> +     * multifd connections to arrive so hasn't started trying
> +     * to load migration state, and thus just aborts the migration
> +     * without exiting

Worth a trailing .

> +     */
> +    MigrateCommon args = {
> +        .start = {
> +            .hide_stderr = true,
> +        },
> +        .listen_uri = "defer",
> +        .start_hook = test_migrate_multifd_tls_x509_start_mismatch_host,
> +        .finish_hook = test_migrate_tls_x509_finish,
> +        .result = MIG_TEST_FAIL,
> +    };
> +    test_precopy_common(&args);
> +}

Definitely a good example of why this was worth testing, and the
comment explains why the difference in observed failure scenarios is
good.

Comment fixes are trivial, so

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


