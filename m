Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859D8663F58
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:38:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFCwc-0001en-Fh; Tue, 10 Jan 2023 06:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFCwa-0001dd-1t
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 06:37:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFCwY-0002gL-2x
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 06:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673350641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pu3RT7qcowUmDiVIh0NP56qSN2EZOoXQWqlASCWWjk8=;
 b=JorSKB3mde9+46I/E4g/O7w/Irfoos8HESg0pKi3FKVPYPPuR2xBJUGCJv9gSCIknvvrBL
 OVFKuoe3e3g6cDd0dMiHOfgxNc9ect4zXsmFt0N5l5FlQm4lqFrojqa9muELmk8xWh2Zqf
 II+0+yXzRZwCxhm9/IExfgdYS0KTpiw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-ScL5-sYcMCy0vZ8DjmDx3w-1; Tue, 10 Jan 2023 06:37:20 -0500
X-MC-Unique: ScL5-sYcMCy0vZ8DjmDx3w-1
Received: by mail-qk1-f198.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so8522132qkl.9
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 03:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pu3RT7qcowUmDiVIh0NP56qSN2EZOoXQWqlASCWWjk8=;
 b=4DIlRje+sCTzSdCLbyfIiSoSRXcO71skhEFwxPysx1Ma5jhg+HGv9GAr6FI8ALZOqo
 +Wi6DEoUKUlp1fTFAOxguJpAcp0biCKSxDtcptX6IQ9Y7Mb7zbSnY1G349f2P6M5Im0w
 4mHB2nMGp+WH9aKuQee7V97LzjAnaeqQglWyTAhGopV+9gZBmWi2Ktau4EF+8wBh/Uub
 NHzuRuHvCBuAkEFZcSsqfsccDywwORraiM3yrdtThiWOLYkTQUgk8Q2tjw2G7Fx4M7ma
 lBmmCed+wQxcdhP2DaDhbwkTKAALlcs4C0apm8StZt3YaI2YB53QviWZTso9BUkDq2T/
 7UjQ==
X-Gm-Message-State: AFqh2krmcIIUIvridW5PD4KQZ7vorwmG/k4QqrrcIn3Ioo9b7sTbSETr
 PPFeWnGUkk8COTpxdtXvY5XNyqoBn78Lb1oiH72eBeieZ996v8A4nqO7kJ3bS6e9S/AhG2bIoP0
 U5FK97WOpfEtpTl4=
X-Received: by 2002:ac8:5297:0:b0:3a6:9cfa:d6c with SMTP id
 s23-20020ac85297000000b003a69cfa0d6cmr3903581qtn.39.1673350639806; 
 Tue, 10 Jan 2023 03:37:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu7DuRgMqmzRXitL9iQyjAQmifcaCoSY8opYmE9WcFM8y9fFzrdT1BVHJ39hSaikGWjrGSm3w==
X-Received: by 2002:ac8:5297:0:b0:3a6:9cfa:d6c with SMTP id
 s23-20020ac85297000000b003a69cfa0d6cmr3903544qtn.39.1673350639559; 
 Tue, 10 Jan 2023 03:37:19 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-237.web.vodafone.de.
 [109.43.179.237]) by smtp.gmail.com with ESMTPSA id
 x10-20020a05620a448a00b006faa2c0100bsm7025280qkp.110.2023.01.10.03.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 03:37:19 -0800 (PST)
Message-ID: <49d343fb-f41d-455a-8630-3db2650cfcd5@redhat.com>
Date: Tue, 10 Jan 2023 12:37:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-2-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v14 01/11] s390x/cpu topology: adding s390 specificities
 to CPU topology
In-Reply-To: <20230105145313.168489-2-pmorel@linux.ibm.com>
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

On 05/01/2023 15.53, Pierre Morel wrote:
> S390 adds two new SMP levels, drawers and books to the CPU
> topology.
> The S390 CPU have specific toplogy features like dedication
> and polarity to give to the guest indications on the host
> vCPUs scheduling and help the guest take the best decisions
> on the scheduling of threads on the vCPUs.
> 
> Let us provide the SMP properties with books and drawers levels
> and S390 CPU with dedication and polarity,
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/qapi/machine.json b/qapi/machine.json
> index b9228a5e46..ff8f2b0e84 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -900,13 +900,15 @@
>   # a CPU is being hotplugged.
>   #
>   # @node-id: NUMA node ID the CPU belongs to
> -# @socket-id: socket number within node/board the CPU belongs to
> +# @drawer-id: drawer number within node/board the CPU belongs to
> +# @book-id: book number within drawer/node/board the CPU belongs to
> +# @socket-id: socket number within book/node/board the CPU belongs to

I think the new entries need a "(since 8.0)" comment (similar to die-id and 
cluster-id below).

Other question: Do we have "node-id"s on s390x? If not, is that similar to 
books or drawers, i.e. just another word? If so, we should maybe rather 
re-use "nodes" instead of introducing a new name for the same thing?

>   # @die-id: die number within socket the CPU belongs to (since 4.1)
>   # @cluster-id: cluster number within die the CPU belongs to (since 7.1)
>   # @core-id: core number within cluster the CPU belongs to
>   # @thread-id: thread number within core the CPU belongs to
>   #
> -# Note: currently there are 6 properties that could be present
> +# Note: currently there are 8 properties that could be present
>   #       but management should be prepared to pass through other
>   #       properties with device_add command to allow for future
>   #       interface extension. This also requires the filed names to be kept in
> @@ -916,6 +918,8 @@
>   ##
>   { 'struct': 'CpuInstanceProperties',
>     'data': { '*node-id': 'int',
> +            '*drawer-id': 'int',
> +            '*book-id': 'int',
>               '*socket-id': 'int',
>               '*die-id': 'int',
>               '*cluster-id': 'int',
> @@ -1465,6 +1469,10 @@
>   #
>   # @cpus: number of virtual CPUs in the virtual machine
>   #
> +# @drawers: number of drawers in the CPU topology
> +#
> +# @books: number of books in the CPU topology
> +#

These also need a "(since 8.0)" comment at the end.

>   # @sockets: number of sockets in the CPU topology
>   #
>   # @dies: number of dies per socket in the CPU topology
> @@ -1481,6 +1489,8 @@
>   ##
>   { 'struct': 'SMPConfiguration', 'data': {
>        '*cpus': 'int',
> +     '*drawers': 'int',
> +     '*books': 'int',
>        '*sockets': 'int',
>        '*dies': 'int',
>        '*clusters': 'int',
...
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7f99d15b23..8dc9a4c052 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -250,11 +250,13 @@ SRST
>   ERST
>   
>   DEF("smp", HAS_ARG, QEMU_OPTION_smp,
> -    "-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]\n"
> +    "-smp [[cpus=]n][,maxcpus=maxcpus][,drawers=drawers][,books=books][,sockets=sockets][,dies=dies][,clusters=clusters][,cores=cores][,threads=threads]\n"

This line now got too long. Please add a newline inbetween.

>       "                set the number of initial CPUs to 'n' [default=1]\n"
>       "                maxcpus= maximum number of total CPUs, including\n"
>       "                offline CPUs for hotplug, etc\n"
> -    "                sockets= number of sockets on the machine board\n"
> +    "                drawers= number of drawers on the machine board\n"
> +    "                books= number of books in one drawer\n"
> +    "                sockets= number of sockets in one book\n"
>       "                dies= number of dies in one socket\n"
>       "                clusters= number of clusters in one die\n"
>       "                cores= number of cores in one cluster\n"

  Thomas


