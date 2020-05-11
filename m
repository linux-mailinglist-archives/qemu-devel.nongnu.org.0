Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652181CD75F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 13:12:54 +0200 (CEST)
Received: from localhost ([::1]:49972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jY6Mf-0006Ks-D4
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 07:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jY6L7-0005J2-7m
 for qemu-devel@nongnu.org; Mon, 11 May 2020 07:11:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49489
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jY6L6-0005p6-EA
 for qemu-devel@nongnu.org; Mon, 11 May 2020 07:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589195475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5crtsZ8C1ZnRGJlZ9cldEnfZWOlTEhC5Hozu7U+jRI=;
 b=ADa/HDZKqcuCwvm1qD6LWLtI/Sfo6+sRFVHk5CNA7Tp+L/baTpC1jStzdkJto1pv4HyGzQ
 9ad5RDWKQKZCWh403frm1HJQyGxpnD1AxAECSbpKymhRNVNAk4LuviAJlF5QS7v4NPaDP+
 Y3DvGDKBw6FdfoKmjOwWs5VSfIUcOII=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-e71M698AM2qN4FmiCevkag-1; Mon, 11 May 2020 07:11:13 -0400
X-MC-Unique: e71M698AM2qN4FmiCevkag-1
Received: by mail-wr1-f69.google.com with SMTP id z5so5047227wrt.17
 for <qemu-devel@nongnu.org>; Mon, 11 May 2020 04:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q5crtsZ8C1ZnRGJlZ9cldEnfZWOlTEhC5Hozu7U+jRI=;
 b=L1IBYeE1aRcShJv+34SCO+O8flMwxLfAYGAOjDU/jl27tCn3VH4XSVbJ552kDQCSHJ
 EwGBwnOtSuj8lIPsseI+ZS3S8FuYukSS9UNkErloL5RlsVULYfGvcPfeew0m1uZXMpBd
 OL61PEnLqqt7sIODXq9OMYWABIHvUGd3vY93qS5HHiSasDmDzlNkcYXNFee6brYf4XNn
 3uqCs5N5Ym0/qn+C8+Rn6EJlin3wbOxD8kOEhR3ckXtuUH/NqOTtoxVXSFNJdz99pxNi
 8j78pkgDOqElg6bimW/lJu2nFA0FjOzGUb2Os5d+zMoW2FPHa/lqiavGfE8N9dDDvbqT
 eWyQ==
X-Gm-Message-State: AGi0Pua88Uifz3VG11yUjPqORd+F2rAxMqkf6Tq+lHHjJIbI0ovSX8Jv
 nPrKaL8iz2tVTjSa/IrD8JwSeG1ew6PM2WvjgVqmtjtWl4fh0mZk2mJkhX7WFU94W8LXv3rbt1N
 gCaRinVK+pu6qCMY=
X-Received: by 2002:adf:f5c4:: with SMTP id k4mr16414632wrp.23.1589195472439; 
 Mon, 11 May 2020 04:11:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypImuFSybS82VJpBzOJllgJHAc/wCz6zPqQI1AYKEYn+haLDrVpWWtXSS3/e/+RnmF3p8k39mQ==
X-Received: by 2002:adf:f5c4:: with SMTP id k4mr16414605wrp.23.1589195472208; 
 Mon, 11 May 2020 04:11:12 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ec64:483c:eca:9b27?
 ([2001:b07:6468:f312:ec64:483c:eca:9b27])
 by smtp.gmail.com with ESMTPSA id o26sm15421208wro.83.2020.05.11.04.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 04:11:11 -0700 (PDT)
Subject: Re: [PATCH 3/4] device-core: use atomic_set on .realized property
To: Maxim Levitsky <mlevitsk@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20200416203624.32366-1-mlevitsk@redhat.com>
 <20200416203624.32366-4-mlevitsk@redhat.com>
 <20200504104538.GC354891@stefanha-x1.localdomain>
 <b265d4ee-400e-bb80-cc37-e89c5dab2a8c@redhat.com>
 <948c2e2f293c08b6411030dc5ad91c23a2f773f0.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <82d51a76-fd38-d72e-2d22-c4de1a76d5f9@redhat.com>
Date: Mon, 11 May 2020 13:11:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <948c2e2f293c08b6411030dc5ad91c23a2f773f0.camel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 00:05:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/20 13:00, Maxim Levitsky wrote:
> On second thought, I think both cases matter, after I examined the device removal case.
> In device removal case, the device is first un-realized and then removed from the bus,
> so just like in device hotplug case, the scsi_device_find can give you an unrealized device.
> 
> I will change this patch to set .realized to false at the start (if needed) of the function and to true at the end (also if needed)
> Will atomic_rcu_set work? or atomic_store_release?
> (Both are the same thing, but former documents the purpose of using with RCU.

atomic_rcu_set is more to store pointers, in this case you want to store
the value after any other change to the struct so atomic_store_release
is more appropriate.

Paolo


