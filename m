Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4174EAD8F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:48:13 +0200 (CEST)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBGe-00041p-28
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:48:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZBDn-00018M-Ca
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZBDl-0005AR-Qi
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648557913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/h8DzmVVDtb8OVQM1ZrUOLp1hPOLOsQgs5Tf2fuAcoU=;
 b=JP/CcRjQ1/hPjJo0TCzSWIzoyRnJp+IorX2Vj7n4OH2QV0Nw8IIRC4RWqd9uzr6IP8RCld
 xqujTYUMco4H/D+o0ev/m71LIssbbtaeSURcYwx1PmYZvUACvSuk9HmT1VKRI6IhoWdGEB
 7kxy67DRU6BIBbCWloY6xAuzZRuujqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-23HIR3PjMWaMODbCYTi76A-1; Tue, 29 Mar 2022 08:45:11 -0400
X-MC-Unique: 23HIR3PjMWaMODbCYTi76A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DFCE811E7A;
 Tue, 29 Mar 2022 12:45:11 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4802A40CF8ED;
 Tue, 29 Mar 2022 12:45:10 +0000 (UTC)
Message-ID: <5226bc8b-32ce-3aa8-7ef7-2e27e9e46eeb@redhat.com>
Date: Tue, 29 Mar 2022 14:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/4] s390x: follow qdev tree to detect SCSI device on a
 CCW bus
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220328143019.682245-1-pbonzini@redhat.com>
 <20220328143019.682245-2-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220328143019.682245-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/2022 16.30, Paolo Bonzini wrote:
> Do not make assumptions on the parent type of the SCSIDevice, instead
> use object_dynamic_cast all the way up to the CcwDevice.  This is cleaner
> because there is no guarantee that the bus is on a virtio-scsi device;
> that is only the case for the default configuration of QEMU's s390x
> target.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/s390x/ipl.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 84971e537b..e21776822a 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -375,14 +375,18 @@ static CcwDevice *s390_get_ccw_device(DeviceState *dev_st, int *devtype)
>                   object_dynamic_cast(OBJECT(dev_st),
>                                       TYPE_SCSI_DEVICE);
>               if (sd) {
> -                SCSIBus *bus = scsi_bus_from_device(sd);
> -                VirtIOSCSI *vdev = container_of(bus, VirtIOSCSI, bus);
> -                VirtIOSCSICcw *scsi_ccw = container_of(vdev, VirtIOSCSICcw,
> -                                                       vdev);
> -
> -                ccw_dev = (CcwDevice *)object_dynamic_cast(OBJECT(scsi_ccw),
> -                                                           TYPE_CCW_DEVICE);
> -                tmp_dt = CCW_DEVTYPE_SCSI;
> +                SCSIBus *sbus = scsi_bus_from_device(sd);
> +                VirtIODevice *vdev = (VirtIODevice *)
> +                    object_dynamic_cast(OBJECT(sbus->qbus.parent),
> +                                        TYPE_VIRTIO_DEVICE);
> +		if (vdev) {

Seems like you accidentally used TABs for indentation here?

With TABs replaced by spaces:

  Reviewed-by: Thomas Huth <thuth@redhat.com>


> +                    ccw_dev = (CcwDevice *)
> +                        object_dynamic_cast(OBJECT(qdev_get_parent_bus(DEVICE(vdev))->parent),
> +                                            TYPE_CCW_DEVICE);
> +                    if (ccw_dev) {
> +                        tmp_dt = CCW_DEVTYPE_SCSI;
> +                    }
> +		}
>               }
>           }
>       }


