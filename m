Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6145CC1F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:32:48 +0100 (CET)
Received: from localhost ([::1]:58464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpx4Y-0004sx-Nb
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:32:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mpx1a-0001yq-Q8
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:29:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tfanelli@redhat.com>)
 id 1mpx1Y-00042v-I3
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637778578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SyvijTljh9DWMrOyvlBI1XLGhjmvHfU1jqIIuW07KFs=;
 b=Y0cPb0CxgorgAw0I0wqmSkA0P1HQqh/CNU4TX7q3bhonBnOtosQX23xUSG+SWQzf93bR19
 BSHL+BYkm2W4HxSBIkUWarSM9oatU0mjsxZ1mVnMSCoqqTpwCF9MHFxvJav+7d+TGbHq4H
 uOzICSEjgY1NL92FYdsf6NSgqZXiUgs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-JZ5akZhzNXeNV-P7ZDqf3Q-1; Wed, 24 Nov 2021 13:29:37 -0500
X-MC-Unique: JZ5akZhzNXeNV-P7ZDqf3Q-1
Received: by mail-qv1-f70.google.com with SMTP id
 1-20020ad45ba1000000b003bdfcecfe10so2722597qvq.23
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SyvijTljh9DWMrOyvlBI1XLGhjmvHfU1jqIIuW07KFs=;
 b=tlAyu/dr1qY449brgsHLoAFThzuWREL4XqY8z4M21vaPN1mMZXMNqlxy5pXApPMxff
 +YbDU6jo0q8xN+VhRAewcjCjx7APDcC1FLR+HMsaNtquOq1de8Zij5tdWPwuZpsjYb1D
 Np8Xyf+45JpmbKcIMoUh4NCezeUuN3QrnQ5F23XBQBqZ8/yag/G8msU6ZHH0VRNLHZ9O
 FkjZ8mC0SzabGsNWszQHULlG2z0RMtJqG/28WGe1KfX1LE9zfJosrMPWHu/3MK4DK3EX
 tDIx2YAJpl6gWg22yvjPJF1ZMEcDgt6HZ7Bak6+QFB89bgI1pWVee4cgrdqvjBfnvQnD
 /kkg==
X-Gm-Message-State: AOAM531kkFGyA/BPO3iKne1lFMDMktAO75EqYqPVmvUdMHMW5ZVrX53L
 C+pP+z4SK+MZUxaIT6qHyXjLUL5kqrUPEL7vfpnCUzt/+/tRlb5jIOUY2zBC6pfew2CDmUGARwU
 YHI5G+PzoVpbnOHw=
X-Received: by 2002:ac8:7fc2:: with SMTP id b2mr10173283qtk.114.1637778577087; 
 Wed, 24 Nov 2021 10:29:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFuY/q80uEmSAOHWw+dXqn/yJ18QGCKYptMepOejHXHcZoP4COVy11H5boER2DiEWJQ8E2xg==
X-Received: by 2002:ac8:7fc2:: with SMTP id b2mr10173254qtk.114.1637778576888; 
 Wed, 24 Nov 2021 10:29:36 -0800 (PST)
Received: from [192.168.1.234] (pool-71-175-3-221.phlapa.fios.verizon.net.
 [71.175.3.221])
 by smtp.gmail.com with ESMTPSA id bk39sm250903qkb.35.2021.11.24.10.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 10:29:36 -0800 (PST)
Message-ID: <14e7c639-9aa0-884e-5fa2-eef86348d7e9@redhat.com>
Date: Wed, 24 Nov 2021 13:29:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: SEV guest attestation
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.ibm.com
References: <8b0c6f36-8a11-eeff-8bab-68c47fe95fbe@redhat.com>
 <YZ57O1d+0IPl3DS/@work-vm>
From: Tyler Fanelli <tfanelli@redhat.com>
In-Reply-To: <YZ57O1d+0IPl3DS/@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=tfanelli@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=tfanelli@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: John Ferlan <jferlan@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 12:49 PM, Dr. David Alan Gilbert wrote:
> * Tyler Fanelli (tfanelli@redhat.com) wrote:
>> Hi,
>>
>> We recently discussed a way for remote SEV guest attestation through QEMU.
>> My initial approach was to get data needed for attestation through different
>> QMP commands (all of which are already available, so no changes required
>> there), deriving hashes and certificate data; and collecting all of this
>> into a new QMP struct (SevLaunchStart, which would include the VM's policy,
>> secret, and GPA) which would need to be upstreamed into QEMU. Once this is
>> provided, QEMU would then need to have support for attestation before a VM
>> is started. Upon speaking to Dave about this proposal, he mentioned that
>> this may not be the best approach, as some situations would render the
>> attestation unavailable, such as the instance where a VM is running in a
>> cloud, and a guest owner would like to perform attestation via QMP (a likely
>> scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
>> commands, as this could be an issue.
>>
>> So I ask, does anyone involved in QEMU's SEV implementation have any input
>> on a quality way to perform guest attestation? If so, I'd be interested.
>> Thanks.
> QMP is the right way to talk to QEMU; the question is whether something
> sits between qemu and the attestation program - e.g. libvirt or possibly
> subsequently something even higher level.
>
> Can we start by you putting down what your interfaces look like at the
> moment?

Basically, I just establish a connection with a QMP socket at the 
beginning, serialize different QMP structs to get the data I need 
(query-sev, query-sev-capabilities, etc..), get the results and 
deserialize that data. In the original attempt, I would keep this 
protocol for issuing "sev-launch-start", "sev-inject-secret", and 
others. From a mgmt app perspective (in my case, I'm looking at it from 
a sevctl perspective), it's relatively straightforward. Any work 
required for getting certificates, sessions, measurements, and OVMF data 
is handled by sevctl.

> Dave

Tyler.

-- 
Tyler Fanelli (tfanelli)


