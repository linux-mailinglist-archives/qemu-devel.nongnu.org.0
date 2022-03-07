Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1924D0BE7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:18:40 +0100 (CET)
Received: from localhost ([::1]:35208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMch-0007cP-Qr
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:18:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM85-0001Pf-1s
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:47:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM83-0005mz-Cg
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUlO0ocQc29ciczcLm1pSy5SoSdfztTWbGuuDhmskVs=;
 b=NZQNllzBfQ9aSEAARlRTRx5Bz6jh9gCWEcRL5DBFWhbYMVZx3qfoMrpZK3XSwmDNDE0OXI
 +6d3hF08dBLNZITD9c2WfLTXfVAscvAfL3g6C3w37gZf5GqHIYFQ4OMnX2y5MqNJKOlA7c
 KFwQoURev7QI281+3IpPWD+bKrx0Au0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556--tbdu40yN0ClNk9FbFR49A-1; Mon, 07 Mar 2022 17:46:57 -0500
X-MC-Unique: -tbdu40yN0ClNk9FbFR49A-1
Received: by mail-ed1-f69.google.com with SMTP id
 l8-20020a056402028800b0041636072ef0so3421300edv.13
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AUlO0ocQc29ciczcLm1pSy5SoSdfztTWbGuuDhmskVs=;
 b=VLEGatqypFfQsS/JLnz5ywo7ZP4ErppDT+UwIAUHUN31O0rNQwlWFqB8n8oAOm9Vgb
 ZKi+l9zSO4y4I9nfx1YUNm0ba63N503g4DwaJKGSF6NTrcF3Vn0F0XffavgKPEHo0+Gz
 9DcGruStb+xteQYdiGETns0vu3u/AU94AM/PrOrOSIw7ZX0koO34VnYNEaksPQI4gI/N
 PSMdXCK220CfJaTSp5ExQLwmJdMTeCueZRKFPRyMR9whHO10vbKq22cTqI44i0mTWg9a
 gph7XqH1b+/HfkVfFBqFZuCnGWEegJObq4CrUdzvK6fDO5M1SzNbO2yiDEI7hdssHN4B
 nkcA==
X-Gm-Message-State: AOAM532uvuj0EplAs22tkeGWxMOVfIlcXjCPK/I9WVs+nbCdIirzZJyQ
 D/WreOChNbarIhHLCb9/9dicAgr2KV6i0VJbANvkXeGPmthhRiKGsS0AbNLuly9I3R05jlpXATq
 O2jyUtC2fUdwi6LQ=
X-Received: by 2002:aa7:cac3:0:b0:412:fdeb:a5fa with SMTP id
 l3-20020aa7cac3000000b00412fdeba5famr12877390edt.257.1646693216058; 
 Mon, 07 Mar 2022 14:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFc3oTmk638Qe7CBYD8sE5cLIptgIMEUfLe2FL6iR0NFBfw4BBUupi1lRwmAEwTDxPORYL0Q==
X-Received: by 2002:aa7:cac3:0:b0:412:fdeb:a5fa with SMTP id
 l3-20020aa7cac3000000b00412fdeba5famr12877373edt.257.1646693215860; 
 Mon, 07 Mar 2022 14:46:55 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 gl2-20020a170906e0c200b006a767d52373sm5158293ejb.182.2022.03.07.14.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:55 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v13 0/8] hmp,qmp: Add commands to introspect virtio devices
Message-ID: <20220307174606-mutt-send-email-mst@kernel.org>
References: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1646658521-31652-1-git-send-email-jonah.palmer@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: david@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 08:08:33AM -0500, Jonah Palmer wrote:
> This series introduces new QMP/HMP commands to dump the status of a
> virtio device at different levels.


Fails to build on the build-system-centos job:

libqemu-ppc64-softmmu.fa.p/hw_virtio_virtio.c.o: In function
`qmp_decode_features':
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
reference to `gpu_map'
/builds/qemu-project/qemu/build/../hw/virtio/virtio.c:4155: undefined
reference to `gpu_map'
collect2: error: ld returned 1 exit status

https://gitlab.com/qemu-project/qemu/-/jobs/2172339948


Also fails on cross-win64-system:

https://gitlab.com/qemu-project/qemu/-/jobs/2172339938

../hw/virtio/virtio.c: In function 'qmp_x_query_virtio_vhost_queue_status':
../hw/virtio/virtio.c:4358:30: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4358 | status->desc = (uint64_t)(unsigned long)hdev->vqs[queue].desc;
| ^
../hw/virtio/virtio.c:4359:31: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4359 | status->avail = (uint64_t)(unsigned long)hdev->vqs[queue].avail;
| ^
../hw/virtio/virtio.c:4360:30: error: cast from pointer to integer of
different size [-Werror=pointer-to-int-cast]
4360 | status->used = (uint64_t)(unsigned long)hdev->vqs[queue].used;
| ^
cc1: all warnings being treated as errors

Reported-by: PMM

-- 
MST


