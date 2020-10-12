Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D4128B780
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 15:44:13 +0200 (CEST)
Received: from localhost ([::1]:58030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRy7X-0004iA-W3
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 09:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kRy6J-000483-KB
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 09:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kRy6G-0008Hn-Kk
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 09:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602510170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TW8G0NFBwjC7/wQIDCnPm7/KBfRzctZcjEuCcCLRchc=;
 b=gAqxFk76/Cu8CRsjuNYX89txrffizU6IuPmPxny6sMe9I+FJYnBPfsGu+DvHXjJc7TE2HI
 g+RQ8vDQGvxMbspDYFd43XZwXwYacpDoD0XaVuPXZQXJYs67gWtc3SrFK0K5LuiQA9wMKZ
 52m5h3ARl9YGlPaj3xWHVH97tzz8rVI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-v9BcDiu_P6qNA6z1aHU2zg-1; Mon, 12 Oct 2020 09:42:48 -0400
X-MC-Unique: v9BcDiu_P6qNA6z1aHU2zg-1
Received: by mail-wm1-f69.google.com with SMTP id l15so5230227wmh.9
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 06:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TW8G0NFBwjC7/wQIDCnPm7/KBfRzctZcjEuCcCLRchc=;
 b=MJwSK04eHX215rYiBLHC3pWZ6yr79k3nXPSr1Dgti3/Dwf4g0pdzsFaKlX0A1v3/QF
 p8bBH3RE/fbkYXMZ9GUhJ8c4oHYQau9V4ApD/7Z96jMllXIJvLcggA9SD7ClgV4almLA
 V0mFO9qqHmpfsPjjGnbKVUMD/pLRkegYgPNtoV/xuGSEGgVFwOTynaVn+BfcgSrd5eQ/
 S9Fjy8xzspycryeG/uRqO4B3uc1Rh80Fzbnrfe27PjCEbKPpaICvuvzUWVC6FGSRq93e
 UnMrWvIxPfWo42XakR6Tz1n5CP3POI1QicUhGiOd3S0AstuhmmK2rHxhmjulUOr+iexH
 NUhw==
X-Gm-Message-State: AOAM531jawmncqdO3kYvfqhRjSGS9d/9lG2FVLkQhPVHT78AA4us8qBN
 mQ3n76lIoOKSfSis1dtjSG3n1xMdA+tkpdTq65xOGoNCo+ubpDd5zhdcWJ3jlQZU2sLXW5P6Nya
 xgabqX8ueo/NokFY=
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr10628771wme.157.1602510167254; 
 Mon, 12 Oct 2020 06:42:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAFQd4wF5isvDwR8DMZXZ8ebWq4Dzv6jPWFxTUeJRl9CXPkcDIFh71wMKgdnP+0WHtez0MFQ==
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr10628757wme.157.1602510167052; 
 Mon, 12 Oct 2020 06:42:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7ffb:1107:73ba:dbcf?
 ([2001:b07:6468:f312:7ffb:1107:73ba:dbcf])
 by smtp.gmail.com with ESMTPSA id 4sm25952630wrn.48.2020.10.12.06.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 06:42:46 -0700 (PDT)
Subject: Re: [PULL 00/39] SCSI, qdev, qtest, meson patches for 2020-10-10
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201010075739.951385-1-pbonzini@redhat.com>
 <CAFEAcA_L0h-0==uP4FrB-QeFsFOcSu5BZFRskO9w4LB2cEqxHg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6b3fafa-e0a3-d8f4-4905-21d70c9a167b@redhat.com>
Date: Mon, 12 Oct 2020 15:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_L0h-0==uP4FrB-QeFsFOcSu5BZFRskO9w4LB2cEqxHg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 12:29, Peter Maydell wrote:
> warning: Function parameter or member 'event' not described in
> 'qtest_qmp_event_ref'
> make: Leaving directory '/home/petmay01/linaro/qemu-for-merges/build/all'
> make: Entering directory '/home/petmay01/linaro/qemu-for-merges/build/all'
> [build continues and succeeds]
> 
> Not sure why it isn't fatal.

I'll fix and resend anyway.

Paolo


