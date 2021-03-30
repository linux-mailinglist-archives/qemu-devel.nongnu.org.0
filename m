Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A32034E60B
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 13:05:44 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRCBr-0008B1-Dx
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 07:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRC9x-0007fT-Q1
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRC9r-000657-L9
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 07:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617102218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kqkhjP8OaRvR4uJmhnYb/flcVU4aFRG0/kxneUJMOQ=;
 b=Zzm1AdBczmuQajg2GMNstVQWSo+8r0wATsPthB+PXUmCS7flY7SurNr/ubvdvdJT6dzWSB
 dMrVBxDf7XGA9VHgpb+WasJc3ZwLziMqVO28NqEm5Czn/1uH4F3fEsDxez7+5W+N1FO9Oe
 FiUaMre0kDi/r8U/roUox/GC8BxAOUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-sAij9khxNs6Oa-1Q5Z_sAg-1; Tue, 30 Mar 2021 07:03:34 -0400
X-MC-Unique: sAij9khxNs6Oa-1Q5Z_sAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34AC98026B1;
 Tue, 30 Mar 2021 11:03:33 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-220.ams2.redhat.com
 [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0FA396554;
 Tue, 30 Mar 2021 11:03:31 +0000 (UTC)
Subject: Re: [PATCH v2 0/2] qcow2: Force preallocation with data-file-raw
To: qemu-block@nongnu.org
References: <20210326145509.163455-1-mreitz@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <89d37c55-52ed-4087-de30-27ed34989c57@redhat.com>
Date: Tue, 30 Mar 2021 13:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326145509.163455-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.03.21 15:55, Max Reitz wrote:
> v1: https://lists.nongnu.org/archive/html/qemu-block/2020-06/msg00992.html
> 
> 
> Hi,
> 
> I think that qcow2 images with data-file-raw should always have
> preallocated 1:1 L1/L2 tables, so that the image always looks the same
> whether you respect or ignore the qcow2 metadata.  The easiest way to
> achieve that is to enforce at least metadata preallocation whenever
> data-file-raw is given.

Thanks for the review, applied to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Max


