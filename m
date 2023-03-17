Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD76BEB02
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAwg-00010M-Qp; Fri, 17 Mar 2023 10:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pdAwf-000100-EZ
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:20:37 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pdAwd-0005Nx-55
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:20:37 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 f6-20020a17090ac28600b0023b9bf9eb63so5325168pjt.5
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 07:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679062833;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PJAK1AsmS8a3FLukpfq1q89ZflRMei33dNMbQaPW2p4=;
 b=GIYqD0rBh92lTGEF3bjQAcnzDfT7qjumH2CcZ9qttLomeeaMGlfD3v5K4/aetpJAqq
 XQSwjm3/Y0X6y0TDMKUqZxzZGvaTkk2Nf+4w/dOIzZ9UvJAcbyccRCdOJ4NpSF+oVuOI
 p/J7yDooMNIq7Gnf/ypL+cgVi2WraK1T23c8NbBApk3K3Fx18rUBrgz8HWCS/7IzY9iQ
 nC/lnT7fws8YiH15jqGp/KA4NyF1DhoW3eFTMfiK7DX/3uX7OzQUCWkSNLTO1SIyI57s
 V0Ix5e8sFcTxNKfbjl9BWP8cxKGPdkSN1JRFsLF/I9PPtOUbszeInuaLpYvI6CuaqOLq
 DVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679062833;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PJAK1AsmS8a3FLukpfq1q89ZflRMei33dNMbQaPW2p4=;
 b=5pUHSWkOlsvlPAf7767nVSYsgNDc/73kob23HQximYNnG5iEp7eHgaYJHdWAocWbCf
 tzs+IBNzL7yNQ9/l2PQmizaPO/6LH1fLOlsNN3yk8rbFwI66Xlgx0b355jwey9LwYydk
 mpGZ4r3cBNRKw/biKWgcFyLcRW81GwYLj+CKD4AaUjwrpyGTmKobbygOH/RJu3Dc0Gl4
 KsLm6QiDOgXhjht5lh5XOdGmPHAM6ciWZrQE1MVOEL/cPbVq2rnzp0Llak7KXVn2t8iS
 6SxV1WnLJUOY7zHFVZ13FQBo4iPP9IkilvFoGr9asWpG6SbCmhmJ3cFeFnaJfuLMXb+R
 S3dA==
X-Gm-Message-State: AO0yUKWfK+i4DEuWUiNn6xm79l+AOe54TAc5dvWmASikcQFfwuZ6w4pV
 Z8wDXafKRZEo5MSJl1iw7cSuxA==
X-Google-Smtp-Source: AK7set9PM7wnLZug8I+8uKaqEVd8LA8g0EiF3cn4cIOkMa9vfMh9rEYaktifJP+QgK+MXFm9o9lXoQ==
X-Received: by 2002:a05:6a20:2d8:b0:d3:c1c4:5e37 with SMTP id
 24-20020a056a2002d800b000d3c1c45e37mr7429823pzb.53.1679062833491; 
 Fri, 17 Mar 2023 07:20:33 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a62e401000000b005e4c3e2022fsm1641218pfh.72.2023.03.17.07.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 07:20:32 -0700 (PDT)
Message-ID: <345cb091-2906-579e-83ef-c5be75769199@daynix.com>
Date: Fri, 17 Mar 2023 23:20:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] igb: Save more Tx states
To: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "quintela@redhat.com" <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230317122456.43461-1-akihiko.odaki@daynix.com>
 <DBBP189MB1433B24E821E8E3F0B6B540C95BD9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <DBBP189MB1433B24E821E8E3F0B6B540C95BD9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/03/17 22:08, Sriram Yagnaraman wrote:
