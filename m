Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF793388AD
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:30:19 +0100 (CET)
Received: from localhost ([::1]:52476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe7e-0003pm-3v
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKe5c-0001cJ-4q
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:28:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKe5a-0007Pi-KF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615541289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiekMfdzXukuc2uB8mHUYZUiV4+o0tYgdC9CkTUjzi4=;
 b=TkiXGdh4FZ4UY5NvbkNnuaOKcaLEX5xvbfupTP963uiuJhU4j+Y8a5ygBycgs++zCwKn8t
 Z6jWq8/N4ShfZIPhOlDDI8shG2iHyB2Cs4KS60+MTV8yTSwt4sSq+9npEU9/vN5O0tdqvO
 hx9lc4gvuZy+qOGbu2+UnGJmkyFQjVI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-_Jqli1TeNKqinlf_wO6pfw-1; Fri, 12 Mar 2021 04:28:05 -0500
X-MC-Unique: _Jqli1TeNKqinlf_wO6pfw-1
Received: by mail-wr1-f69.google.com with SMTP id h30so10912954wrh.10
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jiekMfdzXukuc2uB8mHUYZUiV4+o0tYgdC9CkTUjzi4=;
 b=d+bOtMTTRjfDpQPSE2hsUjUJ9DVFoTpAU7TxzSULjMZvDDfZogEC6ZhDUWDfU7h3O6
 66kSB7rFvb4kwryQf4fDZ0dKtJiqLzIJ9X41KAAkILqiHIhlUNplfDbmrGIVpjGTHvSn
 5WqqtiCNZm5yFkvF8V/81wkNEkeEINysSWShKXlAU5qVImvamupS0dH5rS1fE4GYb16t
 uLXGVS8P9VP6TWA1TK+pkU/5452YlZUdvzLeKp54DiSOhyZdTV4xY0965Ot6/IvHKtu+
 mw6P2qWpVahDCYZvSUOQWcomL7ghZSm3yyjIa2TVvIMc74bebJUP4J9kCoSCC6Bjt4nw
 feKg==
X-Gm-Message-State: AOAM531oUTFB1Ad8LaB1mWT8qVYR9Y+kgOHy0R4PJw0+K8+e/sctPv+q
 NtDUaEDx6NBzPbo2Dw8qcRhwq31DdhaQV9eYCd0coEKZytMdQA4mGFenODFsTfgf6XCzn14qGuj
 95YPLmznMfTRhdFE=
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr11829681wmc.35.1615541284078; 
 Fri, 12 Mar 2021 01:28:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyoKShgSISfR31FTObseOZA8Z4fagVZC20G5rRgMasa2L+iM4dcBWp1oroCTthoITBxNbuJQ==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr11829651wmc.35.1615541283895; 
 Fri, 12 Mar 2021 01:28:03 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id s84sm1521570wme.11.2021.03.12.01.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:28:03 -0800 (PST)
To: Andrew Jones <drjones@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <CAJ+F1CLu=A4CaL+KbsSuOr9A36DX_9PpkVNg7PH7-4hCzpfoFg@mail.gmail.com>
 <651baead-dcc3-c0ef-f5dd-cda36c8d6599@redhat.com>
 <20210312084816.pnenjcbdjzwu3z54@kamzik.brq.redhat.com>
 <c36e5524-7eaf-16a7-5362-f992fe3a8383@redhat.com>
 <20210312091719.6sfr673oppm7hpdr@kamzik.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
Message-ID: <6a5d8eea-2527-f7dc-336a-1a0571e53869@redhat.com>
Date: Fri, 12 Mar 2021 10:28:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210312091719.6sfr673oppm7hpdr@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 10:17, Andrew Jones wrote:
> On Fri, Mar 12, 2021 at 10:01:43AM +0100, Paolo Bonzini wrote:
>> On 12/03/21 09:48, Andrew Jones wrote:
>>>> I think we definitely need the additional data section here: For KVM on
>>>> POWER, it would be good to know whether it's KVM-HV or KVM-PR, for KVM on
>>>> MIPS it would be good to know whether it's KVM_VM_MIPS_VZ or KVM_VM_MIPS_TE,
>>>> for KVM on x86 whether it's the AMD flavor or Intel, ...
>>>
>>> Could also pre-expand all of these and list them individually.
>>
>> That seems worse (in general) because in a lot of cases you don't care; the
>> basic query-accels output should match the argument to "-accel".
>>
> 
> For these special subtypes, what's the property/state that indicates it
> when just using '-accel kvm' on the command line? Because if this qmp
> list matches the '-accel' parameter list, then qtest and other qmp clients
> may need to query that other information too, in order for this accel
> query to be useful. And, do we need an accel-specific qmp query for it?
> Or, is that information already available?

It depends.

On PPC (if I remember/understand correctly) only pseries supports both 
HV and PR, while all other machines only support KVM-PR.  So in that 
case it's a kvm-type machine property that is defined only for the 
pseries machine.

On MIPS instead there's no option and VZ always wins over TE.  I think 
it could be made an option on -accel, but I'm not familiar with MIPS 
machine types.

Something like "name: 'kvm', types: ['book3s-hv', 'pr']" would work 
nicely for KVM-PPC, and likewise for MIPS.

Paolo


