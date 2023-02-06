Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C14D68B9A3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 11:14:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOyVI-0006fR-PI; Mon, 06 Feb 2023 05:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOyVC-0006XK-RP
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:13:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pOyVA-0008Kq-DZ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675678407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=541RhhlzsaQHgle1Nk79Bgd+WcPXeY3i6TWNGx9WQBk=;
 b=O6SkMEUSsiMzRP8gwNBJP8AsMT1Jof+1NesmYs2uylP7giMQzVA2blmtEojAaUzt1Oi+g4
 DiNj/9c8iD2zNRh6w7cw7yvP/3aE6GVGinMCEKuoo9hWbnEwC7lnU6Mb+wjEjI3AsV+L2o
 xGUBBu8fHG27zjYj6bhhZrIJl5XWwtg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-dJ5rR_8nMjK6JnbXr4JkqQ-1; Mon, 06 Feb 2023 05:13:26 -0500
X-MC-Unique: dJ5rR_8nMjK6JnbXr4JkqQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 dy3-20020ad44e83000000b0056bf716c68bso985179qvb.10
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 02:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=541RhhlzsaQHgle1Nk79Bgd+WcPXeY3i6TWNGx9WQBk=;
 b=V0S2MzZYAeWrAVI7ATQhgWcip9M7U9EJXtbZB90Xiq4OGeTOLbVSsiJURj2W4qg7YB
 cJvRlb5szeD2DYudefpkkQMhXx/gC/sgdtzvfTJILcdBApyuYpUra3jgQa4DUp2ZXE5r
 WGIjmiDclJGl2M8G/3KbFODs0pLbphRC737iDGo//alkDmypzhnpoCm+90VeKvbPT/bB
 w5FW21CyFxKVJ6FMPBx+NV4OnC1D9l3svOVLi5RudPYBHvmiPr9NhWRdTnQrTNrSkwKc
 hJ+0AAnImA2CoEaaWXPJBHoReA5c7z1ShNloYiEq3qtsk+rxJ7rTLM1te71aYmlzhR1E
 exjA==
X-Gm-Message-State: AO0yUKUXmnTyo0/nXmU+iUgQIqxPKxzOfrxnzMZphBXgeXkes3uKLopS
 uaxLdnt4gmx5+FZGB2Ab7MYZq2odCpHFckRXK6gX30My1M3IWjmJeQRFA7tskx39LDKjFMKtgBE
 H8ObrnRpb4cwTCJM=
X-Received: by 2002:ac8:5746:0:b0:3b9:ca95:da6e with SMTP id
 6-20020ac85746000000b003b9ca95da6emr28949381qtx.44.1675678406235; 
 Mon, 06 Feb 2023 02:13:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/eK/1ZE1EZU9OIuyZJjtHyolv/nA66FESD4737u2k9Alw01F8uxfYI3aEtFOBu/+ITF0qwYg==
X-Received: by 2002:ac8:5746:0:b0:3b9:ca95:da6e with SMTP id
 6-20020ac85746000000b003b9ca95da6emr28949368qtx.44.1675678406045; 
 Mon, 06 Feb 2023 02:13:26 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 16-20020a05620a049000b0072692330190sm7104714qkr.64.2023.02.06.02.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 02:13:25 -0800 (PST)
Message-ID: <dc19cfad-dfbb-b81a-1341-6a60df7f4968@redhat.com>
Date: Mon, 6 Feb 2023 11:13:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v15 04/11] s390x/sclp: reporting the maximum nested
 topology entries
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-5-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230201132051.126868-5-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 01/02/2023 14.20, Pierre Morel wrote:
> The maximum nested topology entries is used by the guest to
> know how many nested topology are available on the machine.
> 
> Let change the MNEST value from 2 to 4 in the SCLP READ INFO
> structure now that we support books and drawers.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
> ---
>   include/hw/s390x/sclp.h | 5 +++--
>   hw/s390x/sclp.c         | 5 +++++
>   2 files changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


