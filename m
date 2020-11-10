Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51E02AD9E0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:13:29 +0100 (CET)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVKo-00067e-Dh
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcVG4-0001Mw-G8
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:08:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcVG0-0001MF-Ft
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605020903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PsV7u+qyryTcutwQpsiwk0o+WYEJfG0wvN0hgqkixys=;
 b=R7DzT2U7SbF1ZXqkVMkrzFAozk4bHfetBcqr/FxN+u6cMz06pY5UlDWADdCcnj13z8RlYd
 31/nGAVGd6P4eTEM1aG68mksFYmbV07ukUoL3scPuyLIGdMdCpsxsk+DDu6kyv9lTLPkfq
 lCfo7x63mzGbPlaYxpw2qWpabZuAkYs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-ALalFwpRMuecQp3Td6ELUQ-1; Tue, 10 Nov 2020 10:08:21 -0500
X-MC-Unique: ALalFwpRMuecQp3Td6ELUQ-1
Received: by mail-ej1-f69.google.com with SMTP id c10so4825955ejm.15
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 07:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PsV7u+qyryTcutwQpsiwk0o+WYEJfG0wvN0hgqkixys=;
 b=pYfM+ynHVfmj5rzKtfp/kp9yeV5iSLtpVEBT8swLRqbkq23IKLlKVCUz4DPege0EU8
 2qOc8MawTMycjPmAtp4TQpKxxPR5qa+l8oOqoFL6wniTlAhxypMWzgefI1arGRxenjun
 S96MWj6iTgn+nwEms4uIF67qJ3kh9SBVQ6nF2Vm3JGTicz1JJmbPtJJU6Y9nK0A937Pv
 Ti0ML61ByWO+3VM8uB1EU+BYSzfpWYUlx6ApVewqvTJJpt60Gy2QlhiBKwFM2FxojMCi
 TeKDRxKvdHloKO5ceEzUFwrbJgJh53WjC6GKYZWqWrVfa7DXNx/Vke8JIkamoaHSqfjA
 dXfw==
X-Gm-Message-State: AOAM530gzdeFIeC4kzgMoch1Wgz8SH/ccDiJTk2+cY3CsSNfgFihlaYC
 l0/OuTxzOIbNpJE1UpV96G7Nbbj+7l9oDE0JLdrojLqH6zyizsJL1HwzyHr+DEtpChAiZsewfUz
 Y/ynrijkFHuZNGhk=
X-Received: by 2002:a17:906:519b:: with SMTP id
 y27mr19660605ejk.25.1605020898749; 
 Tue, 10 Nov 2020 07:08:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn96pLSBxY4HdDp4EVw1s2XJ70Rjp6BOogB6R93z8KSvDLbTUIhCiDByffx3ugphItjmzkuA==
X-Received: by 2002:a17:906:519b:: with SMTP id
 y27mr19660585ejk.25.1605020898420; 
 Tue, 10 Nov 2020 07:08:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q7sm10595636ejc.28.2020.11.10.07.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 07:08:17 -0800 (PST)
Subject: Re: QOM address space handling
To: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
 <20201110150333.GE5733@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eec01576-51b4-e52b-f511-b127c6182da3@redhat.com>
Date: Tue, 10 Nov 2020 16:08:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110150333.GE5733@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 16:03, Eduardo Habkost wrote:
>> Does anyone have any arguments for which solution is preferred?
> I'd say (2) is preferred, as we don't expect object_new(T) to
> have any side effects outside the object instance state.

Since there are no listeners, the side effects of address_space_init() 
are relatively limited.  So doing it in instance_init is not a big deal.

> Most
> address_space_init() calls in the code today seem to be in
> realize functions.
> 
> However, I wonder if we could make this simpler (and mistakes
> less fatal) if we make AddressSpace a QOM child of the device.
> Paolo, would it be too much overhead to make AddressSpace a QOM
> object?

No, it wouldn't.  AddressSpace is already quite heavyweight.

Paolo


