Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDD33A4321
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 15:37:39 +0200 (CEST)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrhLu-0000dR-O4
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 09:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lrhKK-0007ga-0m
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lrhKC-0001mc-IK
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 09:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623418550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlQrVpiTc0W58oCmETXqnguHOwXdbhzhlZjTziM7Zww=;
 b=OVJOaxCTIl0TRKuMDe83rFWcVQhzoZbbEePqPytKcHpzXdUgkwanBFwjqOTWZO1dyxuZ3n
 0KSCfFFcTbp97sQXsVYM7cbOW2PF9PkbiVS7iRVh0zS8sGKchnNdDNT/mdqBzw1NoMCMRd
 sN38UO+niJlTZMyWHKIMImYgSnpO9k4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-ePg5glOONbWDehNWez8-xw-1; Fri, 11 Jun 2021 09:35:47 -0400
X-MC-Unique: ePg5glOONbWDehNWez8-xw-1
Received: by mail-wr1-f72.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so2645514wrd.7
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 06:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FlQrVpiTc0W58oCmETXqnguHOwXdbhzhlZjTziM7Zww=;
 b=tQSHi9cxCEIJluZzxk8iLx3TxFF1ECJY5IsqQlPj1xtzeaZS1bPOd6x1cr8UjIBTlN
 b2tJhAV0mImgkvs5SiaruIUAFI4P+/VKiQNfkRw0ZIlUd4lMtwu6EZ1wt2XIlNgB4r7N
 LFiNJsCZ7vm62BvitGQzWw1alcPe2mg1wu/Ag7xKOC2D4DKejpjnxCUpPfWW2hiL11JG
 +EzHflvEGTXWNNFZTSoXhelehFSQvTl1azziMd9H7mnnl2qK3t8aXcmKDeDpPGpda9jV
 R6dD/Hi4QzOyFtcd693HpqqbJqOqxJE4bKvLJHFwWGBT3GDO6ilyIWZW0lL/L3lFj/i1
 X/3w==
X-Gm-Message-State: AOAM530CjDLNg0Q2EqwVJSXAFMU7RvSCCofQ7+uLpBUYywOUuFb5oyz6
 AfnDm9wJNAINOnV3m4wEeYywstRB8NJNra9Jq7MvQktt7Pb1nyCKqWERE6voZq1voiYoUWTU6bx
 Yo53xh4Wq9d3kXto=
X-Received: by 2002:a5d:4351:: with SMTP id u17mr4110066wrr.47.1623418545841; 
 Fri, 11 Jun 2021 06:35:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW380NKuEwWvYS2Oi+2WEGYjwL61enGALISX5oTPqNdTmCqaM4eoru3+rLpDY1Af9XryBaUQ==
X-Received: by 2002:a5d:4351:: with SMTP id u17mr4110025wrr.47.1623418545603; 
 Fri, 11 Jun 2021 06:35:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64b6.dip0.t-ipconnect.de. [91.12.100.182])
 by smtp.gmail.com with ESMTPSA id r7sm16326077wma.9.2021.06.11.06.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 06:35:45 -0700 (PDT)
Subject: Re: [PATCH v8 00/15] RAM_NORESERVE, MAP_NORESERVE and hostmem
 "reserve" property
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210510114328.21835-1-david@redhat.com>
 <a6efbfaf-c33c-0fb2-bb34-2ca4240cb05c@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5b7eda56-bbee-60e7-4ee0-cbd2c5beb08b@redhat.com>
Date: Fri, 11 Jun 2021 15:35:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a6efbfaf-c33c-0fb2-bb34-2ca4240cb05c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.06.21 15:34, Paolo Bonzini wrote:
> On 10/05/21 13:43, David Hildenbrand wrote:
>> Based-on: 20210406080126.24010-1-david@redhat.com
> 
> Queued both the dependent series and this one, thanks.  Sorry for the delay.
> 

No worries Paolo, I know that we're all super busy -- thanks!

-- 
Thanks,

David / dhildenb


