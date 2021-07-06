Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E6A3BDC0F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:18:40 +0200 (CEST)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oiV-0007l4-An
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0oXc-0005xj-NU
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0oXa-0000eJ-28
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:07:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625591241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/0/OEeAFGsfeeMhpEwQqN9UrFKHwWzSoT19/wSI5v8=;
 b=IQKV1yvSD4tuTU4/+XfioymgygvU9UicroWLGbqlbYtREe9n/9D5WXZHOKP9O9VSVIO24L
 NeIqfSq/jKy90CmoOd10LiX3e/mgvwKdwLj93E/rJ3HYILZlKPVICSJU9O8tPp5X6Y/kYH
 Dqqoaq2Il8RVxae3lRVNOeKCgueqCdQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-TP89qow6N5m8WJWS9rC5mg-1; Tue, 06 Jul 2021 13:07:20 -0400
X-MC-Unique: TP89qow6N5m8WJWS9rC5mg-1
Received: by mail-ej1-f71.google.com with SMTP id
 v5-20020a1709068585b02904eb913da73bso427451ejx.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 10:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/0/OEeAFGsfeeMhpEwQqN9UrFKHwWzSoT19/wSI5v8=;
 b=OwR0+bFrMvn92NQ2GrIunYYF9COUR8MgfELW9EAR+NxYK+Ercq0Duhr03ZwQlGQ2ho
 8JXyIRzsYn8qaaHEwAGZ/xlt7DRGX6caFEQm/F7n5nPhcd9auOWm+wu06Mr2rF/uZgs5
 UAhq2r0EdiLmAh1wsiFSkz/R2Rqoa9NEjOx0USxrnQ1cGd1HXMPrty0X19c/6/kYOtBN
 Idp2p+wXiBstTlyg5swTLORsrAXlZozcoO4f7ERi3TOI9HPuJGCJERLLRJCExQJzkek+
 B1FaBg0ekbKaNcbQ6tHmZW8/WbdPO1V1hb5C6jR4xXpRgSXBNOFoio5WBwlrVKN2EJJE
 4LLw==
X-Gm-Message-State: AOAM5339qaY2jthVNWHWloROtfQu699tn55GeqUv+LLjTX3lg1EuqCZ+
 q4D9mjNNStpqTnTsiJAsphP/Es14R3Zb4H1s3i9Z4bkTDA0VjqJGDvals+EynRMxhADz+kBmhGp
 7RZkfs7aEgDb4sxc=
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr24228215edc.2.1625591238854; 
 Tue, 06 Jul 2021 10:07:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwP10/m7zUEbupWSBw3E0Kit5kgTrsq9WiQeL0AsaTPkNdy5I7CNBfgN9YskwngFU2a6/CGA==
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr24228154edc.2.1625591238493; 
 Tue, 06 Jul 2021 10:07:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s7sm6243566ejd.88.2021.07.06.10.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 10:07:17 -0700 (PDT)
Subject: Re: [PATCH v4 01/34] modules: add modinfo macros
To: Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
 <20210624103836.2382472-2-kraxel@redhat.com>
 <20210624203728.q2zrkpm5c6qecl2v@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5d9e28b4-5439-4c17-4c23-6de33ba786f4@redhat.com>
Date: Tue, 6 Jul 2021 19:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624203728.q2zrkpm5c6qecl2v@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/21 22:37, Eduardo Habkost wrote:
> On Thu, Jun 24, 2021 at 12:38:03PM +0200, Gerd Hoffmann wrote:
>> Add macros for module info annotations.
>>
>> Instead of having that module meta-data stored in lists in util/module.c
>> place directly in the module source code.
>>
> [...]
>> +/* module implements QOM type <name> */
>> +#define module_obj(name) modinfo(obj, name)
> 
> Can we make OBJECT_DEFINE_TYPE*() use this macro automatically?
> 

Yeah, that's possible.  I would do it as a separate patch though, 
because Gerd is on vacation and he asked me to include it in a pull 
request before soft freeze.

Thanks,

Paolo


