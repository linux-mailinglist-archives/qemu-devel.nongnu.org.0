Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C965247E7E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Aug 2020 08:36:37 +0200 (CEST)
Received: from localhost ([::1]:43164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7vEa-00047W-51
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 02:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7vD7-0003Z6-O8
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 02:35:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51182
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k7vD6-0005W5-69
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 02:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597732498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhuWkMySBseVsXXvvajXVKtUKUPzVZ7teSgoVFbGn7w=;
 b=UBGQ3mDb/btS+i+a7iBEzOa4RT00H5MtanRtsJtPrOp6S0lnxy0UXQ/HJ/RysuZmGUwtDQ
 N2DGu1EY6BY/GHGSwf21c4das2h9Sd3WDmgXbRAMB4FLmMxD+4200OKxrdAocWY8SeaSxJ
 Sv781G35ldAvr/YTaa2zmEJbDMHNk14=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-O12JoDUUMkOJR7kH8UdIdQ-1; Tue, 18 Aug 2020 02:34:57 -0400
X-MC-Unique: O12JoDUUMkOJR7kH8UdIdQ-1
Received: by mail-wm1-f69.google.com with SMTP id p23so5693230wmc.2
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 23:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EhuWkMySBseVsXXvvajXVKtUKUPzVZ7teSgoVFbGn7w=;
 b=m4eoUvxo4aPpSuMxVTlOrRX4UHU/yJ01njZ418DkU6PDzdQbroGTMwUVoZthRqp01F
 loi/kX4yOvAsTDRbtSEdHxOBeEtx285dIKbshAIXIn2pBMBqzyhvSceLtu6NQTQJ/Eta
 ynufwJgY3UcBqIxcSrRjwni6qe7OjvKVvISiXummMTNRZcYaHx5DV/RixAPUkyPz7g0q
 XFSJ49T08rPqMp+E5SfKdMiHqLGsywcUH/2JZbnKqyM4Fe4kLyVjEsk3peFwkjTrnUZG
 sX27dCLtT3eqUhFhR1ig+4dOCTy2A/I9v6kGjpxCfnyIIqrLeIV5S7rL1RYtWn9cfcBI
 pIXA==
X-Gm-Message-State: AOAM531u/feK6/AxyAeVlD7CrozvqZ97OaxMKTBNLQbo1LeM6sZ9Bxal
 XUxKC2Z5vgN7kH8U/91OdrPzGsjnUNZdvXQcgOqAWydFvNrwbHcOZR+Uc/o3Qw3ts1sf+VuPlBe
 2i2TcD33v1G0ZfbM=
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr19057526wmj.128.1597732496175; 
 Mon, 17 Aug 2020 23:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxixZQNYGHNAcvyiHOGYukrwMS03rfHK6CojAmP+3TFNhPMmTOCEys2kme2kBR8yCjm5H1mpg==
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr19057508wmj.128.1597732495980; 
 Mon, 17 Aug 2020 23:34:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:a0d1:fc42:c610:f977?
 ([2001:b07:6468:f312:a0d1:fc42:c610:f977])
 by smtp.gmail.com with ESMTPSA id h14sm30963279wml.30.2020.08.17.23.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 23:34:55 -0700 (PDT)
Subject: Re: [PATCH-for-5.1 v2 2/2] stubs: Remove qemu_notify_event()
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
References: <20200805085526.9787-1-philmd@redhat.com>
 <20200805085526.9787-3-philmd@redhat.com>
 <6846f9a0-ba29-059a-e400-603116f5bb69@redhat.com>
 <38110319-24ea-9a1d-0274-f09f5d33527a@redhat.com>
 <effa1326-e4fe-bf45-3ca2-e22cb1ce096b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e074b9a9-8556-37f5-84be-b2ead84634dc@redhat.com>
Date: Tue, 18 Aug 2020 08:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <effa1326-e4fe-bf45-3ca2-e22cb1ce096b@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 02:16:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/20 13:49, Thomas Huth wrote:
>> ... as this is the current behavior.
> But could we maybe end up in a scenario, where the stub from
> stubs/cpu-get-icount.c is used, which then calls the real implementation
> of qemu_notify_event() in main-loop.c ?

Yes, definitely.  It would happen in tools such as qemu-img/qemu-io and
it's the correct behavior.

Paolo


