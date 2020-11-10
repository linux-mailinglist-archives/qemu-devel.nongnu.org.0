Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE83E2AD0B8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 08:58:19 +0100 (CET)
Received: from localhost ([::1]:46092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcOXi-0005s5-Rx
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 02:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcOWu-0005QC-5H
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 02:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcOWs-00043f-3M
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 02:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604995044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+EauqwM7J6qmF8Em84hfpZdWRDvpl7Ew4UMQzlOSqV0=;
 b=K/5KOoLG4aHhu2KrF/J4c6BijD0WHX3j8rLRzUXOUBzZVlLKZXzXcsHp4v+IxtSCLx5LL0
 tgVHZNLmoW5cKp96WxHCtEmnD2uZJcINNuHbpeQ21hHpTZoqt4hgV3l6N2NuX2eRplYmyw
 gwvYN/eAEgLqu+Ez/3SfmtRXOsNNSZ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-MaZJgnFcMU2R4XDDj__EPA-1; Tue, 10 Nov 2020 02:57:22 -0500
X-MC-Unique: MaZJgnFcMU2R4XDDj__EPA-1
Received: by mail-wm1-f69.google.com with SMTP id s85so403446wme.3
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 23:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+EauqwM7J6qmF8Em84hfpZdWRDvpl7Ew4UMQzlOSqV0=;
 b=RpM8rb2liXEvq4gKH1inDfQXcyNzLuR8xypTDdBIedkpuB7Wpoh6sB2t8MYYczYNjc
 uBWwnnyiI1kkMx8F0U3zZPtPdlxDGKD85LCeE0SpaEo5Ey1xb+EPlrbRMVaujFgRAthI
 0+6q/OjVi4uMcYaWeybXBSknEeC5huTwQm/yBkCl1ZqyZHUCW8ph8gJuM4exhLPQQbA/
 OZHCXkehftIjhFOdaGoCXX/QwZII4bRjQOreUrHKVEuSOfyrIVpdHg6WNg563KEfLkiG
 qHrevveFMLkAPIf6ViIZAgjkKmy4hU7C0uk+G147EnXWfaTplpbyiS9dE/4S9NtO8jRY
 /uMQ==
X-Gm-Message-State: AOAM532zkfuReZtFfp7Y+WjaTMaC3mvcnoE+hSpobHb+Ar9zucRgldf7
 Dnt2j/QEF83RzuWwsAKSHEZF1UhyFM/ByfXobg0JvlEwtVYIqI/VAkAqiRRmks9bPoTMDSqbIwT
 4Q2AHyixTTHhVjvNvxrnehzfou7Y1yQ/zNbbR6v9xpSVevayz1hEkiiI2zzIwS+Pa
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr10715953wrg.366.1604995040711; 
 Mon, 09 Nov 2020 23:57:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJ/qtpWX2FmC0ox8Wi3OBFvbA0YHOUosL3EseDrxGcHfgw/2CXvtK4ixG9n6XB6DSXikftIw==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr10715919wrg.366.1604995040432; 
 Mon, 09 Nov 2020 23:57:20 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id f19sm2002986wml.21.2020.11.09.23.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 23:57:19 -0800 (PST)
Subject: Re: [PATCH v13 0/4] Add Versal usb model
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Francisco Eduardo Iglesias <figlesia@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Ying Fang <fangying1@huawei.com>,
 Vikram Garhwal <fnuv@xilinx.com>, Paul Zimmerman <pauldzim@gmail.com>,
 Sai Pavan Boddu <saipava@xilinx.com>
References: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <44ea4075-aac5-386f-52e4-832606870832@redhat.com>
Date: Tue, 10 Nov 2020 08:57:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1604991130-12965-1-git-send-email-sai.pavan.boddu@xilinx.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 7:52 AM, Sai Pavan Boddu wrote:
> This patch series attempts to make 'hcd-xhci' an independent model so it can be used by both pci and system-bus interface.

This part got merged already...


