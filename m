Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835002C875C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 16:04:10 +0100 (CET)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjkin-0004Z1-Fs
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 10:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjkff-0003PT-I6
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:00:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjkfb-0002bt-3O
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 10:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606748450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLl//QxTM8A6fZuVx2FEPOAaU2GB3ftr0llqbIcfYI8=;
 b=Ezjvw37EOzoe0vumXceYqtmKVtlIM8TxAYMfxh+y5c9F1CIcyJf8E+t0JqmJvvirawkxoi
 gByahYjErjl87TQc8o2rusVtg9tqQrFagrNkldal30KykD46pIBCCWDiAlKnxBHIgxvTKi
 g3xGMLigJNVaszY6TZIxgopi7aKuKsM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-QuPi37AlOticlMA9EU7WiA-1; Mon, 30 Nov 2020 10:00:47 -0500
X-MC-Unique: QuPi37AlOticlMA9EU7WiA-1
Received: by mail-ej1-f71.google.com with SMTP id dx19so5895921ejb.7
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 07:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rLl//QxTM8A6fZuVx2FEPOAaU2GB3ftr0llqbIcfYI8=;
 b=LFBsHydkgMSeJARC60IxAQKWCf+EspTAkOW3t7Igubl4D7qQy///l8dDK9SIDw4Sx8
 2wAvuymAfI8hIIG+08A13yXnGLpaE9yPI1oMp9G7zfcx3yBvvfBUNe/X8F4D7zdsqctO
 s+aaZqy8LtIvxmtp40WLHNH0hQceBt625cAsahoZsfUHLJeMvs2hk+vjCUYO+J96ncBF
 UrIG5peOeyiztnW+lw1668pjzxce5Le1Zl9ybG/7uFMmZBT0GOgrNhzZ6IgPFgChcvpF
 T0vnkvm0PKxew078fZNPlR94ouB3sbfd/Y/Mzbmw8g9s9s3Cdd7L4kbMSFBsiDMUAUio
 EgZw==
X-Gm-Message-State: AOAM531Pdp725yRZg9A8+/qn3kOJfL0/GFd4CIhXfNUMcBOAlJ1aB2Al
 88u1LkpRgLpHt/WbySnusavzsIuZ9eCyL6jX3R1HnGkKSYs8DWszlrjDU4ohZbcpLc1S4HlIlr1
 LJhUSjs8YXw4tm4g=
X-Received: by 2002:a17:906:a899:: with SMTP id
 ha25mr5324931ejb.203.1606748445390; 
 Mon, 30 Nov 2020 07:00:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRZkh1meTSmMRzG5wPZHzdrmZ/WWld71B2EJ1gJYbvEi+3oKMrRLSO82r0aqclhBL3j3lXZA==
X-Received: by 2002:a17:906:a899:: with SMTP id
 ha25mr5324684ejb.203.1606748441806; 
 Mon, 30 Nov 2020 07:00:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id da9sm532957edb.13.2020.11.30.07.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 07:00:40 -0800 (PST)
Subject: Re: [PATCH 01/18] qapi/qom: Add ObjectOptions for iothread
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20201130122538.27674-1-kwolf@redhat.com>
 <20201130122538.27674-2-kwolf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <48386682-4637-b6e8-47c8-dd4922407146@redhat.com>
Date: Mon, 30 Nov 2020 16:00:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130122538.27674-2-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/20 13:25, Kevin Wolf wrote:
> +##
> +# @IothreadProperties:
> +#
> +# Properties for iothread objects.
> +#
> +# @poll-max-ns: the maximum number of nanoseconds to busy wait for events.
> +#               0 means polling is disabled (default: 32768 on POSIX hosts,
> +#               0 otherwise)
> +#
> +# @poll-grow: the multiplier used to increase the polling time when the
> +#             algorithm detects it is missing events due to not polling long
> +#             enough. 0 selects a default behaviour (default: 0)
> +#
> +# @poll-shrink: the divisor used to decrease the polling time when the
> +#               algorithm detects it is spending too long polling without
> +#               encountering events. 0 selects a default behaviour (default: 0)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'IothreadProperties',
> +  'data': { '*poll-max-ns': 'int',
> +            '*poll-grow': 'int',
> +            '*poll-shrink': 'int' } }
> +

Documentation is the main advantage of the ObjectOptions concept. 
However, please use the version where each object and property was 
introduced for the "since" value.  Otherwise the documentation will 
appear to show that none of these objects was available before 6.0.

Yes, there is no documentation at all right now for QOM objects. 
However, wrong documentation sometimes is worse than non-existing 
documentation.

Paolo


