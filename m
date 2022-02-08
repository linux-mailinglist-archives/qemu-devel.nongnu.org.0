Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CF44AD55E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:12:35 +0100 (CET)
Received: from localhost ([::1]:55446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNUA-0004vb-Nj
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:12:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLjg-0005GT-7U
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:20:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nHLja-0001jD-Gb
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644308412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvHJf+2pzfovStVs+MZiZCf947haBubcOit7ajGSdfo=;
 b=QztkmezO2Fae9G5oXG76EU5uD6eJ26ZIuNH41cpuv0M6o8eBWd8y9b8ZrjwD9MCAMGvhla
 DltL6ITEoH7thXjcW3IRdEKMpyDn/qfWYY48xCeDIC1xbZPMUWlL7KLeAEOQGJ2BhBKh3H
 +HILvifpjLdgA0+fFqJoND/Em4P/0mE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-CPsBZSROP62sTVu42qYMCw-1; Tue, 08 Feb 2022 03:20:09 -0500
X-MC-Unique: CPsBZSROP62sTVu42qYMCw-1
Received: by mail-pl1-f200.google.com with SMTP id
 j1-20020a170903028100b0014b1f9e0068so7017643plr.8
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 00:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EvHJf+2pzfovStVs+MZiZCf947haBubcOit7ajGSdfo=;
 b=mULLO2Y7YmBiSFQjqN8MgOZgsdqEuLsuwslfNPvmVrCSwrqtQmc0pAVTIezpg37IzJ
 Vacn/uJ1uPRPmYGfML72NTu9ZRe80xs+o4HXH57OW9AX7K21yZfYxg92qSgspFLSPzmv
 xfNTfPNrcbtu/DnLmx6orcOVxx+8JCt2zLlFC1o4onruJ3h6yzwRA+7oRDEmPuwjPQbx
 7kvBAnsfQuNWj0xEX10zHGAtaKxMEPHds64D1V1RzgryZp3AOGcUQ/gOE+TSK3QOCsKh
 6P/QP2XGwglzHeJ9fclCaAh6pGy9oTxCkO+q0M5lhDIRihMRPnzulh8mIFr9vWQA5jO5
 cjyg==
X-Gm-Message-State: AOAM530U8x2svyrotdjL17/ReTyKWhvAapZJKq5PvtqnWnWmDg5dpAoi
 GxBUrp1OCbjBf6w3eNBQ0FCzucg4ORxTTiZVQhgzSOOX19R7tmFCuDNy4DHJJ/Fe/Pm/H3WB0FB
 LbRUYyYAVZjb/fgY=
X-Received: by 2002:aa7:9d9b:: with SMTP id f27mr3385579pfq.84.1644308408166; 
 Tue, 08 Feb 2022 00:20:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVMEw3NTbVITKusdMFSzdE8bcRzr/AptfBE8JVpxlbacuCrC3xd44Hc+rj5P+ukq9peJgoqQ==
X-Received: by 2002:aa7:9d9b:: with SMTP id f27mr3385550pfq.84.1644308407944; 
 Tue, 08 Feb 2022 00:20:07 -0800 (PST)
Received: from [10.72.13.12] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id p1sm15934541pfh.98.2022.02.08.00.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 00:20:07 -0800 (PST)
Message-ID: <29c05c6b-3ecb-73c4-81d2-eae07c3477a3@redhat.com>
Date: Tue, 8 Feb 2022 16:19:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 23/31] vdpa: Add custom IOTLB translations to SVQ
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
 <20220121202733.404989-24-eperezma@redhat.com>
 <e3b9ee89-46e0-cdbe-1093-5f067d2176ac@redhat.com>
 <CAJaqyWe1zH8bfaoxTyz_RXH=0q+Yk9H7QyUffaRB1fCV9oVLZQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWe1zH8bfaoxTyz_RXH=0q+Yk9H7QyUffaRB1fCV9oVLZQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Gautam Dawar <gdawar@xilinx.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Blake <eblake@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/1 上午3:11, Eugenio Perez Martin 写道:
>>> +            return false;
>>> +        }
>>> +
>>> +        /*
>>> +         * Map->iova chunk size is ignored. What to do if descriptor
>>> +         * (addr, size) does not fit is delegated to the device.
>>> +         */
>> I think we need at least check the size and fail if the size doesn't
>> match here. Or is it possible that we have a buffer that may cross two
>> memory regions?
>>
> It should be impossible, since both iova_tree and VirtQueue should be
> in sync regarding the memory regions updates. If a VirtQueue buffer
> crosses many memory regions, iovec has more entries.
>
> I can add a return false, but I'm not able to trigger that situation
> even with a malformed driver.
>

Ok, but it won't harm to add a warn here.

Thanks


