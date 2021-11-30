Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22541463569
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 14:25:58 +0100 (CET)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms38v-0001Ak-9S
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 08:25:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ms35I-0007Wx-5T
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ms35F-0007Tj-6j
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 08:22:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638278528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2Wi8PAXdAU9R5cY6k8W+/3v4mO5deS8maGc/G+6gik=;
 b=a8beKNC0pGQF3G/ytvo8+88++DvptyqqPpcEIjxxODQHIJ19uu+Mk+w4qI622J3dLhmAjS
 DlbvVZKig1tsYhS48puGwrTsUowZ+ugFW3wuUSYHTLobN1nuMmUELUiM230d1ErQfj1Hgj
 BOpGXCnlgIacKDAeGWBOWztkQnzcKlg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-In3Ll8xLOtGXKN-dXNv87A-1; Tue, 30 Nov 2021 08:22:06 -0500
X-MC-Unique: In3Ll8xLOtGXKN-dXNv87A-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso13742535wms.4
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 05:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y2Wi8PAXdAU9R5cY6k8W+/3v4mO5deS8maGc/G+6gik=;
 b=oIB6kyKS+yAoLESMIOWNP/9AjMOb1XV9wCWq8a+HgSRMRQ9m1/cqzoApXwk4MPPJQ/
 /TqPnCD9hP5ZQkqA7dhE5HXy8xTYZwws0+K4hHuZAL3UEP0yccZSAlJKpYRqoqkIN5oT
 SorKq21AZpYGQBZreBihidClVdTNPvclzhftccAmbdt2HRBPEWISVS6pPJdOHlYjhtpl
 9IaTaPEpNOT10vuMlOWCZT/WCIMBegB3kOwSzghzI4sf02+R3XiX1IWgimFv/S2nA2gd
 CIDhQCX3VtN/VBSb+JU2xOEN28/lEa1JjJTARbrNbe8ySHsuyPwoui2sb7j5l3YerabQ
 M9zA==
X-Gm-Message-State: AOAM532P3zK0Gpv/HoU7nDugFd9E4j7Zuq+NT72VDhf8BiRB1LXx6MbM
 bFGkU32azzlv+CJ+5irKlHM18mA4Rjatfp/Ot3EO54yEpLYHcNSBy1wJOjHwD+sY3K37CoRoudE
 fU2B/FhDk9iabLqI=
X-Received: by 2002:a5d:58fb:: with SMTP id f27mr40954760wrd.10.1638278525057; 
 Tue, 30 Nov 2021 05:22:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ4qaVSXGzkjDi+J5qd5FztSwEPCEHNw9JRAKvI4Cvp5I73jesBFufojmVGVQWZZDkjCpk8A==
X-Received: by 2002:a5d:58fb:: with SMTP id f27mr40954722wrd.10.1638278524824; 
 Tue, 30 Nov 2021 05:22:04 -0800 (PST)
Received: from xz-m1.local ([85.203.46.194])
 by smtp.gmail.com with ESMTPSA id g5sm21788565wri.45.2021.11.30.05.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:22:04 -0800 (PST)
Date: Tue, 30 Nov 2021 21:21:58 +0800
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v7 3/3] cpus-common: implement dirty page limit on vCPU
Message-ID: <YaYldsdDa6ENmSF1@xz-m1.local>
References: <cover.1638267948.git.huangy81@chinatelecom.cn>
 <692eeb1960338ff0ae027a42192e264d55342e7b.1638267948.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <692eeb1960338ff0ae027a42192e264d55342e7b.1638267948.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus ArmBruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 30, 2021 at 06:28:13PM +0800, huangy81@chinatelecom.cn wrote:
>  ##
> +# @set-dirty-limit:
> +#
> +# Set the upper limit of dirty page rate for a virtual CPU.
> +#
> +# Requires KVM with accelerator property "dirty-ring-size" set.
> +# A virtual CPU's dirty page rate is a measure of its memory load.
> +# To observe dirty page rates, use @calc-dirty-rate.
> +#
> +# @cpu-index: index of the virtual CPU.
> +#
> +# @dirty-rate: upper limit for the specified vCPU's dirty page rate (MB/s)
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "set-dirty-limit"}
> +#    "arguments": { "cpu-index": 0,
> +#                   "dirty-rate": 200 } }
> +#
> +##
> +{ 'command': 'set-dirty-limit',
> +  'data': { 'cpu-index': 'int', 'dirty-rate': 'uint64' } }
> +
> +##
> +# @cancel-dirty-limit:
> +#
> +# Cancel the dirty page limit for the vCPU which has been set with
> +# set-dirty-limit command. Note that this command requires support from
> +# dirty ring, same as the "set-dirty-limit" command.
> +#
> +# @cpu-index: index of the virtual CPU to cancel the dirty page limit
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#   {"execute": "cancel-dirty-limit"}
> +#    "arguments": { "cpu-index": 0 } }
> +#
> +##
> +{ 'command': 'cancel-dirty-limit',
> +  'data': { 'cpu-index': 'int' } }

This seems to be overloaded to be a standalone cmd..

How about:

  { "cmd": "vcpu-dirty-limit",
    "arguments": {
      "cpu": $cpu,
      "enable": true/false,
      "dirty-rate": 100,
    }
  }

If "enable"==false, then "dirty-rate" can be ignored and it'll shut down the
throttling on vcpu N.  Then this command will literally merge the two you
proposed.

It'll be nice if we provide yet another command:

  { "cmd": "query-vcpu-dirty-limit",
    "arguments": {
      "*cpu": $cpu,
    }
  }

When $cpu is specified, we return (cpu=$cpu, real_dirty_rate,
target_dirty_rate) for this vcpu.  When $cpu is not specified, we return an
array of that containing all the vcpus.

It'll be nicer to enhance the output of the query command to e.g. have a global
"enabled"=true/false as long as any vcpu has throttle enabled then the global
throttle is enabled.  I didn't think more than that, but how's that sound so
far?

Thanks,

-- 
Peter Xu


