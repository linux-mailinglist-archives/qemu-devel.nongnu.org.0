Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35073442100
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:41:35 +0100 (CET)
Received: from localhost ([::1]:56662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdBW-0007WE-9J
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhc4i-0007ef-BU
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:30:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhc4Q-00022Y-1L
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635791409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IkBr15hXYDxzO6QpEpV7lPOGkwr+OCo3HPaedgDbF9U=;
 b=C2Tb8juJ8vxOJCJeBBsWaIujR2MWe64c+scRzDFgP+h11vUnKbX8VTJDQuBPMTEPfz+Bs7
 WomjMeRJaI61By1V3/uTlxdShOBJH09/IfjYJsys9owYKRBRaQ1JCSi3XSUoTzeCNCTXhj
 +PEBrxSXuf4yn4RbGMvVTQreqEmQKN4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-djG_SIOrNTWeGJM2hd35Qg-1; Mon, 01 Nov 2021 14:30:08 -0400
X-MC-Unique: djG_SIOrNTWeGJM2hd35Qg-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adff791000000b00183e734ba48so1887172wrp.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IkBr15hXYDxzO6QpEpV7lPOGkwr+OCo3HPaedgDbF9U=;
 b=e67yUu3VpwN5EiDD+dPzP5KI7nl/a4yEHZl5nWK7AIPrH/xeSYJFygcLhkjmF3WxS1
 upNHksWvoRxU8e8fLpXFWfrjxIjJBI+elyPd6Qm4+x7N0f3ZWfUCUYB+aC7AdniHyaLn
 Os6ZWi7pNscCJJ/HRR2+FHTH9bz1wujkf/RBk0Q816PMdFUm3TurlV8Zjm8w3W5bZBue
 hyrBH14H4zPKSO23J7K7ThitG7D4eOeg1M8xWt1yZarDN2jqtr5bXWrnRKHef+h+h9RI
 ElIjdHzaSIqqQUoL7eNXhZsmP2D+4cWcHNYe8LFIMYqArJriANqUIaieu1Ms7vTMmeqk
 dr2g==
X-Gm-Message-State: AOAM5310ftDKHCXZbliC7UrPbbuclMryHRv0MatNNbw9frx4OfpvMpW2
 Um4ZfpCPKigG09fvwAB+ltrKlnB+u1Wr+zSdq7cvntDV+54NDEYhwqHAmuMPjA1vXL5uOAD/YLE
 hY4avfFBfCuZvV1c=
X-Received: by 2002:a5d:522e:: with SMTP id i14mr24228269wra.43.1635791407011; 
 Mon, 01 Nov 2021 11:30:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD3oo1UA+l4UmR28WxTE5h+zrN+KgW4Ttg311xpecHHehUxEp0B8vGNLMArpmyzaOBFmUUtQ==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr24228241wra.43.1635791406795; 
 Mon, 01 Nov 2021 11:30:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p12sm4257021wro.33.2021.11.01.11.30.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:30:06 -0700 (PDT)
Message-ID: <a126eca1-ebb7-a2cc-e5e1-b042ab1ab610@redhat.com>
Date: Mon, 1 Nov 2021 19:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/3] Dynamic sysbus device check error report
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211029142258.484907-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211029142258.484907-1-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 edgari@xilinx.com, mirela.grujic@greensocs.com,
 Alistair Francis <alistair.francis@wdc.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 16:22, Damien Hedde wrote:
> Hi,
> 
> Dynamic sysbus devices are allowed by a per-machine basis.
> Right now, the allowance check is done during an machine_init_done
> notifier, well after such devices are created.
> 
> This series move the check at the right place (during the handling
> of a QMP device_add command or -device CLI option) so that we can
> report the error right away.

> Damien Hedde (3):
>   machine: add device_type_is_dynamic_sysbus function
>   qdev-monitor: Check sysbus device type before creating it
>   machine: remove the done notifier for dynamic sysbus device type check

Thanks, series queued to machine-next.


