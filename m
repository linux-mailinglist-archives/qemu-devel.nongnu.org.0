Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC383269EF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 23:24:00 +0100 (CET)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFlWg-0003rZ-Vy
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 17:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFlUu-0002U8-Bn
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 17:22:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFlUq-0004U5-4r
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 17:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614378122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMnC+yiCrz3mu8dqmrPsWWtVRYRks/7JSfqU4O7XcZM=;
 b=JeixgE3VGBMkXdEuiEUBFJjYixPOwkutAEhUTTF96tfHTQLc6DPJxeSR6XKRCXgOBzEjbX
 u7JM96zUIOMvi1oOKf3w8e86+mTMTLcdM4Ze+Xq3EtuDBlPk0570b6TJxHyDbj82fMxOBY
 aFs5rqX632EqyCkyypBQd50OtxEssPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-0dz-Hpf1MlGxl6SqW3rp1g-1; Fri, 26 Feb 2021 17:22:00 -0500
X-MC-Unique: 0dz-Hpf1MlGxl6SqW3rp1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B02028030B7;
 Fri, 26 Feb 2021 22:21:59 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD7175D6D1;
 Fri, 26 Feb 2021 22:21:53 +0000 (UTC)
Subject: Re: [PATCH v2 27/31] qom: Add user_creatable_add_from_str()
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-28-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5091e3df-6ab4-e789-70fb-3d3017121edb@redhat.com>
Date: Fri, 26 Feb 2021 16:21:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-28-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:52 AM, Kevin Wolf wrote:
> This is a version of user_creatable_process_cmdline() with an Error
> parameter that never calls exit() and is therefore usable in HMP.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  include/qom/object_interfaces.h | 16 ++++++++++++++++
>  qom/object_interfaces.c         | 29 ++++++++++++++++++++++++-----
>  2 files changed, 40 insertions(+), 5 deletions(-)
> 

> +/**
> + * user_creatable_add_from_str:
> + * @optarg: the object definition string as passed on the command line
> + * @errp: if an error occurs, a pointer to an area to store the error
> + *
> + * Create an instance of the user creatable object by parsing optarg
> + * with a keyval parser and implicit key 'qom-type', converting the
> + * result to ObjectOptions and calling into qmp_object_add().
> + *
> + * If a help option is given, print help instead.
> + *
> + * Returns: true when an object was successfully created, false when an error
> + * occurred (*errp is set then) or help was printed (*errp is not set).
> + */
> +bool user_creatable_add_from_str(const char *optarg, Error **errp);

This could be used to fix the exit status 2 issue in qemu-img convert,
if you rearrange the series a bit.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


