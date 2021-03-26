Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673934AB4E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 16:18:53 +0100 (CET)
Received: from localhost ([::1]:35748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPoEe-0002sJ-3g
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 11:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lPoDY-0002EU-Iu
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:17:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lPoDX-0007Rf-0a
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 11:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616771861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NwxxaWw3HP9jYnutJktHjBXk/gexBEkh1O6qDRYd3XM=;
 b=UYNm81SBKzvvIxmOroWhJymMe3kT2LsBb7hrPAFnoqw1o8Ov2foueMiPGyjLzUx8e2J5id
 fgUvsGRWJtLmm/T8U1wZv48MdhoKB7cMck8KBkVuwy4nueciQ+5VOD/QddOzTSC+p0Ujy2
 nZoxzvnUsRkjlo/Rd7YreGvoSK/3FLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-PHhpnNPpO22kNISPlCy21A-1; Fri, 26 Mar 2021 11:17:39 -0400
X-MC-Unique: PHhpnNPpO22kNISPlCy21A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB3084E20A;
 Fri, 26 Mar 2021 15:17:38 +0000 (UTC)
Received: from [10.3.114.231] (ovpn-114-231.phx2.redhat.com [10.3.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 485AB5D9E3;
 Fri, 26 Mar 2021 15:17:38 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] iotests/244: Test preallocation for data-file-raw
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210326145509.163455-1-mreitz@redhat.com>
 <20210326145509.163455-3-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1c5b2174-8ce4-e20c-8e0c-f03ac6e1d5ce@redhat.com>
Date: Fri, 26 Mar 2021 10:17:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210326145509.163455-3-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 9:55 AM, Max Reitz wrote:
> Three test cases:
> (1) Adding a qcow2 (metadata) file to an existing data file, see whether
>     we can read the existing data through the qcow2 image.
> (2) Append data to the data file, grow the qcow2 image accordingly, see
>     whether we can read the new data through the qcow2 image.
> (3) At runtime, add a backing image to a freshly created qcow2 image
>     with an external data file (with data-file-raw).  Reading data from
>     the qcow2 image must return the same result as reading data from the
>     data file, so everything in the backing image must be ignored.
>     (This did not use to be the case, because without the L2 tables
>     preallocated, all clusters would appear as unallocated, and so the
>     qcow2 driver would fall through to the backing file.)
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/244     | 104 +++++++++++++++++++++++++++++++++++++
>  tests/qemu-iotests/244.out |  59 +++++++++++++++++++++
>  2 files changed, 163 insertions(+)
> 

> +
> +# We cannot use qemu-img to create the qcow2 image, because it would
> +# clear the data file.  Use the blockdev-create job instead, which will
> +# only format the qcow2 image file.

Well, perhaps we could use qemu-img to create a qcow2 pointing to a
temporary file, then rewrite it to point to the real data file, but that
feels hackish, and your approach worked.  And besides, while we have
qemu-img rebase -u to rewrite the backing file, I don't know if we have
a similar qemu-img command for rewriting the data file.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


