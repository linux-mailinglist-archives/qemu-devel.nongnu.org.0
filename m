Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF742305E70
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 15:36:46 +0100 (CET)
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4lw5-0006tj-Sk
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 09:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l4lu2-0005a0-IW
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1l4lty-0003DI-3T
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 09:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611758070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1zijwwFSPnebzzwbQ8LLs9OvM2B9NDhaql4IIKdupk0=;
 b=KcmduFut+UKPOh75/tOH50NNZx7RQ8dp3Wbx/4PRSQSK2LTDKgyKwmOG6fWihzJ+o/MoJR
 Uv9CedDGkjdG6FCoC9t3CAiP2xByWiiEX4P61mOGujCylkY6oca8J2G0mZ36zpyf76OlNs
 LO7vkjuP4eqmu+xfKM89WXQuLSXQmxg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-hJi8hjQ9P6G88_90Yxx2Rg-1; Wed, 27 Jan 2021 09:34:26 -0500
X-MC-Unique: hJi8hjQ9P6G88_90Yxx2Rg-1
Received: by mail-wr1-f70.google.com with SMTP id n14so1137969wru.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 06:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1zijwwFSPnebzzwbQ8LLs9OvM2B9NDhaql4IIKdupk0=;
 b=AZXxAzXmddq0zRQ/OLZXyg5ZFUtBYRMOw1YbALhmqk4X6R/XUzPYKYp6RNAxMB1KlM
 L/C/9Ys1cHp0TbD0RAwpp4lCuYHUKcq/SuD/cjklajxh/4Z9qmN0MKQYuJPdX7bFPzhN
 NKakAlUasKfpOevTCyNKLC8f2vhRCdGdQYiTtNwzqhTPKiBlqwaagq91eS6kz2I03HrV
 yNKttQiT2Ik9O+AC2pf8fSDFivUeaQvJakyeWRJHXamuR4KugBnlprF1RLIOu7Fsl0XD
 mdxtHS+C9DZCGJ65lj+JUg9lp4+oUYWMN3r+amq/WlQGTlOkdnb5xLsUrK3Y++HzDDci
 TNzQ==
X-Gm-Message-State: AOAM532o2IQQUTEnpD5+ny5V7SE9y5nsCL4OYng3ddlVduNDL5dzRsvz
 Y/HWfVbisS+XkjooAgxIgh23PZ6+RHmVFevDYK6dMXDNLlVyAhJx4Ot1l9gG0/4LdkWnwfHWdxU
 q7vQ4LebpX5K2oMg=
X-Received: by 2002:a5d:6884:: with SMTP id h4mr11799798wru.106.1611758065316; 
 Wed, 27 Jan 2021 06:34:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8H6pbAnIV8HsEAuv9/lVAdba1+DanasL6pVFwFhXDHzKODicoz06s8nw6DBaec/GXpYtRzg==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr11799770wru.106.1611758065070; 
 Wed, 27 Jan 2021 06:34:25 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id t205sm2857060wmt.28.2021.01.27.06.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 06:34:23 -0800 (PST)
Date: Wed, 27 Jan 2021 15:34:21 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] virtio: move 'use-disabled-flag' property to hw_compat_4_2
Message-ID: <20210127143421.rgshi3fvscfv53ip@steredhat>
References: <20210108171252.209502-1-sgarzare@redhat.com>
 <20210118160312.GB9899@work-vm>
 <20210119084519.a7lkqmmudu4n4em5@steredhat>
 <20210127142813.GG3052@work-vm>
MIME-Version: 1.0
In-Reply-To: <20210127142813.GG3052@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 Jing Zhao <jinzhao@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 02:28:13PM +0000, Dr. David Alan Gilbert wrote:
>* Stefano Garzarella (sgarzare@redhat.com) wrote:
>> On Mon, Jan 18, 2021 at 04:03:12PM +0000, Dr. David Alan Gilbert wrote:
>> > * Stefano Garzarella (sgarzare@redhat.com) wrote:
>> > > Commit 9d7bd0826f introduced a new 'use-disabled-flag' property
>> > > set to true by default.
>> > > To allow the migration, we set this property to false in the hw_compat,
>> > > but in the wrong place (hw_compat_4_1).
>> > >
>> > > Since commit 9d7bd0826f was released with QEMU 5.0, we move
>> > > 'use-disabled-flag' property to hw_compat_4_2, so 4.2 machine types
>> > > will have the pre-patch behavior and the migration can work.
>> >
>> > Be a little careful that fixing this probably causes a migration from
>> > 5.2->6.0 to fail with this machine type;  so when we do these
>> > type of fixes we often fix an old machine type between some pair of qemu
>> > versions and then break it between a different set.
>>
>> Good point!
>>
>> I did some tests using the example below always using pc-q35-4.2 and it
>> seems that works well:
>>
>> - 5.2 -> 6.0    pass
>> - 5.2 -> 4.2            FAIL
>> - 6.0 -> 5.2    pass
>> - 6.0 -> 4.2    pass
>> - 4.2 -> 5.2    pass
>> - 4.2 -> 6.0    pass
>>
>> Should I run some more tests?
>
>Apologies for the delay; I had to step back and understand a bit about
>what was going on.

no problem :-)

>
>The problem here is that you're sending a 'disabled' subsection when
>that option is true; your patch doesn't change the 4.1 machine type but
>it does change the 4.2 machine type; and that makes the 4.2 machine type
>not send it; so that means your patched version *will* work to existing
>code (because it's a subsection anyway it doesn't break the stream
>format when it's missing).
>

Thanks for the detailed explanation!

>
>Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>

Thanks,
Stefano


