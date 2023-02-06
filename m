Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D8C68BBD6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzpT-0004TJ-TN; Mon, 06 Feb 2023 06:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOzpC-0004QP-BE
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:38:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOzpA-0006ZP-IH
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675683495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yurOwrSYkMEr1+LImfWS1Ft2DGAumqBBKks44Ulqjc=;
 b=eJcWTMcnWY6KZZHNt/18zA8k/SbjulkThm35DfJB4hEN5LC779K4t4c9y/BhabUY5KV8Fs
 I+mOqzAOzQMbKP+rTaeL0rcvUmpJv2fxCI3KwquRa5aourUZFbBsrU5vaWqedrB226PfQ9
 VnQfCJm7oTG6DD5pOIyaDhXwvkqVHJk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-qKTqeFi6MtO6PiUxT4AU-Q-1; Mon, 06 Feb 2023 06:38:14 -0500
X-MC-Unique: qKTqeFi6MtO6PiUxT4AU-Q-1
Received: by mail-qv1-f70.google.com with SMTP id
 ob12-20020a0562142f8c00b004c6c72bf1d0so5606412qvb.9
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 03:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0yurOwrSYkMEr1+LImfWS1Ft2DGAumqBBKks44Ulqjc=;
 b=ryPDyNKrn95LWL3MnSmyQbwUTu7PmL4NXyitrUnREOE2Osm5i0G4Q58ZJmo0XFdoKD
 0gJoF7w/D+8a6L0F7Wd1iCfPdhT77bhjTKAGjge9d6QpAgJb5nIvtA6aQc5oTxyP5s1q
 mlelIYP3GEQb9hZgcHvhvAFlve9ujAr7+KGcUwg0iZQ36xYK9vuLEC211LmOXv3h9XD1
 jlO6oJApnwCPbsms709hsUM6KegUctOJYnsSS9XTC4IP9ShGbiLnNIuP9OdLyE3ESx+1
 NyXotAP4+Ob5N9eYlOJJ6ir2QYxEBMgKbSScxnEJd/xrtOWIKYdbLvczgcPtMRwIJfeN
 dSxA==
X-Gm-Message-State: AO0yUKVMn0BlX4zgaqhAFIb+9Ys53RVHYKSeBcXQrXPJz9wnHxJZHhDU
 IzytAvxNbD8pZyu1K4zNNyonZWCKDvf92uaaSKva3mj60n2YpVg4pkLa47xFddDWPdZMmTVq3aE
 Yd5hRgBNC0zoS8ps=
X-Received: by 2002:a05:6214:20e3:b0:537:7e74:2d6a with SMTP id
 3-20020a05621420e300b005377e742d6amr34541896qvk.3.1675683493907; 
 Mon, 06 Feb 2023 03:38:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9bdEFqgHWp1C10RyzvDFI9sRYQyMXT5vVscDNqI9UVkgLuRwREcF7/JuyuS0N//oHHVy6q/Q==
X-Received: by 2002:a05:6214:20e3:b0:537:7e74:2d6a with SMTP id
 3-20020a05621420e300b005377e742d6amr34541864qvk.3.1675683493674; 
 Mon, 06 Feb 2023 03:38:13 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 h67-20020a376c46000000b0070495934152sm7266775qkc.48.2023.02.06.03.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:38:13 -0800 (PST)
Message-ID: <92533b03-f07e-736a-4e29-bcdf883f7ec4@redhat.com>
Date: Mon, 6 Feb 2023 12:38:08 +0100
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
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-7-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v15 06/11] s390x/cpu topology: interception of PTF
 instruction
In-Reply-To: <20230201132051.126868-7-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01/02/2023 14.20, Pierre Morel wrote:
> When the host supports the CPU topology facility, the PTF
> instruction with function code 2 is interpreted by the SIE,
> provided that the userland hypervizor activates the interpretation

s/hypervizor/hypervisor/

> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
> 
> The PTF instructions with function code 0 and 1 are intercepted
> and must be emulated by the userland hypervizor.

dito

> During RESET all CPU of the configuration are placed in
> horizontal polarity.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
>   /**
>    * s390_topology_reset:
>    *
>    * Generic reset for CPU topology, calls s390_topology_reset()
>    * s390_topology_reset() to reset the kernel Modified Topology
>    * change record.
> + * Then set global and all CPUs polarity to POLARITY_HORIZONTAL.

You describe here already what's going to happen...

>    */
>   void s390_topology_reset(void)
>   {
>       s390_cpu_topology_reset();
> +    /* Set global polarity to POLARITY_HORIZONTAL */

... then here again ...

> +    s390_topology.polarity = POLARITY_HORIZONTAL;

... and the code is (fortunately) also very self-exaplaining...

> +    /* Set all CPU polarity to POLARITY_HORIZONTAL */
> +    s390_topology_set_cpus_polarity(POLARITY_HORIZONTAL);

... so I'd rather drop the two comments within the function body.

>   }

(rest of the patch looks fine to me)

  Thomas


