Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C551B24A7A2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 22:18:30 +0200 (CEST)
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8UXV-0008Ip-Sq
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 16:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8UWl-0007oa-73
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 16:17:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8UWj-00079p-E4
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 16:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597868260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WueU0GsHHwibGTnMdmyforivxCz76qVZIdh2NP+XPk=;
 b=VyY7gngOdDLJe0/1fhBzeNY2wq17p/90I/v20awpaV4yuXSp6iJox67+Mt2Np6sCSJR5O4
 XZs9n4DBTKQMwFV5RATWjoqzMepE9kLpmAMEZrZUeGcDR5W3SqsNxMlgc+ywhRPzOjhLuC
 Wk7riwGAfb/07D6pbgeGJPcLVB49M5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-KNzYDm0uMg6GY67DCEKxQQ-1; Wed, 19 Aug 2020 16:17:38 -0400
X-MC-Unique: KNzYDm0uMg6GY67DCEKxQQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16FDC8030A1;
 Wed, 19 Aug 2020 20:17:37 +0000 (UTC)
Received: from [10.3.112.136] (ovpn-112-136.phx2.redhat.com [10.3.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B963E2719C;
 Wed, 19 Aug 2020 20:17:36 +0000 (UTC)
Subject: Re: [RFC PATCH 10/22] nbd: Remove NBDExport.close callback
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200813162935.210070-1-kwolf@redhat.com>
 <20200813162935.210070-11-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2a083517-e155-e557-4f5e-a398f9f28604@redhat.com>
Date: Wed, 19 Aug 2020 15:17:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813162935.210070-11-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 16:17:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/20 11:29 AM, Kevin Wolf wrote:
> The export close callback is unused by the built-in NBD server. qemu-nbd
> uses it only during shutdown to wait for the unrefed export to actually
> go away. It can just use nbd_export_close_all() instead and do without
> the callback.
> 
> This removes the close callback from nbd_export_new() and makes both
> callers of it more similar.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


