Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC97F2AACA9
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Nov 2020 18:47:16 +0100 (CET)
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbomZ-0001RC-Dw
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 12:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kbokr-0000fB-6d
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 12:45:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kbokm-000654-E8
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 12:45:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604857522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKcr5vUXMJh6j6z/E1BNk/wJeVOexwL5vSDM/421TEA=;
 b=Jq2OLlC63QglC4/X9yYUMjCeNiO9TxP9lMfb95AMNxWufrS4ecytbD/o2ofoc7IoKvjLQx
 ndthC5i6xK7ttz6Woxcq87uzOXZiEElG8zIy5/MtV8+QrwvVEFfpxFVIFb2tNIFePfqdm9
 DnDRg36eLepmlmFAqlEM9fG+LHhTNuU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-VN-UTJT2OXyMSBAuPPrVxg-1; Sun, 08 Nov 2020 12:45:20 -0500
X-MC-Unique: VN-UTJT2OXyMSBAuPPrVxg-1
Received: by mail-wr1-f72.google.com with SMTP id w6so3215693wrk.1
 for <qemu-devel@nongnu.org>; Sun, 08 Nov 2020 09:45:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pKcr5vUXMJh6j6z/E1BNk/wJeVOexwL5vSDM/421TEA=;
 b=FmzAHwSlCDXrQI1HXy/IxZkz6zredcqDgZvmbYbI17kMsio/K9fa4laM0F8gsrGvIv
 lLtWvk70AgKc11PJKzL5tNWSXQfFELDA4dd1+BDji6gwGHOilAsy3IoY2h5faz9m6x53
 dVAmVASAdwamM5lgdDIzI44pmqvUQDWSbcNk26rntyN1ZVPigtyEe9ObWaB3B+6nWt55
 7mOANRbNq8pOxJAYU1F4UMB2FXOh25eM0CqHfbsSqZsvgJ9ozXmvEwgwfBcHtyFdpMpS
 NfcKzm7IL92kfcpO76kKPjICizQAgCLeAqf8fBvj6ZD1uvDxHdnA/m6+bYxELwz3TRMH
 BFBg==
X-Gm-Message-State: AOAM532FtRAxvPZCoG0pTlSSgT32ywLEt0mhvXOeCGcNtZrNvfc1YOdm
 nOkMsSyNbNWcyV00tgKqGZXblj8rlr58DLxR/0eNDz8igieIae1Wi5JtrpU/ctW1PeqTwnDBPCY
 Ar3UD6ySQ4nHA5L4=
X-Received: by 2002:a1c:6302:: with SMTP id x2mr10602942wmb.56.1604857519876; 
 Sun, 08 Nov 2020 09:45:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1+MmTs2lallUAly8YG6ttAFAIc9qc4UR8osQBdD9ziPolvVhuWzyWw6bD4azHYpnqWfdQ3g==
X-Received: by 2002:a1c:6302:: with SMTP id x2mr10602917wmb.56.1604857519689; 
 Sun, 08 Nov 2020 09:45:19 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i33sm10548606wri.79.2020.11.08.09.45.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 09:45:18 -0800 (PST)
Subject: Re: --enable-xen on gitlab CI? (was Re: [PATCH 09/36] qdev: Make
 qdev_get_prop_ptr() get Object* arg)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201029220246.472693-1-ehabkost@redhat.com>
 <20201029220246.472693-10-ehabkost@redhat.com>
 <CAJ+F1CKqo3D20=qSAovVKWCGz4otctaWnGC0O5p-Z1ZG9Pj_Mw@mail.gmail.com>
 <20201030113516.GP5733@habkost.net>
 <7645972e-5cad-6511-b057-bd595b91c4aa@redhat.com>
 <e35c50b6-e795-d901-61e4-4879c5eadd61@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e3e3d331-fd4f-7365-1e2f-bf8bfdb11396@redhat.com>
Date: Sun, 8 Nov 2020 18:45:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e35c50b6-e795-d901-61e4-4879c5eadd61@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 09:02:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 QEMU <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Qemu-s390x list <qemu-s390x@nongnu.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/31/20 11:25 AM, Thomas Huth wrote:
> On 30/10/2020 18.13, Paolo Bonzini wrote:
>> On 30/10/20 12:35, Eduardo Habkost wrote:
>>>
>>> What is necessary to make sure we have a CONFIG_XEN=y job in
>>> gitlab CI?  Maybe just including xen-devel in some of the
>>> container images is enough?
>>
>> Fedora already has it, but build-system-fedora does not include
>> x86_64-softmmu.
> 
> Eduardo, could you try to add xen-devel to the centos8 container? If that
> does not work, we can still move the x86_64-softmmu target to the fedora
> pipeline instead.

On CentOS 8:

  #6 10.70 No match for argument: xen-devel
  #6 10.71 Error: Unable to find a match: xen-devel

Regards,

Phil.


