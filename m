Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398C51B893
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 09:16:55 +0200 (CEST)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmVjK-0007hV-4S
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 03:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmVdC-000541-DB
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:10:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:32398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmVd9-0008Lx-Ft
 for qemu-devel@nongnu.org; Thu, 05 May 2022 03:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651734629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTyStVVAg27kxjoO/J9rOg0rNSvQSzXAF5lhxKRw/wk=;
 b=QBSKfg+/YRd7Xz46IUz/Jv128HismjMUU5Rjwp/lyUH7XbbmUgpfJwWlvp+QAz10t7vIT1
 ABg3gCSQCsNH/lKm/rmyHAfGjB0fqgO7QDQpcwup1HhlikTf3jVDbTKw3yuV4yP+qKD04A
 bzogV7K4V7/3LajUDqewGOZzh/oLZh0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-2pkkcvC-OaaGxhCpUYagow-1; Thu, 05 May 2022 03:10:28 -0400
X-MC-Unique: 2pkkcvC-OaaGxhCpUYagow-1
Received: by mail-ej1-f72.google.com with SMTP id
 hr42-20020a1709073faa00b006f4dc7f0be1so1306486ejc.22
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 00:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=xTyStVVAg27kxjoO/J9rOg0rNSvQSzXAF5lhxKRw/wk=;
 b=sIuAt89atPPjXQFNe+jOhQt8I3PCLc49hLCKyTIeSmj58eXE7uHSdZ4KB2CMHiuZ9c
 unUf8bFbEE1TcjtFYg4mLtImsUHyuXRnZz+7XDQgeePvSmPFQAVy/YjIaOlvg92U2NNt
 szZ7/PAAu6Jacqh8bdHIj65H5Sk6Ogh4LEQCD1H7lD6zeS1fhUdZPuXxOOk0E4dEcdHC
 03s7UMlnvtMr875gUA93+CkZea9btbAZBkOMsZ/tU7F1p+HQweojV9e+fQm1BC1bcgTd
 USXL9X1BuGb+vMJr9gx+vyqGmKF8qJsInR8tLePz5BvPopj/8uHYQ1tYbEikg1n7hnxr
 sMBg==
X-Gm-Message-State: AOAM531UDKUnUAywQi07zk8FUzw4yIgdN/Zqai7qRC39um/Ij250Jnsi
 LpWIF/5EABk3YE+SLHDA1ovtLnJ1K32j1zrWdxg4IkMmKicOQF/CcPAyulSsz9KsYFDt9lewIfn
 JMWbCg54OUKAetB8=
X-Received: by 2002:a50:ed0e:0:b0:425:e476:f4ed with SMTP id
 j14-20020a50ed0e000000b00425e476f4edmr27840690eds.32.1651734627318; 
 Thu, 05 May 2022 00:10:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXtgQfvFs2eQPstzXi1CPp1JGiKx+h/vd1ka84p40au63K0u7ER/c3bb9dXWsoL2NCBwJd/w==
X-Received: by 2002:a50:ed0e:0:b0:425:e476:f4ed with SMTP id
 j14-20020a50ed0e000000b00425e476f4edmr27840671eds.32.1651734627063; 
 Thu, 05 May 2022 00:10:27 -0700 (PDT)
Received: from [127.0.0.1] (93-33-37-188.ip42.fastwebnet.it. [93.33.37.188])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a056402524d00b0041d527833b9sm416444edd.3.2022.05.05.00.10.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 May 2022 00:10:26 -0700 (PDT)
Date: Thu, 05 May 2022 09:10:17 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
CC: qemu-devel@nongnu.org, mark.kanda@oracle.com, berrange@redhat.com,
 dgilbert@redhat.com
Subject: Re: [PATCH 1/8] qmp: Support for querying stats
In-Reply-To: <87sfpp3018.fsf@pond.sub.org>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-2-pbonzini@redhat.com> <87sfpp3018.fsf@pond.sub.org>
Message-ID: <41B27AED-A9E0-4666-AEBB-0F3C9F436DF1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Il 4 maggio 2022 15:22:27 CEST, Markus Armbruster <armbru@redhat=2Ecom> ha=
 scritto:
>Can you point to existing uses of KVM binary stats introspection data?

There's none, but Google is using it in house=2E The same data was availab=
le before in debugfs and available via the kvm_stat script, so you could al=
so refer to Christian Borntraeger's KVM Forum 2019 talk=2E The problems wit=
h debugfs are basically that it's only available to root and is disabled by=
 secure boot (both issues are not fixable on general because they are Linux=
 policy)=2E

