Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9189F697A57
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:59:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFVS-0007Lq-HD; Wed, 15 Feb 2023 05:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pSFVP-0007L7-KA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pSFVN-0000eg-Rk
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:59:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676458757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z1vm4rRSwi9q0BCc8utZUgURv9fQkg9JJyOqtW+jBlQ=;
 b=ga9IcP0A5xF6cjJDGQHUO6hrmRqaYyPKrGwXPg2jeLDF3W2J4+OaAP7Z806GlYP6BuJgCp
 QZS7malMY9MxX1AKK29c3GT1yz2AYPRAoXCeySVU5QRd90kW2gMAdF3VWWkGKmVrSuOwyu
 238vkZlSfkuYKyVYBexrowdmIFCDm+4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-DGET8La2Nii-4pQFBs3PVA-1; Wed, 15 Feb 2023 05:59:12 -0500
X-MC-Unique: DGET8La2Nii-4pQFBs3PVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 635AA85CCE4;
 Wed, 15 Feb 2023 10:59:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3CFB2166B30;
 Wed, 15 Feb 2023 10:59:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 3/3] qtests/arm: add some mte tests
In-Reply-To: <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-4-cohuck@redhat.com>
 <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 15 Feb 2023 11:59:09 +0100
Message-ID: <874jrndwjm.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Feb 06 2023, Eric Auger <eauger@redhat.com> wrote:

> Hi,
>
> On 2/3/23 14:44, Cornelia Huck wrote:
>> @@ -517,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>          assert_set_feature(qts, "host", "pmu", false);
>>          assert_set_feature(qts, "host", "pmu", true);
>>  
>> +        /*
>> +         * Unfortunately, there's no easy way to test whether this instance
>> +         * of KVM supports MTE. So we can only assert that the feature
>> +         * is present, but not whether it can be toggled.
>> +         */
>> +        assert_has_feature(qts, "host", "mte");
> I know you replied in v4 but I am still confused:
> What does
>       (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
> return on a MTE capable host and and on a non MTE capable host?

FWIW, it's "auto" in both cases, but the main problem is actually
something else...

>
> If I remember correctly qmp_query_cpu_model_expansion loops over the
> advertised features and try to set them explicitly so if the host does
> not support it this should fail and the result should be different from
> the case where the host supports it (even if it is off by default)
>
> Does assert_has_feature_enabled() returns false?

I poked around a bit with qmp on a system (well, model) with MTE where
starting a guest with MTE works just fine. I used the minimal setup
described in docs/devel/writing-monitor-commands.rst, and trying to do a
cpu model expansion with mte=on fails because the KVM ioctl fails with
-EINVAL (as we haven't set up proper memory mappings). The qtest setup
doesn't do any proper setup either AFAICS, so enabling MTE won't work
even if KVM and the host support it. (Trying to enable MTE on a host
that doesn't support it would also report an error, but a different one,
as KVM would not support the MTE cap at all.) We don't really know
beforehand what to expect ("auto" is not yet expanded, see above), so
I'm not sure how to test this in a meaningful way, even if we did set up
memory mappings (which seems like overkill for a feature test.)

The comment describing this could be improved, though :)


