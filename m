Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E8266D95D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:11:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHhyi-0001Vo-II; Tue, 17 Jan 2023 04:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHhyc-0001Sa-Vv
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:09:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pHhyb-0003Gi-JS
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 04:09:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673946593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmE1EToF7FK1PhWv4licRkfgkaPfpMdX2S2fwec8xmg=;
 b=fs/aSa6hUBsWEEDCbvteZKqFOThi5sT3zrWLfKfPAwiB5w+jQ9oGNT63XEQFzi7XEWDKKQ
 lh44WuEXyS7mWHo40JWI3Ikk5ZSVOcxbE1uCK0BznlVBJ672m8Ss/o9GxJeFwd66BGyLxf
 ZUDQ3fsyYZ3/PuYNi0WKbCu3U56V0+U=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-OuHazmYWNtWYPlIdLazN_Q-1; Tue, 17 Jan 2023 04:09:51 -0500
X-MC-Unique: OuHazmYWNtWYPlIdLazN_Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 f10-20020ac8134a000000b003b2dde42a4fso4220062qtj.4
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 01:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cmE1EToF7FK1PhWv4licRkfgkaPfpMdX2S2fwec8xmg=;
 b=zewnHMpsLb9DzkYJgWqw8lYKEIG19PpcgqMEWoK045VHDUFmUdJm5osqWt0MuFICa2
 UTZ1uXAATD7EpKh0C+qzVKLEkB3yFPBjnbX5c2K+NT646WQMjLNO+yw6vVnD0cqX7+Ue
 wy4ZT4/X1eckTosdG+9Qg7WKsiNHqUimME8sa6N/w5/hDuy54rttEzgPE6PfIjfcAG2a
 DaJXpNdFk4mLq7WNXPEKMiGM5mm194zyW99uv2v/C3wr9lc8BNKqrhtpdMo2mNWcIgi1
 NWh5Wcwo7kniYd/R+hIoYCWyrwfPEj6xHZ8OZsD/fSG9+RWTPt2SNmN/1pS0P518pqPd
 0i+g==
X-Gm-Message-State: AFqh2krWulxiZyQRf65WdoQ27VyXV5ML298t3iwhfCvcvVh4wMtRgXNh
 6K88VLIHm0k7r29SMZhMiY043vl75B+mrfIaoaqba/QaA3IKynVqIM1JGtbcqDxJNf061AEww6v
 erIbwVIAYsxzUASk=
X-Received: by 2002:a05:622a:5a91:b0:3b6:414f:c2ba with SMTP id
 fz17-20020a05622a5a9100b003b6414fc2bamr1684916qtb.38.1673946591099; 
 Tue, 17 Jan 2023 01:09:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt329/71WT+ZQg+neZRVbjrhGpx046DLiWjspjYhDSFjQkhP01Kh7IagzUjHkQ9/4MFqtqgmg==
X-Received: by 2002:a05:622a:5a91:b0:3b6:414f:c2ba with SMTP id
 fz17-20020a05622a5a9100b003b6414fc2bamr1684892qtb.38.1673946590852; 
 Tue, 17 Jan 2023 01:09:50 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-26.web.vodafone.de.
 [109.43.177.26]) by smtp.gmail.com with ESMTPSA id
 e26-20020ac8491a000000b003b62fcd6d50sm409538qtq.28.2023.01.17.01.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 01:09:50 -0800 (PST)
Message-ID: <e87024f2-6ecf-1015-cc8c-604b17e139e2@redhat.com>
Date: Tue, 17 Jan 2023 10:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/3] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Sebastian Mitterle
 <smitterl@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230116174607.2459498-1-clg@kaod.org>
 <20230116174607.2459498-3-clg@kaod.org>
 <a386bb49-72de-6edc-9873-70ec59e475ab@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <a386bb49-72de-6edc-9873-70ec59e475ab@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/01/2023 09.40, Janosch Frank wrote:
> On 1/16/23 18:46, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> If a secure kernel is started in a non-protected VM, the OS will hang
>> during boot without giving a proper error message to the user.
> 
> Didn't we establish that you were missing the IOMMU flag so this statement 
> isn't correct anymore?
> 
> 
> I haven't yet fully ingested my coffee, but from what I understand you would 
> block a switch into PV mode if cgs is not set. Which would mean that PV KVM 
> unit tests wouldn't start anymore as well as any VMs that have the unpack 
> feature but not cgs.
> 
> And that's not something that we want.
> 
> You can start a PV VM without cgs if unpack is in the CPU model. The ONLY 
> requirement that we should fail on is unpack.

So would it make sense to check for S390_FEAT_UNPACK (or something else?) 
here, or should the patch completely be dropped instead?

  Thomas


