Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B518650A9B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7E2b-0003IE-8d; Mon, 19 Dec 2022 06:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1p7E2Z-0003Hx-86
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:10:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1p7E2X-0007Q1-GO
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671448236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yj+I1lBEgyrZneSKsHS4h/NvByUt4rlEtpTxh0Qafh0=;
 b=IluokYyyaTQlAmW+VNsKVWia4gonINNM1iZZCg6fSxIHeDRchHV3nrxxSJg52+E+I+JqQm
 ahbXk8U5i7nyBiOTMijP2JetAfo6pdxQU4P2o257t6zneg+XSgSwDS9Jx/4v9edIWokGwo
 o9c6ujMnFjar+I/BFPiKpTnmLmOghJI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-fLFXDSEWNKm7kbux886pXA-1; Mon, 19 Dec 2022 06:10:35 -0500
X-MC-Unique: fLFXDSEWNKm7kbux886pXA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sd1-20020a1709076e0100b00810be49e7afso2374766ejc.22
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 03:10:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yj+I1lBEgyrZneSKsHS4h/NvByUt4rlEtpTxh0Qafh0=;
 b=GP3mFEe+IJNNBC2R4xl7459asSD10532w5Ln9fPnXYVwpZsFWV6fKDbVOmI1rHaSS7
 YKAdLNgdmLSuq0e89rjammq0a4ZGgwdmFJ9rnCSrMtI0Mnzp4xpv2XpzVI3tmW7J3ZtN
 sYrniiJ2ehuzh5JRPkdYnMqSaB4LaymnibM4PeTqzzf+k96ufSJYkjdgQSIUUeUVKqmM
 wiWtyXERaHP6UmBw6o210aE08z8CyHPKEdH3cZ8tr+7e72v4p41ye0QrdPs3FQ2uP69h
 7UejBKySUgIT1xC2yo8f52jSmUZwSzs1mm2RrvO21cjYKDIf8x1vwLLAVs+FfFltEUzE
 nN7A==
X-Gm-Message-State: ANoB5pnAw7yfm/wHkI25ugMdXVbMVDpikELBS8NT2aTXT1lW04PKBsm3
 Zl6pBLXD5ecBzMF1nUZki0WfgbKhZ0IyMMtR8GDJChhQjwDTq1BcbAPrNW9i8Bfn5y+m7cpqhBe
 aZHerL14hX66JCZo=
X-Received: by 2002:a17:906:3716:b0:7c0:bbab:22e5 with SMTP id
 d22-20020a170906371600b007c0bbab22e5mr32628668ejc.16.1671448234036; 
 Mon, 19 Dec 2022 03:10:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6bzx/KcH8d/9Nn9/dh8WS9TfD24fZ6rAt/LZAYFQFrPCX/QktE3TSzCe1nUZoHSAvLqD9YWQ==
X-Received: by 2002:a17:906:3716:b0:7c0:bbab:22e5 with SMTP id
 d22-20020a170906371600b007c0bbab22e5mr32628660ejc.16.1671448233825; 
 Mon, 19 Dec 2022 03:10:33 -0800 (PST)
Received: from [10.43.2.39] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ky3-20020a170907778300b0073d7b876621sm4140634ejc.205.2022.12.19.03.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 03:10:33 -0800 (PST)
Message-ID: <88d57d47-09e5-ebd8-82aa-f289a05e0517@redhat.com>
Date: Mon, 19 Dec 2022 12:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] hostmem: Honor multiple preferred nodes if possible
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: imammedo@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com
References: <a0b4adce1af5bd2344c2218eb4a04b3ff7bcfdb4.1671097918.git.mprivozn@redhat.com>
 <f06e436f-223a-9318-d631-c9d5c711af1b@redhat.com>
 <c7fc7797-6696-e9d8-8c1a-dd4b86cc2781@redhat.com>
 <536107c6-b142-d5aa-0d94-4277a5c5af15@redhat.com>
 <e264e466-5cff-3b7f-9850-ba203ce02828@redhat.com>
 <302262b2-e928-7013-3f4e-4ab5a9616844@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <302262b2-e928-7013-3f4e-4ab5a9616844@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/19/22 10:58, David Hildenbrand wrote:
> 
> I'll fixup. I just queued the fixed-up patch to
> 
> https://github.com/davidhildenbrand/qemu.git mem-next
> 
> Please double-check. Thanks!
> 

Looks good. Sorry for not doing it properly the first time.

Michal


