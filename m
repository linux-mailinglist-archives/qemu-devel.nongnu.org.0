Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955332B00F2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 09:13:26 +0100 (CET)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd7jR-0000CZ-Ms
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 03:13:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kd7i3-0007j9-Gv
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 03:11:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kd7i0-0007WH-6h
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 03:11:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605168714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2Mc75XsBbGazZvneISgPY/O83VGxFTjRFw2SLDJeCE=;
 b=EY85NdfEhzixoz1bHkGdDG+6LS8pvId9p5bptgx0BrpHJ6dUeE1pm7ENSC5G+xYu6OQ8bk
 dtMjvOz1oNmfI7cEydPB13I6Z8P+qcpokOswzbOLRV8DGHD11+j48wf0aDnf6DXtyB+OE2
 4HIvQZSRvsT2GTtimprq4o8nLWDWC8M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-c54QcdByPN6maXOTFJCuSw-1; Thu, 12 Nov 2020 03:11:53 -0500
X-MC-Unique: c54QcdByPN6maXOTFJCuSw-1
Received: by mail-wm1-f71.google.com with SMTP id 14so1840437wmg.1
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 00:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W2Mc75XsBbGazZvneISgPY/O83VGxFTjRFw2SLDJeCE=;
 b=CaE5WQBxkw9IG8+5KMUkbgRiPyKtdzRuVHDd13vbDEXn6dYkoRlkLC+nQWJaEW5DP7
 bRmEKAMLVcRohe4jmmxapkU0OHQKnOxcdZIRmOY7IRHrOL8aFDdLbuljETVWK85jAcuX
 CAUTcCtK/+i845/8gLbhBANVbymKoN6VZm7kan+KWuicptki546scMaOvcnpW6YPvop1
 LpAgvtdHmUOd7RAwmZIOQ/XJffEt38Qs3DpIauF/6hqagzGFgr8cK11t86qXr6CiamF6
 EfVv/kMAVPIBYy9INTv2JEf7VrmcpsTMFFdLTjoURt7tx/ah1lcCTTqOwoP6fL+ynvZH
 EmVw==
X-Gm-Message-State: AOAM531vds2spLV58fDfDj0tmMnl7xIt0MhakvPG8lmaFaUDBmTlsdmg
 r3l1Lbltvs5I8yFTYPHi2h4OhHZWI6X/QZVKcI4TP0vWbWFgv4WXTmcprLiwwA+wDzfmBuEQ5Iu
 sou+RKRQYeWBCqaM=
X-Received: by 2002:adf:8521:: with SMTP id 30mr13437372wrh.265.1605168711711; 
 Thu, 12 Nov 2020 00:11:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0q5AwtaFFfg3/+gJaGxQjR5Phrom9qYu6ScwyEasP6VqHs8RyB79A4vXt40n8cmi8i7nVVg==
X-Received: by 2002:adf:8521:: with SMTP id 30mr13437345wrh.265.1605168711464; 
 Thu, 12 Nov 2020 00:11:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id b63sm5957669wme.9.2020.11.12.00.11.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 00:11:50 -0800 (PST)
Subject: Re: [PATCH v2 00/44] Make qdev static property API usable by any QOM
 type
To: Eduardo Habkost <ehabkost@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20201109113404.GA24970@merkur.fritz.box>
 <3b711053-e67a-86fb-59e7-c06948dd8928@redhat.com>
 <20201109152125.GZ5733@habkost.net>
 <2300fd53-afa1-b957-b33b-cff2986fcb93@redhat.com>
 <20201109171618.GA5733@habkost.net>
 <098ca211-3ad5-b194-e9f5-678291fe641e@redhat.com>
 <20201109185558.GB5733@habkost.net>
 <9659e726-7948-4e02-f303-abcbe4c96148@redhat.com>
 <20201109202855.GD5733@habkost.net> <20201110103804.GA6362@merkur.fritz.box>
 <20201111183905.GO5733@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c2c2f63f-111a-1c17-29af-72b83e9b600a@redhat.com>
Date: Thu, 12 Nov 2020 09:11:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111183905.GO5733@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 19:39, Eduardo Habkost wrote:
> I will submit v3 of this series with both
> object_class_property_add_field() and
> object_class_add_field_properties() as internal QOM APIs.
> object_class_add_field_properties() will be used to implement
> device_class_set_props().

I have no problem making both of them public APIs.  If an object can use 
only a single array of static^Wfield properties that's totally fine; I'm 
just not sure about splitting properties between class_init and static 
arrays, which is the less consistent case.

Paolo


