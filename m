Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E0C1F3E90
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 16:47:47 +0200 (CEST)
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jifXW-0006bg-8f
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 10:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jifWI-0006BU-Et
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 10:46:30 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26000
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jifWH-0005MS-Jr
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 10:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591713989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ddVBo13rJbPYLZScmOuRArd6DNdVPEKHdtA9qP5PgUU=;
 b=S8PkK5QZRSw9pALQ4hb8Yc8CUqSClGGZi6VYJIEkn+8pIn7OLpxrlwAV95AMOIyLc6Yi4m
 n3m3ShHcg1w20zH9ZtHMVMYOlZYLfJTYPDon28vAp5rstBerrqYDR16Wi8oBhvozAttHVO
 3zZPtv7afX2lRmDlJy1NQMOf+Ny3DjM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-yX5iXfFvMVulsVjD0bQ8yw-1; Tue, 09 Jun 2020 10:46:27 -0400
X-MC-Unique: yX5iXfFvMVulsVjD0bQ8yw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE53410CE781;
 Tue,  9 Jun 2020 14:46:25 +0000 (UTC)
Received: from [10.3.113.22] (ovpn-113-22.phx2.redhat.com [10.3.113.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 190738FF60;
 Tue,  9 Jun 2020 14:46:25 +0000 (UTC)
Subject: Re: [PATCH] qcow2: Reduce write_zeroes size in handle_alloc_space()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200609140859.142230-1-kwolf@redhat.com>
 <02e24dca-99da-873d-8425-09a07571e675@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <042f0b8f-dd51-acc3-8498-ac9a5532df15@redhat.com>
Date: Tue, 9 Jun 2020 09:46:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <02e24dca-99da-873d-8425-09a07571e675@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 23:42:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Denis V. Lunev" <den@openvz.org>, anton.nefedov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/20 9:28 AM, Vladimir Sementsov-Ogievskiy wrote:
> 09.06.2020 17:08, Kevin Wolf wrote:
>> Since commit c8bb23cbdbe, handle_alloc_space() is called for newly
>> allocated clusters to efficiently initialise the COW areas with zeros if
>> necessary. It skips the whole operation if both start_cow nor end_cow
>> are empty. However, it requests zeroing the whole request size (possibly
>> multiple megabytes) even if only one end of the request actually needs
>> this.
>>
>> This patch reduces the write_zeroes request size in this case so that we
>> don't unnecessarily zero-initialise a region that we're going to
>> overwrite immediately.
>>

> 
> Hmm, I'm afraid, that this may make things worse in some cases, as with 
> one big write-zero request
> we preallocate data-region in the protocol file, so we have better 
> locality for the clusters we
> are going to write. And, in the same time, with BDRV_REQ_NO_FALLBACK 
> flag write-zero must be
> fast anyway (especially in comparison with the following write request).
> 
>>           /*
>>            * instead of writing zero COW buffers,
>>            * efficiently zero out the whole clusters
>>            */
>> -        ret = qcow2_pre_write_overlap_check(bs, 0, m->alloc_offset,
>> -                                            m->nb_clusters * 
>> s->cluster_size,
>> -                                            true);
>> +        ret = qcow2_pre_write_overlap_check(bs, 0, start, len, true);
>>           if (ret < 0) {
>>               return ret;
>>           }
>>           BLKDBG_EVENT(bs->file, BLKDBG_CLUSTER_ALLOC_SPACE);
>> -        ret = bdrv_co_pwrite_zeroes(s->data_file, m->alloc_offset,
>> -                                    m->nb_clusters * s->cluster_size,
>> +        ret = bdrv_co_pwrite_zeroes(s->data_file, start, len,
>>                                       BDRV_REQ_NO_FALLBACK);

Good point.  If we weren't using BDRV_REQ_NO_FALLBACK, then avoiding a 
pre-zero pass over the middle is essential.  But since we are insisting 
that the pre-zero pass be fast or else immediately fail, the time spent 
in pre-zeroing should not be a concern.  Do you have benchmark numbers 
stating otherwise?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


