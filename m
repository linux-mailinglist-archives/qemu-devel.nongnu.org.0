Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6381EA805
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 18:56:01 +0200 (CEST)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfnjE-0003RG-5H
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 12:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jfni8-0002QT-M1
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 12:54:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38024
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jfni8-0002q2-0D
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 12:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591030491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qybf7gWpXrl/2he2NAZm8CNJByGPr4Py5v1EMy+EOgU=;
 b=VCVQ6H2bXhexHByUsQT8WRfNonrSbSNoh23gP5+GP0aVkpk91hjVpyt5MWu62WD4u18Fnm
 QFNUzocI3XY9L2q7Q4dGEoDZ1ZysNTfnrEdRT+WGRnq9Kam6BFR99J19R52UgR9F1jt3En
 SiIVdpyglV5YLi3+PnAWd5jfgFvLP5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-ARqnnT5GO_-RspCLJHqnVQ-1; Mon, 01 Jun 2020 12:54:49 -0400
X-MC-Unique: ARqnnT5GO_-RspCLJHqnVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FFA7461;
 Mon,  1 Jun 2020 16:54:48 +0000 (UTC)
Received: from work-vm (ovpn-113-144.ams2.redhat.com [10.36.113.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30B6D7A1EF;
 Mon,  1 Jun 2020 16:54:47 +0000 (UTC)
Date: Mon, 1 Jun 2020 17:54:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH v2 6/6] migration/migration.c: Fix hang in
 ram_save_host_page
Message-ID: <20200601165444.GJ2743@work-vm>
References: <cover.1590007004.git.lukasstraub2@web.de>
 <e79085bbe2d46dfa007dd41820194d5e2d4fcd80.1590007004.git.lukasstraub2@web.de>
MIME-Version: 1.0
In-Reply-To: <e79085bbe2d46dfa007dd41820194d5e2d4fcd80.1590007004.git.lukasstraub2@web.de>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 05:35:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_HK_NAME_DR=0.01 autolearn=_AUTOLEARN
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Lukas Straub (lukasstraub2@web.de) wrote:
> migration_rate_limit will erroneously ratelimit a shutdown socket,
> which causes the migration thread to hang in ram_save_host_page
> if the socket is shutdown.
> 
> Fix this by explicitly testing if the socket has errors or was
> shutdown in migration_rate_limit.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

and queued this one (the others in the series are the same as the v1)


> ---
>  migration/migration.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 187ac0410c..e8bd32d48c 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3347,6 +3347,10 @@ bool migration_rate_limit(void)
>      bool urgent = false;
>      migration_update_counters(s, now);
>      if (qemu_file_rate_limit(s->to_dst_file)) {
> +
> +        if (qemu_file_get_error(s->to_dst_file)) {
> +            return false;
> +        }
>          /*
>           * Wait for a delay to do rate limiting OR
>           * something urgent to post the semaphore.
> --
> 2.20.1


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


