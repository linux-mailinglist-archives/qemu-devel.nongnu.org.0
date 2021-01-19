Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AD52FC111
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 21:33:10 +0100 (CET)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1xgb-0003wG-Aq
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 15:33:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1xVa-0000ya-RT
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:21:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l1xVY-0007fa-Qv
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611087702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgFXLlqE1tI4bbgbBFbSGWCKwUBRpbHYn2ZXZabu5/0=;
 b=dGAejuEHv66QaKYF1oNbvcfgM42Ab/3oXmBoqp4HbugEl1HYRnmJvm0glulxYOYJkfbGOp
 juUj9HGmthhWZdyFCKRBuUR7S34RAB5AG6B6+ziZdzBL9RgjcXxIxXq2SufkeTUvkwdmBa
 DT9yYDsDN5QiR2OVyAovifpBmJtCta8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-QNCbKlvJOxCyOYYtvAw7OA-1; Tue, 19 Jan 2021 15:21:38 -0500
X-MC-Unique: QNCbKlvJOxCyOYYtvAw7OA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEDCB107ACE3;
 Tue, 19 Jan 2021 20:21:36 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C85201D7;
 Tue, 19 Jan 2021 20:21:35 +0000 (UTC)
Subject: Re: [PATCH v3 02/25] qapi: backup: add perf.use-copy-range parameter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201026171815.13233-1-vsementsov@virtuozzo.com>
 <20201026171815.13233-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <84902f8a-2c1f-7e71-f59e-c3f485b7295a@redhat.com>
Date: Tue, 19 Jan 2021 14:21:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201026171815.13233-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org, jsnow@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/20 12:17 PM, Vladimir Sementsov-Ogievskiy wrote:
> Experiments show, that copy_range is not always making things faster.
> So, to make experimentation simpler, let's add a parameter. Some more
> perf parameters will be added soon, so here is a new struct.
> 
> For now, add new backup qmp parameter with x- prefix for the following
> reasons:
> 
>  - We are going to add more performance parameters, some will be
>    related to the whole block-copy process, some only to background
>    copying in backup (ignored for copy-before-write operations).
>  - On the other hand, we are going to use block-copy interface in other
>    block jobs, which will need performance options as well.. And it
>    should be the same structure or at least somehow related.
> 
> So, there are too much unclean things about how the interface and now
> we need the new options mostly for testing. Let's keep them
> experimental for a while.
> 
> In do_backup_common() new x-perf parameter handled in a way to
> make further options addition simpler.
> 
> We add use-copy-range with default=true, and we'll change the default
> in further patch, after moving backup to use block-copy.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/qapi/block-core.json
> @@ -1370,6 +1370,19 @@
>  { 'struct': 'BlockdevSnapshot',
>    'data': { 'node': 'str', 'overlay': 'str' } }
>  
> +##
> +# @BackupPerf:
> +#
> +# Optional parameters for backup. These parameters don't affect
> +# functionality, but may significantly affect performance.
> +#
> +# @use-copy-range: Use copy offloading. Default true.
> +#
> +# Since: 5.2

We've missed 5.2; this will need to be updated to 6.0

> +##
> +{ 'struct': 'BackupPerf',
> +  'data': { '*use-copy-range': 'bool' }}
> +
>  ##
>  # @BackupCommon:
>  #
> @@ -1425,6 +1438,8 @@
>  #                    above node specified by @drive. If this option is not given,
>  #                    a node name is autogenerated. (Since: 4.2)
>  #
> +# @x-perf: Performance options. (Since 5.2)

and here

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