>> index 4912b9744e=2E=2E92d7ecc52c 100644
>> --- a/qapi/qapi-schema=2Ejson
>> +++ b/qapi/qapi-schema=2Ejson
>> @@ -93,3 +93,4 @@
>>  { 'include': 'audio=2Ejson' }
>>  { 'include': 'acpi=2Ejson' }
>>  { 'include': 'pci=2Ejson' }
>> +{ 'include': 'stats=2Ejson' }
>> diff --git a/qapi/stats=2Ejson b/qapi/stats=2Ejson
>> new file mode 100644
>> index 0000000000=2E=2E7454dd7daa
>> --- /dev/null
>> +++ b/qapi/stats=2Ejson
>> @@ -0,0 +1,192 @@
>> +# -*- Mode: Python -*-
>> +# vim: filetype=3Dpython
>> +#
>> +# Copyright (c) 2022 Oracle and/or its affiliates=2E
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or l=
ater=2E
>> +# See the COPYING file in the top-level directory=2E
>> +#
>> +# SPDX-License-Identifier: GPL-2=2E0-or-later
>> +
>> +##
>> +# =3D Statistics
>> +##
>> +
>> +##
>> +# @StatsType:
>> +#
>> +# Enumeration of statistics types
>> +#
>> +# @cumulative: stat is cumulative; value can only increase=2E
>> +# @instant: stat is instantaneous; value can increase or decrease=2E
>> +# @peak: stat is the peak value; value can only increase=2E
>> +# @linear-hist: stat is a linear histogram=2E
>> +# @log-hist: stat is a logarithmic histogram=2E
>
>For better or worse, we tend to eschew abbreviations in schema
>identifiers=2E  Would you mind @linear-histogram and @log-histogram?

Sure=2E


>> +# Since: 7=2E1
>> +##
>> +{ 'enum': 'StatsTarget',
>> +  'data': [ 'vm', 'vcpu' ] }
>
>Do VM stats include vCPU stats?  "Entire virtual machine" suggests they
>do=2E=2E=2E

No, they don't=2E They are a different sets of data that is gathered on re=
sources shared by the whole VM=2E Stuff such as "# of pages taken by the KV=
M page tables" goes there because VCPUs share a single copy of the page tab=
les, as opposed to "# of page faults" which is a VCPU stat=2E

>> +# The arguments to the query-stats command; specifies a target for whi=
ch to
>> +# request statistics, and which statistics are requested from each pro=
vider=2E
>> +#
>> +# Since: 7=2E1
>> +##
>> +{ 'struct': 'StatsFilter',
>> +  'data': { 'target': 'StatsTarget' } }
>
>The "and which statistics" part will be implemented later in this
>series?

Oh, indeed it is=2E Thanks for noticing=2E

>> +{ 'struct': 'StatsResult',
>> +  'data': { 'provider': 'StatsProvider',
>> +            '*qom-path': 'str',
>
>When exactly will @qom-path be present?

Only if the target is vcpus, for the current set of targets=2E Because the=
 target is in the command I am not repeating it here with another discrimin=
ated record=2E

>> +# @type: kind of statistic, a @StatType=2E
>
>Generated documentation looks like
>
>       type: StatsType
>              kind of statistic, a StatType=2E
>
>I think ", a @StatType" should be dropped=2E
>
>If we decide to keep it: @StatsType=2E

Gotcha=2E

>
>> +#
>> +# @unit: base unit of measurement for the statistics @StatUnit=2E
>
>"@StatUnit", too=2E
>
>If we decide to keep it: @StatsUnit=2E
>
>@unit is optional=2E  What's the default?

The stat is an adimensional number: a count of events such a page faults, =
or the maximum length of a bucket in a hash table,  etc=2E It's actually th=
e common case=2E

>> +# @base: base for the multiple of @unit that the statistic uses, eithe=
r 2 or 10=2E
>> +#        Only present if @exponent is non-zero=2E
>> +#
>> +# @exponent: exponent for the multiple of @unit that the statistic use=
s
>
>Alright, given a stat value 42, what does it mean for the possible
>combinations of @base and @exponent?

Base and exponent are used to represent units like KiB, nanoseconds, etc=
=2E

>> +# @bucket-size: Used with linear-hist to report the width of each buck=
et
>> +#               of the histogram=2E
>
>Feels too terse=2E  Example, perhaps?
>
>I assume @bucket-size is present exactly when @type is @linear-hist=2E
>Correct?

Yep, will expand=2E

>> +##
>> +# @StatsSchema:
>> +#
>> +# Schema for all available statistics for a provider and target=2E
>> +#
>> +# @provider: provider for this set of statistics=2E
>> +#
>> +# @target: kind of object that can be queried through this provider=2E
>> +#
>> +# @stats: list of statistics=2E
>> +#
>> +# Since: 7=2E1
>> +##
>> +{ 'struct': 'StatsSchema',
>> +  'data': { 'provider': 'StatsProvider',
>> +            'target': 'StatsTarget',
>> +            'stats': [ 'StatsSchemaValue' ] } }
>
>How am I to connect each element of the result of query-stats to an
>element of the result of query-stats-schema?

You gave the target to query-stats and the result of query-stats has the p=
rovider and name=2E Target+provider+name uniquely identify a StatsSchemaVal=
ue in the result of query-stats-schemas=2E

Paolo

>
>> +
>> +##
>> +# @query-stats-schemas:
>> +#
>> +# Return the schema for all available runtime-collected statistics=2E
>> +#
>> +# Since: 7=2E1
>> +##
>> +{ 'command': 'query-stats-schemas',
>> +  'data': { },
>> +  'returns': [ 'StatsSchema' ] }
>


