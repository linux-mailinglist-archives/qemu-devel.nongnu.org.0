Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4F6D6313
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 15:37:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjgpc-0007uL-1B; Tue, 04 Apr 2023 09:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjgpY-0007tT-SU
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjgpU-0008JQ-Hj
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 09:36:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680615365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZhLnt/r66hnYoU42n1PTzi+FpFYTJeZLFF1ASAjXjKE=;
 b=AIYdH9j85HlDhd8c5HzHInswgPRJWGge+lN4QqZ8dh+g5TwDvbaEyP2a3bg4cKLiBQCkz2
 IVoXgyjo+MOWJioUk/nEBXw+Rv+ZIYtaqUC8w8T65Yi1QfJIOFXGKilltUDiprwyW8eKjk
 1fxRYmIeW+5JAs6dbl+9pQpL2Hw5QaA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-jmxh4QgkP1uESoNZNw69GQ-1; Tue, 04 Apr 2023 09:36:02 -0400
X-MC-Unique: jmxh4QgkP1uESoNZNw69GQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84F8887B2B6;
 Tue,  4 Apr 2023 13:36:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF23B40C6EC4;
 Tue,  4 Apr 2023 13:36:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B103121E6926; Tue,  4 Apr 2023 15:35:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  eblake@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,
 quintela@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org
Subject: Re: [PATCH 15/16] qapi: Format since information the conventional
 way: (since X.Y)
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-16-armbru@redhat.com>
 <1c067573-9eab-fa70-8c49-a4085d150134@yandex-team.ru>
Date: Tue, 04 Apr 2023 15:35:59 +0200
In-Reply-To: <1c067573-9eab-fa70-8c49-a4085d150134@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Tue, 4 Apr 2023 15:55:08 +0300")
Message-ID: <87wn2rwz0g.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> On 04.04.23 14:59, Markus Armbruster wrote:
>> @@ -2741,7 +2741,7 @@
>>   #
>>   # @on-error: the action to take on an error (default report).
>>   #            'stop' and 'enospc' can only be used if the block device
>> -#            supports io-status (see BlockInfo).  Since 1.3.
>> +#            supports io-status (see BlockInfo).  (Since 1.3)
>>   #
>>   # @filter-node-name: the node name that should be assigned to the
>>   #                    filter driver that the stream job inserts into the graph
>> diff --git a/qapi/stats.json b/qapi/stats.json
>> index f17495ee65..36d5f4dc94 100644
>> --- a/qapi/stats.json
>> +++ b/qapi/stats.json
>> @@ -69,7 +69,7 @@
>>   #
>>   # @vcpu: statistics that apply to a single virtual CPU.
>>   #
>> -# @cryptodev: statistics that apply to a crypto device. since 8.0
>> +# @cryptodev: statistics that apply to a crypto device (since 8.0)
>>   #
>>   # Since: 7.1
>>   ##
>> diff --git a/qapi/tpm.json b/qapi/tpm.json
>> index 4e2ea9756a..eac87d30b2 100644
>> --- a/qapi/tpm.json
>> +++ b/qapi/tpm.json
>> @@ -44,8 +44,7 @@
>>   # An enumeration of TPM types
>>   #
>>   # @passthrough: TPM passthrough type
>> -# @emulator: Software Emulator TPM type
>> -#            Since: 2.11
>> +# @emulator: Software Emulator TPM type (since 2.11)
>
> Seems, we don't have any preference between "some text (since VER)" vs "some text. (Since VER)" ?

I personally use (Since VER) after a full sentence ending in
punctuation, and (since VER) after something that doesn't end in
punctuation.


