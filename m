Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70344E2325
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:17:38 +0100 (CET)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEAT-0006uQ-BT
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:17:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nWE81-0004nf-2W
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nWE7y-00045c-8j
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647854100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kkTSKdqjmfA0aSI+Ym6iyRU2inq1gUNJE2LelNF8vNE=;
 b=FPlOwpf2fv21xxVVTJkbi6ETyfBm/N1z3lSYRz0SJGs4TLzteTd6l4WjgHunU2zjHJdyWJ
 p9AF+3MhkryO7Pnx0zRWH1/1KlukTKRo4/oNqS7kEb1/zxLPw7oFtjMaHV+PGYFkngIa02
 ve6uG9hH+GmYnYJ4xB1wk5P3kN3dCN0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-8DkKG7nlPGSMRrcphe_YqA-1; Mon, 21 Mar 2022 05:14:59 -0400
X-MC-Unique: 8DkKG7nlPGSMRrcphe_YqA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b10-20020a50e38a000000b00418cd24fd27so8298555edm.8
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kkTSKdqjmfA0aSI+Ym6iyRU2inq1gUNJE2LelNF8vNE=;
 b=zq3o+Ftx5LxgIOxo4hq5k8YtWVHxdcOG0WSyK54x68pnLDBuFB9JurVKSM+uWngjAw
 TmT229OV6OCZBLaC/1U8RXNrZhYGEMlS2WtNbu7IWNSvOl6GttpbJQfu38bhfX5/gx5f
 SqBPBhMsapiUeZGHkyGujL1rbCY7cuXbmDWnLiLQ4WBg4mKN6dH7lyL5grjBM1rl7nch
 VdCgB53PGdkpa/OhsV/qsjKAv6WiXeEPIEKiBqD6TgTplAOjx0mxuxenyaYtg+ftE3c9
 0vCIAZf2f4nBu+Kwhgt7AsMc/BFIw+5EVMEK6l+IFSlTOrkuDo4zm8oHsZ4LoIFgNaLX
 W0ow==
X-Gm-Message-State: AOAM530aMLwAwQ5c9QGvNkIdhlRHa9hwv7L4aVOUM+PjPPX+bphlvVk3
 K2z/MBsm6b2/cBY8Wt5f4vgfHtWEVHifMj+HHAQNChCD6D2ZKIAK5+nkRr6CEwLrC3tZaTXfQx4
 JqaaaJGgmzk0ECYA=
X-Received: by 2002:a17:907:1c27:b0:6df:d55c:ab7c with SMTP id
 nc39-20020a1709071c2700b006dfd55cab7cmr8911989ejc.581.1647854098104; 
 Mon, 21 Mar 2022 02:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIP2lXYfGVXHitcieQg0Qf7EPA4MAFPxxHxIqWyb6F3Gbm4eInyU+gqQC8JjURsuYX77LNLA==
X-Received: by 2002:a17:907:1c27:b0:6df:d55c:ab7c with SMTP id
 nc39-20020a1709071c2700b006dfd55cab7cmr8911977ejc.581.1647854097939; 
 Mon, 21 Mar 2022 02:14:57 -0700 (PDT)
Received: from [10.43.2.152] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a17090673c200b006db8ec59b30sm6662785ejl.136.2022.03.21.02.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:14:57 -0700 (PDT)
Message-ID: <2ad1c932-e573-a5f6-bf67-ed3fe88b88e8@redhat.com>
Date: Mon, 21 Mar 2022 10:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/3] qga: Implement guest-network-get-interfaces for
 Solaris
To: Andrew Deason <adeason@sinenomine.net>, qemu-devel@nongnu.org
References: <20220320213843.4544-1-adeason@sinenomine.net>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220320213843.4544-1-adeason@sinenomine.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/22 22:38, Andrew Deason wrote:
> This implements the guest agent guest-network-get-interfaces command on
> Solaris. Solaris provides a getifaddrs() that's very similar to the Linux one,
> so the implementation is mostly the same.
> 
> Andrew Deason (3):
>   qga/commands-posix: Use getifaddrs when available
>   qga/commands-posix: Fix iface hw address detection
>   qga/commands-posix: Fix listing ifaces for Solaris
> 
>  meson.build          |   1 +
>  qga/commands-posix.c | 488 +++++++++++++++++++++++++++------------------------
>  2 files changed, 260 insertions(+), 229 deletions(-)
> 

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