> 
> 
>> -----Original Message-----
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Friday, 17 March 2023 13:25
>> Cc: qemu-devel@nongnu.org; Jason Wang <jasowang@redhat.com>; Dmitry
>> Fleytman <dmitry.fleytman@gmail.com>; quintela@redhat.com; Philippe
>> Mathieu-Daudé <philmd@linaro.org>; Sriram Yagnaraman
>> <sriram.yagnaraman@est.tech>; Akihiko Odaki <akihiko.odaki@daynix.com>
>> Subject: [PATCH for 8.0] igb: Save more Tx states
>>
>> The current implementation of igb uses only part of a advanced Tx context
>> descriptor and first data descriptor because it misses some features and sniffs
>> the trait of the packet instead of respecting the packet type specified in the
>> descriptor. However, we will certainly need the entire Tx context descriptor
>> when we update igb to respect these ignored fields. Save the entire context
>> descriptor and first data descriptor except the buffer address to prepare for
>> such a change.
>>
>> This also introduces the distinction of contexts with different indexes, which
>> was not present in e1000e but in igb.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>> Supersedes: <20230316155707.27007-1-akihiko.odaki@daynix.com>
>>
>>   hw/net/igb.c      | 25 ++++++++++++++++++-------
>>   hw/net/igb_core.c | 36 +++++++++++++++++++-----------------
>>   hw/net/igb_core.h |  8 +++-----
>>   3 files changed, 40 insertions(+), 29 deletions(-)
>>
>> diff --git a/hw/net/igb.c b/hw/net/igb.c index c6d753df87..7c05896325
>> 100644
>> --- a/hw/net/igb.c
>> +++ b/hw/net/igb.c
>> @@ -502,16 +502,27 @@ static int igb_post_load(void *opaque, int
>> version_id)
>>       return igb_core_post_load(&s->core);  }
>>
>> -static const VMStateDescription igb_vmstate_tx = {
>> -    .name = "igb-tx",
>> +static const VMStateDescription igb_vmstate_tx_ctx = {
>> +    .name = "igb-tx-ctx",
>>       .version_id = 1,
>>       .minimum_version_id = 1,
>>       .fields = (VMStateField[]) {
>> -        VMSTATE_UINT16(vlan, struct igb_tx),
>> -        VMSTATE_UINT16(mss, struct igb_tx),
>> -        VMSTATE_BOOL(tse, struct igb_tx),
>> -        VMSTATE_BOOL(ixsm, struct igb_tx),
>> -        VMSTATE_BOOL(txsm, struct igb_tx),
>> +        VMSTATE_UINT32(vlan_macip_lens, struct e1000_adv_tx_context_desc),
>> +        VMSTATE_UINT32(seqnum_seed, struct e1000_adv_tx_context_desc),
>> +        VMSTATE_UINT32(type_tucmd_mlhl, struct
>> e1000_adv_tx_context_desc),
>> +        VMSTATE_UINT32(mss_l4len_idx, struct e1000_adv_tx_context_desc),
>> +    }
>> +};
>> +
>> +static const VMStateDescription igb_vmstate_tx = {
>> +    .name = "igb-tx",
>> +    .version_id = 2,
>> +    .minimum_version_id = 2,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_STRUCT_ARRAY(ctx, struct igb_tx, 2, 0, igb_vmstate_tx_ctx,
>> +                             struct e1000_adv_tx_context_desc),
>> +        VMSTATE_UINT32(first_cmd_type_len, struct igb_tx),
>> +        VMSTATE_UINT32(first_olinfo_status, struct igb_tx),
>>           VMSTATE_BOOL(first, struct igb_tx),
>>           VMSTATE_BOOL(skip_cp, struct igb_tx),
>>           VMSTATE_END_OF_LIST()
>> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c index
>> a7c7bfdc75..36027c2b54 100644
>> --- a/hw/net/igb_core.c
>> +++ b/hw/net/igb_core.c
>> @@ -389,8 +389,10 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt
>> *pkt, bool tx,  static bool  igb_setup_tx_offloads(IGBCore *core, struct igb_tx
>> *tx)  {
>> -    if (tx->tse) {
>> -        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->mss)) {
>> +    if (tx->first_cmd_type_len & E1000_ADVTXD_DCMD_TSE) {
>> +        uint32_t idx = (tx->first_olinfo_status >> 4) & 1;
> 
> [...] More below
> 
>> +        uint32_t mss = tx->ctx[idx].mss_l4len_idx >> 16;
>> +        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
>>               return false;
>>           }
>>
>> @@ -399,13 +401,13 @@ igb_setup_tx_offloads(IGBCore *core, struct igb_tx
>> *tx)
>>           return true;
>>       }
>>
>> -    if (tx->txsm) {
>> +    if (tx->first_olinfo_status & E1000_ADVTXD_POTS_TXSM) {
>>           if (!net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0)) {
>>               return false;
>>           }
>>       }
>>
>> -    if (tx->ixsm) {
>> +    if (tx->first_olinfo_status & E1000_ADVTXD_POTS_IXSM) {
>>           net_tx_pkt_update_ip_hdr_checksum(tx->tx_pkt);
>>       }
>>
>> @@ -527,7 +529,7 @@ igb_process_tx_desc(IGBCore *core,  {
>>       struct e1000_adv_tx_context_desc *tx_ctx_desc;
>>       uint32_t cmd_type_len;
>> -    uint32_t olinfo_status;
>> +    uint32_t idx;
>>       uint64_t buffer_addr;
>>       uint16_t length;
>>
>> @@ -538,20 +540,19 @@ igb_process_tx_desc(IGBCore *core,
>>               E1000_ADVTXD_DTYP_DATA) {
>>               /* advanced transmit data descriptor */
>>               if (tx->first) {
>> -                olinfo_status = le32_to_cpu(tx_desc->read.olinfo_status);
>> -
>> -                tx->tse = !!(cmd_type_len & E1000_ADVTXD_DCMD_TSE);
>> -                tx->ixsm = !!(olinfo_status & E1000_ADVTXD_POTS_IXSM);
>> -                tx->txsm = !!(olinfo_status & E1000_ADVTXD_POTS_TXSM);
>> -
>> +                tx->first_cmd_type_len = cmd_type_len;
>> +                tx->first_olinfo_status =
>> + le32_to_cpu(tx_desc->read.olinfo_status);
>>                   tx->first = false;
>>               }
>>           } else if ((cmd_type_len & E1000_ADVTXD_DTYP_CTXT) ==
>>                      E1000_ADVTXD_DTYP_CTXT) {
>>               /* advanced transmit context descriptor */
>>               tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
>> -            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
>> -            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
>> +            idx = (tx_ctx_desc->mss_l4len_idx >> 4) & 1;
> 
> I do not know if there are any other drivers that use more than 2 contexts, but as I read 7.2.2.2.11 IDX (3), IDX is a 3 bit field.
> The above line will interpret 3, 5 and 7 as 1 for e.g.

7.2.1.4 "Transmit Contexts" says:
 > The 82576 supports 32 context register sets on-chip (two per queue)

DPDK also uses only two contexts while its design is extensible and can 
use more if the hardware allows. Therefore, it can be concluded that the 
device actually has only two contexts.

I don't know why IDX is defined as 3-bit field, but I think it's safe to 
ignore the other two bits as we do for the other reserved bits.

> 
>> +            tx->ctx[idx].vlan_macip_lens = le32_to_cpu(tx_ctx_desc-
>>> vlan_macip_lens);
>> +            tx->ctx[idx].seqnum_seed = le32_to_cpu(tx_ctx_desc->seqnum_seed);
>> +            tx->ctx[idx].type_tucmd_mlhl = le32_to_cpu(tx_ctx_desc-
>>> type_tucmd_mlhl);
>> +            tx->ctx[idx].mss_l4len_idx =
>> + le32_to_cpu(tx_ctx_desc->mss_l4len_idx);
>>               return;
>>           } else {
>>               /* unknown descriptor type */ @@ -575,8 +576,10 @@
>> igb_process_tx_desc(IGBCore *core,
>>       if (cmd_type_len & E1000_TXD_CMD_EOP) {
>>           if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
>>               if (cmd_type_len & E1000_TXD_CMD_VLE) {
>> -                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
>> -                    core->mac[VET] & 0xffff);
>> +                idx = (tx->first_olinfo_status >> 4) & 1;
>> +                uint16_t vlan = tx->ctx[idx].vlan_macip_lens >> 16;
>> +                uint16_t vet = core->mac[VET] & 0xffff;
>> +                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
>>               }
>>               if (igb_tx_pkt_send(core, tx, queue_index)) {
>>                   igb_on_tx_done_update_stats(core, tx->tx_pkt); @@ -4024,8
>> +4027,7 @@ static void igb_reset(IGBCore *core, bool sw)
>>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>>           tx = &core->tx[i];
>>           net_tx_pkt_reset(tx->tx_pkt);
>> -        tx->vlan = 0;
>> -        tx->mss = 0;
>> +        memset(&tx->ctx, 0, sizeof(tx->ctx));
>>           tx->tse = false;
>>           tx->ixsm = false;
>>           tx->txsm = false;
>> diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h index
>> 814c1e264b..8914e0b801 100644
>> --- a/hw/net/igb_core.h
>> +++ b/hw/net/igb_core.h
>> @@ -72,11 +72,9 @@ struct IGBCore {
>>       QEMUTimer *autoneg_timer;
>>
>>       struct igb_tx {
>> -        uint16_t vlan;  /* VLAN Tag */
>> -        uint16_t mss;   /* Maximum Segment Size */
>> -        bool tse;       /* TCP/UDP Segmentation Enable */
>> -        bool ixsm;      /* Insert IP Checksum */
>> -        bool txsm;      /* Insert TCP/UDP Checksum */
>> +        struct e1000_adv_tx_context_desc ctx[2];
>> +        uint32_t first_cmd_type_len;
>> +        uint32_t first_olinfo_status;
>>
>>           bool first;
>>           bool skip_cp;
>> --
>> 2.39.2
> 

