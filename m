Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685B3A0551
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:51:49 +0200 (CEST)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqihQ-0008N2-B4
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqigB-0007Rz-Uq
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:50:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqigA-0004qN-9r
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623185429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=denD12Bwx9PQm5UBoKUv6B0bXmdWwpsuImR8ZzVSa34=;
 b=ajkwTsO7YuHV37/TxDnXkXkMLdipq8YfA9LsuTvHJdy7t1D/qXztmzu4tmmsk+aAceURnw
 ZlEynhWmVrVv5J4PC8Gl4izwUTaY4Im9d3eaCDjoN8M9Uere2kwl5psy+EWWu0lNO7Re3f
 iLwo0eyNdKRNyd+tDtdgQEY194pVkGo=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ALvIGEXkMkWs4HO_uMQs1A-1; Tue, 08 Jun 2021 16:50:28 -0400
X-MC-Unique: ALvIGEXkMkWs4HO_uMQs1A-1
Received: by mail-oo1-f69.google.com with SMTP id
 x24-20020a4a9b980000b0290249d5c08dd6so4639046ooj.15
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=denD12Bwx9PQm5UBoKUv6B0bXmdWwpsuImR8ZzVSa34=;
 b=Ns9Ed4DWPZY89tjvRGN8ZbG/+MvVhw0heHi3e+mwbBow3vHsGcv7LNDnw/DL8dXWPx
 a+c8wALlxBRhpwGu28A2LVKaZV+xq6HFN9ngOtjzhCpqQfSK2MBX0n8wEbxEz8zHpiwp
 44LEotn6pRYpWyOURlu+/x+N0B7IGKTF5djSKZS/xAg/Y8OZv58pA77hThl2PTEdVtxV
 n0jZ7DhhbXTs2rUe5PPo4MhOJOkNsGn3MQjwR8T1IUsp1x54WS+kwzi4KjQxq0Z9/vAJ
 cN8EAVkkhN/LQ1A536srDfsrZIjJfqujm3aQJr+EKv9BBR4CnurkGbfVAGm9L+Hw1VVh
 7+oA==
X-Gm-Message-State: AOAM531kGCdr7DvkxeQPH1OXbKcFP4tMPvv6Ukwyj0KImax6W/2altJt
 5Bx9eGUhDJAc/q1M9lczvFKdZKp0nUEXmWd7aXFcepai2FPS5Hn7RKUcjJ72aPhLU5ngSaV6tc2
 jmwo2u+mccxxF8/Y=
X-Received: by 2002:a05:6808:3dc:: with SMTP id
 o28mr4029442oie.64.1623185427472; 
 Tue, 08 Jun 2021 13:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIsLzGhbhQI/+s04m8kpS62LZgsVIyCv/BTrUtvLZpG3tbXB1nJLs5wI+LaVoDr5C1GFSeRA==
X-Received: by 2002:a05:6808:3dc:: with SMTP id
 o28mr4029432oie.64.1623185427289; 
 Tue, 08 Jun 2021 13:50:27 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 d1sm3379358otu.9.2021.06.08.13.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 13:50:26 -0700 (PDT)
Subject: Re: [PATCH] Add Connor Kuehl as reviewer for AMD SEV
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608192537.103584-1-ckuehl@redhat.com>
 <YL/Ouxk9LcVzE28D@redhat.com>
 <d01cae3a-eee4-1488-6f74-6b0beef38c6c@redhat.com>
 <YL/W1QqMPjZLvq+F@redhat.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <220f3a15-a25d-7c89-d9de-a8c1cf0cd708@redhat.com>
Date: Tue, 8 Jun 2021 15:50:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL/W1QqMPjZLvq+F@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 3:45 PM, Daniel P. Berrangé wrote:
>> Right, I am just worried that if I am the only person that shows up in
>> the get_maintainer.pl output, the submitter will have to know some other
>> way who a relevant maintainer is that can take the patches otherwise
>> they won't be CC'd. Or we'll have to hope a relevant maintainer sees
>> them on the list. Or I'll have to chase down a maintainer myself
>> assuming the reviews all check out. :-)
> 
> Well there's no real guarantee that any of the previous committers will
> take the patch even if they are listed by get_maintainer. This is typical
> with anything lacking a maintainer assigned. We typically hope that
> whoever runs the "misc" queue sees the patch and picks it up, but often
> it requires pings to remind someone to pick it up.
> 
> The only real right answer here is to actually get someone as the
> nominated maintainer. Every other scenario is a just a band aid and
> is not a good experiance for contributors. A nominated reviewer is
> usually hoped to be a stepping stone to someone becoming maintainer
> in future, so in that sense the fact that only you will be cc'd is
> sort of intentional :-)

That makes perfect sense. I'll forge on ahead, then :-)

Thanks!

Connor


