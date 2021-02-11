Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D899319031
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:42:14 +0100 (CET)
Received: from localhost ([::1]:39824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAF2j-0004gf-AR
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lAF0x-0003bK-VT
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lAF0r-0004ID-FD
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613061614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lj9y6zovpDL1H8VNnAnIwnGuHO/lQ5y0uBDzrMSzgjs=;
 b=cZvXnT6w5lh2oTQInJysxUfDNfQ9bylohKcvmDiMjbUY/z1vX2bz54xahZqDXmGKlaaeAb
 pYldV8RYN/sTxf9jUWNc9wDq+MD3SlwqRg45YecNj0lMmm6+J1tzzsEmVOliPbXuGYCgTP
 Uv02cN7MA3qQMs+fqTxRTA6eeTUbdLc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-UepfRj7BMU-PNkepBIcOFA-1; Thu, 11 Feb 2021 11:40:12 -0500
X-MC-Unique: UepfRj7BMU-PNkepBIcOFA-1
Received: by mail-ed1-f70.google.com with SMTP id o21so4901608edq.1
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 08:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Lj9y6zovpDL1H8VNnAnIwnGuHO/lQ5y0uBDzrMSzgjs=;
 b=jRzLZkh7TkCbroB4REQOk/P1YfS2ONtwkHd/MUwUspnhHxRqB6EUQRZjuvjH/AQiXY
 pLdS6FWtriKz6wT/WKSXPyZIs0BxNtcEwjwIMXnmsur6mViD0q2gYsITEuUhs5uUm9XG
 DShqdeCxsbo4KrdTTiYwhEuXcx6krgqZq2fBKtfy6+4wC8xH2eMQaP05q8DJ3MYAfbIc
 R2fVJ8VbJpIwqEXZSeW/l6AksHhFjJp0/2w1jGk7MGyIsRV0JBDm0SHklRd28ymYT4+3
 QA3/vuaHAnB/mIk7HkJjy75unuCNON8bWu35WhWxmf5LB0jT9JqycBVnLWAAK4pMnsx1
 ybPw==
X-Gm-Message-State: AOAM533eUWkR7J5W/W+SpHO1sUIKeaN4q8/38KXwwh6atBXuRjenQTfj
 0b6FUFRC9+xZZIAQEbcmcvMaQQICu7Nrh9UAJFqGKutfCuetnIwq+jPtwy71Gv5dAIlRPFtiS+y
 JvMTEZJG0/OE/7kg=
X-Received: by 2002:a05:6402:22f6:: with SMTP id
 dn22mr8965268edb.277.1613061611041; 
 Thu, 11 Feb 2021 08:40:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAvYu/wVmfgYAjypXKzDwvmJHlNwAAXIJAYLYHGgD2uuy7YNz2HDw2FUtZ6+pr3Mn3BQ537g==
X-Received: by 2002:a05:6402:22f6:: with SMTP id
 dn22mr8965246edb.277.1613061610877; 
 Thu, 11 Feb 2021 08:40:10 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id b6sm4415609edy.31.2021.02.11.08.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 08:40:10 -0800 (PST)
Date: Thu, 11 Feb 2021 17:40:07 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [RFC v2 1/7] vhost: Delete trailing dot in errpr_setg argument
Message-ID: <20210211164007.r6mtlu4dz64gpn2q@steredhat>
References: <20210209153757.1653598-1-eperezma@redhat.com>
 <20210209153757.1653598-2-eperezma@redhat.com>
 <14b2637e-9610-356e-ad18-27a9a8b82508@redhat.com>
 <CAJaqyWd+NuY3B94HX8J_EzFf4sxeZnFCcw=aXfT-KZ7nfmL6DQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWd+NuY3B94HX8J_EzFf4sxeZnFCcw=aXfT-KZ7nfmL6DQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 virtualization@lists.linux-foundation.org, Michael Lilja <ml@napatech.com>,
 Jim Harford <jim.harford@broadcom.com>, Rob Miller <rob.miller@broadcom.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 07:11:41PM +0100, Eugenio Perez Martin wrote:
>On Tue, Feb 9, 2021 at 5:25 PM Eric Blake <eblake@redhat.com> wrote:
>>
>> On 2/9/21 9:37 AM, Eugenio Pérez wrote:
>> > As error_setg points
>>
>> Incomplete sentence?
>>
>> Missing Signed-off-by.
>>
>
>Sorry, I should have paid more attention.
>
>Maybe it is better to send this though qemu-trivial, so it does not
>mess with this series?

Yes, I agree that it can go regardless of this series.

Thanks,
Stefano


