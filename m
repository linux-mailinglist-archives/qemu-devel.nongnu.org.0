Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FEB3B29AA
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:45:41 +0200 (CEST)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwK3Q-0002cy-Ex
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwK2B-0000qB-JO
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwK28-0003uI-Uh
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624520660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JEUnH2FkAYgG8FPMBL/k6x2U8GNhcz+PEYxHyuipSj0=;
 b=awHULg0PtPzFFApJFp+4c49Ur+oXbPb3ulT8XI7/EJ88CBHlBTajC7s2vUyK2xImRHTghy
 7hmYJx2tSoO0A3FuqmFHnKd37/x+/PsPf0kBfHozJYrbnVpfip+OljH9fG0dtAM1z5G2hH
 Z0HjZdHsGFh+k+XV6a/XG48x90+TZOc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-n220VjcVNMaTUsbTbNlGYQ-1; Thu, 24 Jun 2021 03:44:18 -0400
X-MC-Unique: n220VjcVNMaTUsbTbNlGYQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 z5-20020a17090ad785b029016ef9db92bfso3026660pju.0
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 00:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=JEUnH2FkAYgG8FPMBL/k6x2U8GNhcz+PEYxHyuipSj0=;
 b=ZFXi6f4zZDjNvUKA57eXQZ6QQcoJojXn1a/UCSzQiIYozZw66hI9A0zUiYscVXJGqm
 dK07B+jdhJVQbjM0wSVBf9lQCLdDCsmgCTMHgupVttV2pqkQMP5oyah1qydlICevwptc
 udRbbzTFzuxJjbL/slFuOY83amRySRQ9ppLXflCYfNKQtBPT85Fnpco+zWdk8KV6VlYP
 eBOryE7Z5BsI92bNmdNIpMH3zLADnOuUXixb+tFnsL8BCS7OuB37S3us2Vt9KWboLK1Q
 VEKhrixkYkGrS/9UsZRo//VGDAp8aeQ8y8DK1Tn/Q+3FNXN9htTWQhISEqoFDQ7O8Ja3
 uB2w==
X-Gm-Message-State: AOAM533289qmCGQqt9nP2Ww7VPGyR7l5UHu/dDiZhtainEV0dmiZlhuK
 4XMD4O840CRHmAHoYGCyy2/9OoPkBfJqF2ZPaRiZ0+xkoCGASe9cnNOwHNSoaK5lTod6dmDcTp6
 PFletwOU0I4E+qIo=
X-Received: by 2002:a17:90a:9282:: with SMTP id
 n2mr4042178pjo.204.1624520657859; 
 Thu, 24 Jun 2021 00:44:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3k91mLuR+unRPNT2kuuY4Yj8/X/+N0ndqs0fbbCz/nCoN6yATtIVk5sM3pX8NypHKDVBVkg==
X-Received: by 2002:a17:90a:9282:: with SMTP id
 n2mr4042159pjo.204.1624520657668; 
 Thu, 24 Jun 2021 00:44:17 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q12sm1535009pgc.25.2021.06.24.00.44.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:44:17 -0700 (PDT)
Subject: Re: [PATCH 15/18] vhost-net: control virtqueue support
To: Eli Cohen <elic@nvidia.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-16-jasowang@redhat.com>
 <20210624074217.GB42206@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <7c3f4682-85fe-d572-719c-0036e3ce1bab@redhat.com>
Date: Thu, 24 Jun 2021 15:44:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624074217.GB42206@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/24 ÏÂÎç3:42, Eli Cohen Ð´µÀ:
>>   
>> -int vhost_net_start(VirtIODevice *dev, NetClientState *ncs, int total_queues);
>> -void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs, int total_queues);
> This breaks compilation of hw/net/vhost_net-stub.c
>

Right, will fix.

Thanks


