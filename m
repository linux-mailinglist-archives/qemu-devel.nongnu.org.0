Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 033012A2FF1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 17:38:19 +0100 (CET)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZcqY-0005no-4C
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 11:38:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZcmV-00037J-TE
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 11:34:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kZcmT-000132-Sv
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 11:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604334845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXazUCi4/fkT3GRBLPkMaRgzAASrfK57VJZ7z26cu5M=;
 b=VcjDmlZsaXQ12L0IZe76HE8C5OlbA7yj+kduC+L8CHGMbiEpm2GPHRSWzum73uEenBhZh4
 iXFK7Lsso9b2rdeqnNrl94QeyixmQShBz4NSvsOGvNl+xe9wz8pQUnLacRKyH0eo+ljlbP
 5FofzniDJPI+seCV2dobCU4jVB592lY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-uWtjMNXaMiexXlj_paT-mg-1; Mon, 02 Nov 2020 11:34:03 -0500
X-MC-Unique: uWtjMNXaMiexXlj_paT-mg-1
Received: by mail-wm1-f71.google.com with SMTP id y21so1777412wmi.7
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 08:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xXazUCi4/fkT3GRBLPkMaRgzAASrfK57VJZ7z26cu5M=;
 b=eQL9nJGGXcKHIvYKCiV/Hz18G9DPnQ4gFrruX6dLkB0jKx/X8enOC8rtvg4ryCtu+/
 QVBlIWkjBVS259wq5fJ0ThuvHDq0nee8O/Zc/gFBmfrocY3HjOObTM/2Ws8qw8fW7iK7
 rN3KoAqPffHq3/fAth7SmpnXvf2OJL4tyir8JVYVcTwjFj34W0ARqVr351SNk7sPLMdG
 AnrMnwW5imQexCJlamHQeiWQlC8AuPym3RpOfqD+28UMMkdi6kJvmM49FOJRL6tZcT1L
 KqHaXxreZSDq4CVb6lSCnPIwH7/rDWiAVv3YXWi7IzdWJoHGIcRyPqyqn6kzO03kJCX+
 YyaA==
X-Gm-Message-State: AOAM5312/28zZF9pzXX7irHm0vH55aeC6hTszZV+oiPdZECKU6xEDdI3
 r7kbpPlbne5KY0PimGtKZ34bNJsSsMWd/v9T/a+K09+FO95WDWOts5DYbngCsF9dzgcexNswv3z
 IEwA6PIKGnXXBZdU=
X-Received: by 2002:adf:f104:: with SMTP id r4mr21416824wro.202.1604334841803; 
 Mon, 02 Nov 2020 08:34:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcHaLA6Xf+1ykworpTJt1udhmSuTZNyFBTbgnz9QjJT5nqcwzk0fbQ5W2phHk95fx3vfH7xg==
X-Received: by 2002:adf:f104:: with SMTP id r4mr21416814wro.202.1604334841651; 
 Mon, 02 Nov 2020 08:34:01 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y63sm7157099wmg.28.2020.11.02.08.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:34:01 -0800 (PST)
Subject: Re: [RFC PATCH v2 00/37] cleanup qemu_init and make sense of command
 line processing
To: Igor Mammedov <imammedo@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201102165756.69540720@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6c08fbaa-57aa-b2da-c90a-6b53f628806a@redhat.com>
Date: Mon, 2 Nov 2020 17:34:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102165756.69540720@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
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

On 02/11/20 16:57, Igor Mammedov wrote:
>> The main improvements with respect to v1 are:
> series no longer applies to master
> what commit if was based on?
> 

It's based on 20201026143028.3034018-1-pbonzini@redhat.com (which you
should be able to get through patchew).

Paolo


