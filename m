Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C272E0D50
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 17:24:01 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krkS8-0003X6-Bk
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 11:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krkPG-00028L-O1
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1krkPD-0005Ca-3Y
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608654058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqOebpOXqNN2hMZ3YgSbgf3XuVLXS9FmIhZEWBGJs+s=;
 b=bPgpJfxxf1WQ2XqP3WqN9D9dYh8wq24bHw9cx3g9vzESO/ET+2DIPdpIPb8AMvQ5y1AcuS
 vJdOVL96frggZKeXSQJCaDPYTXyWYG7N2WtWv2htkl6TUCsI9M3BGFYSV2dXRlK9rUWPk0
 cqM2Bbi8mHP2DWnZsdmhaeel8qhVkyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-n-hg9_OGOIy8is5FBNmTiQ-1; Tue, 22 Dec 2020 11:20:56 -0500
X-MC-Unique: n-hg9_OGOIy8is5FBNmTiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71790107ACE6;
 Tue, 22 Dec 2020 16:20:55 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-243.ams2.redhat.com
 [10.36.113.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AFE96F98B;
 Tue, 22 Dec 2020 16:20:54 +0000 (UTC)
Subject: Re: [PATCH] iotests: fix _check_o_direct
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201218182012.47607-1-vsementsov@virtuozzo.com>
 <a5f2a6a0-3638-9bb9-8b54-15a8acc3dc78@redhat.com>
 <c5191bfb-3f9f-efc4-69d5-83a0b67d5338@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6ad571f0-3b88-8a0e-0e2a-4d1e82ccbb75@redhat.com>
Date: Tue, 22 Dec 2020 17:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c5191bfb-3f9f-efc4-69d5-83a0b67d5338@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.20 16:35, Vladimir Sementsov-Ogievskiy wrote:
> 22.12.2020 18:15, Max Reitz wrote:
>> On 18.12.20 19:20, Vladimir Sementsov-Ogievskiy wrote:
>>> Unfortunately commit "iotests: handle tmpfs" break running iotests
>>> with -nbd -nocache, as _check_o_direct tries to create
>>> $TEST_IMG.test_o_direct, but in case of nbd TEST_IMG is smothing like
> 
> s/smothing/something/ , sorry.

Already done O:)


