Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D070234183E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:29:40 +0100 (CET)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBRr-00040r-P5
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNBPJ-0003Db-PN
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:27:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNBPF-0006tp-J5
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:27:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616146016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38z4sROegan/nfR+1L0RPWrtYeNs2dR6Ir1OxG/STwU=;
 b=OqrAexXPFfkfUiVgFX3bvOVcUGR5pH3TyY+4aTfunDfR4V+J1OFTPe20Tgu57KcGTrKPtl
 sYeiYPyGunoCf7wtRu3k0d/PTx3VbU9fsKfufxv1ZIDHnRua1YNCW4q1Bc0YihNX5ByOrE
 svrpQxMJXXP1ctUTpHZPUC8gYJfaA5o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-dN0cadz3PpekplY5aHAI8A-1; Fri, 19 Mar 2021 05:26:54 -0400
X-MC-Unique: dN0cadz3PpekplY5aHAI8A-1
Received: by mail-ed1-f69.google.com with SMTP id a26so15568575edt.23
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 02:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=38z4sROegan/nfR+1L0RPWrtYeNs2dR6Ir1OxG/STwU=;
 b=G7ql85ofEN90ccB6US1WiCkAUOABHd1NrXP4+8T7rmc730685NDokzGZIB8hpC3PKv
 UlZPIpdSC6Mmbw8b3Q1Z4ymebWw26SEF13HuU+kVrIz7pJ/RnBvfCRgzATBCF6Ctq/Pr
 wLIgrLrRr+vXdL+TehuZGAMOlrcRPEX86NrnVrWG8wp7on+fO1+f7n6w3FSB7Lr7IqR3
 fbqyHtrwHSMUs+VSHeJCYdJtny5p94Svb+WBHDXzpBgCMZ+1YnPXNwmCJ9phvYgMB6AQ
 bG8i3J+KDYfmGKQotL+/ZZ4vud/ZK7WqBF3JldHCiZ7XwfN8smyMIZrX/vlRynUdpnJE
 oIEA==
X-Gm-Message-State: AOAM531mWAaTtftruuO6kuXvIQNbNiaWYHdVBMbHktMplW644iqger6H
 FGrK8CK/FrnECoEf3Yk/4fOyQ/RDLqPPtj5T1DTuvhweVS3fmOmwvJIGlfsG6SEkMTqwGQgxk9v
 LPAF4Q2R5k9Bu/os=
X-Received: by 2002:a17:907:c16:: with SMTP id
 ga22mr3240700ejc.120.1616146013767; 
 Fri, 19 Mar 2021 02:26:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQitPaiR/aA6Wdb/KZoLZT+l+VJtFiq8cCFkI3tBMlgjTakcoDF6iSjjGitYZqGtx5hp/wYw==
X-Received: by 2002:a17:907:c16:: with SMTP id
 ga22mr3240697ejc.120.1616146013616; 
 Fri, 19 Mar 2021 02:26:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n16sm3704432edr.42.2021.03.19.02.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 02:26:53 -0700 (PDT)
Subject: Re: [PATCH 1/2] floppy: add a regression test for CVE-2020-25741
To: Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
References: <20200827113806.1850687-1-ppandit@redhat.com>
 <20210319050906.14875-1-alxndr@bu.edu> <87lfajsn7w.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5a572879-02d6-d525-627c-892bd3903c25@redhat.com>
Date: Fri, 19 Mar 2021 10:26:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <87lfajsn7w.fsf@dusky.pond.sub.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: John Snow <jsnow@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 06:53, Markus Armbruster wrote:
> I guess this is a reproducer.  Please also describe actual and expected
> result.  Same for PATCH 2.

Isn't it in the patch itself?

Alexander, I think these reproducers are self-contained enough (no 
writes to PCI configuration space to set up the device) that we can 
place them in fdc-test.c.

Paolo


