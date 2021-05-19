Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530B8389492
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:21:02 +0200 (CEST)
Received: from localhost ([::1]:36498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPsT-00048q-D1
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljPpa-0001aG-Sq
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljPpZ-0007A6-Cj
 for qemu-devel@nongnu.org; Wed, 19 May 2021 13:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621444680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WdYFY3JLX3QmgX+13UV58xyKMll4drFqGBdmMQha3U=;
 b=QpaGOp1LZ+XGSJRLf/SYHovz90Jj5U/ZxFUt54BczPO/Gx6VyCrkCRqCnkVdLdi06QtGN+
 beZl69vws9a5Fb8Brgo7n4Te0t7IP4CRUAp4bIFw0ODHjZIBNAuk2/9Qb8Pl77y8snowE8
 w3pJcbO5c+8KTg9kRZSr5M0w6dhpYyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-fIBuLIEtOzyE8KMM71gmxQ-1; Wed, 19 May 2021 13:17:58 -0400
X-MC-Unique: fIBuLIEtOzyE8KMM71gmxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6D89800D55;
 Wed, 19 May 2021 17:17:57 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D51B5D6AC;
 Wed, 19 May 2021 17:17:57 +0000 (UTC)
Subject: Re: [PATCH v2 01/21] qapi/parser: Don't try to handle file errors
To: Markus Armbruster <armbru@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-2-jsnow@redhat.com>
 <87wnrw5r2q.fsf@dusky.pond.sub.org>
 <55aacc2d-75c7-c925-4b65-a1e3f0046d3b@redhat.com>
 <87zgwryzof.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <c7424ac7-7d99-f4e0-1698-d975a7bbef82@redhat.com>
Date: Wed, 19 May 2021 13:17:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87zgwryzof.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 3:01 AM, Markus Armbruster wrote:
> In commit f5d4361cda "qapi/source.py: add type hint annotations", I
> believe.
> 
> Hmm, this commit actually fixes incorrect typing, doesn't it?
> 

Yes.

It just wasn't caught because this file wasn't being checked yet. I 
tried to avoid this for a long time by making sure I tested my full 
conversion stack after every rebase, but it got too cumbersome.


