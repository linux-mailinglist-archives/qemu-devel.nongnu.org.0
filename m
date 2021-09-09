Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A34049F8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 13:43:46 +0200 (CEST)
Received: from localhost ([::1]:46078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIT3-0008IC-Rb
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 07:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOIO5-0005rp-1P; Thu, 09 Sep 2021 07:38:37 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hare@suse.de>)
 id 1mOIO2-0008OG-ML; Thu, 09 Sep 2021 07:38:36 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99AF0201D1;
 Thu,  9 Sep 2021 11:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631187512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUQC+ti/ZKvHEtIl+EkXDYGwkerFAXtk5w/AcfGEWLk=;
 b=2Pzi3TTlK5D3J7NKMi36KFu+vQ3DkjUa+Pit3+fB1W0ZIwm3iyGVBg8VNwliIg8Wb1yjjE
 LZFd8aWaDLlmFRdcCwfYdv7ODZe+oVbDzpq6PjhfPejpoeZJFdz8bOF1SMv4MF23AxopVr
 Y42wDCSK7kUI0GXpJ0005G2NIYKk5Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631187512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUQC+ti/ZKvHEtIl+EkXDYGwkerFAXtk5w/AcfGEWLk=;
 b=p4dS/y9zC6tnix7//dmwpC/wHmU/nhag13z+7vdsv5vOi7+0WzTnWmAh6o+cp2xbZO7Q75
 uyxq1L+qbWjagNCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DD3713A5D;
 Thu,  9 Sep 2021 11:38:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z+k8IjjyOWGRXAAAMHmgww
 (envelope-from <hare@suse.de>); Thu, 09 Sep 2021 11:38:32 +0000
Subject: Re: [PATCH] hw/nvme: select first free NSID for legacy drive
 configuration
To: Klaus Jensen <its@irrelevant.dk>
References: <20210909095159.122174-1-hare@suse.de>
 <YTnnd/ThFAb7OMlf@apples.localdomain>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <03e281e1-7dff-539e-1370-f05dd9a1c625@suse.de>
Date: Thu, 9 Sep 2021 13:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YTnnd/ThFAb7OMlf@apples.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=hare@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 12:52 PM, Klaus Jensen wrote:
> On Sep  9 11:51, Hannes Reinecke wrote:
>> If a legacy 'drive' argument is passed to the controller we cannot
>> assume that '1' will be a free NSID, as the subsys might already
>> have attached a namespace to this NSID. So select the first free
>> one.
>>
>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>> ---
>>  hw/nvme/ctrl.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index 757cdff038..2c69031ca9 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -6546,8 +6546,15 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>>  
>>      /* setup a namespace if the controller drive property was given */
>>      if (n->namespace.blkconf.blk) {
>> +        int i;
>>          ns = &n->namespace;
>> -        ns->params.nsid = 1;
>> +        for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
>> +            if (nvme_ns(n, i) || nvme_subsys_ns(n->subsys, i)) {
>> +                continue;
>> +            }
>> +            ns->params.nsid = i;
>> +            break;
>> +        }
>>  
>>          if (nvme_ns_setup(ns, errp)) {
>>              return;
>> -- 
>> 2.26.2
>>
> 
> Did you actually hit this?
> 
> Because then then property checking logic is bad... The device is not
> supposed to allow nvme,drive= combined with a subsystem property. In
> nvme_check_constraints():
> 
>   if (n->namespace.blkconf.blk && n->subsys) {
>     /* error out */
>     return;
>   }
> 
> 
Ah. Missed that.
Do ignore my patch then.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer

