Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F254F2B98F1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:08:39 +0100 (CET)
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnQE-000276-Gb
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:08:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfnKb-0004sQ-I9
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:02:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfnKW-0006NQ-Ke
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605805362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UGJIntZtR489w+5p6uV8lb0Lshk9BEyQ3nS6e5ScdTk=;
 b=TofcMwk4n6UZURWiBZyUTVv6yOUlSuhM/rqBfyrR1j/UZ1GQpNDtVtxYhgMIny04u4b1Pm
 Je/t5wzZ/H61F5O92CDjJZz/2XbIYzB4KpENRUuXrfN0uoxta9OS0kSBNQ2sKsWTKIvpn9
 Iv00IO2ZoPvVAkt/CsZDCf2yXA5wQbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-X6u8QqGoPXCNvG7A3KZAcw-1; Thu, 19 Nov 2020 12:02:39 -0500
X-MC-Unique: X6u8QqGoPXCNvG7A3KZAcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAF8718B62A6;
 Thu, 19 Nov 2020 17:02:37 +0000 (UTC)
Received: from [10.3.112.188] (ovpn-112-188.phx2.redhat.com [10.3.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B4C219C47;
 Thu, 19 Nov 2020 17:02:37 +0000 (UTC)
Subject: Re: [PATCH 3/4] block: add dbg_dump_block_layer()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201119131634.14009-1-vsementsov@virtuozzo.com>
 <20201119131634.14009-4-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bd3c2fb4-a163-d79e-48be-4559342fab82@redhat.com>
Date: Thu, 19 Nov 2020 11:02:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119131634.14009-4-vsementsov@virtuozzo.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, mreitz@redhat.com, andrey.shinkevich@virtuozzo.com,
 crosa@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 7:16 AM, Vladimir Sementsov-Ogievskiy wrote:
> Add function for debugging: we already have x-debug-query-block-graph
> qmp command and scripts/render_block_graph.py which can dump
> block-layer graph for running vm using qmp command. But when debug
> block layer code, its often needed to dump some intermediate state
> during some operation, so separate qmp command doesn't help.
> 
> So, let's introduce a function which can dump needed information into
> json file.
> 
> In next commit we'll update scripts/render_block_graph.py so that it
> will be able to parse json files.
> 
> For new function to not crash if we have mirror_top filter node not yet
> bdrv_append()ed (to debug why it can't be appended), make
> bdrv_get_allocated_file_size() and bdrv_refresh_filename() not crash on
> filters without a child.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---

> +++ b/qapi/block-core.json
> @@ -1908,6 +1908,19 @@
>  ##
>  { 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph' }
>  
> +##
> +# @XDbgBlockLayerDump:
> +#
> +# Unite query-named-block-nodes, query-block-jobs and
> +# x-debug-query-block-graph results into one structure for block_layer_dump()
> +# function.
> +#
> +# Since: 5.3

The next release will be numbered 6.0, not 5.3.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


