Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3795339D4F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:30:05 +0100 (CET)
Received: from localhost ([::1]:59334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0ay-0000ED-9l
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL0Zo-00089p-RW
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:28:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL0Zl-0004CY-Or
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:28:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615627728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVUtRbkHg6/nUlt1SQUZfVwOU+T337lqHRK8z3I28k4=;
 b=bs1AgvBA0T8xQ1pxyxNe8sBezn6RU4ILtDjhBvWwOej1SuXYa7fUv5twOrg8ZMD6TU/wqo
 78QV7+fFY/hv2xWU0+kU9XLW91vE0f2vcRjW+yt7m6v1M0+KkR+j6f8oZQwnklyGT8aGDx
 CYncmg3YuT946IBy8UnvyqGtLadWFy4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-ogQ12Q81On6xNHT0bX0BVA-1; Sat, 13 Mar 2021 04:28:44 -0500
X-MC-Unique: ogQ12Q81On6xNHT0bX0BVA-1
Received: by mail-wr1-f70.google.com with SMTP id h21so12251781wrc.19
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 01:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YVUtRbkHg6/nUlt1SQUZfVwOU+T337lqHRK8z3I28k4=;
 b=H6uaRaHNZlulZc18eWYNMZ48nTigd87v8GEs15obspo75/xiG6pj1aYbIM9iF/DNJV
 r4YuSyzTj5YhEiG/Smf9ZPuQ11eCQ1H0iC5bzveVUHo0bATZdKLYOq/Z2W9Q9NrBt+qz
 CmnIzlN4r5w6Kmgr6UqXogd9mmSzQA85XDp2dneTGj14jzHTq9xyeIDhOIFNij5i1olx
 V/LboCgX/tqxqGTH7i7c51+Ac6caZc23OLxERJAuCRlwSmmB/HXXqA6CpRLtkGzocHpX
 jnz2kNQG+ulBLJJ27gWEcldJSlLNC1eiU89DWd0YW0gjP/K7iQD29bP1bjAIivRKsudL
 0Kow==
X-Gm-Message-State: AOAM53021hxU7oOuKaFqXLKeB/DDFZVTHjiBv9h3KK8c4UVu6kSzl6jM
 CA/v7zq235ZH96DGMzAwz8lZAsVAEiOVDoV1+7cah227WszcsCx5BQuQKUIEaPKiJlXRMOyWtm2
 rh3tcrzeIV3r+oas=
X-Received: by 2002:adf:e84f:: with SMTP id d15mr18146463wrn.394.1615627723392; 
 Sat, 13 Mar 2021 01:28:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcVJXtdHZFd4syD93sMbEZdwxr3VGMvFxSv6fq2LobIlWyENXkPjHyvERrgal5KLfzfuKYwA==
X-Received: by 2002:adf:e84f:: with SMTP id d15mr18146435wrn.394.1615627723215; 
 Sat, 13 Mar 2021 01:28:43 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v13sm13159492wrt.45.2021.03.13.01.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 01:28:42 -0800 (PST)
Subject: Re: [PATCH v3 22/30] qom: Factor out user_creatable_process_cmdline()
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-23-kwolf@redhat.com>
 <87h7lfwim1.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d6ebd22d-a284-3c86-ae04-9cf0651c5141@redhat.com>
Date: Sat, 13 Mar 2021 10:28:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87h7lfwim1.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/03/21 09:41, Markus Armbruster wrote:
> Observation, not objection:
> 
> 1. QMP core parses JSON text into QObject, passes to generated
>     marshaller.
> 
> 2. Marshaller converts QObject to ObjectOptions with the QObject input
>     visitor, passes to qmp_object_add().
> 
> 3. qmp_object_add() wraps around user_creatable_add_qapi().
> 
> 4. user_creatable_add_qapi() converts right back to QObject with the
>     QObject output visitor.  It splits the result into qom_type, id and
>     the rest, and passes all three to user_creatable_add_type().
> 
> 5. user_creatable_add_type() performs a virtual visit with the QObject
>     input visitor.  The outermost object it visits itself, its children
>     it visits by calling object_property_set().
> 
> I sure hope we wouldn't write it this way from scratch:)

All problems in computer science ca be solved by adding another level of 
indirection, except those that can be solved by adding two more levels 
of indirection.

> I think your patch is a reasonable step towards a QOM that is at peace
> with QAPI.  But there's plenty of work left.

Absolutely, see https://wiki.qemu.org/Features/QOM-QAPI_integration for 
some brainstorming about it.

Paolo


