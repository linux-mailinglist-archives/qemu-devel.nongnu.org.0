Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332C857B490
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:33:25 +0200 (CEST)
Received: from localhost ([::1]:50664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE71A-0005Y5-3W
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE6zA-000487-1y
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oE6z6-0000Ad-Uk
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658313072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lcpz5J2K6BFqM5MLgRIdFzsY/5DXq+j3NjjVwp89SRY=;
 b=FN0ivsybYupK7zb+71RKXMS3wyPOHaXYG+hQ+7rMzLEsQYABzUP2oCT4Y5ewcfWqNRZoDN
 pAB1X3/oWYDEVF/6Ebobhvm7OD6uI2nufRu1FbgzHO8k3DsFBWErFy7ECSQXFf+ZKqoPNC
 C4aCiwpl2BBn5BBdahCyl0P6uoFWcUA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-sLOY-YocOo6GbwHXedurPQ-1; Wed, 20 Jul 2022 06:31:11 -0400
X-MC-Unique: sLOY-YocOo6GbwHXedurPQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v11-20020a1cf70b000000b003a318238826so592614wmh.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 03:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lcpz5J2K6BFqM5MLgRIdFzsY/5DXq+j3NjjVwp89SRY=;
 b=n3+zY20bpcj0T7Y6imeJFmqgRllQ79vy9g/QKVmTe0MV/a8HhYtA9QAnKSR9EbMnIR
 BU6ynjGl6qarVOM3t6JimJtEYzFOSTf/Eo3GV/5TuxxqTkh5a2eoVtucRbsayrffKG17
 tXvCWuMUO4CMP5dtxdGPExATijiZhNQp6J+jPsdpvwA19rY1SRaXsrGXEKHCKGgRDc1Y
 //e/R7o2tpywfP8G9NeCyzSBSNttXDMizbjAhxiLJC2syB4tTH+oGvDVD49OK9jpoJ2Q
 PAc+FBLPEwDToZLJOD/5dRuy/foVuFu/2/H+qMg9d0PhmUKGCS0ayy2acBdx5O96LSu3
 fyKQ==
X-Gm-Message-State: AJIora8KWgBWuSKLe1eoVYq4ya31eszN4MlYW7YQABlatr32GoZZdP9u
 noztjermwsWJqKvFRUhsI7w3FNcg3OZO80Kb6w0mMb4aFKV7j6ymVD8Ju6QxG1nUBdxFu+OUGci
 cUIqhtaqMTdwOP7w=
X-Received: by 2002:a1c:c916:0:b0:3a2:ef87:20b9 with SMTP id
 f22-20020a1cc916000000b003a2ef8720b9mr3058291wmb.173.1658313069813; 
 Wed, 20 Jul 2022 03:31:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uwtK7N6s1AuUsOmXxWePghUeRVhuEBIxIIhgvV1JYJUcBH9zquniow4tMTiBYuvDy7DcEFVA==
X-Received: by 2002:a1c:c916:0:b0:3a2:ef87:20b9 with SMTP id
 f22-20020a1cc916000000b003a2ef8720b9mr3058274wmb.173.1658313069615; 
 Wed, 20 Jul 2022 03:31:09 -0700 (PDT)
Received: from [192.168.8.104] (tmo-096-80.customers.d1-online.com.
 [80.187.96.80]) by smtp.gmail.com with ESMTPSA id
 q3-20020adfcd83000000b0021e437fabd8sm3034038wrj.69.2022.07.20.03.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jul 2022 03:31:09 -0700 (PDT)
Message-ID: <213763c7-b59a-45e0-cc8a-c21a2dea5baa@redhat.com>
Date: Wed, 20 Jul 2022 12:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Content-Language: en-US
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220720102555.874394-1-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/07/2022 12.25, Roman Kagan wrote:
> It's possible to create non-working configurations by attaching a device
> to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> specifying a slot number other that zero, e.g.:
> 
>      -device pcie-root-port,id=s0,... \
>      -device virtio-blk-pci,bus=s0,addr=4,...
> 
> Make QEMU reject such configurations and only allow addr=0 on the
> secondary bus of a PCIe slot.
> 
> To verify this new behavior, add two basic qtests for the PCIe bridges
> that may be affected by change: pcie-root-port and x3130.  For the
> former, two testcases are included, one positive for slot #0 and one
> negative for (arbitrary) slot #4; for the latter, only a positive
> testcase for slot #4 is included.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
> v2 -> v3:
> - do not use qtest-single stuff [Thomas]

Acked-by: Thomas Huth <thuth@redhat.com>


