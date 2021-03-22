Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5359E343E60
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:51:08 +0100 (CET)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOI9K-0000rw-HJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lOI6f-0007cr-Ui
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lOI6c-0000eo-FB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616410097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1l11j/k0dw3Bf3gyhKwry4UpbpuXzmtme86iLLJbeZk=;
 b=M+Rrx7slQGObWEAUb49lQ98TL4Utajjjw6jPhPldRsoYA8I4aNaxAHyTrznwX5LpW1BhHT
 FSkzNTBgAsr44GSKLLbFLZkpXG+LQ+KGmHQhMvcSwo1nugGqKYf59jhiTOD212l6fGxByL
 XyEPc9qOPr9KH73F7qOvu9BflFiZX2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-_YOpL_6SOZSO1A52oMb7Ug-1; Mon, 22 Mar 2021 06:48:13 -0400
X-MC-Unique: _YOpL_6SOZSO1A52oMb7Ug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B9D181620;
 Mon, 22 Mar 2021 10:48:12 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-196.ams2.redhat.com
 [10.36.114.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E40460BE5;
 Mon, 22 Mar 2021 10:48:10 +0000 (UTC)
Subject: Re: Fwd: [PATCH 0/2] block/raw: implemented persistent dirty bitmap
 and ability to dump bitmap content via qapi
To: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <856ca6ba-3871-068f-f821-269c40a5a4d5@patrikjanousek.cz>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <6e142c5b-053c-dc58-277c-59a8ce67f8a7@redhat.com>
Date: Mon, 22 Mar 2021 11:48:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <856ca6ba-3871-068f-f821-269c40a5a4d5@patrikjanousek.cz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 20.03.21 11:01, Patrik Janoušek wrote:
> I'm sorry, but I forgot to add you to the cc, so I'm forwarding the 
> patch to you additionally. I don't want to spam the mailing list 
> unnecessarily.

I think it’s better to still CC the list.  It’s so full of mail, one 
more won’t hurt. :)

(Re-adding qemu-block and qemu-devel, because the discussion belongs on 
the list(s).)

> -------- Forwarded Message --------
> Subject: 	[PATCH 0/2] block/raw: implemented persistent dirty bitmap and 
> ability to dump bitmap content via qapi
> Date: 	Sat, 20 Mar 2021 10:32:33 +0100
> From: 	Patrik Janoušek <pj@patrikjanousek.cz>
> To: 	qemu-devel@nongnu.org
> CC: 	Patrik Janoušek <pj@patrikjanousek.cz>, lmatejka@kiv.zcu.cz
> 
> 
> 
> Currently, QEMU doesn't support persistent dirty bitmaps for raw format
> and also dirty bitmaps are for internal use only, and cannot be accessed
> using third-party applications. These facts are very limiting
> in case someone would like to develop their own backup tool becaouse
> without access to the dirty bitmap it would be possible to implement
> only full backups. And without persistent dirty bitmaps, it wouldn't
> be possible to keep track of changed data after QEMU is restarted. And
> this is exactly what I do as a part of my bachelor thesis. I've
> developed a tool that is able to create incremental backups of drives
> in raw format that are LVM volumes (ability to create snapshot is
> required).

Similarly to what Vladimir has said already, the thing is that 
conceptually I can see no difference between having a raw image with the 
bitmaps stored in some other file, i.e.:

   { "driver": "raw",
     "dirty-bitmaps": [ {
       "filename": "sdc1.bitmap",
       "persistent": true
     } ],
     "file": {
       "driver": "file",
       "filename": "/dev/sdc1"
     } }

And having a qcow2 image with the raw data stored in some other file, i.e.:

   { "driver": "qcow2",
     "file": {
       "driver": "file",
       "filename": "sdc1.metadata"
     },
     "data-file": {
       "driver": "file",
       "filename": "/dev/sdc1"
     } }

(Where sdc1.metadata is a qcow2 file created with
“data-file=/dev/sdc1,data-file-raw=on”.)

To use persistent bitmaps with raw images, you need to add metadata 
(namely, the bitmaps).  Why not store that metadata in a qcow2 file?

Max


