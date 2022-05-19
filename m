Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E08652D5B1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 16:13:34 +0200 (CEST)
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrguC-0003zb-Cx
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 10:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrgrG-0000jJ-0a
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nrgrB-0003Ml-Rl
 for qemu-devel@nongnu.org; Thu, 19 May 2022 10:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652969424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N8kGEbTrTEeHt4NwMjp2TuqdkAELMIVAn53F1kvMq94=;
 b=TStWXq77IsI0/SocLtsVH/ws2SBSyfHzJOhgOuiWj/W8qBYHSdeF2Ai4rVYAXiYFY62GUj
 jA6KJ02olvGqVMantS3ufhiR6YFVDdEo+OVSKY8aCQ1sKwbscW9HYSj9IUhMbU0mX/uXDw
 onBE3YeF9ZQda3U4gfIvqTCjGiKINUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-ODLQJ5aDPW-6zvVOsjDIJQ-1; Thu, 19 May 2022 10:10:21 -0400
X-MC-Unique: ODLQJ5aDPW-6zvVOsjDIJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8F591C08968;
 Thu, 19 May 2022 14:10:20 +0000 (UTC)
Received: from redhat.com (unknown [10.2.17.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 342BE400E115;
 Thu, 19 May 2022 14:10:18 +0000 (UTC)
Date: Thu, 19 May 2022 09:10:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Anthony Perard <anthony.perard@citrix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH] block: get rid of blk->guest_block_size
Message-ID: <20220519141017.3xkntu4x7yslgpge@redhat.com>
References: <20220518130945.2657905-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518130945.2657905-1-stefanha@redhat.com>
User-Agent: NeoMutt/20220429-71-6f7d3e
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 18, 2022 at 02:09:45PM +0100, Stefan Hajnoczi wrote:
> Commit 1b7fd729559c ("block: rename buffer_alignment to
> guest_block_size") noted:
> 
>   At this point, the field is set by the device emulation, but completely
>   ignored by the block layer.
> 
> The last time the value of buffer_alignment/guest_block_size was
> actually used was before commit 339064d50639 ("block: Don't use guest
> sector size for qemu_blockalign()").
> 
> This value has not been used since 2013. Get rid of it.
> 
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


