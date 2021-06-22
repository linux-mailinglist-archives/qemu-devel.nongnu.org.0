Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D273B07E9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:49:56 +0200 (CEST)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvhit-0003e4-5Y
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Arseny.Krasnov@kaspersky.com>)
 id 1lvhi4-0002hW-Bn
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:49:04 -0400
Received: from mx12.kaspersky-labs.com ([91.103.66.155]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Arseny.Krasnov@kaspersky.com>)
 id 1lvhi2-0001oy-67
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:49:04 -0400
Received: from relay12.kaspersky-labs.com (unknown [127.0.0.10])
 by relay12.kaspersky-labs.com (Postfix) with ESMTP id 3166A75D30;
 Tue, 22 Jun 2021 17:49:00 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
 s=mail202102; t=1624373340;
 bh=n1Dnp7cvK7fevvJgy3L49t8XD9FGUKSeEKAeKOamzv4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=kh9dMmiaRpc83zP/7Ee+Izk6Xdw6/uupEx9OnIbWqrTfKPTxDSUNzv92/QpDRNH9j
 ejrhWhtklY0Atmv2NUKhyTwHcZHxtJR6NF/KPNHklpmYrCpYvG5jreFu06ooDOwJ+U
 D2cxiCjF1ZwPhvO42Uo7lR6DDyytiDKNVl5+j7Ix3gcLz9F5vFiRU3RUMoV7ouyjUF
 YosWJwXq5dHXWiFH7ZC1rbf+lHXB8yZhlTzFdAzJAjg4Xqbp57qWd8AkgZm0x6yq/K
 Cy2Nn1UjrtZfwEdybIcRIYkchondPcIFX8l6hwGnIWVUeDhLA0ge9kVFDBpKVoougC
 9W8zyhOe31UZg==
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client CN "mail-hq2.kaspersky.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id F0DF875D2E;
 Tue, 22 Jun 2021 17:48:59 +0300 (MSK)
Received: from [10.16.171.77] (10.64.68.129) by hqmailmbx3.avp.ru
 (10.64.67.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 22
 Jun 2021 17:48:19 +0300
Subject: Re: [PATCH v2] vhost-vsock: SOCK_SEQPACKET feature bit support
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
References: <20210622121631.2916319-1-arseny.krasnov@kaspersky.com>
 <20210622144117.owtroypg4litbeem@steredhat>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <9e03b985-184a-7c18-54f6-7d51c0f2e40c@kaspersky.com>
Date: Tue, 22 Jun 2021 17:48:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210622144117.owtroypg4litbeem@steredhat>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.64.68.129]
X-ClientProxiedBy: hqmailmbx3.avp.ru (10.64.67.243) To hqmailmbx3.avp.ru
 (10.64.67.243)
X-KSE-ServerInfo: hqmailmbx3.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/22/2021 14:26:00
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 164541 [Jun 22 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: arseny.krasnov@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: kaspersky.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/22/2021 14:29:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 22.06.2021 12:16:00
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KLMS-Rule-ID: 52
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Status: not scanned, disabled by settings
X-KLMS-AntiSpam-Interceptor-Info: not scanned
X-KLMS-AntiPhishing: Clean, bases: 2021/06/22 08:28:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 bases: 2021/06/22 05:48:00 #16781513
X-KLMS-AntiVirus-Status: Clean, skipped
Received-SPF: pass client-ip=91.103.66.155;
 envelope-from=Arseny.Krasnov@kaspersky.com; helo=mx12.kaspersky-labs.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 22.06.2021 17:41, Stefano Garzarella wrote:
> On Tue, Jun 22, 2021 at 03:16:31PM +0300, Arseny Krasnov wrote:
>> This adds processing of VIRTIO_VSOCK_F_SEQPACKET features bit. Guest
>> negotiates it with vhost, thus both will know that SOCK_SEQPACKET
>> supported by peer.
>>
>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>> ---
>> hw/virtio/vhost-vsock.c                       | 12 ++++++++++--
>> include/standard-headers/linux/virtio_vsock.h |  3 +++
>> 2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>> index c8f0699b4f..0406a5d3dc 100644
>> --- a/hw/virtio/vhost-vsock.c
>> +++ b/hw/virtio/vhost-vsock.c
>> @@ -103,12 +103,20 @@ static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
>>     }
>> }
>>
> If you have to resend, better move this to the beginning of the file, 
> right after the includes.
Done
>> +const int feature_bits[] = {
>> +    VIRTIO_VSOCK_F_SEQPACKET,
>> +    VHOST_INVALID_FEATURE_BIT
>> +};
>> +
>> static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>>                                          uint64_t requested_features,
>>                                          Error **errp)
>> {
>> -    /* No feature bits used yet */
>> -    return requested_features;
>> +    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> +
>> +    virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>> +    return vhost_get_features(&vvc->vhost_dev, feature_bits,
>> +                                requested_features);
>> }
>>
>> static const VMStateDescription vmstate_virtio_vhost_vsock = {
>> diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
>> index be443211ce..5eac522ee2 100644
>> --- a/include/standard-headers/linux/virtio_vsock.h
>> +++ b/include/standard-headers/linux/virtio_vsock.h
>> @@ -38,6 +38,9 @@
>> #include "standard-headers/linux/virtio_ids.h"
>> #include "standard-headers/linux/virtio_config.h"
>>
>> +/* The feature bitmap for virtio vsock */
>> +#define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET supported */
>> +
>> struct virtio_vsock_config {
>> 	uint64_t guest_cid;
>> } QEMU_PACKED;
>> -- 
>> 2.25.1
>>
> LGTM:
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
>

