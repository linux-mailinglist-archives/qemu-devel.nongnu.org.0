Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2969F1F6A29
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 16:38:16 +0200 (CEST)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjOLP-0005OH-7V
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 10:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jjOK7-0004SM-WE
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 10:36:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57482
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jjOK6-0001vQ-9y
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 10:36:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591886213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R8iGEVR1kQQwsgaN0ZpVmjwYHpEbDiFbdqFaOwDYgTE=;
 b=A7V5c6jbX5uY/Dv4kSTlbl6tuZ/Gg5kT6T4tvdetLMucdTc/OnH+QB1ubX8IsAMvvtWwsr
 DinDSRO951pb6F8QE/yr/U3urvo+uBcL+0ktEuehlXoeN6eUB7d77Dy867lUs+MPbBnAUY
 0RxE/pON8Il8HG3iHHahYAB3yxyA3iE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-vDfpWE7aPmKNghQaMSfkwA-1; Thu, 11 Jun 2020 10:36:51 -0400
X-MC-Unique: vDfpWE7aPmKNghQaMSfkwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A3BA18A8220;
 Thu, 11 Jun 2020 14:36:50 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0A18FF81;
 Thu, 11 Jun 2020 14:36:48 +0000 (UTC)
Subject: Re: [PATCH v8 33/34] qcow2: Assert that expand_zero_clusters_in_l1()
 does not support subclusters
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1591801197.git.berto@igalia.com>
 <19afb93b267b9698edf5e0253458c5db69ef91a2.1591801197.git.berto@igalia.com>
 <abcbfa4c-c70f-3c2e-ec8f-4087b348af26@redhat.com>
 <w51y2othh0x.fsf@maestria.local.igalia.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <033a2dc9-6dbf-dca8-9963-84f0a374e907@redhat.com>
Date: Thu, 11 Jun 2020 09:36:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <w51y2othh0x.fsf@maestria.local.igalia.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 08:37:10
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
Cc: Kevin Wolf <kwolf@redhat.com>, Derek Su <dereksu@qnap.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/20 8:24 AM, Alberto Garcia wrote:
> On Wed 10 Jun 2020 09:43:53 PM CEST, Eric Blake wrote:
>> On 6/10/20 10:03 AM, Alberto Garcia wrote:
>>> This function is only used by qcow2_expand_zero_clusters() to
>>> downgrade a qcow2 image to a previous version. It is however not
>>> possible to downgrade an image with extended L2 entries because older
>>> versions of qcow2 do not have this feature.
>>
>> Well, it _is_ possible, but it would involve rewriting the entire
>> L1/L2 tables (including all internal snapshots)
> 
> Right :-) Let's try this way:
> 
>      This function is only used by qcow2_expand_zero_clusters() to
>      downgrade a qcow2 image to a previous version. This would require
>      transforming all extended L2 entries into normal L2 entries but
>      this is not a simple task and there are no plans to implement this
>      at the moment.

Works for me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


