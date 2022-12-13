Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288D64B17E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 09:49:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p50x0-0004MW-6W; Tue, 13 Dec 2022 03:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p50wx-0004MA-SV
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:47:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p50ww-0001YZ-5W
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:47:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670921261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YHOjWref26LDnn6B8u2hd+g9889Yo5CV9mS3OqNDkZg=;
 b=gv0JhiRBaVYekO+T5cdfwYKZXRkiYScHbwIQp8KT4erVbR6WzD3xddueO4st7htgjDW9Pm
 vxWcJjUTPuC/ykJ41+J5aqzbUFpm3/UqZm5AKm9NKYIP5ti/SNjFfHAVcUAuL7/EIZ4iz9
 gJmMDbS1emFdh7DZpjjAb7oK7q8eLcU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-104-w8SvmTR9PkeEHROrlr82xg-1; Tue, 13 Dec 2022 03:47:35 -0500
X-MC-Unique: w8SvmTR9PkeEHROrlr82xg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so4495744wms.9
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 00:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YHOjWref26LDnn6B8u2hd+g9889Yo5CV9mS3OqNDkZg=;
 b=EZlTWjOseTye0nBBgf+X691mevbT1XKs9DwQzFRDqtFBTrZCkMb+Ho1B3K+kxz1LcX
 jpZtOsRf9brTHdAvTE04IB7Trv85LWgEjLDgHHiexj/f5Zd4hX3pxyVk2bCCKcCdfOwY
 GZXoZzqSEDw1VMnstbTfePktCGxxtkMqqmD6kqxKwgLEEtZSthwd91x/i0NkQooHavqK
 TcWVNFWg1hyI5pQX1CUu9d2EMctD4cHBhW6tNHVQ/XlE+SlW49c4M3wsDpxZNyyg7XJF
 VdfJQ+fdCahWabDp7mwHbTnAFy6QCw+wlJkLDJ95m1bIuiPBTtVjpcazZ8O4MDuJLmv4
 HBIQ==
X-Gm-Message-State: ANoB5ploLKm/6dPo5uUmPoLv9HUlRAjTmzv6JEsC0WZA5zJnTFY1UJgb
 VmQNEhLtESimZUPU9p8f8oO8Zb2CXIWQWo2KgiNDimohuz+7ABZJzmfkTU4LJ96lU45B8Qh3+td
 /NLACkU/6kJpAx4o=
X-Received: by 2002:adf:ec10:0:b0:242:2206:7c61 with SMTP id
 x16-20020adfec10000000b0024222067c61mr14643147wrn.62.1670921254529; 
 Tue, 13 Dec 2022 00:47:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5jT/FjrxlQI+X2tBP3MtVpKPWdmsp+r6DeqArDLcYp0GNOyzQBDkHM1w+PnUGNIGrJpkgnxQ==
X-Received: by 2002:adf:ec10:0:b0:242:2206:7c61 with SMTP id
 x16-20020adfec10000000b0024222067c61mr14643119wrn.62.1670921254229; 
 Tue, 13 Dec 2022 00:47:34 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-131.web.vodafone.de.
 [109.43.178.131]) by smtp.gmail.com with ESMTPSA id
 z9-20020adfec89000000b002364c77bcacsm10933559wrn.38.2022.12.13.00.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 00:47:33 -0800 (PST)
Message-ID: <d4063ce9-30a5-01b6-3869-b43ff5663711@redhat.com>
Date: Tue, 13 Dec 2022 09:47:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH-for-8.0 06/10] hw/virtio: Cache access_is_big_endian
 value in VirtIODevice state
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-7-philmd@linaro.org>
 <94c26d02-94d5-ec42-99bf-3fac080e567e@linaro.org>
 <8ed5aab1-402f-9d9b-c70e-5d8082d35d1e@linaro.org>
 <8bc3e65d-3f1f-22e5-d56e-2b8bb1a57319@redhat.com>
 <6e6afa52-0a46-91fa-ebd4-642dfd2499a9@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <6e6afa52-0a46-91fa-ebd4-642dfd2499a9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/12/2022 09.32, Philippe Mathieu-Daudé wrote:
> On 13/12/22 09:03, Thomas Huth wrote:
>> On 13/12/2022 08.30, Philippe Mathieu-Daudé wrote:
>>> On 13/12/22 01:14, Richard Henderson wrote:
>>>> On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
>>>>> The device endianness doesn't change during runtime.
>>>>
>>>> What are you talking about?  Of course it does.
>>>
>>> The host CPU certainly does, but the virtio device doesn't... Does it?
>>>
>>> This check only consider the device, not the CPU:
>>>
>>>      bool virtio_access_is_big_endian(VirtIODevice *vdev)
>>>      {
>>>      #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
>>>          return virtio_is_big_endian(vdev);
>>>      #elif TARGET_BIG_ENDIAN
>>>          if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
>>>              /*Devices conforming to VIRTIO 1.0 or later are always LE.*/
>>>              return false;
>>>          }
>>>          return true;
>>
>> Well, this part here means that the endianness can indeed change on the 
>> device side during runtime. Depending on whether VIRTIO_F_VERSION_1 is 
>> negotiated or not, the device is little or big endian. Happens on s390x 
>> for example - for legacy virtio, big endian is used, and for modern 
>> virtio, little endian is used instead.
> 
> virtio_is_big_endian() depends on vdev->device_endian which is set in:
> 
> 1) virtio_init()
> 
>      void virtio_init(VirtIODevice *vdev, uint16_t device_id,
>                       size_t config_size)
>      {
>          ....
>          vdev->device_endian = virtio_default_endian();
> 
> 2) virtio_load()
> 
>      int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
>      {
>          int i, ret;
>          int32_t config_len;
>          uint32_t num;
>          uint32_t features;
>          BusState *qbus = qdev_get_parent_bus(DEVICE(vdev));
>          VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(qbus);
>          VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
> 
>          /*
>           * We poison the endianness to ensure it does not get
>           * used before subsections have been loaded.
>           */
>          vdev->device_endian = VIRTIO_DEVICE_ENDIAN_UNKNOWN;
>          ....
> 
>          if (vdev->device_endian == VIRTIO_DEVICE_ENDIAN_UNKNOWN) {
>              vdev->device_endian = virtio_default_endian();
>          }
> 
> 3) virtio_reset()
> 
>      void virtio_reset(void *opaque)
>      {
>          VirtIODevice *vdev = opaque;
>          VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>          int i;
> 
>          virtio_set_status(vdev, 0);
>          if (current_cpu) {
>              /* Guest initiated reset */
>              vdev->device_endian = virtio_current_cpu_endian();

This is where the virtio endianness depends on the CPU endianness. Looks 
like it is fortunately only taken into account after a device reset, and not 
for every access (as I originally thought).

  Thomas


