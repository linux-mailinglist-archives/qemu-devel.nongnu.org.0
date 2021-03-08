Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355853316E3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 20:00:59 +0100 (CET)
Received: from localhost ([::1]:60882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJL7i-0007Y5-8G
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 14:00:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJKXc-0006Xt-LN
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:23:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJKXX-0003iZ-8W
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:23:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615227813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+beV17USAk5/5BAoxZtz1DOIIiUvcI4Oae8+UMea5+Y=;
 b=KQ1nEmNG87RszTghp/I20aehyKAY82A6dLQtvNV3RJvYJ+1T24+c/DLkEid97Mxyh2jouq
 jvEU6DLjheWo3rf4BBgy87L1Up8SL5Y37KCfWtsGePE3NL/Wj79ERLuUaNdPfQRB7857e3
 hg7LPSIodVSAJ+p6UbXui+lIVRIgih4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-0q9tC7fNMmSCT0KFNs_Rhw-1; Mon, 08 Mar 2021 13:23:32 -0500
X-MC-Unique: 0q9tC7fNMmSCT0KFNs_Rhw-1
Received: by mail-ed1-f72.google.com with SMTP id k8so5425562edn.19
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 10:23:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+beV17USAk5/5BAoxZtz1DOIIiUvcI4Oae8+UMea5+Y=;
 b=PXk2gPCYq4sSn9zGkciy7+FDREcdsKelCVxPSchmc8iubyf2yGmiHVPX/vf3I2EkwQ
 yCyded6PM6dDYPfZw2KsrI5CvcREXvAwRdmLmutbzOeWQkeAXW1RYJpUYr9/RZ392hKl
 avc6sYo5951rWwplavC3A84/WNyawiTIEcvBYHvZ5uCA+1QICIYN65Xh65pOY3qPyxM4
 L0Kplg5E0oQhrcVBdXjdu9ipTjnZgKL6JBOjvG/uCC3H35N8dyqiuPM7VA1YQXOzjntg
 XyCJU5IVTIUyFbBkF1VAEDWi7jSXwQz0ztlM0Hny6OoaT5f4U5Zp3KjX6ZdCd001/pBq
 CkhA==
X-Gm-Message-State: AOAM533w5i/xWnSDWmU78I1PRCh13BQFEI69SWeMxYoVD9ScT05ME07k
 RoD3l5roesb22PEnUViHc44ggCV8JBAPHk2SH9PtYk4upWE+4NOeD1bKKLAHD83OVnTB6r26/O6
 YJH8NraCQqHTenFY=
X-Received: by 2002:a17:906:3496:: with SMTP id
 g22mr16772448ejb.143.1615227809944; 
 Mon, 08 Mar 2021 10:23:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAKId/zSgJcT+DGItbtsG8E/vnOhHJ2ijozl9R/7jYQhXBSZmhKlFsHCkaz/FvrTyU93dWVA==
X-Received: by 2002:a17:906:3496:: with SMTP id
 g22mr16772416ejb.143.1615227809730; 
 Mon, 08 Mar 2021 10:23:29 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g20sm3594900edb.7.2021.03.08.10.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 10:23:29 -0800 (PST)
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20210308143232.83388-1-anthony.perard@citrix.com>
 <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
 <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
 <b2e4ad7c-6688-f3be-b7d3-227c7c1359cb@redhat.com>
 <YEZpoHLsnp+xsGbR@perard.uk.xensource.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <59c6ca73-2f26-e0fa-8b17-a319b2cae8f9@redhat.com>
Date: Mon, 8 Mar 2021 19:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEZpoHLsnp+xsGbR@perard.uk.xensource.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 xen-devel@lists.xenproject.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/21 19:14, Anthony PERARD wrote:
> On Mon, Mar 08, 2021 at 06:37:38PM +0100, Paolo Bonzini wrote:
>> On 08/03/21 18:29, Anthony PERARD wrote:
>>>> If nothing else works then I guess it's okay, but why can't you do the
>>>> xen_block_drive_destroy from e.g. an unrealize callback?
>>>
>>> I'm not sure if that's possible.
>>>
>>> xen_block_device_create/xen_block_device_destroy() is supposed to be
>>> equivalent to do those qmp commands:
>>>       blockdev-add node-name=xvdz-qcow2 driver=qcow2 file={"driver":"file","filename":"disk.qcow2","locking":"off"}
>>>       device_add id=xvdz driver=xen-disk vdev=xvdz drive=xvdz-qcow2
>>>
>>> But I tried to add a call xen_block_drive_destroy from
>>> xen_block_unrealize, but that still is called too early, it's called
>>> before object_property_del_all() which would delete "drive" and call
>>> release_drive() which would free the node.
>>
>> Can you use blockdev_mark_auto_del?  Then you don't have to call
>> xen_block_drive_destroy at all.
> 
> There is no legacy_dinfo, so blockdev_mark_auto_del doesn't work.

Then I guess it's okay.  Perhaps you can rename the function to 
xen_block_blockdev_destroy so that it's clear it's a blockdev and no 
drive.  Thanks,

Paolo


