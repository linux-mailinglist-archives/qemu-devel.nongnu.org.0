Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF4322D1E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:07:28 +0100 (CET)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZHb-0000rg-7t
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEZDl-0005A7-BH
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:03:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEZDh-0000ve-QR
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614092605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tSzTgy4aGjrpTiJY26OpeqSurNAlJLwsI+L0tZXUGn0=;
 b=gqYeyHk2ERQEbNn73eCXFqkrkyeC02URCtpXut+Zhim5c110ygdG43JzOX9DWCh6tx7Ekz
 1QVl0VF+9togtgGilbVPKgL710/TJoWyKecwDX4G0/4R1wezLRTDn4VXGwhB1lkGeWK9TV
 VBQ5nHNRrp9WHIVM+16OpHSLskkTA8k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-p_I5XUrgPdeAK8wHl9zVCA-1; Tue, 23 Feb 2021 10:02:38 -0500
X-MC-Unique: p_I5XUrgPdeAK8wHl9zVCA-1
Received: by mail-ed1-f72.google.com with SMTP id l23so8818985edt.23
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tSzTgy4aGjrpTiJY26OpeqSurNAlJLwsI+L0tZXUGn0=;
 b=pJg5lxg0WQYIsRXS6JmtpeGw16yWgCGHLHnfV/GlpVDN0iZDF4otj5/yv845Lod/GL
 gEkFLt74FfVN3ywxcQJtF6HZVXvxV5ED0gWwhfTwJWoBbMTaXnpHsDs1YH6IsTx1O0q2
 ru/9yDagtSiJeTO1UlXe4OGxmHATbaApkrY1+nwbVW3HTM9W+zvZYiq1CTCHzix02EGv
 O1oaFVH90kfazS5OkjZBak/izUmK7nMsTTtAkXjJ7+yZfMQ0YfzIcMvm12oJ2nx4l8n9
 JizcDhTyEHM03TtMEGNXLE+XqATTSiMVwQgXMwCgE4k8yIU8FyNr4muHgoOK/EdAsJdG
 1Svg==
X-Gm-Message-State: AOAM531GcTJV1c4ah4qXavjaeXVazuFtGGOA9EkN+ua12PUEYqPi2Ga1
 bHnCAgb04ClTrxSHWVsXZIB7njL1+17t1qikOdY36Bsio+hrj0j/w4A7YIvcaBr91i9+6UtfO2S
 cz8K/jURThPp6xJ0=
X-Received: by 2002:a17:906:2803:: with SMTP id
 r3mr26326215ejc.50.1614092556752; 
 Tue, 23 Feb 2021 07:02:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3+TIL5JqsNQxD14e0oS9OGOkuEn5f6VPqN3cCLfgojKAmWbkMQcQi/Ar7fP0EWHDe88C00g==
X-Received: by 2002:a17:906:2803:: with SMTP id
 r3mr26326189ejc.50.1614092556569; 
 Tue, 23 Feb 2021 07:02:36 -0800 (PST)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id d5sm14867368edu.12.2021.02.23.07.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 07:02:36 -0800 (PST)
Subject: Re: [PATCH v6 09/12] softmmu/physmem: Don't use atomic operations in
 ram_block_discard_(disable|require)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210222115708.7623-1-david@redhat.com>
 <20210222115708.7623-10-david@redhat.com>
 <b5be291b-5864-4852-50bd-e75352ba8876@redhat.com>
 <d64fdd53-6868-15fd-ea81-fa26e153eced@redhat.com>
 <61237335-b03f-cb89-c0be-03fc3058c13b@redhat.com>
 <9b127669-f84e-7f8c-f76c-2bf7b206d68b@redhat.com>
 <fa76ac9e-933f-4cdc-0d88-d07604999f45@redhat.com>
 <f62b90b9-e3dc-f904-e511-eede76120220@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9d0fe7cc-75bd-ddb5-7a01-d4ba95f2516e@redhat.com>
Date: Tue, 23 Feb 2021 16:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f62b90b9-e3dc-f904-e511-eede76120220@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/21 10:02, David Hildenbrand wrote:
> 
> 
> int ram_block_discard_disable(bool state)
> int ram_block_uncoordinated_discard_disable(bool state)
> int ram_block_discard_require(bool state)
> int ram_block_coordinated_discard_require(bool state);
> bool ram_block_discard_is_disabled(void);
> bool ram_block_discard_is_required(void);
> 

Fair enough.

Paolo


