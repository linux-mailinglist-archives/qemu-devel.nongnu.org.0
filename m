Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C3E33800A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 23:05:47 +0100 (CET)
Received: from localhost ([::1]:35290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKTRC-0000P9-St
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 17:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKTPk-0007oR-Cx
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKTPh-0005Tm-2J
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 17:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615500251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8wmSEsNFf2s0GrRSOOCIkF27LJLhiH2Xr0IlBgUmmk=;
 b=da77rQUfXSfVi31FloyCEcu/k4EDVrC2/T0DN2ackFIpDtYXuK9jCyrJD6slVRfjbzwsM4
 L+l7+7txKtfAX9yrcK4XpvkyBYbfp/W/DvFiIZQ2uoYcBaL1+AqWnudG9+PAE26NGICEUO
 7oAU7QQ1hv6CjcPE6QzO5HiutErJFjQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-g-WZVZrANPOYX62pPibqfw-1; Thu, 11 Mar 2021 17:04:09 -0500
X-MC-Unique: g-WZVZrANPOYX62pPibqfw-1
Received: by mail-wm1-f70.google.com with SMTP id w10so2681399wmk.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 14:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/8wmSEsNFf2s0GrRSOOCIkF27LJLhiH2Xr0IlBgUmmk=;
 b=LC90w0+QHdK9e6RFwNFRtdg8WP6P9XuZvEkqon5BK9zpNg6Q5k9BRRzmoNKMMnC2Ra
 8nqQliomnuIQyZ6jg7cUfFu6hEdohAXaYhNKOP0VdL1oUctWgNpUqTT23dkGuc57wCm6
 06g4k2z8KFrqp4kMZUo6Wfe23heNt/WnA8Q1dNMVaeNFj4U6tK6IF3+QKHFpvRDKHRPQ
 IaK1FLkZls8NZKSNIdYocwGtV3FlkLEnlirgyPw7wj7V7IVKQB3BSBzUDEs6o6Oh64P6
 dFEvkLR1SlNoElgCa8gOozR850psaPqylcSAj/ltjXSgkg/7a5C7oJd0n8qKUL3DOaHF
 UrcQ==
X-Gm-Message-State: AOAM533NeKIYvWQya9KsWBne61Tt2lVfwUIR7Eu53jqLntlSTAEbNTue
 4p7NSyovlKigXDJlDO2L9ZenN65R7XQnIs4R9g7hYm7Y0VdMVy06VYZ/M90ZNomQN9iUGZJA7m1
 k/Dr1FIi/vWEwlzw=
X-Received: by 2002:a7b:c112:: with SMTP id w18mr9951456wmi.28.1615500248147; 
 Thu, 11 Mar 2021 14:04:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUrIX3rqDRbQavtz/3YgbcEEvOhWk+CwacOhK/x+nwLWoduV9MSTiIBGDw9Itpjkt7f16u4A==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr9951427wmi.28.1615500247971; 
 Thu, 11 Mar 2021 14:04:07 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id z2sm6519487wrm.0.2021.03.11.14.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 14:04:07 -0800 (PST)
Subject: Re: [PATCH 05/14] migrate: remove QMP/HMP commands for speed,
 downtime and cache size
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-6-berrange@redhat.com> <YEoE7NdH+LNzDlXW@work-vm>
 <1e211782-d0c6-6026-6a4e-b5eb626b8fb3@redhat.com>
 <YEpilXGj9m4cCSY0@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c0540b42-2a83-2121-03fa-f4aa1c45b4d1@redhat.com>
Date: Thu, 11 Mar 2021 23:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEpilXGj9m4cCSY0@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 19:33, Daniel P. Berrangé wrote:
> On Thu, Mar 11, 2021 at 07:18:54PM +0100, Paolo Bonzini wrote:
>> On 11/03/21 12:54, Dr. David Alan Gilbert wrote:
>>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>>> The generic 'migrate_set_parameters' command handle all types of param.
>>>>
>>>> Only the QMP commands were documented in the deprecations page, but the
>>>> rationale for deprecating applies equally to HMP, and the replacements
>>>> exist. Furthermore the HMP commands are just shims to the QMP commands,
>>>> so removing the latter breaks the former unless they get re-implemented.
>>>>
>>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>> Yes OK; ouch that's going to break my 7 years of instinctive
>>> 'migrate_set_speed 10G' typing, but it's probably the right thing to do.
>>
>> migrate_set_speed should remain if it is not changed to have a sane default.
> 
> Define sane ?   The default is 1 Gib/s since:
> 
>    commit 7590a2ae091fde8bb72d5df93977ab9707e23242
>    Author: Laurent Vivier <lvivier@redhat.com>
>    Date:   Mon Sep 21 16:49:57 2020 +0200
> 
>      migration: increase max-bandwidth to 128 MiB/s (1 Gib/s)

Oh, I missed that!  I was still thinking of the old 32 MiB/s value.

Paolo


