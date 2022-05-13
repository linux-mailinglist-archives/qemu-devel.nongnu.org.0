Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E10525C4B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:24:35 +0200 (CEST)
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPf7-0002xC-Qa
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1npPPI-0006ml-He
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:08:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1npPPH-000656-4X
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652425690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=At5E9Uh16PX39rtp1RE+a0eligWAZRrGXqlbhN+2HUg=;
 b=An39ldGWkDIH+5mlsoc/OehnngoSPn3lDe5AuSZ3qaMDW5Pg0lWxYc4RzmzuGrRKOjsJZs
 S96OJXtLzGrRqSgrbVsUkUkAgkQEoAYHec8Q5hHk3wYCKjrC4aLsGmM6By/Zudplmdi8Yz
 +4uUfONOitizsXgdirS0ql6TMUVPE8o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-DCmfVBCrMaOYC88qJtvLnw-1; Fri, 13 May 2022 03:08:09 -0400
X-MC-Unique: DCmfVBCrMaOYC88qJtvLnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D157F3804062;
 Fri, 13 May 2022 07:08:08 +0000 (UTC)
Received: from localhost (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 884F51467E2F;
 Fri, 13 May 2022 07:08:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>, Avihai Horon
 <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 2/9] vfio: Fix compilation errors caused by VFIO
 migration v1 deprecation
In-Reply-To: <20220512115710.413c7e34.alex.williamson@redhat.com>
Organization: Red Hat GmbH
References: <20220512154320.19697-1-avihaih@nvidia.com>
 <20220512154320.19697-3-avihaih@nvidia.com>
 <20220512115710.413c7e34.alex.williamson@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Fri, 13 May 2022 09:08:07 +0200
Message-ID: <87y1z5ap0o.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, May 12 2022, Alex Williamson <alex.williamson@redhat.com> wrote:

> On Thu, 12 May 2022 18:43:13 +0300
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> @@ -767,9 +767,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>>      case MIGRATION_STATUS_CANCELLED:
>>      case MIGRATION_STATUS_FAILED:
>>          bytes_transferred = 0;
>> -        ret = vfio_migration_set_state(vbasedev,
>> -                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
>> -                      VFIO_DEVICE_STATE_RUNNING);
>> +        ret = vfio_migration_set_state(
>> +            vbasedev,
>> +            ~(VFIO_DEVICE_STATE_V1_SAVING | VFIO_DEVICE_STATE_V1_RESUMING),
>> +            VFIO_DEVICE_STATE_V1_RUNNING);
>
> Yikes!  Please follow the line wrapping used elsewhere.  There's no need
> to put the first arg on a new line and subsequent wrapped lines should
> be indented to match the previous line, or at least to avoid wrapping
> itself.  Here we can use something like:
>
>         ret = vfio_migration_set_state(vbasedev,
>                                        ~(VFIO_DEVICE_STATE_V1_SAVING |
>                                          VFIO_DEVICE_STATE_V1_RESUMING),
>                                        VFIO_DEVICE_STATE_V1_RUNNING);

FWIW, I'd prefer this variant as well.


