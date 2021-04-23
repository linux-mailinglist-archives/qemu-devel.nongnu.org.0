Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3768A3692BC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:09:18 +0200 (CEST)
Received: from localhost ([::1]:34820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvYb-0003sJ-9F
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lZvWS-0002fZ-B9
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:07:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lZvWM-0003Ny-7t
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:07:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619183214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKbiJvO8D+qP9hfc7hFZ4uufMVS4nm6r8u9POdsfEs4=;
 b=K+bwOYt3m8yiGdu1GZMEWqtBcooogdNSFnh6nlqSNbqJmXK30uBRH6rHJRib9NzuCTFlpg
 1/P4EeqhKoOPTb1NXtP0hx+jDSrc4a37pCA+J1RTD64uwp4KY9CWWJkp/SR0PfZryl/A3m
 qsRVHWBzI6qnEHlR6DCtjzTDGAydeok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-EygDwtkrOYWD2jhV8yWnXQ-1; Fri, 23 Apr 2021 09:06:52 -0400
X-MC-Unique: EygDwtkrOYWD2jhV8yWnXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE6D3107ACCA;
 Fri, 23 Apr 2021 13:06:51 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-2.ams2.redhat.com
 [10.36.115.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 246875DEAD;
 Fri, 23 Apr 2021 13:06:49 +0000 (UTC)
Subject: Re: firmware selection for SEV-ES
To: Pavel Hrdina <phrdina@redhat.com>
References: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
 <YIARw09TcakElBco@antique-laptop>
 <0b5d799c-6290-5585-599e-4c4f37af6202@redhat.com>
 <0cf69e7e-d159-6b68-0046-5449b0241634@redhat.com>
 <YIKiE+USYmCjQeSR@antique-laptop>
 <e5978a49-00a6-6350-0e06-6aab6de4c9a5@redhat.com>
 <YILFNu1R8LcZRF48@antique-laptop>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <17cd75db-98bf-7bf1-bc5b-cd71e62507ec@redhat.com>
Date: Fri, 23 Apr 2021 15:06:49 +0200
MIME-Version: 1.0
In-Reply-To: <YILFNu1R8LcZRF48@antique-laptop>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "=?UTF-8?Q?Daniel_P._Berrang=c3=a9?=" <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/23/21 15:01, Pavel Hrdina wrote:
> On Fri, Apr 23, 2021 at 02:34:02PM +0200, Laszlo Ersek wrote:
>> On 04/23/21 12:31, Pavel Hrdina wrote:
>>> On Fri, Apr 23, 2021 at 10:16:24AM +0200, Michal Privoznik wrote:
>>>> On 4/22/21 4:13 PM, Laszlo Ersek wrote:
>>>>> On 04/21/21 13:51, Pavel Hrdina wrote:
>>
>>>>> Should we file a libvirtd Feature Request (where?) for recognizing the
>>>>> @amd-sev-es feature flag?
>>>>
>>>> Yes, we should. We can use RedHat bugzilla for that. Laszlo - do you want to
>>>> do it yourself or shall I help you with that?
>>>
>>> This BZ looks like it's already tracking support for amd-sev-es [1].
>>>
>>> Pavel.
>>>
>>> [1] <https://bugzilla.redhat.com/show_bug.cgi?id=1895035>
>>
>> That's a private RHBZ that tracks SEV-ES for a product that is different
>> from "libvirt upstream".
> 
> I didn't notice that's a private RHBZ, thanks for pointing it out.
> 
> For upstream libvirt we no longer use RHBZ to track RFEs/BZs, we use
> gitlab issues so if we want to track the work in upstream as well I can
> create a new issue.

Heh, I suspected I was missing something there :) Yes, please, if you or
Michal could create a new issue in gitlab, that would be great.

Thanks
Laszlo


