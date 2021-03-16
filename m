Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F2333CFBE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 09:23:22 +0100 (CET)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM4z3-000206-IY
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 04:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM4xm-0000ki-IZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lM4xk-0004cI-PZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 04:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615882919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2TCkh1ueeeI91+dcrmkeL6v+gEBGuayu6kquyXxw6E=;
 b=fwpFS4llHadvxRHRTGHcopn7ZgnNQhlLpSFMXVF6gjBoSX8Niig+hO2e0GcLqWhPBClO0A
 biSlOp12+YP/xb+x9zO+7gBHkoPDRpK6jZKYr1KSrZOSXd+EM2EpKHoLy3ZZ+yITirWAe4
 uNWndbHyz7Hf6oTwMxyQb1c7HctpVQ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-QYgh79n6OOaGK3nxsQUsRg-1; Tue, 16 Mar 2021 04:21:55 -0400
X-MC-Unique: QYgh79n6OOaGK3nxsQUsRg-1
Received: by mail-wr1-f72.google.com with SMTP id b6so964707wrq.22
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 01:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G2TCkh1ueeeI91+dcrmkeL6v+gEBGuayu6kquyXxw6E=;
 b=WvDFU5VmJh/ThQb6T2OyMHT5NDJeOqOGCFRQ5pk0s1Le0N/RxGPR1FWUel5eXYJGFO
 JhIyraXUTLCEahS9WNjqhm6p/LfPpd10jvsg68hpORpglNwmMXghxQgS/nUfg/x8sfSB
 lJ9Ub7y+R3asfG8BOYb/DRLG4KGhb4O+BZQlulpJjXsAfEw4tlFEbnt86SJf+slpn75z
 ID98N3xcW++UHFEhtoP3OKe2Yp1fhzj+xeNOlxK90N5XqaczQF/oYITB+opVlI8Yn+oj
 6h9vJL+fau1wOJTX2Sr6I3xp00vRj91xapzb/M+P9AeNHsLSKTZRyiDgBZiueKL/r9JX
 V59w==
X-Gm-Message-State: AOAM533Exw7Nx8YoGoXq9yUnVyY/R2Mv+FeCv8xLkJHs/oEZpdS53cAP
 rGiZ16+l+xzL/yJbYkSS0MpMWvMPnZTk/m2FSBFtA2hxkoM/J+Wv8J2OYe7KYFSKS+2zYH2Syws
 GDRhNTFFwwoUE56s=
X-Received: by 2002:a1c:bac2:: with SMTP id k185mr3578092wmf.148.1615882914593; 
 Tue, 16 Mar 2021 01:21:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyZCahZqt/tYyOaBBP3l/if2frV+795fusJ7Q02wCTiZ6mTqcMmIl1hqwdFB05yRTpKq+UWA==
X-Received: by 2002:a1c:bac2:: with SMTP id k185mr3578057wmf.148.1615882914304; 
 Tue, 16 Mar 2021 01:21:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g202sm2447184wme.20.2021.03.16.01.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 01:21:53 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0c75d6b5-cc09-f8c4-dc02-e894abecc1b3@redhat.com>
Date: Tue, 16 Mar 2021 09:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87ft0va8wp.fsf@dusky.pond.sub.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/03/21 07:51, Markus Armbruster wrote:
> The query command could be made more useful than introspection if it
> reflected run time state, i.e. it showed an accelerator only when the
> host system actually supports it.  Can't say how practical that would
> be.

At least for KVM there is runtime state that can be included in 
query-accels.

Paolo


