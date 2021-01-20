Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DFD2FD8BB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 19:50:00 +0100 (CET)
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2IYJ-0001g1-Ov
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 13:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2IWl-00018K-3Q
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:48:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2IWj-000462-Ho
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 13:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611168500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2BljXJUZH7H0Y/XxxzhpINlpdTZEO8Vy6ZmTBIj7OU=;
 b=CLt3HZU2ldR0F1yTNXeyXThoVY8Z5uVefPTZmVID1UrLzfokg8x0C0oJp+/XgL7WjizK03
 mFNsYj6z4kB9SlE/NSLcvXAaV1M8hZxPLYlfwR0OZo0m5JrcbewkVaPM7Mkn77e2bRpWQP
 JhXGId3gp28kd1hjn2aCHfmw0KLhbBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-ljZ5Tw68MquQT03wII48Qw-1; Wed, 20 Jan 2021 13:48:19 -0500
X-MC-Unique: ljZ5Tw68MquQT03wII48Qw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BB65806663;
 Wed, 20 Jan 2021 18:48:18 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD20B5D9DD;
 Wed, 20 Jan 2021 18:48:16 +0000 (UTC)
Subject: Re: [PATCH v9 06/11] block: rename and alter bdrv_all_find_snapshot
 semantics
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210120104411.3084801-1-berrange@redhat.com>
 <20210120104411.3084801-7-berrange@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5125909a-f243-ab40-e755-ea18d13075cd@redhat.com>
Date: Wed, 20 Jan 2021 12:48:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120104411.3084801-7-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 4:44 AM, Daniel P. Berrangé wrote:
> Currently bdrv_all_find_snapshot() will return 0 if it finds
> a snapshot, -1 if an error occurs, or if it fails to find a
> snapshot. New callers to be added want to distinguish between
> the error scenario and failing to find a snapshot.
> 
> Rename it to bdrv_all_has_snapshot and make it return -1 on
> error, 0 if no snapshot is found and 1 if snapshot is found.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---

> +++ b/migration/savevm.c
> @@ -2942,10 +2942,15 @@ bool load_snapshot(const char *name, Error **errp)
>      if (!bdrv_all_can_snapshot(false, NULL, errp)) {
>          return false;
>      }
> -    ret = bdrv_all_find_snapshot(name, false, NULL, errp);
> +    ret = bdrv_all_has_snapshot(name, false, NULL, errp);
>      if (ret < 0) {
>          return false;
>      }
> +    if (ret == 0) {
> +        error_setg(errp, "Snapshot '%s' does not exist in one or more devices",
> +                   name);
> +        return -1;

s/-1/false/ (hoist that hunk from 11/11).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


