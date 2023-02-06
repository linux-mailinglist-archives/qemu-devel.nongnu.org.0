Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEAF68BAF3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:06:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzJg-0008AQ-2q; Mon, 06 Feb 2023 06:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOzJd-00089e-LI
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOzJc-0000PT-AG
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675681539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UfjfmUxwTKU+QXw1YU4iVeGaLQIE4RvLq+RBzp6IhnA=;
 b=Mvsu0kqO4aATBvHTTc+/VbeSFO8F1vfgZBb0Mcoo+PGx79IjJZspOvJ4K56XRemHxtbAj0
 +yulEAilLwwmGkbdETDaNlXmg7DrXxeq1gD3nqY7jGANqNZUTxwJxbBsO7p1wukyofB7v4
 mNefNCabT0qj6yDY7icv0dCZGRwXYuY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-uYVuTaPjPr-0fkGkl6MbJg-1; Mon, 06 Feb 2023 06:05:38 -0500
X-MC-Unique: uYVuTaPjPr-0fkGkl6MbJg-1
Received: by mail-qv1-f71.google.com with SMTP id
 gw11-20020a0562140f0b00b0053b81ec39dfso5655654qvb.14
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 03:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UfjfmUxwTKU+QXw1YU4iVeGaLQIE4RvLq+RBzp6IhnA=;
 b=wasRDgzsljmUL1Clo7/SK495Hb4AJks6/6zpr1aL4nPGCsEd4Bp3C6dJddvx4yFd/w
 W9/zfgpGj+ewe1Bl1aUKGgyawTSttxfPLYdzy/Nzqbejxt/T/3G6ACbVOBbK/3c96JU+
 UPcUBNUZwyH0D30WSrDug1+alHIIUqXtnbDpZm7FDpQpmtl6RNNfKW3b2IObW/+LCCFy
 kgABFMUuOfaJhHCrMmX6eu5VE8ofiWgzWPmhGZpnRaqZJ+anKSXFXqmavkYHawKVMymv
 1s2wA01TpQhlw8r8R0Tocd2vQSDrbaK5g+xTMkC7CTtB8gdxlg1TN3G25Q2Gpt/WQb25
 SWdQ==
X-Gm-Message-State: AO0yUKVzBpM1Xv/Pui0v2vJDs+Ph+NBEhrR+x+yDcxochh8wcVvz8koq
 TmO8Zdo3FaE7hRfqyPGDVk93xWpkY6yCbbQ3qOqPeSp/dGycipMSp1pXnuN+BumDUKemCFaczbp
 nD0hCgvnh/9NgNvM=
X-Received: by 2002:a05:6214:501d:b0:56b:f017:c2e4 with SMTP id
 jo29-20020a056214501d00b0056bf017c2e4mr10691130qvb.47.1675681537132; 
 Mon, 06 Feb 2023 03:05:37 -0800 (PST)
X-Google-Smtp-Source: AK7set+OMXux1Z7XKGdmznt0xi2H1VDXN88UtnWbMtsGZ4wF12iXYhWtqpIGrrXVBQv9auGxGBAV1A==
X-Received: by 2002:a05:6214:501d:b0:56b:f017:c2e4 with SMTP id
 jo29-20020a056214501d00b0056bf017c2e4mr10691100qvb.47.1675681536928; 
 Mon, 06 Feb 2023 03:05:36 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05620a0e8c00b006f7ee901674sm7191289qkm.2.2023.02.06.03.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 03:05:36 -0800 (PST)
Message-ID: <88c4686a-985c-9465-d4dd-6cd5b2faa026@redhat.com>
Date: Mon, 6 Feb 2023 12:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v15 05/11] s390x/cpu topology: resetting the
 Topology-Change-Report
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-6-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230201132051.126868-6-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> During a subsystem reset the Topology-Change-Report is cleared
> by the machine.
> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
> bit of the SCA in the case of a subsystem reset.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
...
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> index a80a1ebf22..cf63f3dd01 100644
> --- a/hw/s390x/cpu-topology.c
> +++ b/hw/s390x/cpu-topology.c
> @@ -85,6 +85,18 @@ static void s390_topology_init(MachineState *ms)
>       QTAILQ_INSERT_HEAD(&s390_topology.list, entry, next);
>   }
>   
> +/**
> + * s390_topology_reset:
> + *
> + * Generic reset for CPU topology, calls s390_topology_reset()
> + * s390_topology_reset() to reset the kernel Modified Topology

Duplicated s390_topology_reset() in the comment.

> + * change record.
> + */
> +void s390_topology_reset(void)
> +{
> +    s390_cpu_topology_reset();
> +}

With the nit fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


