Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCFC3C5E70
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:37:05 +0200 (CEST)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2x3Q-00037c-As
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2x2P-0001lq-Ea
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:36:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2x2N-00042M-LX
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626100558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JnLKKAF+soqrUb/DMYY79wtv3GnKZcCHuUBfBTnAfs=;
 b=hM2oKlG9sZuqykDlt+M+juZzM7CHl3j+PqsXqnEKdUfKEGmyMV0KfXoxT4iepBauGTng19
 MeTKHKD+pxv/1FNk7uvxJVfL1AFwwcIx+8VJ9lRACxOG+vCOyrUUPvhT1e83aGp5HLspVb
 LvW1AhNO6AtDERLuC7qzzAVqHx/JBnc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-RG9fWi-4OHCCJkBg2AnWvA-1; Mon, 12 Jul 2021 10:35:57 -0400
X-MC-Unique: RG9fWi-4OHCCJkBg2AnWvA-1
Received: by mail-wm1-f69.google.com with SMTP id
 p9-20020a7bcc890000b02902190142995dso4333054wma.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5JnLKKAF+soqrUb/DMYY79wtv3GnKZcCHuUBfBTnAfs=;
 b=T50evlEBty/SuNcckipopaZbbLsWQ4nQHvXfX9SxdBDwA0qamjHgkILv89q9tGJyLG
 EDrmTqFlOvE3XIeUdgQvvUe5YVyHrFS4tExWe+GN/mV6eClNGuDHg3J9e9YfnpxMZtly
 ZmSInQhH+MCoE7OwXy180RSXHV8FbPaYHbERlToT0p/9Ivz1PDPxS4BxgCs8Kx5HSgya
 z8WtteYRzB88qVgqN+5xMV3vTghwzVLlzgsbHTzX120yOrzYx+i+1jcyw6a+hBE3BlN3
 SycJlj9zoU7kwxEHyOP9SLvwa2lCzL+ak+hZZvno5FqPpWyVxtEdRxMw3a8oeE5qgUrM
 b4fw==
X-Gm-Message-State: AOAM530zYqbmpMvHz9MVPBzq6h9/It2RoLt1xT/EG46N+NCsLyc8wOqM
 /EBUR0V2C5Yg4nITfXnxUsVsii1XzlmYAfp4IDaOi+gNcGDC9Ki3rz4lCXwxiQ/yohojGHT+eei
 CZZso+utBIDlzXiQ=
X-Received: by 2002:adf:e107:: with SMTP id t7mr59472832wrz.165.1626100556157; 
 Mon, 12 Jul 2021 07:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydqSc8hjeK1XeVwc6rd6aauvT/Z9auFVUJzHEEsi6TFoR8wMVlCmvcdfUsSmSe5o1HH/wd7Q==
X-Received: by 2002:adf:e107:: with SMTP id t7mr59472818wrz.165.1626100556055; 
 Mon, 12 Jul 2021 07:35:56 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id v15sm20338360wmj.39.2021.07.12.07.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 07:35:55 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] hw/i386/pc: Clarify pc_system_ovmf_table_find usage
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210701052749.934744-1-dovmurik@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fd59b7a3-2001-cebe-19d5-1882ada9f12d@redhat.com>
Date: Mon, 12 Jul 2021 16:35:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701052749.934744-1-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 7:27 AM, Dov Murik wrote:
> Add assertion to verify that the flash was parsed (looking for the OVMF table),
> and add documentation for pc_system_ovmf_table_find.

> Dov Murik (2):
>   hw/i386/pc: pc_system_ovmf_table_find: Assert that flash was parsed
>   hw/i386/pc: Document pc_system_ovmf_table_find
> 
>  hw/i386/pc_sysfw.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Thanks, queued to fw-edk2 tree.


