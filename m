Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A72ECAAA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 07:54:16 +0100 (CET)
Received: from localhost ([::1]:58176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxPBX-000865-Tm
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 01:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxPAC-0007D2-SU
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 01:52:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxPAA-00009L-D2
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 01:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610002369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NoahaiVALcykHHX8VZxC7dz8aIjAPk6hGIQ5z++UqI=;
 b=eyp5eD2M2BxzcH5q544pOesXdzz3l6naqy7ru+mDZOgEb3mHN+PW/i1lL3m6BoEUnNUO6V
 N3AbKGCCmJ6ypK94Vu9DcAhpKrkkcDAnZRKQlMVJYG6XJr5Q3NR8BAAZ2F566wladElHb+
 DrjJ6d98GB344WddpZLIw3XlAJB99tw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-ycEJyIREPb2tlmXGpGMI3g-1; Thu, 07 Jan 2021 01:52:47 -0500
X-MC-Unique: ycEJyIREPb2tlmXGpGMI3g-1
Received: by mail-wr1-f72.google.com with SMTP id q2so2236939wrp.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 22:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3NoahaiVALcykHHX8VZxC7dz8aIjAPk6hGIQ5z++UqI=;
 b=QdmOAlQ4aegNlOKopUxj9cAxciYBvBrN9WveH9yGdFuqvYzdTpFC9N6mAeFImCk60D
 kccBJgSQCca4+qFzinOw3kHm86lkpg5nbsZoLXCRmq2NFf4n46DZbwC8CsdK8R6v28MQ
 E7yugyVhpfuzmJk1YPtBCQoIkSyqMTSPKi1W7Woed8KAJy7A7jWGDAb4WJ6o2sA5yFhS
 uxPIUR0FATYKOrLhONBwGhslwJiyBZqHceFMiSWqiGj4zRcu/9fZft2ewNZ+pNjnAoPV
 EKn9wnaVn73Jhpv/V/wfmCYBByHNKFCjxsOfo6yh0yBvEJRHj/F9m31ajnofetoEomLu
 9riw==
X-Gm-Message-State: AOAM530ab7ElWbEp9O59zOlF8qURA2Jj1/Gv8BxRFmE1XkHv1asdlkJ/
 dVHEEZ31fMK5CGaURpWWt9mQ5afcBHuFGk4HJxiQpBlYSYbqKu2OCceoQB1kAuI+AO+5ZsVbDZf
 89saU8Z7Rseh3alp6mehECWyRLmq2Jb4Vy73WXyL/WzneLSOiy6lzJD1BexYkcvvc
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr7301621wru.120.1610002366204; 
 Wed, 06 Jan 2021 22:52:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHasYeLgAB2+byEFh0U41lXnXI/kb3tjLPM5dg0HeU1OUm/J5eJFJSikDs1B4/O6b7UhiTqg==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr7301601wru.120.1610002365971; 
 Wed, 06 Jan 2021 22:52:45 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id g5sm6474954wro.60.2021.01.06.22.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 22:52:45 -0800 (PST)
Subject: Re: [PATCH v3 1/3] update-linux-headers: Include const.h
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210104202057.48048-1-farman@linux.ibm.com>
 <20210104202057.48048-2-farman@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <484cd97b-852f-12ac-99a5-ba06295344c0@redhat.com>
Date: Thu, 7 Jan 2021 07:52:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104202057.48048-2-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 9:20 PM, Eric Farman wrote:
> Kernel commit a85cbe6159ff ("uapi: move constants from
> <linux/kernel.h> to <linux/const.h>") breaks our script
> because of the unrecognized include. Let's add that to
> our processing.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>  scripts/update-linux-headers.sh | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


