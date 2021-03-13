Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF95339DB7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 12:16:14 +0100 (CET)
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL2Fg-0000py-TX
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 06:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL2E2-0000Aw-8v; Sat, 13 Mar 2021 06:14:30 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL2E0-0000dx-Rf; Sat, 13 Mar 2021 06:14:30 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v15so6186086wrx.4;
 Sat, 13 Mar 2021 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A+M8AoZKM+sLg+FFN2PARZWdK2vNN6m7XhOhaXg3Gso=;
 b=OlfD4kJ1JfXIwNykfvE+lPR0SCk7wl7OZHCuvW0y3366DdiO4BIYZCUgygJ+o73cID
 pVjbPwonM4xiFTHGL5b41RwWeUVyiC5n6zzm/1Nb7sTr9spb7yk4+Xu2F/LsRBVcmAzc
 aFFeAP4df5/bk5DxcnfYdq4CfvNaoF8b2FxjdKXrlJG4JcB+Zs6EWLdNlxEtuSIN1NMG
 Op2B4V4AkzhTUqT+Yu2KNgdO9UTh0JmKBOFNe1CULrPAMrgTup6j4dpb31/HK1sdGKjD
 UvluLfGp5TQ6ip2xc9k8Rja8zF729Xp5QMBd4Hg92ohMbCw/SySQjD3s86pVOWrhdOcL
 ozkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A+M8AoZKM+sLg+FFN2PARZWdK2vNN6m7XhOhaXg3Gso=;
 b=DaA4JBE97NyqTcYaTgQnGDbowuRJYyXdpvrOTWidVJqZHx8KElrxrr1vb3yiCV45xW
 2CHpjatgIRTwnZ2SsAwHHavLscAj1+DBSFZXLQ8CTsoJYxzL7Eb+4S2m5ZcKOGKGR28f
 KEQjpoUoNWwvhz2Q7w2E74/023/CTFd1Cl0zJGEG7Zk2JMuJVvDUOBigy0Lhy2YjOM52
 /uGThmm6OAfBleraVXrbk0VvNZQiqWgc4W6f62yzvqfEzh6koc4WW8MzpjLNPCQhUcYR
 NLkwTVaFPVIWZngZPvu7lMSFS/eqQtxrh80+BVpnr5ptUTx4TEsYDggtZ2yo5ID/xwoW
 PbAw==
X-Gm-Message-State: AOAM530dJdElry/zDzsWsobCDWYdmerJei7iX4VTJ3nEHrT9wtL6y92/
 vNKcXAR5975VQqTg6EBOSLM=
X-Google-Smtp-Source: ABdhPJwdocPkUltvvU1gv61LVW8lDKWxiuED7ki/Iecyvvco/1g9RYYf8P7NTKqSL30xnFxAg6juKg==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr18557699wrn.315.1615634066559; 
 Sat, 13 Mar 2021 03:14:26 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id s3sm12028065wrt.93.2021.03.13.03.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 03:14:25 -0800 (PST)
Subject: Re: [PATCH 5/5] memory: Make sure root MR won't be added as subregion
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-6-f4bug@amsat.org>
Message-ID: <3513e265-4d89-3d54-594d-2923d74d5f00@amsat.org>
Date: Sat, 13 Mar 2021 12:14:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312182851.1922972-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 3/12/21 7:28 PM, Philippe Mathieu-Daudé wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Add a bool for MR to mark whether this MR is a root MR of an AS.  We bail out
> asap if this MR is added as a subregion of another MR.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/exec/memory.h | 1 +
>  softmmu/memory.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 54ccf1a5f09..8137ad3a9f6 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -477,6 +477,7 @@ struct MemoryRegion {
>      bool ram_device;
>      bool enabled;
>      bool warning_printed; /* For reservations */
> +    bool is_root_mr;
>      uint8_t vga_logging_count;
>      MemoryRegion *alias;
>      hwaddr alias_offset;
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 9db47b7db6b..ce322ff3d6e 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2442,6 +2442,7 @@ static void memory_region_add_subregion_common(MemoryRegion *mr,
>                                                 MemoryRegion *subregion)
>  {
>      assert(!subregion->container);
> +    assert(!subregion->is_root_mr);

Not all containers have to be backed by AddressSpace.

This check is too strict IMO.

>      subregion->container = mr;
>      subregion->addr = offset;
>      memory_region_update_container_subregions(subregion);
> @@ -2819,6 +2820,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
>  {
>      memory_region_ref(root);
>      as->root = root;
> +    root->is_root_mr = true;
>      as->current_map = NULL;
>      as->ioeventfd_nb = 0;
>      as->ioeventfds = NULL;
> 

