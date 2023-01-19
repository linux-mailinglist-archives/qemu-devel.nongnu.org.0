Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C956D6734DE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:56:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIQbc-0007CH-3V; Thu, 19 Jan 2023 03:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIQbR-0007AW-UL
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:48:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIQbJ-0008NM-8m
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:48:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674118128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MNdqAxKyM29EET5ndZwA8wkVY87Kcxwfh2XLS/I2DOI=;
 b=Ry7EDN/2eqV9HQlrUVinr+aSVpm38T/f8I46Bp5KzE+arn/rMPIfJPo/6urX5eD02Pe89+
 mEM/lHfQQ01rIYfqoba3xaJ53Zzrur10MXykAQKn9IXP1ZuzyFATqGAC+3PasuH+DKnNsj
 HEMktQpMgbMX8xiZ9hGYHrr0SKKfSS0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-8t95co_FOYqr3nnm7ZLcvA-1; Thu, 19 Jan 2023 03:48:44 -0500
X-MC-Unique: 8t95co_FOYqr3nnm7ZLcvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 147CA3806101;
 Thu, 19 Jan 2023 08:48:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D424951EF;
 Thu, 19 Jan 2023 08:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AE43321E6A28; Thu, 19 Jan 2023 09:48:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Dr. David Alan Gilbert <dgilbert@redhat.com>,  Peter Xu <peterx@redhat.com>
Subject: Re: Who maintains util/userfaultfd.c?
References: <873587yqm7.fsf@pond.sub.org> <87v8l3hrig.fsf@secure.mitica>
Date: Thu, 19 Jan 2023 09:48:42 +0100
In-Reply-To: <87v8l3hrig.fsf@secure.mitica> (Juan Quintela's message of "Thu, 
 19 Jan 2023 09:12:39 +0100")
Message-ID: <87o7qux639.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> Markus Armbruster <armbru@redhat.com> wrote:
>> commit 0e9b5cd6b238b7ca9a3a50d957f50c37082705a0
>> Author: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> Date:   Fri Jan 29 13:14:04 2021 +0300
>>
>>     migration: introduce UFFD-WP low-level interface helpers
>>     
>>     Glue code to the userfaultfd kernel implementation.
>>     Querying feature support, createing file descriptor, feature control,
>>     memory region registration, IOCTLs on registered registered regions.
>>     
>>     Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>     Reviewed-by: Peter Xu <peterx@redhat.com>
>>     Message-Id: <20210129101407.103458-3-andrey.gruzdev@virtuozzo.com>
>>     Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>       Fixed up range.start casting for 32bit
>>
>> added util/userfaultfd.c without covering it in MAINTAINERS.  Only user
>> is migration/ram.c, as far as I can tell.  Should it be added to
>> MAINTAINERS section "Migration"?
>
> Hi
>
> It should be added to the Migration maintainers.  Who used to develop
> in that particular corner is David.

I'll post a patch.  Thanks!


