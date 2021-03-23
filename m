Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A4F346B0C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:26:50 +0100 (CET)
Received: from localhost ([::1]:53318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoY5-0004xU-Oz
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoVB-0001ZD-F5
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOoV9-0004kk-LS
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:23:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616534626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VEXQilRl74OKYvsL8vR7deQ/B6BFM2tnQub+aECLcOM=;
 b=cRr4J6dUotiPV9r+d4NIqIYfmCJ+ZTm8qtUrZIQ+tuAYV97X6T//pqrXPUTigWtkDuse6J
 Sa6+FMcvluHllLDhRvnD4b9bEJQf0UoRRngNSPmCecK+rOfQr7fBNtivIGRCcCajMagOHO
 9OiKvtJj888MMbsLF3SwYMBNrQPU96w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-R0rSZnXpN4GmBtBwbzolRQ-1; Tue, 23 Mar 2021 17:23:42 -0400
X-MC-Unique: R0rSZnXpN4GmBtBwbzolRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F72A81621;
 Tue, 23 Mar 2021 21:23:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 411DD1975E;
 Tue, 23 Mar 2021 21:23:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C9F1211327E1; Tue, 23 Mar 2021 22:23:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 26/28] qapi: Enforce struct member naming rules
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-27-armbru@redhat.com>
 <e5b2cdc4-a649-86c1-cde8-ce142be9f5ae@redhat.com>
Date: Tue, 23 Mar 2021 22:23:35 +0100
In-Reply-To: <e5b2cdc4-a649-86c1-cde8-ce142be9f5ae@redhat.com> (Eric Blake's
 message of "Tue, 23 Mar 2021 10:46:17 -0500")
Message-ID: <87im5hlg2w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: michael.roth@amd.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/23/21 4:40 AM, Markus Armbruster wrote:
>> Struct members, including command arguments, event data, and union
>> inline base members, should use '-', not '_'.  Enforce this.  Fix the
>> fixable offenders (all in tests/), and add the remainder to pragma
>> member-name-exceptions.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>
>> +++ b/qapi/pragma.json
>> @@ -31,10 +31,27 @@
>>      # Externally visible types whose member names may use uppercase
>>      'member-name-exceptions': [     # visible in:
>>          'ACPISlotType',             # query-acpi-ospm-status
>> +        'AcpiTableOptions',         # -acpitable
>> +        'BlkdebugSetStateOptions',  # blockdev-add, -blockdev
>> +        'BlockDeviceInfo',          # query-block
>> +        'BlockDeviceStats',         # query-blockstats
>> +        'BlockDeviceTimedStats',    # query-blockstats
>> +        'BlockIOThrottle',          # block_set_io_throttle
>> +        'BlockInfo',                # query-block
>>          'BlockdevVmdkAdapterType',  # blockdev-create (to match VMDK spec)
>>          'BlockdevVmdkSubformat',    # blockdev-create (to match VMDK spec)
>> +        'ColoCompareProperties',    # object_add, -object
>> +        'FilterMirrorProperties',   # object_add, -object
>> +        'FilterRedirectorProperties', # object_add, -object
>> +        'FilterRewriterProperties', # object_add, -object
>> +        'InputLinuxProperties',     # object_add, -object
>> +        'NetdevTapOptions',         # netdev_add, query-netdev, -netdev
>> +        'PciBusInfo',               # query-pci
>> +        'PciDeviceInfo',            # query-pci
>> +        'PciMemoryRegion',          # query-pci
>>          'QapiErrorClass',           # QMP error replies
>>          'UuidInfo',                 # query-uuid
>> +        'VncClientInfo',            # query-vnc, query-vnc-servers, ...
>>          'X86CPURegister32'          # qom-get of x86 CPU properties
>>                                      # feature-words, filtered-features
>>      ] } }
>
> I was worried the list might be even longer.  And as before, we might
> have future patches that want to add aliases and/or deprecate the old
> spellings, as long as introspection can easily see new spellings.
>
> At any rate, I'm in agreement with letting the computer flag new
> instances instead of relying on me to notice during review.

Saves us review - fix up cycles.  Everybody wins.

>> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
>> index 2b08b761c2..fb17eebde3 100644
>> --- a/qga/qapi-schema.json
>> +++ b/qga/qapi-schema.json
>> @@ -19,6 +19,10 @@
>>  # Whitelists to permit QAPI rule violations; think twice before you
>
> Did you want to fix this instance of the word 'Whitelists' somewhere in
> the series?

There's more than just this one.  We can replace them on top if we care.

>>  # add to them!
>>  { 'pragma': {
>> +    # Types whose member names may use '_'
>> +    'member-name-exceptions': [
>> +        'GuestAgentInfo'
>> +    ],
>>      # Commands allowed to return a non-dictionary:
>>      'command-returns-exceptions': [
>>          'guest-file-open',
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


