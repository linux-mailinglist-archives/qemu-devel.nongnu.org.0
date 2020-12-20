Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77332DF49A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 10:26:58 +0100 (CET)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kquzR-0004vQ-Cl
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 04:26:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kquy7-0004VU-Kd
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 04:25:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kquy4-0003YL-ID
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 04:25:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608456330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quFqN1bCbZZSyNzWBx9m+BoutP4+aZWOcPlz6XiY5QM=;
 b=auugksEv4ub2bGVJQ/jT4xF/MsU9U7dsjhbX/VrYIV/j5iFUWNWqRxbW6rTQNYhmIkSbP9
 I/teh9iXCxrFdGcHds2CdHUi56z/ss85ru3JkY0hqm3vpYqVVcIWOfEi3UeYTaEyeltU00
 rqKQ9s6FVspTwHruAJvF3O/CVbDIfKM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-k_Bi1Lq7NweiZ2ZsfdBing-1; Sun, 20 Dec 2020 04:25:28 -0500
X-MC-Unique: k_Bi1Lq7NweiZ2ZsfdBing-1
Received: by mail-ed1-f71.google.com with SMTP id g14so1798036edt.12
 for <qemu-devel@nongnu.org>; Sun, 20 Dec 2020 01:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=quFqN1bCbZZSyNzWBx9m+BoutP4+aZWOcPlz6XiY5QM=;
 b=ms78YtkP9ZXzsHBHBoS6sbWmQTWtFC9EgVRzwBUVLEJY2GWjoRvC/xlxgAiiNLQmP6
 PP3y7on/OsAmrVORD7a/rLqV4H7xTGC22lCzIk/F390Bxqqj/qp9+ftDXJw3k9pVaZrr
 AOitXcMO1DKhnJ8FCEvAHh+ePCno78S1Her3Ny/dSMgNYfGYXIWeoBXpIuEBbPMZnvbW
 D5fyEF2I/daA29srdKBw3sSWpCBy5l3IjdgnwosjiaF+Q+yvH3hk8Szegv4jNyZoUT8X
 WDSPFZXfUJ6lVfcQKrFoq5n5NEjJ6A2gBWbutL4JStNQepcZ/tYOAtH45WAkLzqBFvlh
 YjMA==
X-Gm-Message-State: AOAM532QGVBsO4WIdo8dcaC4p0bwTHRqmvgpui2XnbES3pzBWn/1A+DL
 4gzLwn+NU/y3s7vSzHqw/3yMa5iUb4xHfqGyQYc/936PP/QnBneo7MATH90dmljBe8B7SPwYe41
 daCy3iKeHqSSJEVc=
X-Received: by 2002:a05:6402:318f:: with SMTP id
 di15mr11737571edb.237.1608456327458; 
 Sun, 20 Dec 2020 01:25:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXOftcIl07/aFFNcRqz8Q649k3jPrpMJrsf/EKYsZLir0UIswQlcRd8ATa2rjeb2RqysM88w==
X-Received: by 2002:a05:6402:318f:: with SMTP id
 di15mr11737560edb.237.1608456327300; 
 Sun, 20 Dec 2020 01:25:27 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id f17sm13515735edu.25.2020.12.20.01.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 01:25:26 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
 <4d4b1f60-98b6-6a41-42e7-685b2059da4c@redhat.com>
 <e3932dd6-545b-f329-f88f-e8c9694fc35e@ilande.co.uk>
 <20201218223250.GW3140057@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: QOM address space handling
Message-ID: <750e98b8-4e7b-f912-f06b-d2b835cc6113@redhat.com>
Date: Sun, 20 Dec 2020 10:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218223250.GW3140057@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/20 23:32, Eduardo Habkost wrote:
> Who owns the FlatView reference, exactly?

The AddressSpace.  The device creates the AddressSpace, which holds a 
reference to the MemoryRegion through FlatView and AddressSpaceDispatch, 
which holds a reference to the device.

By destroying the address space that it created, the device can break 
the reference loop.

> If the FlatView reference is owned by the MemoryRegion, we have a
> reference loop: the device holds a reference to the MemoryRegion,
> which owns the FlatView, which holds a reference to the device.
> In this case, who owns the reference loop and is responsible for
> breaking it?

The reference loop is owned by the device, which breaks it through 
unrealize (called by unparent).

instance_finalize by definition cannot break reference loops, so this 
means that my suggestion of using address_space_init in instance_init 
was wrong.

Thanks,

Paolo

> If the FlatView reference is not owned by the MemoryRegion, who
> owns it?


>>>> There are 2 possible solutions here: 1) ensure QOM objects that add
>>>> address spaces during instance init have a corresponding instance
>>>> finalize function to remove them or 2) move the creation of address
>>>> spaces from instance init to realize.
>>>>
>>>> Does anyone have any arguments for which solution is preferred?
>>> 
>>> I slightly prefer (1) because there could be cases where you also create
>>> subdevices using that address space, and in order to set properties of
>>> subdevices before realize, you would have to create the subdevices in
>>> instance_init as well.


