Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1C2F1A4E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 16:59:12 +0100 (CET)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyzb4-0008Pe-VL
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 10:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kyzYs-00075C-Nw
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:56:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kyzYq-0000mD-25
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 10:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610380609;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2b5wL4uF2qG8oPQTcK1QI5tLNrmLUBDBQyk7vgVzbRk=;
 b=Z4M4O4jLvA0xtQJxsoLWK6QYgbt7hRHNJ4OU5GODUk8ductATePlTHUTN28jlEToWincga
 UJpU9sm8JgV1Mnenq5Ez4ZCKGCazNR+TVVZYoR9547Nke7h76Qsp1AXvkUD9S1ftfafCFi
 EmEx663UcF5QRFEOEMWCE0xEhQ9tCcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-S_kKVY9-N0mzRpjUS2ZVfg-1; Mon, 11 Jan 2021 10:56:46 -0500
X-MC-Unique: S_kKVY9-N0mzRpjUS2ZVfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02011B8106;
 Mon, 11 Jan 2021 15:56:45 +0000 (UTC)
Received: from redhat.com (ovpn-115-108.ams2.redhat.com [10.36.115.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BFC160854;
 Mon, 11 Jan 2021 15:56:40 +0000 (UTC)
Date: Mon, 11 Jan 2021 15:56:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zihao Chang <changzihao1@huawei.com>
Subject: Re: [PATCH] vnc: fix unfinalized tlscreds for VncDisplay
Message-ID: <20210111155637.GI1172772@redhat.com>
References: <20210111131911.805-1-changzihao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210111131911.805-1-changzihao1@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: oscar.zhangbo@huawei.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 11, 2021 at 09:19:11PM +0800, Zihao Chang wrote:
> In vnc_display_open(), if tls-creds is enabled, do object_ref(object
> ref 1->2) for tls-creds. While in vnc_display_close(), object_unparent
> sets object ref to 1(2->1) and  unparent the object for root.
> Problem:
> 1. the object can not be found from the objects_root, while the object
> is not finalized.
> 2. the qemu_opts of tls-creds(id: creds0) is not deleted, so new tls
> object with the same id(creds0) can not be delete & add.
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> ---
>  ui/vnc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


