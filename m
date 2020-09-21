Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E0272540
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 15:19:10 +0200 (CEST)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKLim-0007yu-U7
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 09:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKLcj-0003zH-Al
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 09:12:53 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43637
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKLch-0008JS-4m
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 09:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600693970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZPuKACDE5FHHzCCKZ7Z9RpCWtyMwtefKjntBNLjZVw=;
 b=BkdZSyaKr8A/cIgTE9Y8ePZmjLZQHYYhjeQHHVBbupOq1EewKeZQuhHT9ufKiEsjjUvx1Y
 Z3egIKoO6TKgvHpttayzX6Vew3vQ8cC0OImq9F1rixQ3YAKcZ3GTjDNgxpLJywHrBqcrHP
 8A5EfBBl0E2F7N32xqbY1PEDdvWNvI0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-beMAVL9RMbG2iaiICPixJg-1; Mon, 21 Sep 2020 09:12:39 -0400
X-MC-Unique: beMAVL9RMbG2iaiICPixJg-1
Received: by mail-wr1-f72.google.com with SMTP id w7so5880164wrp.2
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 06:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QZPuKACDE5FHHzCCKZ7Z9RpCWtyMwtefKjntBNLjZVw=;
 b=YhBD4tNM3gC/ZNf25z13bl+ARkeju+X7/pwecsEjZf0Bh4DfgAVu8hYTOgzhoidjnj
 /proktgzNSbGOUtpnFE77pXGmU7coJ+m9SJ5mpzYAQo8wC9O63XjvqHCKTD+UNzkhVL8
 dE7paCiDrGvJf6yAaJUQkJxv4IO0qmJxZuAWCyr0IGWRgBJF0ZwebsBDhSwt6ON0EFKr
 ikERBBdnn20MUDoLcc0C0iob6OtTODXjddFXCruhgzIg8lIDt+U+bmnNzVTxI6zHpGk2
 D6EJboe8McBUCg9AwpAalXD8HpWT83yvoM5AHJatSwhrPLI6jSotexHXDkAeudOA6Kl9
 Jwow==
X-Gm-Message-State: AOAM5308SeJLLGSncpTz5g+QbgE522Zss0n2sbCMTUMKEIgfF42R04H0
 jyyAHR1CMUq5A3HZ+c81eohe0dfLgTd9p2vnJBuN/qYwmDTk/RyYbfOs5hvJRcRdpnuURi9Ox0q
 0aPy0452DXXbP+PE=
X-Received: by 2002:a1c:7714:: with SMTP id t20mr31575975wmi.55.1600693957974; 
 Mon, 21 Sep 2020 06:12:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr5Jtr9DFbYyhcF6Jc1voUu1yT5vZQcJy6jFsBjjvY8z+Bth4/3Lnwe02QEvXdJwrJDK/+Lw==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr31575962wmi.55.1600693957747; 
 Mon, 21 Sep 2020 06:12:37 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d153:8d0f:94cf:5114?
 ([2001:b07:6468:f312:d153:8d0f:94cf:5114])
 by smtp.gmail.com with ESMTPSA id t1sm18602940wmi.16.2020.09.21.06.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 06:12:37 -0700 (PDT)
Subject: Re: [PATCH v3 01/10] capstone: Convert Makefile bits to meson bits
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200917235720.2685978-1-richard.henderson@linaro.org>
 <20200917235720.2685978-2-richard.henderson@linaro.org>
 <87wo0no0wz.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ca7167a7-9743-d409-d99e-8269490c5a9a@redhat.com>
Date: Mon, 21 Sep 2020 15:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87wo0no0wz.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 04:38:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/09/20 12:54, Alex Bennée wrote:
> Something is breaking when switching to a branch with this on from
> current master:
> 
>   Linking target qemu-hppa
>   /usr/bin/ld: libcommon.fa.p/disas_alpha.c.o: in function `print_insn_alpha':
>   /home/alex/lsrc/qemu.git/builds/all/../../disas/alpha.c:1818: undefined reference to `bfd_getl32'
>   collect2: error: ld returned 1 exit status
>   make: *** [Makefile.ninja:5965: qemu-alpha] Error 1
>   make: *** Waiting for unfinished jobs....
>   /usr/bin/ld: libcommon.fa.p/disas_hppa.c.o: in function `print_insn_hppa':
>   /home/alex/lsrc/qemu.git/builds/all/../../disas/hppa.c:1969: undefined reference to `bfd_getb32'
>   collect2: error: ld returned 1 exit status
>   make: *** [Makefile.ninja:6259: qemu-hppa] Error 1

From "https://wiki.qemu.org/Features/Meson":

Known issues
============

There is one Make issue that might happen when switching branches: if
the command line changes, the files are not rebuilt. This is always a
problem with Make, but it may become more common now due to the use of
statically-linked libraries.


The simplest fix here would be to use ninja to build QEMU, i.e. do the
main QEMU build recursively just like we do for submodules, keeping Make
purely to orchestrate the build.

Paolo


