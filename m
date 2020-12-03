Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801DD2CDB3A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 17:30:35 +0100 (CET)
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkrV4-0001by-4L
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 11:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkrR1-0007Rs-FV
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:26:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kkrQy-0007ej-W3
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 11:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607012779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lu43ZgU7pdzf+QYQ8+sWf+JFksxBv8ppBok2o3Z1FSI=;
 b=acJNZOKAl127jSRwyQ1LfNdBK4mZJmer/eUaBlj733nJ2pFTbFcEJw1vBrqpWvkz6nep29
 PprtWY66WzapDZ0En5FwCi5179UNg99+1ZCKfo75oml2EU6kCvTz6SDY765hNiCr7JqBYY
 7jTT5m78K10RQ6lTndzSy8rUwkgc1dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-w0fNDd9jMo-pGP7uO2FDZw-1; Thu, 03 Dec 2020 11:26:14 -0500
X-MC-Unique: w0fNDd9jMo-pGP7uO2FDZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31F4E800D53;
 Thu,  3 Dec 2020 16:26:13 +0000 (UTC)
Received: from [10.3.112.195] (ovpn-112-195.phx2.redhat.com [10.3.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF6385D6AC;
 Thu,  3 Dec 2020 16:26:11 +0000 (UTC)
Subject: Re: [PATCH] qemu-nbd: Fix a memleak in nbd_client_thread()
To: Alex Chen <alex.chen@huawei.com>
References: <20201201061349.110262-1-alex.chen@huawei.com>
 <e2180a73-b2e8-4613-00dd-2850e07c2c46@redhat.com> <5FC6F5AB.30300@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <761b7ce9-1ddf-4a92-17fc-a8148cff1bd2@redhat.com>
Date: Thu, 3 Dec 2020 10:26:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5FC6F5AB.30300@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 8:02 PM, Alex Chen wrote:
> On 2020/12/2 4:15, Eric Blake wrote:

>> While the patch looks correct, we have a lot of duplication.  Simpler
>> might be a solution with only one exit label altogether:
>>
> 
> Thanks for your review, I will modify the patch and send patch v2 according to your suggestion.
> BTW, do I need to split this patch into two patches, one to solve the memleak and the other to optimizes the redundant code?

This one seems small enough that a single patch is probably fine (that
is, document that the patch is fixing a memory loop BY consolidating
redundant code).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


