Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5522A68D3CB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:12:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKvq-0006a1-PI; Tue, 07 Feb 2023 05:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPKvm-0006FQ-JU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:10:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pPKvk-0002za-Js
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675764626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4CFqzeSWzfmGYdB8KTd2LF4AGubhGOTkZjk1LT584lM=;
 b=TL2/+wJWEhJkujLH5Sl5YD/NGWpS521B/tz6fIgUjH+pMUA18jBqZyTQDTPvUDsNv/PCWA
 /qMinZ0WlSjui1KMuKfC9MJav+k0QbSL931RJ3NaBsvC8Nfp0UOZ4RgnuIGtUQiY+XXu6S
 t/+sD5ClZhLn7PCKegnGnKSeC/WOcrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-bC4ucc7WPQ2fWO1cEynkGA-1; Tue, 07 Feb 2023 05:10:25 -0500
X-MC-Unique: bC4ucc7WPQ2fWO1cEynkGA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EF6287B2A3;
 Tue,  7 Feb 2023 10:10:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DD32492B21;
 Tue,  7 Feb 2023 10:10:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5ED3221E6A1F; Tue,  7 Feb 2023 11:10:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 11/12] migration/colo: Improve an x-colo-lost-heartbeat
 error message
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-12-armbru@redhat.com>
 <87wn4taluq.fsf@secure.mitica>
Date: Tue, 07 Feb 2023 11:10:22 +0100
In-Reply-To: <87wn4taluq.fsf@secure.mitica> (Juan Quintela's message of "Tue, 
 07 Feb 2023 10:03:25 +0100")
Message-ID: <87k00twzu9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
>> The QERR_ macros are leftovers from the days of "rich" error objects.
>> We've been trying to reduce their remaining use.
>>
>> Get rid of a use of QERR_FEATURE_DISABLED, and improve the somewhat
>> imprecise error message
>>
>>     (qemu) x_colo_lost_heartbeat
>>     Error: The feature 'colo' is not enabled
>>
>> to
>>
>>     Error: VM is not in COLO mode
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> Althought in this case which error message is better is not so clear.
> Colo mode is compiled in, but it is not being "enabled".

In my new error message, I tried to convey that it is about the state of
the VM, not the state of the QEMU binary.


