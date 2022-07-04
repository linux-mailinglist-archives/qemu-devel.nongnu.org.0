Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73EF5650A4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 11:23:03 +0200 (CEST)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8III-00024W-GX
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 05:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1o8IHM-00016p-U1; Mon, 04 Jul 2022 05:22:04 -0400
Received: from mail-m11873.qiye.163.com ([115.236.118.73]:30232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1o8IHF-0003Fn-4i; Mon, 04 Jul 2022 05:22:01 -0400
Received: from [0.0.0.0] (unknown [IPV6:240e:3b7:327a:1650:5458:6562:f17:7dba])
 by mail-m11873.qiye.163.com (Hmail) with ESMTPA id 519509005B5;
 Mon,  4 Jul 2022 17:05:08 +0800 (CST)
Message-ID: <bf4885f2-9ed5-2c17-0b2e-e3f677a52ed1@sangfor.com.cn>
Date: Mon, 4 Jul 2022 17:04:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] e1000: set RX descriptor status in a separate operation
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, asm@asm.pp.ru
Cc: qemu-devel@nongnu.org, zhangjing@sangfor.com.cn,
 lifan38153@sangfor.com.cn, Stefan Hajnoczi <stefanha@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org
References: <20220629094026.558-1-dinghui@sangfor.com.cn>
 <9f349685-b935-942b-57ac-ff5499cda210@redhat.com>
From: Ding Hui <dinghui@sangfor.com.cn>
In-Reply-To: <9f349685-b935-942b-57ac-ff5499cda210@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTk1KVk8dHxgfQ0hMHxlIGFUTARMWGhIXJBQOD1
 lXWRgSC1lBWUlPSx5BSBlMQUhJTBpBSk1OS0FOT05DQU1OTUlBHUpMQUwfGRpZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxw6KDo6Hj08Hi1ROQFLTUkr
 CzQKFANVSlVKTU5NQklOTktCSkxMVTMWGhIXVR8SFRwTDhI7CBoVHB0UCVUYFBZVGBVFWVdZEgtZ
 QVlJT0seQUgZTEFISUwaQUpNTktBTk9OQ0FNTk1JQR1KTEFMHxkaWVdZCAFZQUlMSk43Bg++
X-HM-Tid: 0a81c874d4ad2eafkusn519509005b5
Received-SPF: pass client-ip=115.236.118.73;
 envelope-from=dinghui@sangfor.com.cn; helo=mail-m11873.qiye.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/7/4 15:10, Jason Wang wrote:
> 
> 在 2022/6/29 17:40, Ding Hui 写道:
>> @@ -1013,6 +1013,9 @@ e1000_receive_iov(NetClientState *nc, const 
>> struct iovec *iov, int iovcnt)
>>               DBGOUT(RX, "Null RX descriptor!!\n");
>>           }
>>           pci_dma_write(d, base, &desc, sizeof(desc));
>> +        desc.status |= (vlan_status | E1000_RXD_STAT_DD);
>> +        pci_dma_write(d, base + offsetof(struct e1000_rx_desc, status),
>> +                      &desc.status, sizeof(desc.status));
> 
> 
> Good catch, but to be more safe, I wonder if we can simply use 
> stx_le_pci_dma() here?
> 

Do you mean stb_le_pci_dma(d, base + offsetof(struct e1000_rx_desc, 
status), desc.status, MEMTXATTRS_UNSPECIFIED)?

I checked both pci_dma_write() and stb_le_pci_dma(), there is no 
difference between them, but I'm not sure whether it is proper to mixed 
use address based api and value based api, besides that it's OK to me.

Thanks for reply.

-- 
Thanks,
- Ding Hui



