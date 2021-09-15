Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F640C508
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:17:23 +0200 (CEST)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQTqs-0005wo-A4
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQTp2-00050E-O8
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mQTp1-0008J2-8P
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631708125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhZzbf5qo8Q9g4Cvj1aSQ2nnxSPozfH06+p7PPsMePQ=;
 b=fCmJLN7UY4s9ekyp6ZLHYV65T/Vatq1ZaTI1ykPaGnaRAVJFfoZu9YrzzwdzMbskl1WH+P
 JlOibx9cZUc7JL/k3NLte6hnTFPF1U/JppQZ6hZnJb2OrJC0sHMULxz/1EPmXKg9Xjtoky
 Cm0S+YCWoOiNxNTQeLee5sbKbjLmnhg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-YF3JnjVXMm2FiKyceb6ykg-1; Wed, 15 Sep 2021 08:14:13 -0400
X-MC-Unique: YF3JnjVXMm2FiKyceb6ykg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z17-20020a05640240d100b003cac681f4f4so1477733edb.21
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 05:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZhZzbf5qo8Q9g4Cvj1aSQ2nnxSPozfH06+p7PPsMePQ=;
 b=0KISptVbfjDL3ADmPuLHllUTSx/5831kzxgzBaxmX4yexyUFa2pl6W/4LQCiW0AZdY
 o6qMHfXYfxp99dmdAVD/p/PB610OtrTppv6PbEOS83aL2DaQzwroETse3gWeoPFfkic/
 fBl2qpJEyYB+2v08+CSZYP7GU35Z/3DDkGjfRBkuBqkS/OZJGMFlKSm+3epHtM7WVnKT
 o6PC6pPY725kW1iDqz6pwT37aRh7Z5crEAMQRMNHKrMx3jiN+nmT1qn2X6hEUOr05/Eb
 WPXJJX1jWrS0h2KnsmxdPhMm/neTxdRE1BjHcxpn8/zsrXL5fBVqVTAzWwR2G9B4ripf
 Lh7w==
X-Gm-Message-State: AOAM530I83QgTOAYjnNfc7mZOgKxiVYzRJep7VbCzf+D/ScAbvZTCrA3
 0rtwvU6vw0FWZCsL9Kd1IbXR7NaLSOOeUs2/t00fjK2xNtDnU9XAHlt2p9URkEH07KnGM1df1av
 TzgbRNHmC0m07EErTSCWhxN7fVgDxe70+Opmgb000S+V3RvxRsdjwkgHWoResNSzEez0=
X-Received: by 2002:a05:6402:424e:: with SMTP id
 g14mr25539034edb.372.1631708051494; 
 Wed, 15 Sep 2021 05:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHrxD2kmUT2Jgr0qSAtjdEuXrBD5CxQEaiP0Ezje0c4gJ3clBstOHkkKy1vBoTeLgI4RDPlg==
X-Received: by 2002:a05:6402:424e:: with SMTP id
 g14mr25538994edb.372.1631708051189; 
 Wed, 15 Sep 2021 05:14:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dn28sm5192062edb.76.2021.09.15.05.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 05:14:10 -0700 (PDT)
Subject: Re: [RFC PATCH 3/4] include/sysemu/block-backend: split header into
 I/O and graph API
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210908131021.774533-1-eesposit@redhat.com>
 <20210908131021.774533-4-eesposit@redhat.com>
 <YT9RzrThGlWp4E5Q@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5060185f-9a76-da5a-9214-6d11efef0281@redhat.com>
Date: Wed, 15 Sep 2021 14:14:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YT9RzrThGlWp4E5Q@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/21 15:27, Stefan Hajnoczi wrote:
>> +/*
>> + * I/O API functions. These functions are thread-safe, and therefore
>> + * can run in any AioContext.
> "can run in any AioContext" makes me wonder what the exact requirements
> are. Can they run in any*thread*  (regardless of whether an AioContext
> even exists for that thread) or do they need to run in a thread that has
> called qemu_set_current_aio_context()?

I think they can run in any thread as long as they have called 
aio_context_acquire/release; later on, they will be able to run in any 
thread completely (which will be the underlying mechanism for multiqueue).

Paolo


