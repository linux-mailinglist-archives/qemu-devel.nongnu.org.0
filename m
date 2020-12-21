Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0832E019A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 21:39:29 +0100 (CET)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krRxo-00039v-OR
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 15:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krRvT-0001G2-5S; Mon, 21 Dec 2020 15:37:04 -0500
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:41990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1krRvR-0004CR-F2; Mon, 21 Dec 2020 15:37:02 -0500
Received: by mail-qv1-xf2f.google.com with SMTP id bd6so5037324qvb.9;
 Mon, 21 Dec 2020 12:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hy+1dBLXENlCsEMWHPxupwODxwVINsP+MIW1044Tjkw=;
 b=c0AGueUkjm9LhO72lnynZzl1FvC9LfcfGZE9pSUQp5akhmz2RB9SMhjJPXwIDYJLku
 CXdweN7Ej/4DkH8CEeXrykhcqJit1XB+/RHTADKryvPq2Styv0Ys3KFlg6t2E29O8ZmQ
 av5AqLW9L6kgJ44pfgBHaqXjZnGwoB/58l7SOGQvgmmB+5tKRQmSle8jptwJHT3QS5zJ
 Nm44i8hLv6gbuclW4A/wk93EMxB1MxMo61cvgafDNdSx+hEXvVHs/badFg/HrL9tIlox
 OHjP3IsxhKkId1ltVaXpQ0z4lbwxg+Wx0tmYsAgBbpxR6r/fBEeO0IVIyfTbql2H040s
 CXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hy+1dBLXENlCsEMWHPxupwODxwVINsP+MIW1044Tjkw=;
 b=NRVBuaKt7o7WSJmOTuRZKBSTS+OS/LlE+BU/8ueqMU+Ns3C/wrwEkWmAk2XZSohUjO
 MHBZfqdDp8f5Eds4Z3c9phfhorZz5f/4fpB4JDf6auWhpeCkwQVfFYAENeoInVcLwLXL
 INw9V+aMBCyI2KWXvO7Q+WVOAsS//fr8N+hyX1X7Z+Wa5CmL4CuIMj/iC2yD1K6Xgty6
 S5P3PqWkrICSjP+jZ4NTncLGXjuJH7f5P7F7UdGFg1YMJ9zP4FSTVG3seV+Qa4vScep5
 l8lW1P48xDHlc0OB5wn5LfiV+NTjQMTDKPFaovTFYZLzj1hC7v8FV3JCn2hEH/gbPLg3
 YImw==
X-Gm-Message-State: AOAM531l4xf43ZbMm82lrt316T/x9ziX3pdQHOrXasNc4dyhElE1qhYC
 Bl0EiG4833c9X85JlSBtiC7XCgOLNF0=
X-Google-Smtp-Source: ABdhPJy/CRzPsBQsdZQGnC/22mfIKxiFjL1rhBCUQiciTB46AYhZWya7G3oOfoLxuw9bP4Jw6A/KcA==
X-Received: by 2002:a0c:efc9:: with SMTP id a9mr18802314qvt.31.1608583020303; 
 Mon, 21 Dec 2020 12:37:00 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:556d:fa44:43b8:486b:f066?
 ([2804:431:c7c6:556d:fa44:43b8:486b:f066])
 by smtp.gmail.com with ESMTPSA id q70sm1597539qka.107.2020.12.21.12.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 12:36:59 -0800 (PST)
Subject: Re: [PATCH 4/6] spapr: Use spapr_drc_reset_all() at machine reset
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-5-groug@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ab5a6495-5fe2-f536-f50e-279f077c65f0@gmail.com>
Date: Mon, 21 Dec 2020 17:36:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218103400.689660-5-groug@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 7:33 AM, Greg Kurz wrote:
> Documentation of object_child_foreach_recursive() clearly stipulates
> that "it is forbidden to add or remove children from @obj from the @fn
> callback". But this is exactly what we do during machine reset. The call
> to spapr_drc_reset() can finalize the hot-unplug sequence of a PHB or a
> PCI bridge, both of which will then in turn destroy their PCI DRCs. This
> could potentially invalidate the iterator used by do_object_child_foreach().
> It is pure luck that this haven't caused any issues so far.
> 
> Use spapr_drc_reset_all() since it can cope with DRC removal.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   hw/ppc/spapr.c | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 43dded87f498..8528bc90fec4 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1566,19 +1566,6 @@ void spapr_setup_hpt(SpaprMachineState *spapr)
>       }
>   }
>   
> -static int spapr_reset_drcs(Object *child, void *opaque)
> -{
> -    SpaprDrc *drc =
> -        (SpaprDrc *) object_dynamic_cast(child,
> -                                                 TYPE_SPAPR_DR_CONNECTOR);
> -
> -    if (drc) {
> -        spapr_drc_reset(drc);
> -    }
> -
> -    return 0;
> -}
> -
>   static void spapr_machine_reset(MachineState *machine)
>   {
>       SpaprMachineState *spapr = SPAPR_MACHINE(machine);
> @@ -1633,7 +1620,7 @@ static void spapr_machine_reset(MachineState *machine)
>        * will crash QEMU if the DIMM holding the vring goes away). To avoid such
>        * situations, we reset DRCs after all devices have been reset.
>        */
> -    object_child_foreach_recursive(object_get_root(), spapr_reset_drcs, NULL);
> +    spapr_drc_reset_all(spapr);
>   
>       spapr_clear_pending_events(spapr);
>   
> 

