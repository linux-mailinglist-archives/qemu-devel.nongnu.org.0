Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EF642BC67
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 12:04:01 +0200 (CEST)
Received: from localhost ([::1]:49228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mab7A-0005II-1L
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 06:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maav5-0004em-Cp
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1maav3-00043q-KN
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634118687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYVHLcZkaFlc78AwPYW37niYdVrlGEc5zZ/jsNMxR4Y=;
 b=WqtMTiQaYzFO33UgNXuEbpMqnr0rBGf4AZBt2eMK5onGjRgzH/lF2jqb3jGOCYxlWLr45p
 lYXvmRMjSz4Vr9DfnYA/Db3XYx2qJFGur94uPzbOLSsrKD7hH6NbyJLyGCcUJ6OmTXQSHe
 ekrRCrOAwA8p4DeKkyt8VtCULvTsw2A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-2TjjHv-cPB-xpE44V2NrVg-1; Wed, 13 Oct 2021 05:51:26 -0400
X-MC-Unique: 2TjjHv-cPB-xpE44V2NrVg-1
Received: by mail-wr1-f71.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so1499270wrc.22
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZYVHLcZkaFlc78AwPYW37niYdVrlGEc5zZ/jsNMxR4Y=;
 b=j+OzxVFyWsUTomcRgBYK+3aI38JFXoZ0KTnJutfcBAs8LxDgml5QR5aPWlNfwIErA0
 20F+SE9XEytz/ZGFSvcKHjkR5YZct6hqO+DBD68yECLIAdq2scLazZxoIY3g8IHn3s/j
 DZOM3j1+MihCfiWb5g74WWOZ5oW7QtmWXq4sf0DK0ieMUCdSxv0Q5FdfZrcwPACVUsKo
 ZLkH//gaBeXMNPGvzId9CH8uz5sZ7kHwx/vRV4wbWeK/rRVylAftW487mFytaHHzqazb
 tbuNXhVIokt2pAn7Ar/5BjkDIB4Tq4lR973oq8/SFMvbMLdJnuq1vyIHxHBnXLD3tyFM
 7qsA==
X-Gm-Message-State: AOAM530m1hq5CIpDl7BVi7H7j0ogfvzvG3+WfiKeab6PVWLyCXmwro3T
 S27RLEMFo7PCZjsnnhXAhqQZtVYY3Pjxu1153s4G+6Cq7FmIp5VOc2k7UyhXSCkma6Kw70uwgIZ
 bZX5ZxtFSMwNcL7M=
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr11918529wmd.96.1634118685622; 
 Wed, 13 Oct 2021 02:51:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrcL+VsIrjHIxz6vTBLx3E7GeyYsC0MrSX4vDO/NtrvA4x6Oy3kJZsWcVF+bu6f2tKcPUXKA==
X-Received: by 2002:a1c:7fd0:: with SMTP id a199mr11918511wmd.96.1634118685442; 
 Wed, 13 Oct 2021 02:51:25 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6774.dip0.t-ipconnect.de. [91.12.103.116])
 by smtp.gmail.com with ESMTPSA id k10sm12598998wrh.64.2021.10.13.02.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 02:51:25 -0700 (PDT)
Subject: Re: [PATCH v1] libvhost-user: fix VHOST_USER_REM_MEM_REG not closing
 the fd
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211012183832.62603-1-david@redhat.com>
 <YWaraVenjaIZXHCc@stefanha-x1.localdomain>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <76ec743d-afb5-dea5-6c54-2180d176ca1a@redhat.com>
Date: Wed, 13 Oct 2021 11:51:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YWaraVenjaIZXHCc@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Coiby Xu <coiby.xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.21 11:48, Stefan Hajnoczi wrote:
> On Tue, Oct 12, 2021 at 08:38:32PM +0200, David Hildenbrand wrote:
>> We end up not closing the file descriptor, resulting in leaking one
>> file descriptor for each VHOST_USER_REM_MEM_REG message.
>>
>> Fixes: 875b9fd97b34 ("Support individual region unmap in libvhost-user")
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
>> Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Coiby Xu <coiby.xu@gmail.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   subprojects/libvhost-user/libvhost-user.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
>> index bf09693255..bb5c3b3280 100644
>> --- a/subprojects/libvhost-user/libvhost-user.c
>> +++ b/subprojects/libvhost-user/libvhost-user.c
>> @@ -839,6 +839,8 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>>           vu_panic(dev, "Specified region not found\n");
>>       }
>>   
>> +    close(vmsg->fds[0]);
> 
> Does anything check that exactly 1 fd was received? For example,
> vu_set_log_fd_exec() does:
> 
>    if (vmsg->fd_num != 1) {
>        vu_panic(dev, "Invalid log_fd message");
>        return false;
>    }
> 
> I think that's necessary both to make vhost-user master development
> easier and because fds[] is not initialized to -1.

Similarly, vu_add_mem_reg() assumes exactly one was sent AFAIKS.

If we panic, do we still have to call vmsg_close_fds() ?

-- 
Thanks,

David / dhildenb


