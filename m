Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F248AE8D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:38:36 +0100 (CET)
Received: from localhost ([::1]:35484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HMB-0003o3-Mk
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:38:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7GyK-0004fh-T5
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:13:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n7GyC-0007w7-G5
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXOKgPEHsZzoy5NsJokAvjmow+PYU1tt5wTJrwA0iwU=;
 b=CLa7plEPnVEQ/wi7L0tNPFAD2LkbyRhVY0+evTEIWYPo1zS8T3ZPThgxpu5WqythltB0cJ
 SKxTQIz/m1gS+hYM4wUumLv+r32HR4izEiWlK1D99a5ASAdvBzANflnUrKPiiWHBLuTP6S
 1sstNtz4C/xGsjIk14CLbK3m4Wn9KlA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-Q4PA08eWPUeGh_L0uerbkA-1; Tue, 11 Jan 2022 08:13:35 -0500
X-MC-Unique: Q4PA08eWPUeGh_L0uerbkA-1
Received: by mail-ed1-f70.google.com with SMTP id
 z10-20020a05640235ca00b003f8efab3342so13271767edc.2
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 05:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXOKgPEHsZzoy5NsJokAvjmow+PYU1tt5wTJrwA0iwU=;
 b=gHu/WucBM0GVV1N1lHdVPV6xf3jGMDzCkgnYmBqSoMOu4IRmVHtHdw8d7cZiK/W+ik
 v96lcJrwyv17J1f0r90rlW/56aYfO9iitBPjUddbMGajeF1zyKNLDy84DfKTvEfkro4Y
 vpelk1lvOzbcQisVLSBXPFDGiMmXElxgPFMiaTrd9XP8auIYl6XR0vm5Tx6VW023hfL0
 w5ClmPyujSodBjBpeZFl7rXlgOxCDeY05wTX0SFnOBirgC02f/h2D83j1CmZJqvmwhfq
 mVNNsmuJ1m9FU/Ux4ktNlG02NgmyjmhpZCxu3qsUbEiBA51GnEqQvlnN3CLBpAz7LLN9
 q1/Q==
X-Gm-Message-State: AOAM5301GBmLkI4Iv19HSwF1ut9TWv8WGYah7aym+u8o87rqqv5Y8ucU
 WxqXv1gSqDYHJ5OINpEmnuAlGvnisXG3Ns3vgDJlfxvb6f7nfQCoV2nB1y32JzeOrsn6MN+LKkp
 51flTZYVQ3n82G7Y=
X-Received: by 2002:a05:6402:34c9:: with SMTP id
 w9mr274703edc.403.1641906814333; 
 Tue, 11 Jan 2022 05:13:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw79W+Ghgf0V4cJJSUqzbF8EiJ7DMSlHVphBHGm0Sxphbqyd/VF88s/w5NA7CTlDb5wJtcZKg==
X-Received: by 2002:a05:6402:34c9:: with SMTP id
 w9mr274686edc.403.1641906814170; 
 Tue, 11 Jan 2022 05:13:34 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j13sm5102945edw.89.2022.01.11.05.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 05:13:33 -0800 (PST)
Date: Tue, 11 Jan 2022 14:13:32 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH] hw/smbios: Add table 4 parameter, "processor-id"
Message-ID: <20220111141332.4e0de6af@redhat.com>
In-Reply-To: <20220106223316.3661625-1-venture@google.com>
References: <20220106223316.3661625-1-venture@google.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ani@anisinha.ca, Titus Rwantare <titusr@google.com>,
 Peter Foley <pefoley@google.com>, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  6 Jan 2022 14:33:16 -0800
Patrick Venture <venture@google.com> wrote:

> This parameter is to be used in the processor_id lower 32-bit entry in

I'd call it processor_id_lo throughout the patch
or if you prefer to keep current name, then make it support full QWORD
as spec says.

> the type 4 table.  The upper 32-bits represent the features for the CPU.
> This patch leaves those as 0 when the lower 32-bits are set.

why 0 it out instead of using smbios_cpuid_features value?


> This parameter is set as optional and if left will use the values from
> the CPU model.
> 
> This enables hiding the host information from the guest and allowing AMD
> VMs to run pretending to be Intel for some userspace software concerns.

> Reviewed-by: Peter Foley <pefoley@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  hw/smbios/smbios.c | 19 ++++++++++++++++---
>  qemu-options.hx    |  1 +
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 7397e56737..0553ee0b17 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -104,9 +104,11 @@ static struct {
>      const char *sock_pfx, *manufacturer, *version, *serial, *asset, *part;
>      uint64_t max_speed;
>      uint64_t current_speed;
> +    uint32_t processor_id;



>  } type4 = {
>      .max_speed = DEFAULT_CPU_SPEED,
> -    .current_speed = DEFAULT_CPU_SPEED
> +    .current_speed = DEFAULT_CPU_SPEED,
> +    .processor_id = 0,
>  };
>  
>  static struct {
> @@ -327,6 +329,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
>          .name = "part",
>          .type = QEMU_OPT_STRING,
>          .help = "part number",
> +    }, {
> +        .name = "processor-id",
> +        .type = QEMU_OPT_NUMBER,
> +        .help = "processor id",
>      },
>      { /* end of list */ }
>  };
> @@ -669,8 +675,13 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      t->processor_type = 0x03; /* CPU */
>      t->processor_family = 0x01; /* Other */
>      SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufacturer);
> -    t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
> -    t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
> +    if (type4.processor_id == 0) {
> +        t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
> +        t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
> +    } else {
> +        t->processor_id[0] = cpu_to_le32(type4.processor_id);
> +        t->processor_id[1] = 0;
> +    }
>      SMBIOS_TABLE_SET_STR(4, processor_version_str, type4.version);
>      t->voltage = 0;
>      t->external_clock = cpu_to_le16(0); /* Unknown */
> @@ -1292,6 +1303,8 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>              save_opt(&type4.serial, opts, "serial");
>              save_opt(&type4.asset, opts, "asset");
>              save_opt(&type4.part, opts, "part");
> +            /* If the value is 0, it will take the value from the CPU model. */
> +            type4.processor_id = qemu_opt_get_number(opts, "processor-id", 0);
>              type4.max_speed = qemu_opt_get_number(opts, "max-speed",
>                                                    DEFAULT_CPU_SPEED);
>              type4.current_speed = qemu_opt_get_number(opts, "current-speed",
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ec90505d84..3c51b6cf8f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2527,6 +2527,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 3 fields\n"
>      "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
>      "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
> +    "              [,processor-id=%d]\n"
>      "                specify SMBIOS type 4 fields\n"
>      "-smbios type=11[,value=str][,path=filename]\n"
>      "                specify SMBIOS type 11 fields\n"

missing update of SRST part



