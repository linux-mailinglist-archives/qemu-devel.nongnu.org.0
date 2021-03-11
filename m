Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02824337C83
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:25:12 +0100 (CET)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPzj-0005IC-1M
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKPto-0001Yl-4z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:19:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKPtm-00065f-Dc
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615486741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QsyVvT34Sm0wTS0w+xEzoSD9G05m+sOISVanOX4IPVk=;
 b=QVlue9OlmztQC5O/Nor85rb0T2jKtPjEOwTJpr0RkDgIQSIwQoirs2vm6ljr6Hg5ohqwCr
 jfd6t1cFg5vINrX+fpiMuwGvZgpney7Wmx2nQtlwCtYRtkNmADIWHzE2dlJnPDo5vUEqDn
 UCKFeEnJUGWMenuZFBBgfQptCcHkQt4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-6ZF5tOkNPzKq1ScO8aFRmQ-1; Thu, 11 Mar 2021 13:18:57 -0500
X-MC-Unique: 6ZF5tOkNPzKq1ScO8aFRmQ-1
Received: by mail-wr1-f71.google.com with SMTP id p15so9793676wre.13
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QsyVvT34Sm0wTS0w+xEzoSD9G05m+sOISVanOX4IPVk=;
 b=TuFNGQSdcW93reVBtIhdVkQydQZrmvYIpSzQZak/ddkYf0UqFpZSR+/F9F7FSTF9If
 jqP5s4UFQkBKM0Yst2xngsq8VO8Qjb3RKL5ROJDtqgpL2c5V8T7LDbc8D+ly3F8+4vO2
 kCAjlqj9A3A7CKClUFXcbBhacM7hBFMXir56vw7VwEWe35X8H/gPNdG8vEIGX8uHRKtY
 nAeGkaXRCYNS3cUS+7xwhiu+t+fV2iIM7JsQOyc2o8mIA7+7Wpmzbo19tjscsjO/DU8D
 JDTC9kengBkdg/AzXgBCD76CpWpODEO+fWj6VgMYv0lyQ6nDbtR8VJ3qvVjUULocNWXl
 KCkw==
X-Gm-Message-State: AOAM533EaMbIoMTwHhrO9ZdNiT4YO6g+9LSli0qppZx/CMiQmk5oD67D
 V5KYqenxCa4Hc5OpDoDMdZzdSJRkAUxI5S5upBvvf6wA+wEXH0Azq+shHOk0XCBY+3w4fMqXZ5+
 jieQ0UmfT6EGfBqQ=
X-Received: by 2002:adf:d851:: with SMTP id k17mr10233366wrl.254.1615486736466; 
 Thu, 11 Mar 2021 10:18:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzg8DnNpAeCYuddOtd61FrJmd3fwtEGQ+WB/cqt+Y5MzUht+sheLwvxnhbJZdNciCNJaHltWQ==
X-Received: by 2002:adf:d851:: with SMTP id k17mr10233320wrl.254.1615486736221; 
 Thu, 11 Mar 2021 10:18:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v6sm5034881wrx.32.2021.03.11.10.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 10:18:55 -0800 (PST)
Subject: Re: [PATCH 05/14] migrate: remove QMP/HMP commands for speed,
 downtime and cache size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-6-berrange@redhat.com> <YEoE7NdH+LNzDlXW@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1e211782-d0c6-6026-6a4e-b5eb626b8fb3@redhat.com>
Date: Thu, 11 Mar 2021 19:18:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEoE7NdH+LNzDlXW@work-vm>
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
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/21 12:54, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>> The generic 'migrate_set_parameters' command handle all types of param.
>>
>> Only the QMP commands were documented in the deprecations page, but the
>> rationale for deprecating applies equally to HMP, and the replacements
>> exist. Furthermore the HMP commands are just shims to the QMP commands,
>> so removing the latter breaks the former unless they get re-implemented.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Yes OK; ouch that's going to break my 7 years of instinctive
> 'migrate_set_speed 10G' typing, but it's probably the right thing to do.

migrate_set_speed should remain if it is not changed to have a sane default.

Paolo


