Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178EA30C28B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:54:20 +0100 (CET)
Received: from localhost ([::1]:45730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x4N-0006dR-1m
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wkx-0000e8-HO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:34:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l6wkt-000685-3w
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:34:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fh1X9vk9lgcrDvJ7jCoQ0jx0TgZJU0twcaMSGX6Ml5I=;
 b=MsDuQH8UYgQHtMSHxoaqEpr9vUG/wpNZlRdUjYmQ4dYNHUZUohUeeh1UfOVldYbRaZP0dE
 h/RhGrh+vKf0Z4iKnWB3cU6nq9KIGR25kFLwBL3rVgvgLKkTfNfUg8jUjRzw1Dw25B/uqq
 sPw9vxEYggTc74P3p/Ma0RETNNAbngA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-GsXTQXj7OHSxwBDFR19BAQ-1; Tue, 02 Feb 2021 09:34:08 -0500
X-MC-Unique: GsXTQXj7OHSxwBDFR19BAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0CA0184DBE7
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 14:34:07 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CB5D60C5F;
 Tue,  2 Feb 2021 14:34:07 +0000 (UTC)
Subject: Re: [PATCH 1/2] migration: Add blocker information
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, peterx@redhat.com, alex.williamson@redhat.com,
 laine@redhat.com
References: <20210202135522.127380-1-dgilbert@redhat.com>
 <20210202135522.127380-2-dgilbert@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b536c8f1-adca-cdec-3298-26d3c506e96a@redhat.com>
Date: Tue, 2 Feb 2021 08:34:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210202135522.127380-2-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 7:55 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Modify query-migrate so that it has a flag indicating if outbound
> migration is blocked, and if it is a list of reasons.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  migration/migration.c | 25 +++++++++++++++++++++++--
>  migration/savevm.c    | 13 +++++++++++++
>  migration/savevm.h    |  1 +
>  qapi/migration.json   |  6 ++++++
>  4 files changed, 43 insertions(+), 2 deletions(-)
> 

> +++ b/qapi/migration.json
> @@ -224,6 +224,10 @@
>  #        only returned if VFIO device is present, migration is supported by all
>  #        VFIO devices and status is 'active' or 'completed' (since 5.2)
>  #
> +# @blocked: True if outgoing migration is blocked (since 6.0)
> +#
> +# @blocked-reasons: A list of reasons an outgoing migration is blocked (since 6.0)

A bit of redundancy here; the presence of blocked-reasons is sufficient
to tell if migration is blocked, without needing a bool.  But having the
bool is more type-friendly for machines, so I don't mind having both.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


