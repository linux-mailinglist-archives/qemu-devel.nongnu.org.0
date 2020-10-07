Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920D4285EEF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 14:19:03 +0200 (CEST)
Received: from localhost ([::1]:35130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ8PO-0006YZ-KB
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 08:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ891-0007kh-4t
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 08:02:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ88z-0002Hz-3o
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 08:02:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602072124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03IGo10p7vJJZnPkbAZY+95plnqPzy+01qfBz6HBKx0=;
 b=axpaCGRkMNNiFZlLOQ+n34MewQwcQGddpN7gcmuYaHpEuIlf/Hi+vnBxzg8GKXxrh6SIS1
 pKWrq5gLsiuhA8/268tN2gsWfy03U2y/WM+DbGAJWANDNrXkjn5FfMXV3SSFx6MDsddDMQ
 dX3Ok9o27lk7Ue3py8u8iphp3+q3MWQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-Rgx2slymN1ioy-Y28mRApg-1; Wed, 07 Oct 2020 08:02:02 -0400
X-MC-Unique: Rgx2slymN1ioy-Y28mRApg-1
Received: by mail-wm1-f69.google.com with SMTP id 13so456815wmf.0
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 05:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=03IGo10p7vJJZnPkbAZY+95plnqPzy+01qfBz6HBKx0=;
 b=K7vKDKDPkXwiIRQkv/Z+ZFV/KcQ45wwr+JIlkF9VKBiFhkNKcwotB7ledcEKEYKtlR
 IKwcPofLGb/XtG7SEDQXJB2yz9VGCR9oPJljG/9HpteQ2eyknBSMY0hKPzwUBeFHLm6p
 rCHdkM3Nn83godaV40BA/8mZtN0p5LAmi+he+4Kamxd/h9WL3ULQRHhrcZcj8o+YWk6/
 gJPD0Rueh4hN7u5fivaqhrkO0fxLXaL9ksX4TsVsLby4Do3Q+qs4WGvLypi4ZXaSj0BS
 PfBAt06BUhcogLoYlJAjDoXSotpsBu6xMQsxbnNYnievzLho4qkAbrhGZtMZSOkYshjv
 YmOA==
X-Gm-Message-State: AOAM530+Epqz6R3z9AQ2pAOMcOw/G4IJSc7b3lYRYrsQ4SrVxMOH6Scd
 yfrM87lwncwsC2de2kDsVjZanPqPkiWGEhYa/IdPLCzm/cGFiWlhJrWpNB0H0J27quUeCnEagxR
 NaWhiSE2lLWLmCe0=
X-Received: by 2002:adf:e407:: with SMTP id g7mr3122531wrm.349.1602072120748; 
 Wed, 07 Oct 2020 05:02:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiGp9tO8ORp+4Dk09P8e3YqWEkQx3r/HjW45DsLJBJxzq+iBbjUQHm4X3wDtB2H8EwlrEBLw==
X-Received: by 2002:adf:e407:: with SMTP id g7mr3122495wrm.349.1602072120399; 
 Wed, 07 Oct 2020 05:02:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d2f4:5943:190c:39ff?
 ([2001:b07:6468:f312:d2f4:5943:190c:39ff])
 by smtp.gmail.com with ESMTPSA id m11sm2413392wmf.10.2020.10.07.05.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 05:01:59 -0700 (PDT)
Subject: Re: [PATCH 2/3] docs/devel/qtest: Include protocol spec in document
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201005205228.697463-1-ehabkost@redhat.com>
 <20201005205228.697463-3-ehabkost@redhat.com>
 <27b0312b-cef9-9aea-3196-871eeca6760d@redhat.com>
 <20201007113947.GS7303@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <722dc440-9866-2456-442e-22bf620f0ac4@redhat.com>
Date: Wed, 7 Oct 2020 14:01:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007113947.GS7303@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/20 13:39, Eduardo Habkost wrote:
>> What version of Sphinx do you have?  I need to have ".. code-block::
>> none" here, so presumably the "highlight" directive is newer than my
>> version (1.7.6, pretty old I admit)?
> I have 2.2.2.
> 
> It looks like we should really add code to print a warning if not
> running Sphinx 2.x.

1.x seems to work just fine though, and it's what is included in RHEL8
"CodeReady Linux Builder" repository
(https://developers.redhat.com/blog/2018/11/15/introducing-codeready-linux-builder/).

Paolo


