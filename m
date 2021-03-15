Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2633C07C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:49:49 +0100 (CET)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpTY-0003Uc-RW
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLpPp-0001BD-N3
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:45:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLpPn-0008TO-VA
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615823155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhjQXU0xMVe9p01tEay5zsq6KgHokb3YnFbpZM7glaI=;
 b=VCJw2e6h6nPnzbDRPLNVIsmn3ozQQSQPTk7D7ZpQvoMCgg8JlrRCDOfegoech7e824QHug
 Mkh4wcUkhwHQPvSO6R5TIuAhgNfZ2a4btzfxGIIJcXkxxtxIjS6cU27v6zckeeXBcVEDDO
 +9fB9+tZxBTHwBMWx0UOe1oBW15rJ30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-cKIPEHIdM2OYq932RVGeoA-1; Mon, 15 Mar 2021 11:45:52 -0400
X-MC-Unique: cKIPEHIdM2OYq932RVGeoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E05FE3E746;
 Mon, 15 Mar 2021 15:45:50 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6660E100164C;
 Mon, 15 Mar 2021 15:45:50 +0000 (UTC)
Subject: Re: [PATCH v6 02/10] qapi: Implement deprecated-output=hide for QMP
 command results
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210312153210.2810514-1-armbru@redhat.com>
 <20210312153210.2810514-3-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e4c303de-532f-7617-7f45-f1e0bc16c6d9@redhat.com>
Date: Mon, 15 Mar 2021 10:45:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312153210.2810514-3-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 9:32 AM, Markus Armbruster wrote:
> This policy suppresses deprecated bits in output, and thus permits
> "testing the future".  Implement it for QMP command results.  Example:
> when QEMU is run with -compat deprecated-output=hide, then
> 
>     {"execute": "query-cpus-fast"}
> 
> yields
> 
>     {"return": [{"thread-id": 9805, "props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "qom-path": "/machine/unattached/device[0]", "cpu-index": 0, "target": "x86_64"}]}
> 
> instead of
> 
>     {"return": [{"arch": "x86", "thread-id": 22436, "props": {"core-id": 0, "thread-id": 0, "socket-id": 0}, "qom-path": "/machine/unattached/device[0]", "cpu-index": 0, "target": "x86_64"}]}

Example may not be relevant much longer, given Dan's patch [1] to make
this permanent since we've already passed the deprecation wait.  Up to
you if you want to choose a different example.

https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg07564.html

> 
> Note the suppression of deprecated member "arch".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---

R-b still stands.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


