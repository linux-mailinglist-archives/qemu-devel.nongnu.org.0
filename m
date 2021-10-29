Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2BD4403FD
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:24:33 +0200 (CEST)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYQS-00051N-M8
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgY3V-00025J-70
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgY3S-0003wU-0S
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 16:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635537644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=82POVXWkqw1FnEZYClJfqkq01P52gzcyi9+tWCOQ+ak=;
 b=GB8+8q4OJ3xjcSBUvGDhDV17yS1GgK4ri+enBR2uscRHWlngdAu5UycTikVCZB0Nprre1R
 F7q+rjN+T9C641NDfkvvTiCzkw4d0MVmp0+JnxbZVdTJPKSFxKnxK2CP1NRlnFuVL0zWyE
 mk0WW0ukLYmrIQFPi/JwRMTcpMYCGmQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-OGNJXwiNMrOT0-AZvrTHaA-1; Fri, 29 Oct 2021 16:00:42 -0400
X-MC-Unique: OGNJXwiNMrOT0-AZvrTHaA-1
Received: by mail-wr1-f71.google.com with SMTP id
 c4-20020a056000184400b0016e0cc310b3so3898019wri.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 13:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=82POVXWkqw1FnEZYClJfqkq01P52gzcyi9+tWCOQ+ak=;
 b=qXtVgr/ZHnq8jwsTx3q3YWMRuit0/PrUN1WVeMx3pSNFWBIOmEWN4LcBfilTsXPGoT
 SMtySX5lEMBjoF+L+R9HL7a+ujsCbRiiDypaHolw+JLUlM9xeIMnQI+gFyq2SMa39Scn
 S1Ec/GCY6rcu69xEAZkimK3QYHjbZWBJ5jNjNeOZpiiKHn1w+FfnhI9yf+Aa6mUb8G9b
 Wc9PuESk6vX/AVL7qalA4r07dWXd/1KFQrV/YZC2uwKeOys0SRSHZ5G13JkRqxIEpnnt
 0DAjX/0VnQs6SttcKVcYc6/sG1ub0lqArCUR394ipcj+nxlJEf6sORzlOj8D1kmKbbFe
 7DdA==
X-Gm-Message-State: AOAM533qAb4M6MrxPktdD36iclFqDbEwQ8SIISJYu99Xxv8uTC1BMhk0
 lKJO/j9EdGYS/LfkHWy61S11YWdeQFwAZ7KaBFY753pTeRW4kqIqCwtVFScz6pSlltaIEcG2mKK
 QPnrCrlLAloWMPEs=
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr16381750wrh.278.1635537641802; 
 Fri, 29 Oct 2021 13:00:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAF7NaWUxz7Yc66WZvd1O6Jiu7a4XYV63lLSiGHhiuLngO6SHwSQ5USSm3ote4ri/4yfLHeg==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr16381725wrh.278.1635537641617; 
 Fri, 29 Oct 2021 13:00:41 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i10sm8240340wrf.8.2021.10.29.13.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 13:00:41 -0700 (PDT)
Message-ID: <5cacbff5-7911-577c-88b4-3e72a774fb8d@redhat.com>
Date: Fri, 29 Oct 2021 22:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 0/3] Dynamic sysbus device check error report
To: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, qemu-devel@nongnu.org, edgari@xilinx.com,
 mirela.grujic@greensocs.com, Alistair Francis <alistair.francis@wdc.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
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
> 
> This was initially part of my RFC (hence the v3) about allowing to
> create devices during the machine initialized phase (link is below).
> But it seems to me these patches make sense already as a standalone
> cleanup.

LGTM but I'd like an Ack from Eduardo or Marcel.


