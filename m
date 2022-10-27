Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6260F501
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:28:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo06X-0002jl-BU; Thu, 27 Oct 2022 06:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oo06K-0007ur-Gs
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oo06H-0008M7-FA
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666866420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4e29Szj0bWjoQcGGn3n5PPNT0uo5CPMikeS3uqJGsg4=;
 b=U5x+cwgYtUlk1Wl4wW5ErSKTcXhC/cpWcKFFp6wJIb/FZf10k4dDyhlFcVSYMLpWLR2stK
 oWQz4pmshHisMqN51ZocbYmxGL9TE7JhT56SUh9xRMtZc9P/NsUEu46kc+omKFcmzqOreK
 PEpDKcnXkxUughkCIyx8BwfWCccuwXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-kcLumE1WPuO6nfbYhntdeA-1; Thu, 27 Oct 2022 06:26:56 -0400
X-MC-Unique: kcLumE1WPuO6nfbYhntdeA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6E44823F91;
 Thu, 27 Oct 2022 10:26:54 +0000 (UTC)
Received: from localhost (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E21E4A9265;
 Thu, 27 Oct 2022 10:26:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric
 Auger <eauger@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 2/2] qtests/arm: add some mte tests
In-Reply-To: <bfd29635-9742-741c-a6dc-145bcf4f8ef8@redhat.com>
Organization: Red Hat GmbH
References: <20221026160511.37162-1-cohuck@redhat.com>
 <20221026160511.37162-3-cohuck@redhat.com>
 <bfd29635-9742-741c-a6dc-145bcf4f8ef8@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 27 Oct 2022 12:26:43 +0200
Message-ID: <87h6zpd0kc.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27 2022, Thomas Huth <thuth@redhat.com> wrote:

> On 26/10/2022 18.05, Cornelia Huck wrote:
>> +        qtest_add_data_func("/arm/max/query-cpu-model-expansion/tag-memory",
>> +                            NULL, mte_tests_tag_memory_on);
>
> Is it already possible to compile qemu-system-aarch64 with --disable-tcg ? 

Not yet, the code is too entangled... I tried a bit ago, but didn't make
much progress (on my todo list, but won't mind someone else doing it :)

> If so, I'd recommend a qtest_has_accel("tcg") here ... but apart from that:
>
> Acked-by: Thomas Huth <thuth@redhat.com>

Thanks!


