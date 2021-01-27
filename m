Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FB83063FF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:29:24 +0100 (CET)
Received: from localhost ([::1]:60032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qVH-0000VT-Ub
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4qRb-0005oM-8e
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:25:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l4qRZ-00048a-NF
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611775532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxKpAQ9QJWhmpM3N1aw5QSS/29YaDzEpIscg5FqYMaQ=;
 b=gGb4p8j+tNcBuMX2YImxgO3+XqqvU8AE52Fj/47J//oGTexT5QLrHyFxXo3/QCfC+TEFJl
 E5WC221satm/tKcYr8ORD1Ibm7oQsopJ3rsd+UtAMKwAM7iJRGkdHpz+j/cTlYdOUVcR2z
 4TWdrUrh1NnuoaMB1vBwLs4aqMCDAec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-j2PkQd84PvynoNOSa4HDaQ-1; Wed, 27 Jan 2021 14:25:30 -0500
X-MC-Unique: j2PkQd84PvynoNOSa4HDaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 121B6107ACE6;
 Wed, 27 Jan 2021 19:25:29 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B5605B693;
 Wed, 27 Jan 2021 19:25:28 +0000 (UTC)
Subject: Re: [PATCH v5 02/10] iotests/297: Rewrite in Python and extend reach
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210118105720.14824-1-mreitz@redhat.com>
 <20210118105720.14824-3-mreitz@redhat.com>
 <9fc8e6b5-bac8-6fa5-6e10-7440c7e70b37@redhat.com>
 <4d48e168-24b3-e025-f293-563c485a6419@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <f5c0437e-aa03-1040-fa5a-cbff07bf2c26@redhat.com>
Date: Wed, 27 Jan 2021 14:25:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4d48e168-24b3-e025-f293-563c485a6419@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 5:42 AM, Max Reitz wrote:
> 
> Sounds reasonable to me (can’t find pylint-3 on Arch, for example).  As 
> a follow-up, that is, because I’m afraid I’ve already put this series in 
> a pull request...
> 
> Max

Ah, yeah. I checked master but didn't hunt through the maintainer 
branches. It's not a big deal, since it's an existing problem anyway.

Thanks for working on this!

--js


