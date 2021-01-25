Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05550302522
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:51:56 +0100 (CET)
Received: from localhost ([::1]:39508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41LX-0007zM-3v
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l41Jd-0007IP-1O
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:49:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l41Jb-0002bO-Bf
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 07:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611578994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/mTds6bFc+yhyLAFwC57hN7uwGhfL0yLyRjznWyaxnA=;
 b=G/ZPY2fne8TOGb05ytKDgXeSZHoZLWfwbydWFHiUHxj3MJqLoBvSdFQAwe0Be5/j1xcvf6
 TJLNAn+vrt3eYw0TpDur7+OXmuF+kSzXvKr055FD3VqVehI6DR9pFr7IrdvOKEoR467ekk
 Q7Xu8KWwNk5GN0Q4yQrJM0xCYqqF6jM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-VDMaRJEGNDWWeAIcFI39AA-1; Mon, 25 Jan 2021 07:49:52 -0500
X-MC-Unique: VDMaRJEGNDWWeAIcFI39AA-1
Received: by mail-ed1-f71.google.com with SMTP id w4so7322493edu.0
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 04:49:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/mTds6bFc+yhyLAFwC57hN7uwGhfL0yLyRjznWyaxnA=;
 b=BEj/2WBiwxiULB6hbD0aNs0XgwZ6rEhcT+Q4rhAgRS1onzxyi5ApKqKGUgVdqUnppp
 NP9B2XvybSjTGEpqGwEll7kEeP9iS9aFRENbAk2LwQYMHYqPue/xY7UiUuhlj5MdMmL4
 O8r1tl1cwLFVWHFxeUeXPueYt7oHN2qBVbrYWLDAuBwRRM1nLcZrKFun3guEHeEUl8nQ
 8Cemczy/uR38LSDiQrv0Wtu4TEK8Pk833/QB5rbDI6bedLZshdI585oLCGkF9JtZmpEl
 zzcs6zKsf3wvFWY3GemvI/XiRjJKwb8MoVNqfqOfbIb3A5CEB17Y+YriXECfEZVeueGy
 6bhw==
X-Gm-Message-State: AOAM530/kZNZZDnHjjSN9/9SY5zfKzRSkfmeF8ts+MJTP+fAES6+H3sI
 5iyL5VVtezRpjc6z5Qt3GYNAwhK/pp8FlZjhpQa3GOUpY6Ugr04KDosHxFLoAbPdAZs3S2woEeI
 gKEq25rUKKtxfx3o=
X-Received: by 2002:a17:906:6dc6:: with SMTP id j6mr280381ejt.88.1611578991695; 
 Mon, 25 Jan 2021 04:49:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlCfU6/JlFRsIftR5ig2NgndEbaBmNK2wYJiZ5XhH1ysX9W0+9gbfstLutk3tl7bzY1pkAlg==
X-Received: by 2002:a17:906:6dc6:: with SMTP id j6mr280375ejt.88.1611578991537; 
 Mon, 25 Jan 2021 04:49:51 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x9sm8296275ejd.99.2021.01.25.04.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 04:49:50 -0800 (PST)
Subject: Re: [PATCH 10/25] hmp: special case help options for object_add
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-11-pbonzini@redhat.com>
 <875z3lgp27.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3d8a34d2-47b2-5f6f-0294-66c950717397@redhat.com>
Date: Mon, 25 Jan 2021 13:49:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <875z3lgp27.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 13:48, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> Fix "object_add help" and "object_add TYPE,help".
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Standard question when I read "Fix $interface" in a commit message: how
> exactly is it broken?

It doesn't work at all ("Error: parameter 'id' is missing").

Paolo


