Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B300857124C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 08:35:14 +0200 (CEST)
Received: from localhost ([::1]:35678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB9UH-0005Gi-Lr
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 02:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oB9Bn-0001LX-43; Tue, 12 Jul 2022 02:16:08 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:45550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1oB9Bk-0001Zl-J5; Tue, 12 Jul 2022 02:16:06 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C0409223FD;
 Tue, 12 Jul 2022 06:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657606561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXvQDT4oecocSrg+yAemtNW2lWvx5PhTUM9LkLafQyM=;
 b=wvsiWtUsLwL7Y/Qb86wZpp9h/SCA508eMVh4+9EnFzC5wVxjNuDhKaavRB9/MtoCC6CJtQ
 sjJijhEBdi//gQFLkRRXX6Wfrrgpa11zAaxrqt6YpBL7cggKlwVt6ZluifK/d3B6P3+hNZ
 xuh8xxBD9QbCc79nL6t4BwnsiwFEJX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657606561;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXvQDT4oecocSrg+yAemtNW2lWvx5PhTUM9LkLafQyM=;
 b=9APzhXffvoaJU5eIGSy8lw467VmrWhg1jBsbgmb1QazIofulHne3KUU9cKv2lAIiKGUxKy
 HGG5qd73IKOUd6AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8975513A94;
 Tue, 12 Jul 2022 06:16:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TDwHIaERzWI8dQAAMHmgww
 (envelope-from <hare@suse.de>); Tue, 12 Jul 2022 06:16:01 +0000
Message-ID: <28c437fe-c44a-0fa5-5a23-a5ea94b86006@suse.de>
Date: Tue, 12 Jul 2022 08:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC v4 3/9] file-posix: introduce get_sysfs_long_val for a block
 queue of sysfs attribute
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-4-faithilikerun@gmail.com>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20220712021345.8530-4-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=hare@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/12/22 04:13, Sam Li wrote:
> Use sysfs attribute files to get the zoned device information in case
> that ioctl() commands of zone management interface won't work.
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>   block/file-posix.c | 38 +++++++++++++++++++++++++++-----------
>   1 file changed, 27 insertions(+), 11 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Ivo Totev, Andrew
Myers, Andrew McDonald, Martje Boudien Moerman

