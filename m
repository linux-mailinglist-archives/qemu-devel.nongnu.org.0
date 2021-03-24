Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28567347279
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 08:24:07 +0100 (CET)
Received: from localhost ([::1]:59190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOxs6-0008Ly-74
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 03:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOxl2-0004iD-Kh
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOxkz-0003rL-WC
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 03:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616570203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=myqG1EghK1wMppr4xmCBq/3EWwnGVHQqWUK0YwjHz4Q=;
 b=IYkD0Grj/06XHCkpnOat9DtD6h4LdR5dxncR3QWcC1BNDS1+Ur+AGJRUPg89rt+q3fJVH7
 LMwssuvqJ9GdTSsDL8XC1vmWYf57AelHRDQXbMO/tzmlDeVI+wPyzhLLND0ltLKWJpnnQe
 9TIosl6WZM5yJvCMNl7GhiMTe8GGHGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-Tfv9VWdxMW-OSP6E35CHFg-1; Wed, 24 Mar 2021 03:16:41 -0400
X-MC-Unique: Tfv9VWdxMW-OSP6E35CHFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 869785B365;
 Wed, 24 Mar 2021 07:16:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB4B219705;
 Wed, 24 Mar 2021 07:16:35 +0000 (UTC)
Subject: Re: [PATCH 05/20] qobject: Change qobject_to_json()'s value to GString
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20201211171152.146877-1-armbru@redhat.com>
 <20201211171152.146877-6-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <fd5690fb-cc11-3477-7ab8-78d10a3277d0@redhat.com>
Date: Wed, 24 Mar 2021 08:16:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20201211171152.146877-6-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, mdroth@linux.vnet.ibm.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/2020 18.11, Markus Armbruster wrote:
> qobject_to_json() and qobject_to_json_pretty() build a GString, then
> covert it to QString.  Just one of the callers actually needs a
> QString: qemu_rbd_parse_filename().  A few others need a string they
> can modify: qmp_send_response(), qga's send_response(), to_json_str(),
> and qmp_fd_vsend_fds().  The remainder just need a string.
> 
> Change qobject_to_json() and qobject_to_json_pretty() to return the
> GString.
> 
> qemu_rbd_parse_filename() now has to convert to QString.  All others
> save a QString temporary.  to_json_str() actually becomes a bit
> simpler, because GString provides more convenient modification
> functions.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

  Hi Markus!

This patch broke the output of default values in the device help. With 
commit eab3a4678b07267c39e72:

$ ./qemu-system-x86_64 -device pvpanic,help
pvpanic options:
   events=<uint8>         -  (default: (null))
   ioport=<uint16>        -  (default: (null))
   pvpanic[0]=<child<qemu:memory-region>>

With the commit right before that one:

$ ./qemu-system-x86_64 -device pvpanic,help
pvpanic options:
   events=<uint8>         -  (default: 3)
   ioport=<uint16>        -  (default: 1285)
   pvpanic[0]=<child<qemu:memory-region>>

Any ideas how to fix that?

  Thomas


