Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946822FBBFB
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:09:46 +0100 (CET)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tZh-0002mE-LK
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1tYF-0001tB-Um
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:08:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1tYD-0002hp-4H
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611072490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PV37KtaIbe4rmwZfLkrLn1mEh0ceo2zqHiguZPrRouo=;
 b=e1+tMFkbIRZ/QeTd7uCmfYJcohEcYvm2H+vEHywcyluwYH4MQD/WNjUYlawUn7MA4CYLr8
 XtVOPMOK86VoZCkNHLADHyk4piUtZGbubkKF/J9l1x1PfaqEkz89ZFApBRa/bd9o6Noxeu
 PCI6M6QHrmpRh/kkSoXiB1Pzyf+ppOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-mqOJvKAlPNWUWCLTZnzOYA-1; Tue, 19 Jan 2021 11:08:06 -0500
X-MC-Unique: mqOJvKAlPNWUWCLTZnzOYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C67806660;
 Tue, 19 Jan 2021 16:08:05 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32BA460C5A;
 Tue, 19 Jan 2021 16:08:05 +0000 (UTC)
Subject: Re: [PATCH v4 1/5] net: Clarify early exit condition
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210113221013.390592-1-eblake@redhat.com>
 <20210113221013.390592-2-eblake@redhat.com>
 <7e1edd6a-dbdf-3c4c-4dfa-c181418d09bd@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <689a713c-b190-aa77-106d-24ad8e3fc49e@redhat.com>
Date: Tue, 19 Jan 2021 10:08:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7e1edd6a-dbdf-3c4c-4dfa-c181418d09bd@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 10:54 PM, Vladimir Sementsov-Ogievskiy wrote:
> 14.01.2021 01:10, Eric Blake wrote:
>> On first glance, the loop in qmp_query_rx_filter() has early return
>> paths that could leak any allocation of filter_list from a previous
>> iteration.  But on closer inspection, it is obvious that all of the
>> early exits are guarded by has_name, and that the bulk of the loop
>> body can be executed at most once if the user is filtering by name,
>> thus, any early exit coincides with an empty list.  Add asserts to
>> make this obvious.
> 
> A bit simpler (for me :) observation:
> 
> But on closer inspection, it is obvious that all of the early exits are
> guarded by has_name, and in case when has_name is true we leave the loop

s/in case//

> (by break) immediately after allocation and assigning filter_list for
> the first time.

Replacing my wording with this touched-up sentence is fine with me, if
Markus would like to tweak the queued commit to incorporate it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


