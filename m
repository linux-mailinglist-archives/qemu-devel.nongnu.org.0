Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C822B510C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:26:51 +0100 (CET)
Received: from localhost ([::1]:36982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kek9K-0000At-4z
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kejhg-0001kV-84
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kejhe-0006kW-Ix
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605553093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gl9ciTXAfcgsNnTn8Kv/6W1sWAnm0A2aOKSokqswoOY=;
 b=aNqSRoojHfr/Hx6OLgR5nmaqtSOUjUzoUvUpdtcOWI03EjKBblEAYJ+qBVHll0NUIBw7G/
 zPWL6a/TW6KOr6oAEbjQB44B4YgQSLjeFEDmeKJhTj0l0cQfBAdbMoOVdk9I9jAsDmz/uJ
 l7mlRI2JBNeZgDyU9rfyYC7lg/55hSw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-6HgL8DNbPqmCaepGu3ky5A-1; Mon, 16 Nov 2020 13:58:11 -0500
X-MC-Unique: 6HgL8DNbPqmCaepGu3ky5A-1
Received: by mail-wr1-f71.google.com with SMTP id p16so11569532wrx.4
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:58:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gl9ciTXAfcgsNnTn8Kv/6W1sWAnm0A2aOKSokqswoOY=;
 b=NpWwo+8fuICiFDumb+xb7lYHcN3IsU5dPyNKour8gWB3ZuWHDMbRn62M1IddR90l0a
 /duGG41UuEUPSG0VuQ8P6pwv16V+8WCjUezpcU2pbB0FtG1i0TBHLm4xW6fKUht1siNN
 e5OZ9XnoT1IZTUQ4WiZdJjYQSIJfBOoEvWE5YoZ78meNcMxlkUYzY2xTqbH4JGYl4BsK
 9PZZS/RfYYfT7sVYtb2yuANIdGzfKrhUsE5vZHXPAy670l2KFrnpbPgy2HpdzKxTTePg
 +qxwpt8DZKcZ6G2PtjAr+YkEh6XeUTEUImuIXaWy7Rr1e68XMA0gpQpHhHe1duBjwCpE
 6UKA==
X-Gm-Message-State: AOAM531ZsI/kSBOvUNvqV9yTNUY/7zCl3y8ssKhjZ8xULXnXFEMFtP0F
 ySPN059QnILcH10T/7KapEDBZ82NKHjTZzkJeTNpVzYGPew8aWk9R2kNrGnjJ6cWItKiHpOfsfs
 VqZLJtLk+djOW0cTkPUYcxKDRL8/XTZjGG2epiaeaigXbUh0UVWKgEZ+YczJ/TwvAlyM=
X-Received: by 2002:adf:ce84:: with SMTP id r4mr20075772wrn.281.1605553089568; 
 Mon, 16 Nov 2020 10:58:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO5llqbpchP+U/U+BOAs+JDyZ6Il5qIPa7DVTT2lsHPIwtjuxdOqx+LjHWRGHyUSBqxU0Nfg==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr20075761wrn.281.1605553089379; 
 Mon, 16 Nov 2020 10:58:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u16sm23735364wrn.55.2020.11.16.10.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 10:58:08 -0800 (PST)
Subject: Re: [PATCH 7/7] scsi: move host_status handling into SCSI drivers
To: Hannes Reinecke <hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-8-hare@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e16d0002-8038-2ad0-da7f-969e770df2fc@redhat.com>
Date: Mon, 16 Nov 2020 19:58:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116184041.60465-8-hare@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 19:40, Hannes Reinecke wrote:
>   
> +    if (sreq->host_status == SCSI_HOST_OK) {
> +        SCSISense sense;
> +
> +        sreq->status = scsi_sense_from_host_status(sreq->host_status, &sense);
> +        if (sreq->status == CHECK_CONDITION) {
> +            scsi_req_build_sense(sreq, sense);
> +        }
> +    }

Should be != of course.

Paolo


