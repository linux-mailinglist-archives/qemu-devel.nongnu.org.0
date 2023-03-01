Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409566A764D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:44:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUEL-00039c-0m; Wed, 01 Mar 2023 16:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUEI-000398-Fh
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:43:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUEG-0002z3-Uu
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677706995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q55gyk2Mx1DiM8Zn8UFSBFzaN4zmGHeZdcpxAFhZr4g=;
 b=NL+oTaE12P4md6AipVFlhzez6SirB2KLdcez8tI+wPPtoHvN4Y3n1MJBYptgIAaR/0s1QY
 DC3I5xTw6fbQi2Utw1CniWEBqZcg406gN9A18Nfu7uXxekWDz7yaaypzUyPBjjVuAvG8vs
 Pu+9AE41esexnSyGygmpBm0o055myTE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-bIhEzUbXOMeq1Pr2E6L1DQ-1; Wed, 01 Mar 2023 16:43:14 -0500
X-MC-Unique: bIhEzUbXOMeq1Pr2E6L1DQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso5028082wmi.7
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677706993;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q55gyk2Mx1DiM8Zn8UFSBFzaN4zmGHeZdcpxAFhZr4g=;
 b=sJvz0se1hVzrhDWZcKcxyHXyNtcE2JqyU589ANRpr3A8JMfZbtQEpEQ4gOl7eAExY/
 ngyNHEB7IP5s0sxvtwGEC81iHi0+x5U4cjH1RKGhj0hDfc/6XFz4g6aIeSwNRK/OoICP
 QHHuJcL/6nKsuBDqbhOVtIaF5MtNNkPBAR7H8K6fzC66u/heLt6AvK74GxGUc4arGqO9
 7QYFc9z2gyJ7u2JnzYk2n/9Ibyu5cuKi18+q5RxWycG1f+JIy8NyVbWO6N9VD69RZVFa
 BK0pKIIr6ytOb2ix1TqJmRjqvidIw0LUmz1nBeh9Lp6Dy83lqa+on9055eYHUYHRWONL
 m5QA==
X-Gm-Message-State: AO0yUKWOLNCg0/UqdLvHeZAJxBBbslxtiqztrgJm5OYDhCsAUvnpeHiQ
 4uAOJGJbAMIS8EwB/JxWRMwtQKCNS2dm5WV2QLt93QsUdMsLcUEVrQi4uSkm9oRn/fELYYXinu5
 wZQMVr+KxbIMfFZs=
X-Received: by 2002:adf:e8cb:0:b0:2c8:7750:1769 with SMTP id
 k11-20020adfe8cb000000b002c877501769mr5999546wrn.68.1677706993594; 
 Wed, 01 Mar 2023 13:43:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9swQlqsL2ptOBKkxTQLaOekGoLOHouOWhlAPutlAvYt3M/ASCNI+zyN6ptRd+Q5tiPBgI0HQ==
X-Received: by 2002:adf:e8cb:0:b0:2c8:7750:1769 with SMTP id
 k11-20020adfe8cb000000b002c877501769mr5999532wrn.68.1677706993243; 
 Wed, 01 Mar 2023 13:43:13 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 s8-20020a5d4ec8000000b002c704271b05sm13574229wrv.66.2023.03.01.13.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:43:12 -0800 (PST)
Date: Wed, 1 Mar 2023 16:43:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH 02/12] hw/pci-host/q35: Fix contradicting .endianness
 assignment
Message-ID: <20230301164257-mutt-send-email-mst@kernel.org>
References: <20230214131441.101760-1-shentey@gmail.com>
 <20230214131441.101760-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214131441.101760-3-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 14, 2023 at 02:14:31PM +0100, Bernhard Beschow wrote:
> Settle on little endian which is consistent with using
> pci_host_conf_le_ops.
> 
> Fixes: bafc90bdc594 'q35: implement TSEG'

incorrect formatting for the fixes tag


> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/pci-host/q35.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 83f2a98c71..3124cad60f 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -289,7 +289,6 @@ static void blackhole_write(void *opaque, hwaddr addr, uint64_t val,
>  static const MemoryRegionOps blackhole_ops = {
>      .read = blackhole_read,
>      .write = blackhole_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
>      .valid.min_access_size = 1,
>      .valid.max_access_size = 4,
>      .impl.min_access_size = 4,
> -- 
> 2.39.1


