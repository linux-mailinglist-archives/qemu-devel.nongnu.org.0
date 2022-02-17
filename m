Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F114BA301
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:31:20 +0100 (CET)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKhoV-00018i-7g
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:31:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKgum-0002F3-NX
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:33:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKguj-0000pi-Qr
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645104820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBNMAKIHVcZKs63r5Y6t4a705SFZnlw1Kv7nVwtdeew=;
 b=hMModP+2UmG1KChtbgTAVhmpaFd+VgIoMiTNJrjGvrJbreVRsK3aLnBDyY7Ku1ZqBZ8A0D
 XyXUnA+uF7iuAdYF0RoM/Fczuxq9Z9x9fQGiqU0u9c29CcdXXoyEAy5p94tu52aP9Kxn9w
 nFX3VGVXaE+UkjQv+Si2DiwHUwqqLsg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-m074rY7IMu-QNa5g0k-3QA-1; Thu, 17 Feb 2022 08:33:39 -0500
X-MC-Unique: m074rY7IMu-QNa5g0k-3QA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y13-20020aa7c24d000000b00411925b7829so3359283edo.22
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 05:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBNMAKIHVcZKs63r5Y6t4a705SFZnlw1Kv7nVwtdeew=;
 b=Tny4toNVJfVDZwxUKOQ/fxGAg/iF6DCfGWNZUJsCR3Xr5XYPkEgqCnC49c8bMF0OHE
 HBNw9MPVVB3OoqBHigsI3E6QGljMUmhbmP2ft0sSW97nHXz3omDrNDPyMiL9fEPMDvzg
 sOkXQlK+jCcnEL3VOTcayuWZfxlmCxqHMv/68/xqzxQXhAMHM+hLnqY0ew01p7PDLyJN
 q8c9ktbknXx63K5iQejTfoZWc4iKJ90Sv9TU1OjSbcxz4EhwEdoR3WiRrWIcGdRZIv/Y
 2JQHLLsO/Mk+Xz2jve9LV+inxyR61OPoN/I2DaaJ+4QJNzBaWVhLjRwmFqfzE97Qm/VJ
 WxpA==
X-Gm-Message-State: AOAM53235EQN0aKEJ1bXbufq6ox+T5Lx67Du+u/gDYF14MMpe+YffeF5
 au+ADOJzz5bKrwWFCbD22ePY+63rwvSUDFJb6MzUO4Ze3o3474cdOj05vK4Q4yFiCoKtjVMZHxL
 uwxmImSngj0GXQTE=
X-Received: by 2002:a17:906:ae97:b0:6cf:73fe:8515 with SMTP id
 md23-20020a170906ae9700b006cf73fe8515mr2355427ejb.462.1645104818306; 
 Thu, 17 Feb 2022 05:33:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx//SbgJGJZuQqH/0tqIdee3KVAE4sywew+oKH7TcdGWB5K5Wj7zbOnX5YWNFVxIBafCvaEDQ==
X-Received: by 2002:a17:906:ae97:b0:6cf:73fe:8515 with SMTP id
 md23-20020a170906ae9700b006cf73fe8515mr2355406ejb.462.1645104818031; 
 Thu, 17 Feb 2022 05:33:38 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id gq1sm1194646ejb.58.2022.02.17.05.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 05:33:37 -0800 (PST)
Date: Thu, 17 Feb 2022 14:33:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH 1/1] numa: check mem or memdev in numa configuration
Message-ID: <20220217143335.17e8ff28@redhat.com>
In-Reply-To: <f3b49aba-5fef-8c80-17c3-d577aeed6111@suse.de>
References: <20220216163613.22570-1-lizhang@suse.de>
 <20220217101024.7c723f10@redhat.com>
 <65f05997-dd2b-c30d-5c95-8e832f21afa0@suse.de>
 <20220217112539.43ddd55f@redhat.com>
 <f3b49aba-5fef-8c80-17c3-d577aeed6111@suse.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, wangyanan55@huawei.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Feb 2022 13:24:08 +0100
Li Zhang <lizhang@suse.de> wrote:

> On 2/17/22 11:25 AM, Igor Mammedov wrote:
> > On Thu, 17 Feb 2022 10:38:32 +0100
> > Li Zhang <lizhang@suse.de> wrote:
> >   
> >> On 2/17/22 10:10 AM, Igor Mammedov wrote:  
> >>> On Wed, 16 Feb 2022 17:36:13 +0100
> >>> Li Zhang <lizhang@suse.de> wrote:
> >>>      
> >>>> If there is no mem or memdev in numa configuration, it always
> >>>> reports the error as the following:
> >>>>
> >>>> total memory for NUMA nodes (0x0) should equal RAM size (0x100000000)
> >>>>
> >>>> This error is confusing and the reason is that total memory of numa nodes
> >>>> is always 0 if there is no mem or memdev in numa configuration.
> >>>> So it's better to check mem or memdev in numa configuration.
> >>>>
> >>>> Signed-off-by: Li Zhang <lizhang@suse.de>
> >>>> ---
> >>>>    hw/core/numa.c | 5 +++++
> >>>>    1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/hw/core/numa.c b/hw/core/numa.c
> >>>> index 1aa05dcf42..11cbec51eb 100644
> >>>> --- a/hw/core/numa.c
> >>>> +++ b/hw/core/numa.c
> >>>> @@ -132,6 +132,11 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
> >>>>    
> >>>>        have_memdevs = have_memdevs ? : node->has_memdev;
> >>>>        have_mem = have_mem ? : node->has_mem;
> >>>> +    if (!node->has_memdev && !node->has_mem) {
> >>>> +        error_setg(errp, "numa configuration should use mem= or memdev= ");
> >>>> +        return;
> >>>> +    }  
> >>>
> >>> Wouldn't this breaks memory less numa nodes?  
> >>
> >> Yes, you are right. It will break it if there more numa nodes
> >> than memory, and the numa nodes have no memory backends specified.
> >>
> >> Is it allowed for users to specify more numa nodes than memory?  
> > yep, I think we support it at least for one of the targets
> > (but I don't remember which one(s))
> >   
> 
> Is it okay if I put a warning here, instead of an error and return?
> It won't break the special case. I wonder if it is annoying to get
> the warning.
issuing warning in perfectly valid case (memory-less node)
doesn't look like a good thing to do.

there is already a error message,

 "total memory for NUMA nodes (0x0) should equal RAM size (0x100000000)"

I'd suggest to just fix this error message to be less confusing
instead of adding dubious warning elsewhere.

> 
> Thanks
> Li
> 
> >>  
> >>>
> >>> I'd rather add/rephrase to original error message that memory
> >>> should be specified explicitly for desired numa nodes.
> >>> And I'd not mention 'mem=' since
> >>>     docs/about/removed-features.rst:``-numa node,mem=...`` (removed in 5.1)  
> >>
> >> Thanks for your suggestions, I will rephrase it.
> >>  
> >>>      
> >>>> +
> >>>>        if ((node->has_mem && have_memdevs) || (node->has_memdev && have_mem)) {
> >>>>            error_setg(errp, "numa configuration should use either mem= or memdev=,"
> >>>>                       "mixing both is not allowed");  
> >>>      
> >>  
> >   
> 


