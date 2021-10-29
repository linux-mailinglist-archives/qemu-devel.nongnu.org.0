Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5101C44003C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:23:16 +0200 (CEST)
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUex-0003s8-Dl
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgUTX-0000XN-NC
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgUTS-0004oR-VT
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635523881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6a2XhMM3vOLXgQtz+Td8Moze1vvQu5ulJmuz1fKtaB8=;
 b=R8dnLpQDYCLqkC0OIQ0obCjEf/rgOlMroLDLvrl1D2g5S5P0af63+LcMVLfiGEenNQuIf1
 l4zidEfclwB2gsEtWNsXTX7AFih6PsqQlBmjkEGCQTcIAKhQ7F72ZtD/4Ov9zDPROTwW7D
 VGxAA8Hd/LtNo17fWPXGNLMvHn14bVs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-4COvo9FQMg-rh4Aof_MUYw-1; Fri, 29 Oct 2021 12:11:17 -0400
X-MC-Unique: 4COvo9FQMg-rh4Aof_MUYw-1
Received: by mail-wr1-f72.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so2376797wrc.22
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6a2XhMM3vOLXgQtz+Td8Moze1vvQu5ulJmuz1fKtaB8=;
 b=m2tsXnpVCEf1QzZ0g66Bj6YjDzJeZMNbBEFvo0Sj+JkJ6790oErO5NMQbvOb0JSPKp
 DlCvigo9BN36zRx6yL7de2AkM9OzqkQMTANvg+XnVIvGLIbREfUFhiuYe+YpB/BNNdXB
 znOkqD5XyuDL3SSZktkce8LceJtU73skyqtWBN9c7cRYREIy8pvYCIvE9NaiJz/DZte3
 GYhzJjWTzcgpqxyEvOUylMsE55J845MWIp+Ouv2L5t0sWaQSjKHxLWJGiM8ZVd1PlkAW
 qBYAKx1BcGewJ0TgJo90F4h7ThNhTczv/2uzhq5XVHwTG9sKhB8uwHJHW/1rN0ROZUAl
 wd4Q==
X-Gm-Message-State: AOAM533SDTqyzDBIKc8jZv0bKSmU+dt+CBMofEqxoCtDr/XbB4rhCSiI
 b8KuF1seb8UlcRnqk3KOXwMqTJlEc+QSnaBu9c+mA3h+zhJZsJSKWcx6BZ1cKGjgjoXBCbbkvS9
 3tXZeF1vKrJyubwY=
X-Received: by 2002:adf:efc7:: with SMTP id i7mr15222423wrp.410.1635523876500; 
 Fri, 29 Oct 2021 09:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9Pf3FvADwDs2Nl5smRJ+w0uTgSUkunb/FAzE5QDpylGTcUIGAC9nJvuGkjo5oDK2mga6uTw==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr15222368wrp.410.1635523876212; 
 Fri, 29 Oct 2021 09:11:16 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id s3sm8957166wmh.30.2021.10.29.09.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:11:15 -0700 (PDT)
Message-ID: <e3f41186-b6c0-2a48-6b4c-19100227e0b4@redhat.com>
Date: Fri, 29 Oct 2021 18:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 6/9] qapi: Generalize command policy checking
To: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211028102520.747396-1-armbru@redhat.com>
 <20211028102520.747396-7-armbru@redhat.com>
 <20211029152811.usdi6bp7wsmlwn2d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211029152811.usdi6bp7wsmlwn2d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.512, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, kchamart@redhat.com, qemu-devel@nongnu.org,
 mdroth@linux.vnet.ibm.com, dgilbert@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, jsnow@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 17:28, Eric Blake wrote:
> On Thu, Oct 28, 2021 at 12:25:17PM +0200, Markus Armbruster wrote:
>> The code to check command policy can see special feature flag
>> 'deprecated' as command flag QCO_DEPRECATED.  I want to make feature
>> flag 'unstable' visible there as well, so I can add policy for it.
>>
>> To let me make it visible, add member @special_features (a bitset of
>> QapiSpecialFeature) to QmpCommand, and adjust the generator to pass it
>> through qmp_register_command().  Then replace "QCO_DEPRECATED in
>> @flags" by QAPI_DEPRECATED in @special_features", and drop
>> QCO_DEPRECATED.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Acked-by: John Snow <jsnow@redhat.com>
>> ---
> 
>> +++ b/qapi/qmp-dispatch.c
>> @@ -176,7 +176,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
>>                    "The command %s has not been found", command);
>>          goto out;
>>      }
>> -    if (cmd->options & QCO_DEPRECATED) {
>> +    if (cmd->special_features & 1u << QAPI_DEPRECATED) {
> 
> I admit having to check the C operator precedence table when reading

This doesn't seem a good use of (y)our time. Using a pair of parenthesis
is simpler.

I expect in a not far future that compilers emit a warning for this.

> this (<< is higher than &); if writing it myself, I would probably
> have used explicit () to avoid reviewer confusion, but what you have
> is correct.  (After grepping for ' & 1.*<<' and ' & (1.*<<', it looks
> like authors using explicit precedence happens more often, but that
> there are other instances in the code base relying on implicit
> precedence.)

$ git grep -E ' & [0-9a-zA-Z_]+ <<'
hw/dma/pl330.c:997:    if (~ch->parent->inten & ch->parent->ev_status &
1 << ev_id) {
hw/dma/xlnx-zynq-devcfg.c:198:        if (s->regs[R_LOCK] & 1 << i) {
hw/intc/grlib_irqmp.c:144:        if (s->broadcast & 1 << irq) {
hw/net/fsl_etsec/rings.c:491:    if (etsec->regs[RSTAT].value & 1 << (23
- ring_nbr)) {
hw/net/virtio-net.c:748:            (n->host_features & 1ULL <<
VIRTIO_NET_F_MTU)) {
hw/pci-host/mv64361.c:812:                if ((ch & 0xff << i) && !(val
& 0xff << i)) {
hw/pci-host/mv64361.c:858:        if (s->gpp_int_level && !(val & 0xff
<< b)) {
hw/ssi/xilinx_spi.c:123:        qemu_set_irq(s->cs_lines[i],
!(~s->regs[R_SPISSR] & 1 << i));
hw/ssi/xilinx_spips.c:441:            r[idx[!d]] |= x[idx[d]] & 1 <<
bit[d] ? 1 << bit[!d] : 0;
target/s390x/cpu_features.c:56:                if (init[i] & 1ULL << j) {
tests/qtest/bios-tables-test.c:209:    if (!(val & 1UL << 20 /*
HW_REDUCED_ACPI */)) {

Not that many.


