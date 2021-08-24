Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF73E3F5F9E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:57:08 +0200 (CEST)
Received: from localhost ([::1]:42446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWvL-0004yn-EJ
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIWuU-0003nY-Oy
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIWuS-0002wZ-LH
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629813371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wF3Y2pqvotATH5oU278ZDXPut71vUqnW4XR69B0AaiU=;
 b=hsFWldE9ZK7YdhHSlpkRRmia4p8qxWkUMWdU+n0GG3dcaBMmyiiNlgXd+uuUTyV5MNbPER
 tdpF8ONVIaM33ZVJtoR2++8QkrssrSzo/1FKzVS6FnSf4ARi9k3qbg0rF72yk+0C4ThC8d
 Vq1zlMxeT6zqZlMUQHOt2DQQjnXZW44=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-rA6ly3c9P7mQFkYEwICyEQ-1; Tue, 24 Aug 2021 09:56:10 -0400
X-MC-Unique: rA6ly3c9P7mQFkYEwICyEQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j33-20020a05600c1c21b02902e6828f7a20so1083060wms.7
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 06:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wF3Y2pqvotATH5oU278ZDXPut71vUqnW4XR69B0AaiU=;
 b=nqXMvAZuydnYFEuR1wIxJZdrlYOfakYU6KpQbJjsamcdBZkNS35DVoya572VnDZSvr
 Ek6T4ZSQ+IwHsjkgpE0yO8ZNSQeJ+sPILS8JbXdsBZMmTjvC3GSbmjoVdg3WBcJiP/cD
 qCBmvsD6v4tSK71CzVtOmEHQj/0bacEPX/Bj4uRmy2WqisK6vXW/6hLpJJmkzBnnBQmJ
 DIN6vx2dg+ZzVteBSxogADxrNTqAXv5wZcUqhYwQmEaqptkWI+Vcmc7vuEkzHecu+HxY
 rUm+6FrnF8sFeQIy5SOvAgyhfzE+TlQAxvxNcTCTNjoBDa3rKgINfERLPxzIiY+yYQKM
 r+aQ==
X-Gm-Message-State: AOAM530EudjniLxJc39L384r5WWNDASR6cwTYae01NxP3aHv+a4GP6pd
 WA2eMJTVBvvN7E1CQ/oq0wSJcHS8uAzn9T86bhlSk8qDGZptMti8RnSkuVQY9wtzfnymYwxg4fs
 oFZt1bkmXd6oJMCM=
X-Received: by 2002:adf:efc2:: with SMTP id i2mr12925864wrp.94.1629813369791; 
 Tue, 24 Aug 2021 06:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxUWl/whiqqj8eX50wc9zIIWwIv8SkhNKqnILASnrx7ex5NJ412I75YOeUALhcFsVmE+7qAQ==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr12925772wrp.94.1629813368744; 
 Tue, 24 Aug 2021 06:56:08 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 b4sm17591751wro.97.2021.08.24.06.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 06:56:08 -0700 (PDT)
Subject: Re: [PATCH v8 25/34] python:QEMUMachine: template typing for self
 returning methods
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-26-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <c9eb499d-ad29-e7b6-3f2d-fc0e7ce378ed@redhat.com>
Date: Tue, 24 Aug 2021 15:56:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824083856.17408-26-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
> mypy thinks that return value of these methods in subclusses is
> QEMUMachine, which is wrong. So, make typing smarter.
>
> Suggested-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   python/qemu/machine/machine.py | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


