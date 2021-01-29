Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E7308961
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:39:27 +0100 (CET)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Tzi-0000TX-HK
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Tmy-0005Nk-Vx
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 08:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Tmo-0000OH-KD
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 08:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611926762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4DTIlqlzKHu/MH0vna3+FLcXFx3UeJ+NZ435qFT+9Cw=;
 b=DkIqsUC7gAnx+QdJ8cpzQK8wt87DA434CXyGFEa4tZxUdCijIE0oyV6IZeU8CQSg5BM85B
 VeT+JjgDOGsi6xMvlVeUC8BPVgv/M67f4qTP8dXmd3PXfZJ8+LOildckjl72rkGeugN39V
 TtFuNGYYDYMpkv5vRU64X/PijbZHQzE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-buLhIDS3OwWIsMhhXAlvng-1; Fri, 29 Jan 2021 08:26:01 -0500
X-MC-Unique: buLhIDS3OwWIsMhhXAlvng-1
Received: by mail-wr1-f70.google.com with SMTP id e15so5045405wrm.13
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 05:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4DTIlqlzKHu/MH0vna3+FLcXFx3UeJ+NZ435qFT+9Cw=;
 b=E5DAogtx6WXRFTpU9GHlL1aTPmkYbCGai+p7upIu4SrNcneaRVRAz3Tc5QUhMpb38O
 Ui3t3bYMY0tFl3l1xJW99ts6XufebcZmO5NdGQfXN5+1P7NWRkLk5f9Ta812dQqmiIii
 vXnZbQ3nAyJ7ME1hrgVW9Zhs2m23bfQcNbvWjpjohNUryCDtHK17olp1lW4ga1sfHaBm
 +eZVXDkRUVtGNcqrD1TCpSKRH0SbwoPrW4znCNaxx7D4Xu8ii6FL7kPlQA/gzI/feXA6
 46p2uVUzQF3FRa3ajOm/XjkxmnroD52rusz/VQFh64EzysU+KtgojkCA/t/RIxup1ICK
 G9FA==
X-Gm-Message-State: AOAM533Wul14WPksyYQf5DzDbGbdm8omuLOrf0LfHTAFShOSh7dqKnk+
 tZWIjPWP4rZRSWEWIuYBVRhAfBd6ljVfKa1fq3HGHhgmKYVLC3W6RRM/8cfwL37Pck3tnqE3XXx
 gCLYPWMOaErfuIu4=
X-Received: by 2002:adf:eacc:: with SMTP id o12mr4541819wrn.202.1611926760045; 
 Fri, 29 Jan 2021 05:26:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwf5C+zUojbwKD/S7hjo6X/LXxzFIjmdmTwbvtyuRN9lv5srbjeEuRSxjtzzu0cRyA/WLabkA==
X-Received: by 2002:adf:eacc:: with SMTP id o12mr4541778wrn.202.1611926759874; 
 Fri, 29 Jan 2021 05:25:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b11sm12236438wrp.60.2021.01.29.05.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 05:25:58 -0800 (PST)
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210129081519.3848145-1-armbru@redhat.com>
 <CAFEAcA_O=48U_3p_mKeRRY99OsJCRSTJmOefDT1gbHVdyE_C0A@mail.gmail.com>
 <20210129121752.GJ4001740@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bacb8bab-2719-ae96-f1de-91e598b98abd@redhat.com>
Date: Fri, 29 Jan 2021 14:25:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129121752.GJ4001740@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Jean-Christophe DUBOIS <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/21 13:17, Daniel P. Berrangé wrote:
>> On this one, my vote would be "no". "Versioned machine names
>> include the QEMU version number" is pretty well entrenched,
>> and requiring users to remember that when they want version 4.2
>> they need to remember some other way of writing it than "4.2"
>> seems rather unfriendly. And 550 uses of '.' is a lot.
> We can't make  keyval_parse() accept "/" instead of ".", but can
> we make it accept "/" in addition to ".", and then encourage "/"  ?
> 
> People simply wouldnt be able to use "." as keyval separator if
> they're using typenames containing "." (or would have to escape
> the typename.

'.' is much more common than '/', and is shared by about all programming 
languages that have JSON-ish data structures natively.  So using '/' 
seems decidedly worse to me.

Paolo


