Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2748675A58
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 17:45:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIuUd-0008KG-QT; Fri, 20 Jan 2023 11:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pIuUc-0008K7-2B
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:43:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pIuUa-0006Vc-KU
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 11:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674233031;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUI9HmzZDhSu9I5huoJ52218XmdPghHRT6YdY9akK48=;
 b=E16CVLLRyxvq68GresO3gOsdLZDluT35tsU3P6LxOckdWYDCtV/1prAh/FlcFY7gZU2PBQ
 BTqhRG3vHuMG7MaxnddZSj8c+41ZT3UMv9OrMsSCe5kZQDbt8NY6Lh136OmllLZ9rBfgbu
 HzWUlGkE4JrlzgR4IBheZee0WejIN8o=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-x9R4hMY9MSCbgCGVq8441g-1; Fri, 20 Jan 2023 11:43:50 -0500
X-MC-Unique: x9R4hMY9MSCbgCGVq8441g-1
Received: by mail-qt1-f198.google.com with SMTP id
 bb10-20020a05622a1b0a00b003b68e868462so2597425qtb.15
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 08:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mUI9HmzZDhSu9I5huoJ52218XmdPghHRT6YdY9akK48=;
 b=uJK90s33yLLntAmz9ykzEmieJbvwRg87V7EHJ9PZfUy4urr6+1G5b3QW9HMHkdQWJs
 vUTiNMBddTCHL32jgTaofxJm5pE8RYeJL80xh8O8YDFYhqfC8zBvhgwiJhPQy1Nsxef3
 cyq55pgoPUZz6bMcgHGlTZs9FX4UffuR8sRGy2G/mYVMQRUpTEalOrygzwFrZN7pp51R
 yn/197+XQEJSBuBEEZ6EoylkZtihyUSIBWz859b4NOBoXShh/gT5+Yc7sHQsBeLY70Zx
 QJsu5QdJTHDBKXuZJXD6KZJ0ZGkZ5w+00SHRaSpo9szVXExFf4YLfxBjoFINojBk+qx3
 Bn7Q==
X-Gm-Message-State: AFqh2kr9WOY0k8LR1zXVbbXqwty+582FnlnLtieHtYLCMU0gNXEIYrLr
 fD9Hf611Oi57zE3CE1R46npz0u7H0BNKu/tSZARG/RYMJxNZNjlo5adM4TxNXbBliTnVvh1TSpU
 U2QCmezKP0rkzD/I=
X-Received: by 2002:a05:622a:4209:b0:3b5:4aae:cb0b with SMTP id
 cp9-20020a05622a420900b003b54aaecb0bmr20311146qtb.22.1674233029695; 
 Fri, 20 Jan 2023 08:43:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvy/5XF/94JDuEhfTCp7b9fbvlWQpjl1y3NqzyHg5JdTOM8arnd3y9rzy+nIdHIhR2Bd8FwhA==
X-Received: by 2002:a05:622a:4209:b0:3b5:4aae:cb0b with SMTP id
 cp9-20020a05622a420900b003b54aaecb0bmr20311128qtb.22.1674233029463; 
 Fri, 20 Jan 2023 08:43:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 bq35-20020a05620a46a300b0070209239b87sm6865847qkb.41.2023.01.20.08.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 08:43:48 -0800 (PST)
Message-ID: <5cfc9d33-6845-0644-f120-de20fb1d3142@redhat.com>
Date: Fri, 20 Jan 2023 17:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC] virtio-iommu: Take into account possible aliasing in
 virtio_iommu_mr()
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, peterx@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com, mst@redhat.com
References: <20230116124709.793084-1-eric.auger@redhat.com>
 <Y8qzOKm6kvhGWG1T@myrica> <4fead092-1058-198a-b430-3dee0fffcd51@arm.com>
 <Y8q/6NJhK1MhNuY9@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y8q/6NJhK1MhNuY9@myrica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jean, Robin,

On 1/20/23 17:23, Jean-Philippe Brucker wrote:
> On Fri, Jan 20, 2023 at 03:50:18PM +0000, Robin Murphy wrote:
>> On 2023-01-20 15:28, Jean-Philippe Brucker wrote:
>>
>> For some reason this came through as blank mail with a text attachment,
> Ugh sorry about that, looks like I hit ^D in mutt before sending
>
>> so apologies for the lack of quoting, but for reference this is a
>> long-standing known issue:
>>
>> https://lore.kernel.org/linux-iommu/9625faf4-48ef-2dd3-d82f-931d9cf26976@huawei.com/
>>
>> In summary, yes, hanging {of,acpi}_iommu_configure() off driver probe is
>> massively wrong, and pulling that step into iommu_probe_device() in a sane
>> and robust manner is one of the next things to start on after getting the
>> bus ops out of the way.
> Right, thanks for confirming

Thank you very much for your support and confirmation of the probe issue!

Eric
>
> Thanks,
> Jean
>


