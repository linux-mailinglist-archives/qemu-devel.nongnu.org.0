Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E46A7537
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:23:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXSxq-0001ov-Ff; Wed, 01 Mar 2023 15:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXSxn-0001oW-VW
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXSxl-0006uV-U4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:22:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677702128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vwSYW/Co7bZMlBvGhwCbQ/9AYrGdyH5whXpEeyN5QnY=;
 b=cnj/7gOeX8qWqMlP+IdXeQIw1kqxsXcwCGAwevCd1K7zZh+xWmgcWV4QYnWLviGHP4T3QO
 Dm/bx+yogCxq1UREJLZjjRrBHE/WjzWzrxud3dI6nj0R4pd/EcIjxpg+KQFG0rRwAPhAMR
 q2fiQ5f7M+Sy+sQrWc0jm6vcmoa1z3g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-gp1CgbPeP_aBA4rLjjyINg-1; Wed, 01 Mar 2023 15:22:06 -0500
X-MC-Unique: gp1CgbPeP_aBA4rLjjyINg-1
Received: by mail-wr1-f71.google.com with SMTP id
 k6-20020adfc706000000b002c716981a1fso2780862wrg.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 12:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677702125;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwSYW/Co7bZMlBvGhwCbQ/9AYrGdyH5whXpEeyN5QnY=;
 b=TYJnvcISBpMRd+OGbEhvk753sa2/CpKE8HAPGGHh6xiQbX2veaEHvi8xc73ucTU69L
 371/TEW01L7L7DbFXiTA903z3tOGEvfPebS4WmtllYph7JdwKpgYgHgG/Ylalwj38Yw7
 no82dM/DJcyANHWiPva+ItGuSWUkBdgY0Ipv2EO3nyZ1BHgUKzTXTohWgeBAwNF6OwOW
 A+qwa1+4XCQDq5reYBJvB7aIml+2yvvFDRV+BS3/Xr6qeCPWk5rZhIeWn/3CkNf2jiwj
 EW8fNYZyENQpIZSYP97RMJ+qADV72NSr5H5F/eAiWNBuEblL4Np9nuugFV0bKsZuf45Q
 MWSA==
X-Gm-Message-State: AO0yUKU/8nm8pVKmFFOXPQajw1zFokuGV/DSYO/6fUFNY9Ye0O4mnOjS
 /wVwy2rzdwOShNRI1NHE3TZBL61OmiuTQtAtvdjXZCC0FMUDzwknc1QHswfuqZg+uK4uWoLqKKM
 RnPDbDg5tSiTB1Bc=
X-Received: by 2002:adf:e490:0:b0:2c5:c71:4a84 with SMTP id
 i16-20020adfe490000000b002c50c714a84mr5944227wrm.68.1677702125485; 
 Wed, 01 Mar 2023 12:22:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8iEwYFLYvcosvRgJfatY+POPjUet9RN6E7KopqaGGL8goB07TRShmsN7fv2qTYs6BlPaFo2Q==
X-Received: by 2002:adf:e490:0:b0:2c5:c71:4a84 with SMTP id
 i16-20020adfe490000000b002c50c714a84mr5944209wrm.68.1677702125181; 
 Wed, 01 Mar 2023 12:22:05 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 q5-20020adff505000000b002c70a0e2cd0sm13671328wro.101.2023.03.01.12.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 12:22:04 -0800 (PST)
Date: Wed, 1 Mar 2023 15:22:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Message-ID: <20230301152038-mutt-send-email-mst@kernel.org>
References: <20230224034258-mutt-send-email-mst@kernel.org>
 <8611d901-0940-3747-c2cd-9c193c7f24f2@yandex-team.ru>
 <20230228094756-mutt-send-email-mst@kernel.org>
 <f3338868-d43a-a499-5db8-2fb06d244e37@yandex-team.ru>
 <20230228161602-mutt-send-email-mst@kernel.org>
 <8c3c140a-3c11-ba21-0c53-9cf25928bad0@yandex-team.ru>
 <20230301101212-mutt-send-email-mst@kernel.org>
 <78299aea-4049-991b-fe89-de0d1845bdff@yandex-team.ru>
 <20230301121224-mutt-send-email-mst@kernel.org>
 <bc89a1b1-2478-7780-0d74-64aac91beed5@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc89a1b1-2478-7780-0d74-64aac91beed5@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 01, 2023 at 09:35:56PM +0200, Anton Kuchin wrote:
> I do trust them :)
> I have to, otherwise we would need to pack all the properties and
> flags of qemu to the migration stream and validate them at
> destination or entire migration ends up broken beyond repair if
> orchestrators tend to do stupid things and need babysitting.

This is not at all a crazy idea. It has some disadvantages
too esp around cross version migration, which is why we
don't do this yet.

-- 
MST


