Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7E2B7E80
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 14:47:47 +0100 (CET)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfNoI-0005r2-Ft
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 08:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfNms-0004iW-Mo
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:46:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfNmo-00052B-QW
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605707172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKOwKDysltM9ZGy9/+0xIbU32WpLNHybGmoh72DS+d8=;
 b=Yq82KyHA7J2vmEwetVOeXiM/dSGtzYA8WTZzfZd/7mNTxniqoP0ZAAEsTsbRQK65Gez28A
 m6D+Zjx/bOJmEGg1tN0S13nMrnxdcTwWZqsG1EorshrgD1ubES7fBhz9+g0cTZUCHnZr+I
 B+ZUMghm/Tk8MNxoPaRBXCfu7EZ45+w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-OOvaS8m5OPukmiEOl8y-1A-1; Wed, 18 Nov 2020 08:46:11 -0500
X-MC-Unique: OOvaS8m5OPukmiEOl8y-1A-1
Received: by mail-ej1-f69.google.com with SMTP id q2so744469ejj.16
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 05:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pKOwKDysltM9ZGy9/+0xIbU32WpLNHybGmoh72DS+d8=;
 b=mJpwCsIQpmItmn2WdpZ9bvoE6Gw01x+gHCVEnsDtjlI2mnAkk76UeYNKNKnCl8e4qt
 tjimL2aphfUcotSzhXufyY2Rnu69iQM4d8NKiuwl8W5OfGEfzWYtQwKGL57vBpC9x6j+
 AMUWXXgw1AYVo8hmnKp+By+jvFUUQWnrXl7MDqbjyj/jTDum8xRzPlMNprMmw+EtYLU7
 pzhwWyiYgqiAJzeegvhrVHrrHBsxBn5+lxVMeFVfpbU18WxQNVZXxDFC2hw5h6lk5BBH
 BQPcV2/a3D+yt3EXgtlbZ9eWfza2f5ghsMTU4PfLmc+tyjMY5nFAJDTPGEXkTpjw3Cxb
 P6FQ==
X-Gm-Message-State: AOAM53084bQztv+IYM0nq9YfRzw52q4N/UJjZ884XBidaNltCyuZPPT3
 zgrLndu1OM91I+bBC0WzfDDQcl3VGJKPfHFqZ3zFf70LZVLOnKuaqGqh4wE24FNgqrsvg3CHcCZ
 1uP1UOh5o4+HsQp4n177qjvgcmdflpnHE3hT2Iun7YYi3UQD311/EEwh+XIstxCTYHYI=
X-Received: by 2002:a17:907:7205:: with SMTP id
 dr5mr2093890ejc.335.1605707169680; 
 Wed, 18 Nov 2020 05:46:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz8n99RwYrmsqleVs9CFqFKWiC0TOWdvPFDyqWl78/ZtVP5HlBP6oujw5LHOxKbvy3Ugok4UQ==
X-Received: by 2002:a17:907:7205:: with SMTP id
 dr5mr2093870ejc.335.1605707169398; 
 Wed, 18 Nov 2020 05:46:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bn25sm12815674ejb.76.2020.11.18.05.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:46:08 -0800 (PST)
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
To: Markus Armbruster <armbru@redhat.com>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net> <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local> <87ft57oycu.fsf@dusky.pond.sub.org>
 <b9307f87-5350-21a6-68dd-d4efbae5e502@redhat.com>
 <87r1oqlsmy.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <07b90b7d-2216-d0db-57d0-ea1fa4a32f44@redhat.com>
Date: Wed, 18 Nov 2020 14:46:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87r1oqlsmy.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/20 14:08, Markus Armbruster wrote:
> These look like errors, but aren't; things are working exactly as
> intended, and QEMU runs.  If we want to be chatty about it, we should
> make them info, not error.

If there were an info_report, I would have sent a patch already. :)  In 
general, these are probably not the only cases where error_report is 
used as a fancy fprintf(stderr), rather than to report actual errors.

Paolo

> Same with /dev/kvm made inaccessible:
> 
>      $ qemu-system-x86_64 -accel xen -S -accel nonexistent -accel kvm
>      [Xen chatter...]
>      qemu-system-x86_64: -accel xen: failed to initialize xen: Operation not permitted
>      qemu-system-x86_64: -accel nonexistent: invalid accelerator nonexistent
>      Could not access KVM kernel module: Permission denied
>      qemu-system-x86_64: -accel kvm: failed to initialize kvm: Permission denied
> 
> Here, we do have a fatal error.  We report it as four errors.
> Tolerable.
> 
> If we turn the maybe-not-really-errors into info to make the first
> example less confusing, we need to report a "no accelerator works" error
> at the end.


