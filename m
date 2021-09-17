Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A2740F597
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 12:12:02 +0200 (CEST)
Received: from localhost ([::1]:58526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRAqe-00036F-TX
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 06:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRApf-0001y2-3A
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 06:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mRApd-0006nA-0D
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 06:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631873455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R4K2r/Ci6fhGIuF7Ht9Y/gSFQ3svgpAHkiBKrd/IOjU=;
 b=hgrULbIFTv+6IUv2PAmv5+PpRLQLC/ybCSjxEd/8J6Zisk7s+BHoPE3P643c0KPos4se44
 m+w8plTw4npMPFkbCDHXJmALdLz4YzjSnL2rhjajyrqmN6ON2Oag9R8hXOH5wNLacM1fuC
 GsLFZFTE7tqdgebCa70+A5ZP2dOjLxA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-D3MpstkJPiKbWdJFN2n_Nw-1; Fri, 17 Sep 2021 06:10:52 -0400
X-MC-Unique: D3MpstkJPiKbWdJFN2n_Nw-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so3536669wml.5
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 03:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=R4K2r/Ci6fhGIuF7Ht9Y/gSFQ3svgpAHkiBKrd/IOjU=;
 b=oWZ6msvkYyhI92UUROMMNVATPRzEPbgN0sU5plsFfF+L8wX8bk/GfBPtDaTyP3Rq2j
 g3Xw8XFGGG1YHT0oKS/dE1ADDipOPdud90FFXB4jdfJg0BI2M3DoIgUMgGZHeItlnJT8
 9FSUluTbi1J4uhHIYKGHHM/VgSZuZJfyaKeluW+nlBllEH9BuOYG+hCWWnEPawjAidEe
 Z4MJgeV6Z0D5r+u6p1/PfafF1F5vZiFJ0OsaWl9Ko53bi//GFH1cZ9sQ9FZUMjMBvsHu
 I2zQMEqVMdsdgtU9HO80Nd5V2jLHRwPF25ZzzdrL3cs3IZ+KWSeYH68M9411GhuSxTZE
 nspQ==
X-Gm-Message-State: AOAM533KmQWelDQgyJMQMd2OoNsBWB3ypIkJsYBpfrLC3SGlzp1f6Ql3
 M63o+3i2KjHhhUVVbw4JD51qV11EhaAsVa+Fjxu+YiywUjnrkCeb67eAuShfdf8pjLi35V9RzRV
 WlGcmFOA4v7vZv+k=
X-Received: by 2002:a7b:c745:: with SMTP id w5mr6701904wmk.192.1631873451243; 
 Fri, 17 Sep 2021 03:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycxEpJvK2flM8X17KDUvZa8fb4nWQslNRzR2dPztivDoMJ1pxt4klPBzO6DxU9hHxXTAO4WQ==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr6701884wmk.192.1631873451078; 
 Fri, 17 Sep 2021 03:10:51 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o12sm5189005wms.15.2021.09.17.03.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 03:10:50 -0700 (PDT)
Subject: Re: [PATCH v3 10/16] iotests/297: Add 'directory' argument to
 run_linters
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-11-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <71f48482-3fa9-7657-aa41-ef72b869fc14@redhat.com>
Date: Fri, 17 Sep 2021 12:10:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916040955.628560-11-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.09.21 06:09, John Snow wrote:
> Allow run_linters to work well if it's executed from a different
> directory.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/297 | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


