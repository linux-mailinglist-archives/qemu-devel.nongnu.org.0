Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B613F4B8E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:19:23 +0200 (CEST)
Received: from localhost ([::1]:59026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9rF-0003p0-TQ
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI9pr-0002Oz-8b
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:17:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mI9pl-000421-W5
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 09:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629724668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5YaOf3HB14YM6CCnYxXqbgkxIksp59+XJqdWJTA3Zco=;
 b=h7p95nU68BAq5kZBcyAXdis8w/Wz9D6Pu07F8rokmJi5AVThBGQr6IbNq2Zkr8luW2JNMJ
 CNG4XGS0JvbwIPgOXwqHM+W5DHcjKpzKlHSeSK9PnOTRJjzDgpef4Qz5/7KhNjNKi/s1Hw
 N9AAwd6q4UMcXCQ+fHCc7GK7WTWsbcU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-UmDubWbLOJykHzK70rX_vg-1; Mon, 23 Aug 2021 09:17:47 -0400
X-MC-Unique: UmDubWbLOJykHzK70rX_vg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a9-20020a0560000509b029015485b95d0cso5069213wrf.5
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 06:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5YaOf3HB14YM6CCnYxXqbgkxIksp59+XJqdWJTA3Zco=;
 b=BuIYoa8KNS06aaFkZ/H8bRPvaeiYsNrLW/FEksEVY9zIyKQY4KOypEtx8sArNMJkbN
 /9PyVb17Pm0BKvuE/gfyaR+1d6yGL73gtGCSUw8YD70c39LmvZZXFAEGSJ4u/VzC68ve
 SkqP3cf3hGWXVbhgdEYJuYiWIOEN+sxvNpoZxGp8bH4phFZGa3Upff00Dqwq6M1ds40U
 I3Jw6wXMqgSXJlfrio4+dsFR6Gck3P6o4l9RDkyWPL6B5PWRX+KTYv2Ls4tSTMZWdxXR
 Yet35aixiK+WqkkIq5G8CTeqe0ij0Dj+XsnwwHPLrrqrdX0zg58QxPG1yfleN+wbkUM6
 ixjQ==
X-Gm-Message-State: AOAM531wBzN1/4r0TSrtXMYcyqt1xAWJAEFCGWyiFQCj9XD0EiLtkAqm
 nlL7XZhE6Ds3DfR25Ps00vA+fN/N9FjjpqKwise1/f7Uu8NJ/44qdnDvZonVcipU37fT/I5HOeQ
 45zuHUSO+w5TYhTM=
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr15821280wmq.88.1629724666310; 
 Mon, 23 Aug 2021 06:17:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf7QIUe+D5kX+xQrjkgAoYHR+XJJ1gb+PHRwgANtZg2KIbN8ONJy/MdPDN+dCr2Au/RROIDA==
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr15821236wmq.88.1629724666064; 
 Mon, 23 Aug 2021 06:17:46 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y14sm15215320wrs.29.2021.08.23.06.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 06:17:45 -0700 (PDT)
Subject: Re: [PATCH v7 05/15] machine: Improve the error reporting of smp
 parsing
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20210823122804.7692-1-wangyanan55@huawei.com>
 <20210823122804.7692-6-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c5a2bacc-ea23-6de7-2dd5-f0451034d2a8@redhat.com>
Date: Mon, 23 Aug 2021 15:17:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823122804.7692-6-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Thomas Huth <thuth@redhat.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 2:27 PM, Yanan Wang wrote:
> We have two requirements for a valid SMP configuration:
> the product of "sockets * cores * threads" must represent all the
> possible cpus, i.e., max_cpus, and then must include the initially
> present cpus, i.e., smp_cpus.
> 
> So we only need to ensure 1) "sockets * cores * threads == maxcpus"
> at first and then ensure 2) "maxcpus >= cpus". With a reasonable
> order of the sanity check, we can simplify the error reporting code.
> When reporting an error message we also report the exact value of
> each topology member to make users easily see what's going on.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c | 22 +++++++++-------------
>  hw/i386/pc.c      | 24 ++++++++++--------------
>  2 files changed, 19 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 85908abc77..093c0d382d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -779,25 +779,21 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>      maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
>      cpus = cpus > 0 ? cpus : maxcpus;
>  
> -    if (sockets * cores * threads < cpus) {
> -        error_setg(errp, "cpu topology: "
> -                   "sockets (%u) * cores (%u) * threads (%u) < "
> -                   "smp_cpus (%u)",
> -                   sockets, cores, threads, cpus);
> +    if (sockets * cores * threads != maxcpus) {
> +        error_setg(errp, "Invalid CPU topology: "
> +                   "product of the hierarchy must match maxcpus: "
> +                   "sockets (%u) * cores (%u) * threads (%u) "
> +                   "!= maxcpus (%u)",
> +                   sockets, cores, threads, maxcpus);
>          return;
>      }

Thinking about scalability, MachineClass could have a
parse_cpu_topology() handler, and this would be the
generic one. Principally because architectures don't
use the same terms, and die/socket/core/thread arrangement
is machine specific (besides being arch-spec).
Not a problem as of today, but the way we try to handle
this generically seems over-engineered to me.

[unrelated to this particular patch]


