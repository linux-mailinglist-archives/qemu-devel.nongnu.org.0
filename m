Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1B01FA8C3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 08:27:57 +0200 (CEST)
Received: from localhost ([::1]:41812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jl54d-0006ko-Jw
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 02:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl53f-0006LI-I8
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:26:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28900
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jl53d-0002Y1-7W
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 02:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592288810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gScMv/ixCRowTYN1Gm/ommUykE3DDGimSqN6zY+IDhE=;
 b=a0fu9NwUU4nzKvXlrXtKt3ohDj8UqGQ6KffrUbcKxiT/hYZx8cSAhFaeLiO8Ho6eOjNDC7
 B0PMAjllsUjj5NQGqzFBoJ8nHxTFkwkU80VgxLWmGokli3QOj/iyJFHsDdnejMwIAd7Lfy
 r5vndOv0vCfFHpZMMeYr1mJPZ9gaDm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-E6W9wpbDPPar6mfEIdDBWA-1; Tue, 16 Jun 2020 02:26:47 -0400
X-MC-Unique: E6W9wpbDPPar6mfEIdDBWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D500188360A
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 06:26:47 +0000 (UTC)
Received: from [10.72.13.124] (ovpn-13-124.pek2.redhat.com [10.72.13.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28ECF7CAA9;
 Tue, 16 Jun 2020 06:26:45 +0000 (UTC)
Subject: Re: [PATCH v3 0/2] net: Drop legacy "name" from -net and remove
 NetLegacy
To: Thomas Huth <thuth@redhat.com>
References: <20200518180103.32484-1-thuth@redhat.com>
 <ccb94bbf-62f8-a15c-c7ba-5d2da724757f@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ff5d1188-3b67-fc3f-fa47-77f5435f34bf@redhat.com>
Date: Tue, 16 Jun 2020 14:26:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ccb94bbf-62f8-a15c-c7ba-5d2da724757f@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:01:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/6/15 下午8:06, Thomas Huth wrote:
> On 18/05/2020 20.01, Thomas Huth wrote:
>> Since commit b4983c570c7a ("net: Remove deprecated [hub_id name] tuple of
>> 'hostfwd_add' / 'hostfwd_remove'"), the "name" parameter is not used
>> internally anymore. And it's been marked as deprecated since QEMU v3.1,
>> so it is time to remove the "name" parameter from -net now. Once this
>> has been done, we can also drop the obsolete NetLegacy structure since
>> there is no major difference between Netdev and NetLegacy anymore.
>>
>> v3:
>>   - Do not make "id" in Netdev optional, but rather assign a temporary
>>     "id" for -net before we call the options visitor function.
>>   - Changed some "void *" to "Netdev *" now
>>
>> v2:
>>   - Rebased to master (use the deprecated.rst instead of qemu-deprecated.texi)
>>
>> Thomas Huth (2):
>>    net: Drop the legacy "name" parameter from the -net option
>>    net: Drop the NetLegacy structure, always use Netdev instead
> Ping!
>
> Jason, do you think these patches are OK now, and if so, could you
> please queue them for your next net pull request?


Queued.

Sorry for the late.

Thanks


>
>   Thanks,
>    Thomas
>
>


