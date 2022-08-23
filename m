Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4789559D325
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 10:14:30 +0200 (CEST)
Received: from localhost ([::1]:54278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQP3M-0005KY-QA
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 04:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQOrU-0006Q9-Hs
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 04:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oQOrN-0001Bu-Ko
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 04:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661241725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejcjUDw3vIoCLXASu3R+IJ5wZG9Q/I2ol/jgEKbdGnQ=;
 b=dQX4qpyWyMdgnCxDa5pgOiEddjI3tOXVxVk+3bw9jfSjAJmaTghRVjYMRfjStcpnxhAylY
 QFZllT9rTEEZX1DQyXyRmkL1ySeG4FS7f0D8PzzYOef3KiiV7LIXASHNuJQIgfdr4xXM8r
 I95HyhoiT/non5Q5AZ5xqa0EAuXca/I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-FMl5UedtMmq4gsRPk7pr4w-1; Tue, 23 Aug 2022 04:02:03 -0400
X-MC-Unique: FMl5UedtMmq4gsRPk7pr4w-1
Received: by mail-wr1-f71.google.com with SMTP id
 k20-20020adfb354000000b0022556a0b8cbso845771wrd.5
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 01:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=ejcjUDw3vIoCLXASu3R+IJ5wZG9Q/I2ol/jgEKbdGnQ=;
 b=GCaMukEbzub0udifNXQ+BvpOIHXdOyPVF/6Wfm55c/2H09lOuNshtSryL97upqqLgh
 /L0sDxt0cC2WagZUF7ynF7z4GtM8rQ6M9CPK1+nQWWBye1S5F5gPCOB3cbo0umSIaVNo
 BxQCQznyOyn/BN0+XIsNSEWGTWK6QflYEjZV8owFzoeH3PBrvIdt5pEDwBmKDb/WkNAf
 FqzW19407vS4yqdzsu/EtcLQcyoFydpRUAlpz5hhDGQKEZoP3PXvfzw7+5HFCsXncree
 cH2NjnJ+8366ayckiikHmagXJ9ZGDBwsozMMtWi5adQqrur1lU9JEvGU5/8okZuISd/H
 BNqQ==
X-Gm-Message-State: ACgBeo1vLBSyS1V7T8PGusWAGf0gRP0aQAbWGTDfCdll9RjMRhV7zH3q
 CDsy0DM0bX9KIwkLFRwXfr+HBEZ2igT9RfN5TyWQIfsiSxa8oh0Up8i6qefw/U7C6xS9sgYtDF0
 GSgu8KRnhRjiG8QQ=
X-Received: by 2002:a05:600c:4f43:b0:3a6:2335:f5de with SMTP id
 m3-20020a05600c4f4300b003a62335f5demr1347018wmq.109.1661241722814; 
 Tue, 23 Aug 2022 01:02:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4DBkxvc5jrKq3kf6BhRQAqhu4CSAeK0//rj6GbIKLKej28qoYjJjw0wWt3tVTIfpHPLv7aYA==
X-Received: by 2002:a05:600c:4f43:b0:3a6:2335:f5de with SMTP id
 m3-20020a05600c4f4300b003a62335f5demr1346916wmq.109.1661241721686; 
 Tue, 23 Aug 2022 01:02:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:1600:c48b:1fab:a330:5182?
 (p200300cbc70b1600c48b1faba3305182.dip0.t-ipconnect.de.
 [2003:cb:c70b:1600:c48b:1fab:a330:5182])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b0021e42e7c7dbsm13645977wri.83.2022.08.23.01.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 01:02:01 -0700 (PDT)
Message-ID: <b068f95e-fc8f-1ecc-5bf5-d7774ce6c13a@redhat.com>
Date: Tue, 23 Aug 2022 10:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Peter Xu <peterx@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, integration@gluster.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Richard Henderson <richard.henderson@linaro.org>, Fam Zheng
 <fam@euphon.net>, sgarzare@redhat.com, Alberto Faria <afaria@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, Xie Changlong <xiechanglong.d@gmail.com>
References: <20220822222402.176088-1-stefanha@redhat.com>
 <20220822222402.176088-12-stefanha@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC v4 11/11] virtio-blk: use BDRV_REQ_REGISTERED_BUF
 optimization hint
In-Reply-To: <20220822222402.176088-12-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.22 00:24, Stefan Hajnoczi wrote:
> Register guest RAM using BlockRAMRegistrar and set the
> BDRV_REQ_REGISTERED_BUF flag so block drivers can optimize memory
> accesses in I/O requests.
> 
> This is for vdpa-blk, vhost-user-blk, and other I/O interfaces that rely
> on DMA mapping/unmapping.

Can you explain why we're monitoring RAMRegistrar to hook into "guest
RAM" and not go the usual path of the MemoryListener?

What will BDRV_REQ_REGISTERED_BUF actually do? Pin all guest memory in
the worst case such as io_uring fixed buffers would do ( I hope not ).

-- 
Thanks,

David / dhildenb


