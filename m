Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D67690B8E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:20:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ7li-0005BL-9n; Thu, 09 Feb 2023 09:19:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1pQ7lZ-0005B7-DD
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1pQ7lW-0002Gh-CO
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675952346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LRbJHkzcCjLCHBFF4lP8aMFL0vxR6HR8Hr7f2WXuS9k=;
 b=MXctlxCIJJxXrwtg3Rqf49rfSGx1aJLQbTThlDMIv38ZC1gtoNjFaHDaMd8mJcmZOD76t0
 H4WUy/nrdaHuY/AQ0mRoY3qdmgTahwJ2Aq0E8jTgLNAzlQmzdhVmKYL0ANy4klHOA5GDNi
 SSHlLJ15EkHZz0A431OBnUPyil0JH58=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-H0uAjdH5N6yNgwalQgYhzQ-1; Thu, 09 Feb 2023 09:17:57 -0500
X-MC-Unique: H0uAjdH5N6yNgwalQgYhzQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 d14-20020a170906c20e00b00889f989d8deso1588857ejz.15
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 06:17:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LRbJHkzcCjLCHBFF4lP8aMFL0vxR6HR8Hr7f2WXuS9k=;
 b=Vr6znmy8ixR6P/tkgU+2400nOtiBC0fhlwBWihe0dg3Gqyy8bU92hVR19V5Vw6LiOU
 KtxDkx1ATx6lXSoxGsCjXy+vFF3rDCYQ1zsvPiax6KF34RgVWr6s2g+eXDMGIX7KWdSn
 Kj3UmJyZH1qYoVkWuy3OmgDc2FBuhst/sa0giYsiC4g2XuV7FWJQpfz6wmDdIpvnJ07m
 LvaWcRwZm/mXrhKdIzGeBub+TQll/FH15VD/Ue3NEONaULx7wZ20XSCK5Ea5nP1l6YQw
 84gcnIqJTwxcgSYePocSf9rE2KT9RQwoZfCYqRN+JltGDnfC0Ix+EWqKaiZNorxUzcx3
 E1JQ==
X-Gm-Message-State: AO0yUKXwXrcpLNoGhVbq12sBlFvjBzN1GfAvi8Gc1AD73v4mzZ+dIPXS
 0h+o2qDkni/nemcgul4AxswJy4CK480X3nKauNElo0ZSGU4dQZIpOf9lPeCnkRlR++C+ZGNTkqB
 HsmqMvSbSn9WqRsw=
X-Received: by 2002:a17:907:25cb:b0:8af:4344:f0df with SMTP id
 ae11-20020a17090725cb00b008af4344f0dfmr1582534ejc.53.1675952276278; 
 Thu, 09 Feb 2023 06:17:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/VS8gijHb6N9ilhN9ek7t5sIUKZWEVs2AerobQK1WJncxmT1fnSoyZ+t7GGgW7ruCVGcC8eQ==
X-Received: by 2002:a17:907:25cb:b0:8af:4344:f0df with SMTP id
 ae11-20020a17090725cb00b008af4344f0dfmr1582502ejc.53.1675952276063; 
 Thu, 09 Feb 2023 06:17:56 -0800 (PST)
Received: from ovpn-194-92.brq.redhat.com
 (ec2-3-80-233-239.compute-1.amazonaws.com. [3.80.233.239])
 by smtp.gmail.com with ESMTPSA id
 kg3-20020a17090776e300b0088a2aebb146sm931602ejc.52.2023.02.09.06.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 06:17:54 -0800 (PST)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: "manish.mishra" <manish.mishra@nutanix.com>
Cc: John Levon <john.levon@nutanix.com>, Florian Schmidt
 <flosch@nutanix.com>, carl.waldspurger@nutanix.com, Prerna Saxena
 <prerna.saxena@nutanix.com>, Aravind Retnakaran
 <aravind.retnakaran@nutanix.com>, rohit.kumar3@nutanix.com, "Daniel P.
 Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, Sunil Muthuswamy
 <sunilmut@microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>, Justin
 Terry <juterry@microsoft.com>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: Expose support for HyperV features via QMP
In-Reply-To: <87r0uzlyql.fsf@linaro.org>
References: <cfa1e51f-c74b-c1d1-d6ea-a25a5a5f6c4b@nutanix.com>
 <18bea7dd-c776-6328-2c6b-71c88838db72@nutanix.com>
 <87r0uzlyql.fsf@linaro.org>
Date: Thu, 09 Feb 2023 15:17:48 +0100
Message-ID: <87bkm27wj7.fsf@ovpn-194-92.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> "manish.mishra" <manish.mishra@nutanix.com> writes:
>
>> Hi Everyone,
>>
>> Checking if there is any feedback on this.
>
> I've expanded the CC list to some relevant maintainers and people who
> have touched that code in case this was missed.
>
>> Thanks
>>
>> Manish Mishra
>>
>> On 31/01/23 8:17 pm, manish.mishra wrote:
>>
>>  Hi Everyone,
>>  I hope everyone is doing great. We wanted to check why we do not expose=
 support for HyperV features in
>>  Qemu similar to what we do for normal CPU features via query-cpu-defs o=
r cpu-model-expansion QMP
>>  commands. This support is required for live migration with HyperV featu=
res as hyperv passthrough is not
>>  an option. If users had knowledge of what features are supported by sou=
rce and destination, VM can be
>>  started with an intersection of features supported by both source and d=
estination.
>>  If there is no specific reason for not doing this, does it make sense t=
o add a new QMP which expose
>>  support (internally also validating with KVM or KVM_GET_SUPPORTED_HV_CP=
UID ioctl) for HyperV
>>  features.
>>  Apologies in advance if i misunderstood something.
>>

Thanks for Ccing me.=20

Hyper-V features should appear in QMP since

commit 071ce4b03becf9e2df6b758fde9609be8ddf56f1
Author: Vitaly Kuznetsov <vkuznets@redhat.com>
Date:   Tue Jun 8 14:08:13 2021 +0200

    i386: expand Hyper-V features during CPU feature expansion time

also, the support for Hypre-V feature discovery was just added to
libvirt:

903ea9370d qemu_capabilities: Report Hyper-V Enlightenments in domcapabilit=
ies
10f4784864 qemu_capabilities: Query for Hyper-V Enlightenments
ff8731680b qemuMonitorJSONGetCPUModelExpansion: Introduce @hv_passthrough a=
rgument
7c12eb2397 qemuMonitorJSONMakeCPUModel: Introduce @hv_passthrough argument
7c1ecfd512 domain_capabilities: Expose Hyper-V Enlightenments
179e45d237 virDomainCapsEnumFormat: Retrun void
a7789d9324 virDomainCapsEnumFormat: Switch to virXMLFormatElement()

in case this is not enough, could you please elaborate on the use-case
you have in mind?

--=20
Vitaly


