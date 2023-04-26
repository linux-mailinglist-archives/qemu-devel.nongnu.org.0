Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DFB6EF8D1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:56:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1priQH-00010h-Jq; Wed, 26 Apr 2023 12:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1priQF-00010F-Ab
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1priQA-0003F0-Sa
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682528109;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xQ4i/jQZsZcEEliToEsifKANGySu7FvbR2UiiqEIzEM=;
 b=eMbU+fOdcBirK4UKL9rjnQXP8t7qbA94GnelClUni7nCwjEjtgF1Vc1ahwP1PB0MEfoCpQ
 SQEmoZBO3KVlxbOgY1NCRP0OwrVkoABhiuiXffr4qV+GJkCDK+bPJ3/tJkmMfXajuoAqGl
 O968u+IUyWLfLJ+7EhNR0l9i5lMdIYw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-9SdiwVlvPyCNDY0Ma2zhUQ-1; Wed, 26 Apr 2023 12:55:08 -0400
X-MC-Unique: 9SdiwVlvPyCNDY0Ma2zhUQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f171d201afso44423575e9.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682528107; x=1685120107;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQ4i/jQZsZcEEliToEsifKANGySu7FvbR2UiiqEIzEM=;
 b=jcAX2QqRf+EEFWC0jSXyFL9P81m8wMQThsFCC5JJzen4aHmGu1X8F5NbUWVw+4rb5r
 TNZepB9kxMxwPiotbFlymjoHXZ7h3WRMfstMes7SQvj4qpme4y+XlYqfQqY8edue25Oi
 LhQurYdoAesWdaT1jEAYHxpN6WVrECp9d1rezOLLSdzChQtauwzxMtFgH4UZclC+UjxW
 zjpKgsQa09Z7joNPpux7rJdqOI+fggi4XSfMJJlATKbAYvOmTot1TYZj8tYj+TB/HL5R
 YyfhMwiFU8xsxn1xAJeBAg84LBJKvlID95+yqKmpK0evSRCN+9GDGWF8pmAnJkF7uAPU
 KPlA==
X-Gm-Message-State: AAQBX9fSsxVGuKw9xekKlddvC9rQO+HG3i7Baa9HibFGhE8hUSzD9ycD
 7J5e4+jWx9N638r5FO+CvgCqp4xS9FKUS7qmIrIi1Zl6cCPTekNq6IpO6zgp7aKZm2ObNM2+6jL
 55jImvoSi0WjMs7A=
X-Received: by 2002:a05:600c:228a:b0:3f0:46d4:b391 with SMTP id
 10-20020a05600c228a00b003f046d4b391mr12747377wmf.6.1682528106798; 
 Wed, 26 Apr 2023 09:55:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350YdYgCWph0oNws9hHPBUFx79Qp4XlTzD5S5wMTp3USX7kKGNz3VmD0nZPVrIKSkE6JZ94we7A==
X-Received: by 2002:a05:600c:228a:b0:3f0:46d4:b391 with SMTP id
 10-20020a05600c228a00b003f046d4b391mr12747360wmf.6.1682528106501; 
 Wed, 26 Apr 2023 09:55:06 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b003e91b9a92c9sm18545481wma.24.2023.04.26.09.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:55:05 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Yanan Wang <wangyanan55@huawei.com>,  Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  Leonardo
 Bras <leobras@redhat.com>,  "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 1/3] multifd: Create property
 multifd-flush-after-each-section
In-Reply-To: <ZEgfH1qNGV6nqpWX@x1n> (Peter Xu's message of "Tue, 25 Apr 2023
 14:42:39 -0400")
References: <20230425163114.2609-1-quintela@redhat.com>
 <20230425163114.2609-2-quintela@redhat.com> <ZEgfH1qNGV6nqpWX@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 18:55:04 +0200
Message-ID: <87v8hieg7r.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> On Tue, Apr 25, 2023 at 06:31:12PM +0200, Juan Quintela wrote:
>> We used to flush all channels at the end of each RAM section
>> sent.  That is not needed, so preparing to only flush after a full
>> iteration through all the RAM.
>> 
>> Default value of the property is false.  But we return "true" in
>> migrate_multifd_flush_after_each_section() until we implement the code
>> in following patches.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> PS: Normally I'll just keep the last Sign-off-by for each person. :)

And here we are again O:-)

I have a hook to put that in.  And at some point it did the wrong thing
(i.e. this), and I always forgot to look into old series for this error.

Sorry, fixed.


>> 
>> ---
>> 
>> Rename each-iteration to after-each-section
>> Rename multifd-sync-after-each-section to
>>        multifd-flush-after-each-section
>> ---
>>  hw/core/machine.c     |  1 +
>>  migration/migration.c | 13 +++++++++++++
>>  migration/migration.h | 13 +++++++++++++
>>  3 files changed, 27 insertions(+)
>> 
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 2ce97a5d3b..32bd9277b3 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -60,6 +60,7 @@ const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>>  GlobalProperty hw_compat_7_0[] = {
>>      { "arm-gicv3-common", "force-8-bit-prio", "on" },
>>      { "nvme-ns", "eui64-default", "on"},
>> +    { "migration", "multifd-flush-after-each-section", "on"},
>>  };
>
> Here we need hw_compat_8_0 instead?

Good catch.

Changed.


