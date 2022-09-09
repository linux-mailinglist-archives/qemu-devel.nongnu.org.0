Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F8D5B364F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 13:27:32 +0200 (CEST)
Received: from localhost ([::1]:59204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWcAV-0005m4-DH
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 07:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1oWc48-0007fW-4J
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 07:20:56 -0400
Received: from mail-m11880.qiye.163.com ([115.236.118.80]:56118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinghui@sangfor.com.cn>)
 id 1oWc3q-0000hk-9R
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 07:20:42 -0400
Received: from [0.0.0.0] (unknown [172.96.223.238])
 by mail-m11880.qiye.163.com (Hmail) with ESMTPA id 194D7204EC;
 Fri,  9 Sep 2022 19:20:21 +0800 (CST)
Message-ID: <5660954c-362c-289a-933e-97bd7c236b99@sangfor.com.cn>
Date: Fri, 9 Sep 2022 19:20:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] e1000e: set RX desc status with DD flag in a separate
 operation
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, georgmueller@gmx.net
References: <20220826160543.2120-1-dinghui@sangfor.com.cn>
 <CACGkMEtN3=6GAvYfjTstk_JFa+8nKGsWN5NzR+TRD4LfxyS9XA@mail.gmail.com>
From: dinghui <dinghui@sangfor.com.cn>
In-Reply-To: <CACGkMEtN3=6GAvYfjTstk_JFa+8nKGsWN5NzR+TRD4LfxyS9XA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTElIVklJT0gaSB0aSEtCHVUTARMWGhIXJBQOD1
 lXWRgSC1lBWUpMSVVCTVVJSUhVSUhDWVdZFhoPEhUdFFlBWU9LSFVKSEpOTUlVSktLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OE06CRw6Hz0uPjVOEQsvCxIz
 HytPCzFVSlVKTU1JTElJT0lPQkpMVTMWGhIXVR8SFRwTDhI7CBoVHB0UCVUYFBZVGBVFWVdZEgtZ
 QVlKTElVQk1VSUlIVUlIQ1lXWQgBWUFOTENINwY+
X-HM-Tid: 0a8321fabc742eb6kusn194d7204ec
Received-SPF: pass client-ip=115.236.118.80;
 envelope-from=dinghui@sangfor.com.cn; helo=mail-m11880.qiye.163.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.079,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 2022/9/9 10:40, Jason Wang wrote:
> On Sat, Aug 27, 2022 at 12:06 AM Ding Hui <dinghui@sangfor.com.cn> wrote:
>>
>> Like commit 034d00d48581 ("e1000: set RX descriptor status in
>> a separate operation"), there is also same issue in e1000e, which
>> would cause lost packets or stop sending packets to VM with DPDK.
>>
>> Do similar fix in e1000e.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/402
>> Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
>> ---
>>   hw/net/e1000e_core.c | 54 +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
>> index 208e3e0d79..b8038e4014 100644
>> --- a/hw/net/e1000e_core.c
>> +++ b/hw/net/e1000e_core.c
>> @@ -1364,6 +1364,58 @@ struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
>>       }
>>   }
>>
>> +static inline void
>> +e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
>> +                             uint8_t *desc, dma_addr_t len)
>> +{
>> +    PCIDevice *dev = core->owner;
>> +
>> +    if (e1000e_rx_use_legacy_descriptor(core)) {
>> +        struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
>> +        size_t offset = offsetof(struct e1000_rx_desc, status);
>> +        typeof(d->status) status = d->status;
>> +
>> +        d->status &= ~E1000_RXD_STAT_DD;
>> +        pci_dma_write(dev, addr, desc, len);
>> +
>> +        if (status & E1000_RXD_STAT_DD) {
>> +            d->status = status;
>> +            pci_dma_write(dev, addr + offset, &status, sizeof(status));
>> +        }
>> +    } else {
>> +        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
>> +            union e1000_rx_desc_packet_split *d =
>> +                (union e1000_rx_desc_packet_split *) desc;
>> +            size_t offset = offsetof(union e1000_rx_desc_packet_split,
>> +                wb.middle.status_error);
>> +            typeof(d->wb.middle.status_error) status =
>> +                d->wb.middle.status_error;
> 
> Any reason to use typeof here? Its type is known to be uint32_t?
> 

My intention was using exact type same with struct member status_error, 
which is indeed uint32_t now. If the type of status_error in struct be 
changed in some case, we do not need to change everywhere.

Maybe I worry too much, the struct is related to h/w spec, so it is 
unlikely be changed in the future.

Should I send v2 to use uint32_t directly? I'm also OK with it.

>> +
>> +            d->wb.middle.status_error &= ~E1000_RXD_STAT_DD;
>> +            pci_dma_write(dev, addr, desc, len);
>> +
>> +            if (status & E1000_RXD_STAT_DD) {
>> +                d->wb.middle.status_error = status;
>> +                pci_dma_write(dev, addr + offset, &status, sizeof(status));
>> +            }
>> +        } else {
>> +            union e1000_rx_desc_extended *d =
>> +                (union e1000_rx_desc_extended *) desc;
>> +            size_t offset = offsetof(union e1000_rx_desc_extended,
>> +                wb.upper.status_error);
>> +            typeof(d->wb.upper.status_error) status = d->wb.upper.status_error;
> 
> So did here.
> 
> Thanks
> 
>> +
>> +            d->wb.upper.status_error &= ~E1000_RXD_STAT_DD;
>> +            pci_dma_write(dev, addr, desc, len);
>> +
>> +            if (status & E1000_RXD_STAT_DD) {
>> +                d->wb.upper.status_error = status;
>> +                pci_dma_write(dev, addr + offset, &status, sizeof(status));
>> +            }
>> +        }
>> +    }
>> +}
>> +
>>   typedef struct e1000e_ba_state_st {
>>       uint16_t written[MAX_PS_BUFFERS];
>>       uint8_t cur_idx;
>> @@ -1600,7 +1652,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
>>
>>           e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
>>                              rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
>> -        pci_dma_write(d, base, &desc, core->rx_desc_len);
>> +        e1000e_pci_dma_write_rx_desc(core, base, desc, core->rx_desc_len);
>>
>>           e1000e_ring_advance(core, rxi,
>>                               core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
>> --
>> 2.17.1
>>
> 
> 


-- 
Thanks,
- Ding Hui

