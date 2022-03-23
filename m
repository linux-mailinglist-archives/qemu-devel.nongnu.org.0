Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C84E548C
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:49:44 +0100 (CET)
Received: from localhost ([::1]:37542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX2Ix-0005BS-QK
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:49:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nX2Ez-0001M0-5K
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:45:37 -0400
Received: from [2607:f8b0:4864:20::434] (port=42531
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1nX2Ag-0005kI-VH
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:41:13 -0400
Received: by mail-pf1-x434.google.com with SMTP id g19so1645429pfc.9
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9S4eZd/rXA3n6neAOpli6HJc1yfp+ivfWjQ96On7pkI=;
 b=QhZqkNggS08Iaw6ai+E2dKoy/D9zbMKsZp1q7bLscXQKKNTf2iXab7MnrMd1vBk6Er
 2MWstlzqkm6T21vy6t5M/3ndyjHsZso7L4CrkCYWu2ChTfnRgKwo2TgNg9RMXSEwp9MW
 GMfSOF1OQQWrio3KOet+GLNOTHxytfLoHtF+kYIrYQUtTUhN0AYpaR6IdBrjTJMNr6Xa
 /WpnT6wXbFhnN1OR2SQQcLPAGSXzDTvuuPs7jGWyBMTXLtrvgdhQoUgZl+dNRulOviAQ
 2iKSILaEbeGVSymi+LDckIyJJAyZtHlx8ZIVDLV3O/ut2zEsWbNgJXoV9+kUq9QMDIZ5
 mKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9S4eZd/rXA3n6neAOpli6HJc1yfp+ivfWjQ96On7pkI=;
 b=CuEDC8lH2GfoBK7ABLvUp2GlpOdKixBLJAIlif7BaWz0xXiOSJhAkc/Bp/01WZ097E
 PHrutqYIIaetrIzJ4z60FOhB621m5by3kM6EhTURwE4hqSlsO0TqAFKSt2s2ANcY2ZtI
 tNZ8bxZuEvG8V5Nsj9uwBb3mGiMUmX8POBTgcHGH8sZ8t3Lia8n3tAGcjhlp7WaRN/CA
 6JiXSd8cuzMgio9aInbzOeBPjBVNd/9IGsJnzawV1nd98zcdsd6Jhdx0SH62ZeDTVa7k
 1jcm2pB4CjNe8CcfOebWkqMRcKmQSwdHegLyjPirtULRx4RfRnS+gIOaDcpRo0CvP0+O
 9wnA==
X-Gm-Message-State: AOAM530jwrUTQDcsqMf0VccVXCLmLLBNSSeEHXQFd9IpoePmN6pO/qx2
 J9Psium/BrwjPi6CvpQoUOdN8g==
X-Google-Smtp-Source: ABdhPJxs2YxbMDq4cFOUneNrKNpZMka1lWtg2y+oKbcBfOGQcS9WES0IMW0H8pPRUYmVwxqVrEN6wg==
X-Received: by 2002:a63:ae03:0:b0:386:2b5d:dd7d with SMTP id
 q3-20020a63ae03000000b003862b5ddd7dmr196912pgf.332.1648046467709; 
 Wed, 23 Mar 2022 07:41:07 -0700 (PDT)
Received: from [10.255.146.117] ([139.177.225.224])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056a001a8b00b004fab740dbddsm166340pfv.105.2022.03.23.07.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 07:41:07 -0700 (PDT)
Message-ID: <f0b798fe-d341-775d-c722-1d05b99da0c3@bytedance.com>
Date: Wed, 23 Mar 2022 22:37:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Re: [PATCH v3 0/6] Support akcipher for virtio-crypto
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220323024912.249789-1-pizhenwei@bytedance.com>
 <20220323083558-mutt-send-email-mst@kernel.org>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20220323083558-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: herbert@gondor.apana.org.au, jasowang@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, arei.gonglei@huawei.com,
 linux-crypto@vger.kernel.org,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 20:36, Michael S. Tsirkin wrote:
> On Wed, Mar 23, 2022 at 10:49:06AM +0800, zhenwei pi wrote:
>> v2 -> v3:
>> - Introduce akcipher types to qapi
>> - Add test/benchmark suite for akcipher class
>> - Seperate 'virtio_crypto: Support virtio crypto asym operation' into:
>>    - crypto: Introduce akcipher crypto class
>>    - virtio-crypto: Introduce RSA algorithm
> 
> Thanks!
> I tagged this but qemu is in freeze. If possible pls ping or
> repost after the release to help make sure I don't lose it.
> 
Hi,

Daniel has started to review this patchset, according to Daniel's 
important suggestion, I'll rework this feature and post the next version 
later.

Thanks a lot!

-- 
zhenwei pi

