Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6C1339D61
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 10:41:22 +0100 (CET)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL0lt-0003PA-KG
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 04:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL0kz-0002zv-OC
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:40:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL0kx-0002Qe-Vs
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 04:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615628422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N0OkYf7QweT7wZugcxxGeiG2QClEM9IhFx7kxEw+Nvk=;
 b=HAmnkpYqQKycMkGgt5nRZOwx6+bIR7jN0JcxN/NhkuDlnPamJNDyG5zf8odFkcGyhyArXp
 b2jIBb8UGW/5Kd7JE3RKSrxcPYe3AxfQuzCB++dr6idEuhknud67GYmOzZKkxfCinsPTI+
 xJDZkolsSHXqKc6APh3vcDTsk5N6tSI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-TSie3N8hNQyyk9h_L9PgYQ-1; Sat, 13 Mar 2021 04:40:20 -0500
X-MC-Unique: TSie3N8hNQyyk9h_L9PgYQ-1
Received: by mail-wm1-f72.google.com with SMTP id b20so613020wmj.3
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 01:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N0OkYf7QweT7wZugcxxGeiG2QClEM9IhFx7kxEw+Nvk=;
 b=RRC2R8vb31whqnOWhqd0cuwYizxIoNt1vHkcvfFS0rrPZSMzqqNHAiTrLb1a3wjRnP
 tHedSFY2sUyqJ6q1V9xiyQxoCYPtf3wTNRo9KH+XGsCq3baebhJ8ANtuxWlkqOeqiRfj
 RXGP6M+P5Hu/nh3xKBRgvfDdXX1mvAqNP8K9pxqBRIPvUTOwCGyr+alDWikhdYks1rgx
 ANfT8qOjBw184cjqZczxpymPt75SfSKw+TINBh+NFs3UQvk1C1NIToSggGNEyJqgiVTi
 ruEPaP0+PWv6eOLCVQ8HBvLok0KzGzesFXrh/90PnoCKFPRcxfZ+fZIz/9f/qGt7U17B
 TdUQ==
X-Gm-Message-State: AOAM5332yacP20N22b2/wKyl/l6GMOrBLeY44+S5PAPGwbstGJ68RTUx
 IbTjraz8CHqMMd6a0UDGl0H8jsbE3W6FFtH8dcrIsjHsQt7HCeMeM1RVE8yYdGnWe8+lojBhm57
 tpTwri8NqE4q99kc=
X-Received: by 2002:a1c:bac2:: with SMTP id
 k185mr17375482wmf.148.1615628419659; 
 Sat, 13 Mar 2021 01:40:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJww3o91OpJhebPl3m9OEX6qbC1Mnu9F2STcqF2aQCVIhr5w5NwW+XpUH+Mdy6rmC6KGs/m46Q==
X-Received: by 2002:a1c:bac2:: with SMTP id
 k185mr17375469wmf.148.1615628419503; 
 Sat, 13 Mar 2021 01:40:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id y18sm11172559wrq.61.2021.03.13.01.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 01:40:18 -0800 (PST)
Subject: Re: [PATCH 2/3] qom: move user_creatable_add_opts logic to vl.c and
 QAPIfy it
To: Markus Armbruster <armbru@redhat.com>
References: <20210311172459.990281-1-pbonzini@redhat.com>
 <20210311172459.990281-3-pbonzini@redhat.com>
 <87czw3wg4r.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d53a6c02-7503-71bf-45ca-9036b2d48014@redhat.com>
Date: Sat, 13 Mar 2021 10:40:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87czw3wg4r.fsf@dusky.pond.sub.org>
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/03/21 10:35, Markus Armbruster wrote:
>> +    object_option_foreach_add(object_create_late, &error_fatal);
> Likewise.
> 
> Before and after the patch, object_create_late(opt) ==
> !object_create_early(opt).  Your patch provides us with an opportunity
> to assert this: object_opts must be empty now.  Suggestion, not demand.
> 

Nice idea, I'll include it.

Paolo


