Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3A6383B07
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:16:43 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligrC-0008Q6-KC
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ligJI-0003eQ-6W
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ligJF-00021Y-Ge
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0nC9AzfchNv/k4xJQJaYdVYAELBBU2d1WQ/F2mfQIpo=;
 b=B8d59tqusHE0e2moYyEekoYmW48yaqEhE7P5TFnRhYDa+8fHGayD/QtUJs5E1P8a/yQRiF
 DdHJQyK213NhluQXG8GfOjAhwto4pedEzWooRwbGYQtCUPvgcI/J7f0M2Ab9QGVh4IkezT
 WzIhrnygv6CU8Q6PhDqItg1msyNFr9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-0Mbz3l-6OXSzWX8m122l7A-1; Mon, 17 May 2021 12:41:33 -0400
X-MC-Unique: 0Mbz3l-6OXSzWX8m122l7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BD30803620
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:41:33 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BA50614F0;
 Mon, 17 May 2021 16:41:28 +0000 (UTC)
Subject: Re: [PATCH v3 6/9] qapi: normalize 'if' condition to IfPredicate tree
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-7-marcandre.lureau@redhat.com>
 <ba1046ca-3d92-40c2-e1e5-58ba0ac9baaf@redhat.com>
 <CAMxuvax5Csa01V_WZE3QLCrhuWYh79KgZsfLTNcidXEPTe79Gg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <a55d96b3-c703-7f69-6e33-d6677d075369@redhat.com>
Date: Mon, 17 May 2021 12:41:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMxuvax5Csa01V_WZE3QLCrhuWYh79KgZsfLTNcidXEPTe79Gg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:18 AM, Marc-André Lureau wrote:
> 
> 
>     'if': 'COND'
>     'if': ['COND']
>     'if': { 'any': ['COND'] }
> 
> 
> Actually, a simple list is short form for { 'all': [] }

Typo on my part. It maintains compatibility with what it used to mean, 
so it's good.

I wonder if we want *three* forms available directly in the schema. Can 
we condense it back down to two somehow? Could we possibly remove the 
list-less form?

(The less forms we have, the easier it is to offer e.g. intellisense 
plugins for vscode and things of that nature, which is something I have 
an interest in to improve the usability of the generator for 
contributors who are less invested in the QAPI subsystem.)

--js


