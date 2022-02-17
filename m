Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4D4B9D29
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:31:47 +0100 (CET)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKe4e-0007Eu-79
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:31:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKdyv-0003f9-VA
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:25:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKdys-0003oY-Fd
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 05:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645093543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f16uW3U5J7lrcfYSaFG1bmbQiUsTtdUbCa5zyjzWL9g=;
 b=al3iLUo26Ijr5fcuHKTIyh3kg+TUrF25BZK9sjFh35Z/k660Pv1b9hcPvrZmHdsIEc8gMV
 qlo8uI3PmO+kYEzDV+Ezf7hymCQQMW6obpH5clwjRpGkg26cQAWf2+TEi3kXdT8CIrAZOB
 mJBLHGQ/5bCIlpokR/SSyROHIYyc+aU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-mfE9G-sxMFKbPnEw2jIvpA-1; Thu, 17 Feb 2022 05:25:42 -0500
X-MC-Unique: mfE9G-sxMFKbPnEw2jIvpA-1
Received: by mail-ed1-f69.google.com with SMTP id
 l24-20020a056402231800b00410f19a3103so3275076eda.5
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 02:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f16uW3U5J7lrcfYSaFG1bmbQiUsTtdUbCa5zyjzWL9g=;
 b=UFqjtWKDt5vwlK65D7rvRXsuFBHoDmG8iv6iRMFlaIaFZRa1ynO2yikQKfQyZHyrI9
 P77kA5Z5N6DCtOYOL3tah31l2cqvcPp+vPX7VccYobuhl30GImptKfiyDHlP0pvxI33Q
 mtJnILhIktGry6183qCJ36YXwr8v8bQ1kegHTCIKHC1hSckey0tac0huCp112hFkO6to
 S90ry02uc7SSWsoQu3HFOjh46QkaKr1ldhobbT3s53n8OTXoo8L+PESy5fwAnQweJA6s
 0H5MlHJYB6LGxLfaSoZV3xmvU7kRkIpodi7179fvh/dHhv29gDeK4UNY1+6f53WT8Rt4
 2G1Q==
X-Gm-Message-State: AOAM531vwdKXmA6tU/CXVEHy56sjhXqwSZpbkn/z2OFEMV/9/C3sLUWT
 +Xrvmxo+ohY3Lkrb4Rk1z/nuC4KKlZtD+1t2eJ0Exqq1508i1PuAcmzB3Mfvblrf7j1XoHIovI8
 WauvmzNfRzo25pKc=
X-Received: by 2002:a17:906:2a97:b0:6b4:143f:37c6 with SMTP id
 l23-20020a1709062a9700b006b4143f37c6mr1827566eje.133.1645093541476; 
 Thu, 17 Feb 2022 02:25:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBRiLjhTVEsavK9mWtdxh6QlpvrfVNejnBuVZmCjJ8LKOU9dlwQ88AF8XqGjdKMgm4wLsKSQ==
X-Received: by 2002:a17:906:2a97:b0:6b4:143f:37c6 with SMTP id
 l23-20020a1709062a9700b006b4143f37c6mr1827551eje.133.1645093541253; 
 Thu, 17 Feb 2022 02:25:41 -0800 (PST)
Received: from localhost (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id j18sm1010070ejc.166.2022.02.17.02.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 02:25:40 -0800 (PST)
Date: Thu, 17 Feb 2022 11:25:39 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH 1/1] numa: check mem or memdev in numa configuration
Message-ID: <20220217112539.43ddd55f@redhat.com>
In-Reply-To: <65f05997-dd2b-c30d-5c95-8e832f21afa0@suse.de>
References: <20220216163613.22570-1-lizhang@suse.de>
 <20220217101024.7c723f10@redhat.com>
 <65f05997-dd2b-c30d-5c95-8e832f21afa0@suse.de>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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

On Thu, 17 Feb 2022 10:38:32 +0100
Li Zhang <lizhang@suse.de> wrote:

> On 2/17/22 10:10 AM, Igor Mammedov wrote:
> > On Wed, 16 Feb 2022 17:36:13 +0100
> > Li Zhang <lizhang@suse.de> wrote:
> >   
> >> If there is no mem or memdev in numa configuration, it always
> >> reports the error as the following:
> >>
> >> total memory for NUMA nodes (0x0) should equal RAM size (0x100000000)
> >>
> >> This error is confusing and the reason is that total memory of numa nodes
> >> is always 0 if there is no mem or memdev in numa configuration.
> >> So it's better to check mem or memdev in numa configuration.
> >>
> >> Signed-off-by: Li Zhang <lizhang@suse.de>
> >> ---
> >>   hw/core/numa.c | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/hw/core/numa.c b/hw/core/numa.c
> >> index 1aa05dcf42..11cbec51eb 100644
> >> --- a/hw/core/numa.c
> >> +++ b/hw/core/numa.c
> >> @@ -132,6 +132,11 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
> >>   
> >>       have_memdevs = have_memdevs ? : node->has_memdev;
> >>       have_mem = have_mem ? : node->has_mem;
> >> +    if (!node->has_memdev && !node->has_mem) {
> >> +        error_setg(errp, "numa configuration should use mem= or memdev= ");
> >> +        return;
> >> +    }  
> > 
> > Wouldn't this breaks memory less numa nodes?  
> 
> Yes, you are right. It will break it if there more numa nodes
> than memory, and the numa nodes have no memory backends specified.
> 
> Is it allowed for users to specify more numa nodes than memory?
yep, I think we support it at least for one of the targets
(but I don't remember which one(s))

> 
> > 
> > I'd rather add/rephrase to original error message that memory
> > should be specified explicitly for desired numa nodes.
> > And I'd not mention 'mem=' since
> >    docs/about/removed-features.rst:``-numa node,mem=...`` (removed in 5.1)  
> 
> Thanks for your suggestions, I will rephrase it.
> 
> >   
> >> +
> >>       if ((node->has_mem && have_memdevs) || (node->has_memdev && have_mem)) {
> >>           error_setg(errp, "numa configuration should use either mem= or memdev=,"
> >>                      "mixing both is not allowed");  
> >   
> 


