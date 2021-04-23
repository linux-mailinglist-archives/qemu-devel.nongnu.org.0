Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268E368EBB
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 10:17:39 +0200 (CEST)
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZr0M-0003Km-GL
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 04:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lZqzQ-0002si-8G
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lZqzO-0007MM-78
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619165796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YK7gdE+SszGLq1K6exd92cAb6aqGxQye/Jt6sOzJCpk=;
 b=N4ty3jSxQ4EzcP8d7HiiILbWCxFdBdz5AcY/zKReghsXSY2S1EGu9YzkUFuNHH5krDVWO6
 KA4kENE2VCpN+9hY5SiYWQxUazqyWFhZ/TpcumgDkZveusv0bCBZQ2+dmFqw39SupPyhr+
 pQ6IJ12dGAmRIjlLg5Ib62vlQ4w/PiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-iVGOeqcvN1KvFI0o5F5-pw-1; Fri, 23 Apr 2021 04:16:29 -0400
X-MC-Unique: iVGOeqcvN1KvFI0o5F5-pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69159817475;
 Fri, 23 Apr 2021 08:16:28 +0000 (UTC)
Received: from [10.40.195.9] (unknown [10.40.195.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 660A8687DB;
 Fri, 23 Apr 2021 08:16:26 +0000 (UTC)
Subject: Re: firmware selection for SEV-ES
To: Laszlo Ersek <lersek@redhat.com>, Pavel Hrdina <phrdina@redhat.com>
References: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
 <YIARw09TcakElBco@antique-laptop>
 <0b5d799c-6290-5585-599e-4c4f37af6202@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <0cf69e7e-d159-6b68-0046-5449b0241634@redhat.com>
Date: Fri, 23 Apr 2021 10:16:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0b5d799c-6290-5585-599e-4c4f37af6202@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 4:13 PM, Laszlo Ersek wrote:
> On 04/21/21 13:51, Pavel Hrdina wrote:
>> On Wed, Apr 21, 2021 at 11:54:24AM +0200, Laszlo Ersek wrote:
>>> Hi Brijesh, Tom,
>>>
>>> in QEMU's "docs/interop/firmware.json", the @FirmwareFeature enumeration
>>> has a constant called @amd-sev. We should introduce an @amd-sev-es
>>> constant as well, minimally for the following reason:
>>>
>>> AMD document #56421 ("SEV-ES Guest-Hypervisor Communication Block
>>> Standardization") revision 1.40 says in "4.6 System Management Mode
>>> (SMM)" that "SMM will not be supported in this version of the
>>> specification". This is reflected in OVMF, so an OVMF binary that's
>>> supposed to run in a SEV-ES guest must be built without "-D
>>> SMM_REQUIRE". (As a consequence, such a binary should be built also
>>> without "-D SECURE_BOOT_ENABLE".)
>>>
>>> At the level of "docs/interop/firmware.json", this means that management
>>> applications should be enabled to look for the @amd-sev-es feature (and
>>> it also means, for OS distributors, that any firmware descriptor
>>> exposing @amd-sev-es will currently have to lack all three of:
>>> @requires-smm, @secure-boot, @enrolled-keys).
>>>
>>> I have three questions:
>>>
>>>
>>> (1) According to
>>> <https://libvirt.org/formatdomain.html#launch-security>, SEV-ES is
>>> explicitly requested in the domain XML via setting bit#2 in the "policy"
>>> element.
>>>
>>> Can this setting be used by libvirt to look for such a firmware
>>> descriptor that exposes @amd-sev-es?
>>
>> Hi Laszlo and all,
>>
>> Currently we use only <launchSecurity type='sev'> when selecting
>> firmware to make sure that it supports @amd-sev. Since we already have a
>> place in the VM XML where users can configure amd-sev-as we can use that
>> information when selecting correct firmware that should be used for the
>> VM.
> 
> Thanks!
> 
> Should we file a libvirtd Feature Request (where?) for recognizing the
> @amd-sev-es feature flag?

Yes, we should. We can use RedHat bugzilla for that. Laszlo - do you 
want to do it yourself or shall I help you with that?

Michal


