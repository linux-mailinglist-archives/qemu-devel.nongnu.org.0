Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B1B34407C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:09:30 +0100 (CET)
Received: from localhost ([::1]:40364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJNA-0005xd-UM
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOJKp-0004c8-1W
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lOJKm-0004W0-Me
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:07:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616414818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NM+YhAzgg4p6tek0HkU+L4aSxl2NITN72MmNAVMPeJE=;
 b=X9BqbubcyV7ptGSp5C+qMWSyUeG4wc3OoG7fXPCHB5qd/bDx4cBxEgwwCNZ1BQLsQ+y4AM
 NqNpmI8dLTFBTtN94bJUc1dUdBb/SmFbg4NW1W6tY2eE9QjtUyKhWE2GMLZiy5BZe+BE6E
 Zd06+uXYiNN3ydDNCcmXmVgVDacWd3M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-xcLx0CLyMHOVhyXzlhANEw-1; Mon, 22 Mar 2021 08:06:57 -0400
X-MC-Unique: xcLx0CLyMHOVhyXzlhANEw-1
Received: by mail-wr1-f70.google.com with SMTP id n17so25951030wrq.5
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 05:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NM+YhAzgg4p6tek0HkU+L4aSxl2NITN72MmNAVMPeJE=;
 b=pxzOXwn6DGL5Mnxn7Be4ZH7A9J2ULQMB+frX17S769JewWWekgiI90B9ozQN6IYxnD
 xJDRasHTHgCCJx5ebvaGbJD+RPkswyjp0DIDlHdB6m4u+Fzz/4YCLTSEYRzxDsRJ0VlN
 Ch7FQeLfHiZik0sq5Xlh8jjOQidL5/Qt+FaHJnlHDFm+vBsAdwJEy40Fzk2zfzbOYpca
 uq4eqKKgIlgojCWjZvSIbIB8njFfJgKXgbGilIBhIgVpw6p80aaRsPWs4EeZk6UuBrky
 9PaXBrIp0KVGP6/mjcfibS+Yyi2clyih0Q07fxiBaRz/JCcrjnqCgXTkFPDtMSez8bAU
 yJYA==
X-Gm-Message-State: AOAM533JQ0IaamYVs+52WlfFJvfroeOWHGfQLR85geiL141TDgQculG1
 KtxEuwgx2UqB8tYfRc8eJFw65qi1cYyGy95hXy/0Cu7HedpDdgZPNngwdV09NPI6SFH6f4kJr8j
 PRiFxHiR8KCvOn0w=
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr18409330wrm.260.1616414815764; 
 Mon, 22 Mar 2021 05:06:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEv2XjuP70syAAWmnQkeICb21lUjFlJ9S7W2jyrU2pCNe1xSpGeaDuj+dM9GrVDlKt4AciCg==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr18409289wrm.260.1616414815469; 
 Mon, 22 Mar 2021 05:06:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h13sm15711148wmq.29.2021.03.22.05.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 05:06:54 -0700 (PDT)
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
To: David Gibson <david@gibson.dropbear.id.au>,
 Markus Armbruster <armbru@redhat.com>
References: <155911cc-8764-1a65-4bb3-2fc0628d52e5@gmail.com>
 <877dmkrcpl.fsf@dusky.pond.sub.org>
 <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box> <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box> <875z1w7ptm.fsf@dusky.pond.sub.org>
 <YFg7qYYBqGZuKSO+@yekko.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fc4b9be9-8fca-cfba-5c26-f3ad8ae8035c@redhat.com>
Date: Mon, 22 Mar 2021 13:06:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFg7qYYBqGZuKSO+@yekko.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/21 07:39, David Gibson wrote:
>> QEMU doesn't really keep track of "in flight" unplug requests, and as
>> long as that's the case, its timeout even will have the same issue.
> Not generically, maybe.  In the PAPR code we effectively do, by means
> of the 'unplug_requested' boolean in the DRC structure.  Maybe that's
> a mistake, but at the time I couldn't see how else to handle things.

No, that's good.  x86 also tracks it in some registers that are 
accessible from the ACPI firmware.  See "PCI slot removal notification" 
in docs/specs/acpi_pci_hotplug.txt.

> Currently we will resolve all "in flight" requests at machine reset
> time, effectively completing those requests.  Does that differ from
> x86 behaviour?

IIRC on x86 the requests are instead cancelled, but I'm not 100% sure.

Paolo


