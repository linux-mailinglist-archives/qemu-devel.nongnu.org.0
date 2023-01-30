Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5C86810C4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:06:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUnl-00084k-D5; Mon, 30 Jan 2023 09:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUnj-00084V-Ve
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:06:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMUni-0007TR-AU
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:06:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675087585;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nu4r8RvR1fA+o0XH3N8qhzs5tCgiFw0Rq1BNc45uvKg=;
 b=dUwjcDgJBV3Zd+wkfZ9dvAhjxe8yYYSWsl669h5ixhBTHlDrPnmgcrdqCg4S91REt8+9Z6
 arGkTAdtQU8cPwzxrPapQEPybwf9GVmEWmUmzsi28XFZ8uSvGO1/K/QRX97pOqPtDI1qV3
 dDu9cbRRpn1zy3BksFOnRf7Sct6Xw7s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-197-ypNWJIk6Nv23J-jUMDnMuw-1; Mon, 30 Jan 2023 09:06:23 -0500
X-MC-Unique: ypNWJIk6Nv23J-jUMDnMuw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg24-20020a05600c3c9800b003db0ddddb6fso7251934wmb.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:06:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nu4r8RvR1fA+o0XH3N8qhzs5tCgiFw0Rq1BNc45uvKg=;
 b=fuwe7HsUNxS1VMvG/w8eLetXwJE6djB9nf4XmYHAMVLxg71wp7hELGN3KdldV6vy/g
 ga3/Fd6xB8hF+sNsh72yRl/InS29n47MDbmZ6mwM8om8xw0lloUl3cdsF5z/mO+IYPfy
 9wHalBMs1O0Pm9lAFR9xgauT57xuzNJnYvgrtGlBa4IfJSx4ttNJRQSsMOFnZXoDCrwP
 cjVMaNooDbscDg7WVO2EDzsWyEQCp2khnquuT1HbZzRNKeuqnY2AevFnQdZiogb8JRxq
 irVNhAYpXcGv5YOdlFF1xWKXjk+sd7g09VxzEtFfXuxZyArqI7kE3EtroSOuFl0S+Xbw
 d6Yg==
X-Gm-Message-State: AO0yUKVRgqOSwrRYn6WyekBVYp3uIIxHZp5jzI1ukagrcpPaNEE/1OUs
 kWJPhHq1uiwhkI45xFZh7AyDd8IPK8U7IG4TPZCqluwJg2xGE9VUR23n08IHQAiuqArKHNRkMGG
 GdKXbAoFDVOkP7+A=
X-Received: by 2002:a05:600c:5109:b0:3d2:2830:b8bb with SMTP id
 o9-20020a05600c510900b003d22830b8bbmr5873178wms.34.1675087582155; 
 Mon, 30 Jan 2023 06:06:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+oJTemKr5TH6iF9STFpBXMRLa5c6vXC1wI3Ce+n6f7+8PXteynOmyATrOVsYAuKiuklJ1rKw==
X-Received: by 2002:a05:600c:5109:b0:3d2:2830:b8bb with SMTP id
 o9-20020a05600c510900b003d22830b8bbmr5873136wms.34.1675087581803; 
 Mon, 30 Jan 2023 06:06:21 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 b48-20020a05600c4ab000b003db1ca20170sm3863973wmp.37.2023.01.30.06.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:06:20 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 08/11] multifd: Add capability to enable/disable
 zero_page
In-Reply-To: <87o7qgcqi3.fsf@pond.sub.org> (Markus Armbruster's message of
 "Mon, 30 Jan 2023 10:37:24 +0100")
References: <20230130080956.3047-1-quintela@redhat.com>
 <20230130080956.3047-9-quintela@redhat.com>
 <87o7qgcqi3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 15:06:19 +0100
Message-ID: <87y1pknmlg.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> Juan Quintela <quintela@redhat.com> writes:
>
>> We have to enable it by default until we introduce the new code.
>>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> The subject doesn't quite match the patch to the QAPI schema.  It claims
> "capability to enable/disable zero_page", but ...


And here I am, making a full of myself (again).

Will change the documentation/commit informatioon, what is right is the
code.

Thanks a lot.

Later, Juan.

>
>> ---
>>
>> Change it to a capability.  As capabilities are off by default, have
>> to change MULTIFD_ZERO_PAGE to MAIN_ZERO_PAGE, so it is false for
>> default, and true for older versions.
>> ---
>>  qapi/migration.json   |  8 +++++++-
>>  migration/migration.h |  1 +
>>  hw/core/machine.c     |  1 +
>>  migration/migration.c | 13 ++++++++++++-
>>  4 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/migration.json b/qapi/migration.json
>> index 88ecf86ac8..ac5bc071a9 100644
>> --- a/qapi/migration.json
>> +++ b/qapi/migration.json
>> @@ -472,12 +472,18 @@
>>  #                  Requires that QEMU be permitted to use locked memory
>>  #                  for guest RAM pages.
>>  #                  (since 7.1)
>> +#
>>  # @postcopy-preempt: If enabled, the migration process will allow postcopy
>>  #                    requests to preempt precopy stream, so postcopy requests
>>  #                    will be handled faster.  This is a performance feature and
>>  #                    should not affect the correctness of postcopy migration.
>>  #                    (since 7.1)
>>  #
>> +# @main-zero-page: If enabled, the detection of zero pages will be
>> +#                  done on the main thread.  Otherwise it is done on
>> +#                  the multifd threads.
>
> ... here, we add a capability to shift certain work to another thread.
> No "enable/disable" as far as I can tell.  Which one is right?
>
> What's the default?
>
> Not this patch's fault, but needs fixing: we neglect to document the
> default for several other parameters.
>
> Wordsmithing nitpick: suggest "done by the thread" or maybe "done in the
> thread".
>
> @main-zero-page suggests this is about a special zero page.  Perhaps I
> can think of a clearer name, but first I need to be sure what the thing
> is about.
>
>> +#                  (since 8.0)
>> +#
>>  # Features:
>>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>>  #
>> @@ -492,7 +498,7 @@
>>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>>             'validate-uuid', 'background-snapshot',
>> -           'zero-copy-send', 'postcopy-preempt'] }
>> +           'zero-copy-send', 'postcopy-preempt', 'main-zero-page'] }
>>  
>>  ##
>>  # @MigrationCapabilityStatus:


