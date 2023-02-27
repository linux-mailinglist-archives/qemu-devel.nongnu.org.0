Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63446A42FF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdeV-0004zt-Av; Mon, 27 Feb 2023 08:34:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWdch-0004Vh-Vj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:33:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWdcg-0007L4-Kq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677504777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPF6OqkldqKMAfXygeIPr6QHZzjaTi2wskjIdYzJSBk=;
 b=Ggbt3M9WkDdR/CHsGAICsJazT5wf3Ie128PFOztg7G+TjWQUxdoTEC836utyeBX2zAmUj4
 8I1KmfSwxAX1QuGlruMcF+HZUY4xX+kpLEVir/dJ1gu4uWdRi8q7VQsSm2XmM56tu5ydQu
 IId8eqc+RZNwqK4UN+5CeAtBCV5rQQ0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-212-HXb3IJ4HPtK5AbFLD28JkA-1; Mon, 27 Feb 2023 08:32:53 -0500
X-MC-Unique: HXb3IJ4HPtK5AbFLD28JkA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k36-20020a05600c1ca400b003eac86e4387so5335244wms.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 05:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hPF6OqkldqKMAfXygeIPr6QHZzjaTi2wskjIdYzJSBk=;
 b=bpxC+3DwwFDzQcH9wfP54Tp5H8EwFzNBvgciblrCjlGb9lCh/QOnB0XWnbvIzbcqWX
 6352mRcXMExDudOnu7jNSxVky1Mq+b0oF9xNPrzVg/JeuQ+3x4zju5g1wGqUeyLTZc1Z
 kto12zG+skzPwKyJSLjzfhAUQWME744GuTuB3z05bgO8Y76pEQJXjGbdaGPu50qANo1J
 lbQpnfejSpslT+uDwt6bjEUPSTbeYSY81kmJkokjNB02NlMoBNyAAS8L7ErUQLqqtQhs
 z0atbrM11e6aW+u7q9kUb3V36WcQiNT4RLu9CR6SQQLWUh7i3yRMPjgiQu4jEd8MfjIh
 Jq9Q==
X-Gm-Message-State: AO0yUKXe7lTdqczikPn4IpidXz9UAHZWc2yLl4Gt7ZBlmTOuuJvVL99v
 qcKwDJ1OC1UXRxgIDMdqfT3I1JUNx6Z5Jlyuu0EPnD6Gs3LW1NWKPB04Q4hsQDAhYZOaoOMI8Jl
 NIGm1TMaFq5S1KBI=
X-Received: by 2002:a05:600c:1c86:b0:3ea:ed4d:38f6 with SMTP id
 k6-20020a05600c1c8600b003eaed4d38f6mr12435575wms.4.1677504772805; 
 Mon, 27 Feb 2023 05:32:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/HHsOVoCqCSi4LLgNkgXWJ8tbRO76NvBzHEZr9RzACY5CRnnRRggW5lBz8VKGsyv0o7aCVfQ==
X-Received: by 2002:a05:600c:1c86:b0:3ea:ed4d:38f6 with SMTP id
 k6-20020a05600c1c8600b003eaed4d38f6mr12435555wms.4.1677504772515; 
 Mon, 27 Feb 2023 05:32:52 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 c2-20020a5d4cc2000000b002bfd524255esm6983507wrt.43.2023.02.27.05.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:32:51 -0800 (PST)
Message-ID: <9a029d4e-4794-9a6a-7516-bed8feb39d97@redhat.com>
Date: Mon, 27 Feb 2023 14:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v16 10/11] qapi/s390x/cpu topology:
 CPU_POLARIZATION_CHANGE qapi event
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-11-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230222142105.84700-11-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 22/02/2023 15.21, Pierre Morel wrote:
> When the guest asks to change the polarization this change
> is forwarded to the admin using QAPI.
> The admin is supposed to take according decisions concerning
> CPU provisioning.

I still find it weird talking about "the admin" here. I don't think any 
human will monitor this event to take action on it. Maybe rather talk about 
the "upper layer" (libvirt) or whatever you have in mind to monitor this event?

> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index baa9d273cf..e7a9049c1f 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -389,3 +389,37 @@
>     'features': [ 'unstable' ],
>     'if': { 'all': [ 'TARGET_S390X' ] }
>   }
> +
> +##
> +# @CPU_POLARIZATION_CHANGE:
> +#
> +# Emitted when the guest asks to change the polarization.
> +#
> +# @polarization: polarization specified by the guest
> +#
> +# Features:
> +# @unstable: This command may still be modified.
> +#
> +# The guest can tell the host (via the PTF instruction) whether the
> +# CPUs should be provisioned using horizontal or vertical polarization.
> +#
> +# On horizontal polarization the host is expected to provision all vCPUs
> +# equally.
> +# On vertical polarization the host can provision each vCPU differently.
> +# The guest will get information on the details of the provisioning
> +# the next time it uses the STSI(15) instruction.
> +#
> +# Since: 8.0
> +#
> +# Example:
> +#
> +# <- { "event": "CPU_POLARIZATION_CHANGE",
> +#      "data": { "polarization": 0 },
> +#      "timestamp": { "seconds": 1401385907, "microseconds": 422329 } }
> +#

I'd remove the final empty line.

> +##
> +{ 'event': 'CPU_POLARIZATION_CHANGE',
> +  'data': { 'polarization': 'CpuS390Polarization' },
> +  'features': [ 'unstable' ],
> +  'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
> +}

  Thomas


