Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329A234EE1A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 18:43:32 +0200 (CEST)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRHSl-00081l-9x
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 12:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRHLV-0001B8-FO
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRHLS-0008Up-Dz
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 12:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617122156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQMQe7dCiEquxpFJ1qBKgk1mzsgYm5h263ev+NAvYvU=;
 b=K4Kdvg9Lml8fD0zAgya8YvGPH2J1D6Ra5MUp8q8YoX4z6bDxZvYbmpF+GO+1T4SUiUqxFH
 xX+1uLOze8TNJvnFUdw619PvgzWZMyIfnpum7DMh8yIlHhpb5i4G9tEVTnL6AGBfdmKfhE
 9rzOS7ZDmep4Ox6nf8k43Wu2UgJToCg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-N-cC27R_Nv6O8lkCa8HTcA-1; Tue, 30 Mar 2021 12:35:53 -0400
X-MC-Unique: N-cC27R_Nv6O8lkCa8HTcA-1
Received: by mail-wr1-f72.google.com with SMTP id o11so10617669wrc.4
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 09:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SQMQe7dCiEquxpFJ1qBKgk1mzsgYm5h263ev+NAvYvU=;
 b=G84MonkenpnLvNEmMvmPhEXWVyXzz9SW26NYNTDbQkl9Ag2uIcCkAfwEXMzRS44LJE
 VGkRgnhYJolXtenz9mpgFTb86eMDSPh57mBsFwSwCVMoJgPRF54olinYq13JBYMi+mzO
 KScgL344aiLApKEx2CdNw9UOBAg7iafTpfJYWljQ3Mo2PUPUBz32f7kRmG1VxBcj50+u
 AvJ/53+g5hEE/4MSNvq9q8+OLsXvfrw/uDBVrD6/K2BJI/Qh95NDWhLzHPoBO4yFMB/l
 +edmSr+I7Jy5pkicNbhIsZRSnj6dKBf4NV0JroqiGCxtqWr3hbo0FnFxDIMQLjG5bOai
 h20A==
X-Gm-Message-State: AOAM5305E4Acw4moinEc1fr0klNFjFTGdLiww5wKbqh4EeWOIr7dRd0D
 sx4yrAsRGbbd3YRSW3yiRKCcS2brOz2r0KJ4Lh+DGzpZyhEbV1nemuWTAyUh6cHk8vrWcNQf5Sb
 +83Otc1Ey//gtJ4Y=
X-Received: by 2002:a7b:c24f:: with SMTP id b15mr4904546wmj.59.1617122151874; 
 Tue, 30 Mar 2021 09:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsUg+Pd0l5LXFdAB06tVvtc+kD0n5v+t7SRRf9XBjUclHdr61zRSFWM0aHmp1T1uyRzoMfqQ==
X-Received: by 2002:a7b:c24f:: with SMTP id b15mr4904527wmj.59.1617122151706; 
 Tue, 30 Mar 2021 09:35:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w6sm35673130wrl.49.2021.03.30.09.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 09:35:50 -0700 (PDT)
Subject: Re: [PATCH 1/1] Remove flatview_simplify()
To: Richard Henderson <richard.henderson@linaro.org>,
 FelixCuioc <FelixCui-oc@zhaoxin.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20210329121408.17862-1-FelixCui-oc@zhaoxin.com>
 <20210329121408.17862-2-FelixCui-oc@zhaoxin.com>
 <68af8e22-0380-8459-64c9-cbc5051cd04a@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9deccead-1590-0fe3-3c91-9bc6958484c9@redhat.com>
Date: Tue, 30 Mar 2021 18:35:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <68af8e22-0380-8459-64c9-cbc5051cd04a@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: RaymondPang-oc@zhaoxin.com, qemu-devel@nongnu.org, CobeChen-oc@zhaoxin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/03/21 18:33, Richard Henderson wrote:
> 
>> Flatview_simplify() can merge many small memory ranges
>> into a large one and contains EHCI dma buffers.
>> For example,the merged range maybe0xc0000-0xbfffffff.
>> When seabios write PAM register to change the properties
>> of part of the merged range from RW to readonly,
>> this action cause the merged IOVA mapping will be
>> unmapped.But EHCI device still send DMA cycles
>> and then IOMMU blocks the DMA cycles of EHCI device.
> 
> You've described the problem, and it is quite obviously *not* in memory.c.

Well, sort of.

The problem is that neither VFIO nor KVM support atomically switching 
the memory map.  For KVM that would be possible, for VFIO based on past 
discussion it would be much harder.  Removing flatview_simplify() seems 
to be the easiest way to bypass the issue.

That said, perhaps it's better to keep the simplification within a 
page-sized range, to avoid introducing subpages unnecessarily.

Paolo


