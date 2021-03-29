Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D600D34CD2D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:40:17 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQoNc-0003Tx-Ey
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoLk-0002ul-GW
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lQoLf-0004bO-Q4
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 05:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617010693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EgulBuW4Y4tnspUkj9T2xcU0bZcCRros9KNKLTR+qSE=;
 b=GQQePdXDI+5GEBqDHJmB9Gpp7eBQRInWTEoPIeTCSfN/uS3VQD9hduwcsSfGkSg+TtKDVz
 qU2TOze5tlmZ/OW5DWndRvJshvr15w7lbS20/PiSlFzbOKOtd6rh/xgErqvA6wmpr4ORFn
 37+D4MW730+LbCDMuoj9DXuUgXGT0tY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-dzWiDXJ1Ouakoe7_P6Hv1w-1; Mon, 29 Mar 2021 05:38:10 -0400
X-MC-Unique: dzWiDXJ1Ouakoe7_P6Hv1w-1
Received: by mail-wr1-f70.google.com with SMTP id z17so8389421wrv.23
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 02:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EgulBuW4Y4tnspUkj9T2xcU0bZcCRros9KNKLTR+qSE=;
 b=ITwKjKijheg54sMM9AwRg4kPk1mNSXESTzU6p3k21v11F0bunSIgoPAKEpqNg6ZSyp
 yLRjjXVxwupWcUol65Es8m9o1iXayfXlAzS3aSUFsMYw0SHtaiBX2/wCFQiaqOTyoZSA
 vehCXPNH9HUQUS9DlE3n/YmFdOcb0qnfiB53rKUjvTj/kad4QGOjOrYoOG/6Jo/UD1rC
 w2qR0bdesmAtX+VBHGLV5OmpPLRICMSBcOedjrUIn3aS/y7Dxro4MOk86tvI4YkUSEhq
 6i0sY8yjFtnrn8jFlVn3Z+NR11HYvc7uMkGRRZ0nvlX8UG3TBsd4c8EjqAzqTJ01Qiiz
 hFew==
X-Gm-Message-State: AOAM532T88AQrmfDCC2FgMukI86Mn17BeqkQgcfphS1BH4UVBlUsXJtB
 Zrsw5WkIbnT03MtKNvScHUJCTN+DPFPoN8T7sosngGSPY4zuQhkTajpN7TY+YK2/JMjFCalh+h9
 RxFLya6xWN+HAmPA=
X-Received: by 2002:a1c:6241:: with SMTP id w62mr23893124wmb.79.1617010688890; 
 Mon, 29 Mar 2021 02:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZR6FgfbiK+pA/1tA0BJMaEDbjMLG3z5jQyJTRMzyGkhQWxMENwATpiTN9fVphbQLQkVCNMA==
X-Received: by 2002:a1c:6241:: with SMTP id w62mr23893104wmb.79.1617010688682; 
 Mon, 29 Mar 2021 02:38:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j20sm23129986wmp.30.2021.03.29.02.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 02:38:07 -0700 (PDT)
To: David Gibson <david@gibson.dropbear.id.au>,
 Igor Mammedov <imammedo@redhat.com>
References: <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box> <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box> <875z1w7ptm.fsf@dusky.pond.sub.org>
 <YFg7qYYBqGZuKSO+@yekko.fritz.box>
 <fc4b9be9-8fca-cfba-5c26-f3ad8ae8035c@redhat.com>
 <YFlhiNorrttIslFf@yekko.fritz.box> <20210323140636.1a89eaab@redhat.com>
 <YGFnEGa2Hyt4cZMT@yekko.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
Message-ID: <b0f87852-4afc-bac8-7f62-7d1988285821@redhat.com>
Date: Mon, 29 Mar 2021 11:38:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YGFnEGa2Hyt4cZMT@yekko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/21 07:35, David Gibson wrote:
>>   regarding unplug - on device_del QEMU raises SCI interrupt, after this the process is
>>   asynchronous. When ACPI interpreter gets SCI it sends a respective _EJ0 event to
>>   devices mentioned in PCI_DOWN_BASE register. After getting the event, guest OS may
>
> Ok.  Is PCI_DOWN_BASE an actual emulated hardware register, or one of
> the invented ones you mention above?

It's invented.  Which is perhaps not the best word because the point of 
ACPI is exactly to let vendor provide a standardized interface that 
abstracts any register they invent.  Even when QEMU emulates actual 
chipset registers, operating systems usually access those registers 
through the ACPI interpreter (i.e. through bytecode provided by QEMU).

> Either way, I'm assuming there must be a PCI_DOWN_BASE register for
> each PCI bus, yes?  How is that implemented for PCI to PCI bridges?

Yes (though they are multiplexed on the same I/O port using a 
bus-selection register).

>>  Also it doesn't feature pending removal on reboot, that our ACPI PCI hotplug code has.

Ok, so that is what I was remembering.

Paolo


