Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C19547614E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:03:49 +0100 (CET)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZZ6-0006eh-D9
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:03:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXrI-0006P7-Vj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:14:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxXrH-0008W3-F9
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639588466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7W8yCdgxujTQXBUcwTQP0YT4WKi+2Bfreyrw9yWArg=;
 b=Z9NHrm6416+Hyh9mp3F8g4Nk8uVbG8qFcjMWG8x0aCBu8W18lz2Y4CTV48/DKN+d3TjvBh
 hzNbshVk6xBw037MJzyLhwATQTR0kZFoGp970qho8H8tcdQZ/ezgfxK3MQcAPwCnlD/Bfi
 CoODnGVpI1ZwnRL8uupzSHiaf5ho18k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-gzAcOfkrPlWi1Cq1dbXrDg-1; Wed, 15 Dec 2021 12:14:23 -0500
X-MC-Unique: gzAcOfkrPlWi1Cq1dbXrDg-1
Received: by mail-wm1-f69.google.com with SMTP id
 n16-20020a05600c3b9000b003331973fdbbso9302547wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 09:14:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D7W8yCdgxujTQXBUcwTQP0YT4WKi+2Bfreyrw9yWArg=;
 b=OZeUF96uDkDNmddoaU9fwY1RvnfptVYVmmXuvYddmt24ScfqswR837bp4I8W1Frces
 3l4jL2zEU2ZN4IiSfMKl+a14LO/YYhNCKu2Q1NjCYzpvQDwzDOLhDqrWeGCvCpK8WR6F
 +INY07BOILx01381UcG5OoNa0i00bIl/7UK9wSrvlX9sVYdCFynrhL+gVMrYlPxyZs4j
 Xt5muG5WowRk+vEr4W4ANkG33aO7oEHHEcPu1FkTHKKNuE/JU4Ywr56HQ03iQ4z9fNQO
 6grbe9vMQeCS9qGscy+/N/p7yrp6fwMITiBhw1OHM2ZPHfJ8Mn/IOmb87AdibKQXUfLv
 Eb4Q==
X-Gm-Message-State: AOAM5322zdWZr+3NZlFy6Yfb9eSw16v9mU/51gfakZ5PwBg897zrFvrI
 IvCllsWuPIq2BUdHkev6dKKAwtzNHUKUW3c36ETLj+fFs6PoVJ7Z/oJodJDFpZMtnl7PvqlWrix
 aoHUQuFc2inlubu4=
X-Received: by 2002:adf:c7d2:: with SMTP id y18mr2177897wrg.717.1639588461963; 
 Wed, 15 Dec 2021 09:14:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPE4GaZDmaoWlY64T3fyjCJSZhKNFMTTdpWsY2DyYhJBgAiitMM3iwZIKkoYqxDxjYizRQDA==
X-Received: by 2002:adf:c7d2:: with SMTP id y18mr2177865wrg.717.1639588461750; 
 Wed, 15 Dec 2021 09:14:21 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id m15sm34071wrw.27.2021.12.15.09.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 09:14:21 -0800 (PST)
Message-ID: <3e160727-eb18-3e7f-1a60-3d143b6bde1f@redhat.com>
Date: Wed, 15 Dec 2021 18:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm
 field
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-4-philmd@redhat.com> <YSPr6dN+iKKFlCxy@t490s>
 <922195af-f70d-eaf6-2aa4-b924f8196076@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <922195af-f70d-eaf6-2aa4-b924f8196076@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 21:04, David Hildenbrand wrote:
> On 23.08.21 20:41, Peter Xu wrote:
>> On Mon, Aug 23, 2021 at 06:41:55PM +0200, Philippe Mathieu-Daudé wrote:
>>> +/* Permission to restrict bus memory accesses. See
>>> MemTxAttrs::bus_perm */
>>> +enum {
>>> +    MEMTXPERM_UNSPECIFIED   = 0,
>>> +    MEMTXPERM_UNRESTRICTED  = 1,
>>> +    MEMTXPERM_RAM_DEVICE    = 2,
>>> +};
>>
>> Is there a difference between UNSPECIFIED and UNRESTRICTED?
>>
>> If no, should we merge them?
>>
> 
> I'd assume MEMTXPERM_UNSPECIFIED has to be treated like
> MEMTXPERM_UNRESTRICTED, so I'd also think we should just squash them.

For now they are treated the same way, but ideally we should
explicitly classify bus accesses and remove the MEMTXPERM_UNSPECIFIED.

While we can use the same definition with comments, I think having
different definitions ease maintainance (thinking of git-grep), but
if we know we will never classify/convert the devices, then indeed
having MEMTXPERM_UNSPECIFIED is pointless and confusing.


