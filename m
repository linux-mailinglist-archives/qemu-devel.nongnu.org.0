Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F6D6CD223
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 08:38:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phPQI-0002fc-FA; Wed, 29 Mar 2023 02:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phPQE-0002fG-Lx
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 02:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phPQC-0002RV-GO
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 02:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680071795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aGETvVgshMj5d1u/r7RIpwiyhaBxF6y2pOvq/3s6ujs=;
 b=GvQ1aeMMt9Utm79lU+CrNFn/l4INMPSvzdckHnY+ZnYTIqTuIhUUkmySZj3x0mpS77iyFe
 Uie6/Jg5fFTnwO+wPUK8m2Wn16WlB/4R3Gx8edqc70KZR2YwB2brcCmykQGVPLq3gJ3YQI
 Cyxqc0HHH0z/+CRi1hXDiFYuKue68bE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-U9-OnMSgOXeJuyxoLVlq_A-1; Wed, 29 Mar 2023 02:36:33 -0400
X-MC-Unique: U9-OnMSgOXeJuyxoLVlq_A-1
Received: by mail-qk1-f197.google.com with SMTP id
 q143-20020a374395000000b0074690a17414so6880281qka.7
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 23:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680071793;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aGETvVgshMj5d1u/r7RIpwiyhaBxF6y2pOvq/3s6ujs=;
 b=OxGB/L0xN0qhYXtXOjaEvwaGwyZfkrZq0ngU7GQVoMWEwYNF2zM2Mz/o/zw1e5jmLP
 8uB2w8tJ82hp/XwIRopnk4iAGY7jw1bJQC0ojr5WR/9csLyyy5Orjsu/j5IGdvuQTw3u
 d/TgNQ3z/0xjau42qzr+Sh/h+Q1EHjc6xEMeB49/UxMizxqFYA3/MSmpahRJ4nXJ6tzD
 nbSNFXyZq6uO92GcQ8hCLGfuzbbKjxs3xZk8w0/BSUOq1ddbzwsg3NiSnX2ryubyGY11
 9FhxYaFAX+iAi/C/kG6aIG+338tKpQg4iw2gWx0HC5caM5NVNx1+8uUbL1DUjYeWu/CG
 BOQg==
X-Gm-Message-State: AAQBX9c2u1ZSDbJQHuXz6UV586BfcmWgy52dbDCHQQx7qyLq76hTwlAP
 lrSBhwEjxiVUbzxO2tqKAvpq7KiK+Ujp8J7WcyuYRn0f9In27kVDzagZj3cIvzu6uOzvbvGsQkH
 H+0nGw381/zmrwGg=
X-Received: by 2002:a05:622a:149:b0:3db:9289:6949 with SMTP id
 v9-20020a05622a014900b003db92896949mr2118948qtw.3.1680071793337; 
 Tue, 28 Mar 2023 23:36:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350at0v9nmtwLp1G4vVsNMHyuHNPDodYQoIizyQ+khkgfXhlVJO6j8ZVwX/zgLJ6NloOfj8gs0Q==
X-Received: by 2002:a05:622a:149:b0:3db:9289:6949 with SMTP id
 v9-20020a05622a014900b003db92896949mr2118932qtw.3.1680071793082; 
 Tue, 28 Mar 2023 23:36:33 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-100.web.vodafone.de.
 [109.43.177.100]) by smtp.gmail.com with ESMTPSA id
 139-20020a370591000000b00745a78b0b3asm14343592qkf.130.2023.03.28.23.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 23:36:32 -0700 (PDT)
Message-ID: <88923929-1a75-2dbd-d7d9-406d620c71e7@redhat.com>
Date: Wed, 29 Mar 2023 08:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: s390x TCG migration failure
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Daniel P . Berrange" <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Coiby Xu
 <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Eric Blake
 <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>
References: <20230207005650.1810-4-quintela@redhat.com>
 <20230324184129.3119575-1-nsg@linux.ibm.com>
 <84eebff9-54b8-9354-5b48-822937af0405@redhat.com>
 <07464c8f08535b5c6611135ffeda66c8b26ec46c.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <07464c8f08535b5c6611135ffeda66c8b26ec46c.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29/03/2023 00.21, Nina Schoetterl-Glausch wrote:
> On Tue, 2023-03-28 at 15:01 +0200, Thomas Huth wrote:
>> On 24/03/2023 19.41, Nina Schoetterl-Glausch wrote:
>>> Hi,
>>>
>>> We're seeing failures running s390x migration kvm-unit-tests tests with TCG.
>>> Some initial findings:
>>> What seems to be happening is that after migration a control block header accessed by the test code is all zeros which causes an unexpected exception.
>>> I did a bisection which points to c8df4a7aef ("migration: Split save_live_pending() into state_pending_*") as the culprit.
>>> The migration issue persists after applying the fix e264705012 ("migration: I messed state_pending_exact/estimate") on top of c8df4a7aef.
>>
>>    Hi Nina,
>>
>> could you please open a ticket in the QEMU bug tracker and add the "8.0"
>> label there, so that it correctly shows up in the list of things that should
>> be fixed before the 8.0 release?
> 
> https://gitlab.com/qemu-project/qemu/-/issues/1565 

Thanks!

> Not sure if I cannot add a label or if I overlooked how to.

Ah, you might need to be at least a "Reviewer" in the qemu-project to be 
able to add labels and milestones. You can ask one of the owners or 
maintainers (see https://gitlab.com/qemu-project/qemu/-/project_members ) to 
add you as a reviewer.

Anyway, I added the 8.0 milestone now to the ticket.

  Thomas


